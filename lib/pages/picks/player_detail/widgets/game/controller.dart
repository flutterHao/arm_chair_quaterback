import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/grade.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/up_star_defeat.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/up_start_success.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../index.dart';

///
///@auther gejiahui
///created at 2024/10/17/11:37

class GameController extends GetxController with GetTickerProviderStateMixin {
  GameController(this.arguments, this.upStarSuccessCallBack);

  final PlayerDetailPageArguments arguments;
  final Function? upStarSuccessCallBack;

  final ScrollController scrollController = ScrollController();

  final isUpgrading = false.obs;
  final rateProgress = 0.0.obs;

  var xDragValue = 0.0.obs;

  AnimationController? _rateAnimationController;
  Animation<double>? _rateAnimation;

  TeamPlayerInfoEntity? uuidPlayerInfo;
  late NbaPlayerInfosPlayerDataCapList capList;
  NbaPlayerBaseInfoEntity? nbaPlayerBaseInfoEntity;
  List<BarChartGroupData> _barGroups = [];

  var loadStatus = LoadDataStatus.loading.obs;

  late List<ChartSampleData> dataSource;

  StarUpDefineEntity? starUpDefineEntity;

  late RxList<GradeUp> teamPlayerList = RxList();

  String? cacheUuid;

  levelUpTap(BuildContext context) async {
    Navigator.pop(context);
    EasyLoading.show();
    var where = teamPlayerList.where((e) => e.choice).toList();
    var materialScienceUUID =
        where.map((e) => e.teamPlayer.uuid).toList().join(",");
    await PicksApi.upStarTeamPlayer(uuidPlayerInfo!.uuid!, materialScienceUUID)
        .then((result) {
      if (result.success) {
        Get.dialog(UpStarSuccess(
          response: result,
        ));
        reloadData();
        Get.find<HomeController>().refreshMoneyCoinWidget();
        if (upStarSuccessCallBack != null) {
          upStarSuccessCallBack!.call();
        }
      } else {
        Get.dialog(const UpStarDefeat());
      }
    }, onError: (e) {
      EasyLoading.showToast("SERVER ERROR");
    });
    EasyLoading.dismiss();
  }

  upgradeTap() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    isUpgrading.value = true;
    _animationController.forward();
  }

  dismiss() {
    isUpgrading.value = false;
    _animationController.reverse();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  reloadData() {
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    var futures = [
      CacheApi.getNBAPlayerInfo(),
      PicksApi.getNBAPlayerBaseInfo(arguments.playerId),
    ];
    var homeController = Get.find<HomeController>();
    var uuidInfo = homeController.userEntiry.teamLoginInfo?.teamPlayerList
        ?.firstWhereOrNull((e) => e.playerId == arguments.playerId);
    print('uuidInfo----:${uuidInfo?.toJson()}');
    if (uuidInfo != null) {
      cacheUuid = uuidInfo.uuid;
      futures.addAll([
        CacheApi.getStarUpDefine(),
        PicksApi.getAllTeamPlayersByUpStar(cacheUuid!),
        PicksApi.getTeamPlayerByUUID(uuidInfo.teamId, cacheUuid!)
      ]);
    }

    Future.wait(futures).then((result) {
      //todo 自己的球员需要使用其他接口获取ability的数据，接口暂未提供
      capList = (result[0] as NbaPlayerInfosEntity)
          .playerDataCapList
          .firstWhere((e) => e.playerId == arguments.playerId);
      nbaPlayerBaseInfoEntity = (result[1] as NbaPlayerBaseInfoEntity);
      _barGroups.clear();
      maxPriceValue = 0;
      minPriceValue = 0;
      for (int i = 0;
          i < (nbaPlayerBaseInfoEntity?.playerTrends.length ?? 0);
          i++) {
        int index = i;
        var toY = nbaPlayerBaseInfoEntity!.playerTrends[index].playerMarketPrice
            .toDouble();
        maxPriceValue = max(maxPriceValue, toY);
        minPriceValue = min(minPriceValue, toY);
        // minPriceValue = (minPriceValue < (maxPriceValue - 500))
        //     ? (maxPriceValue - 500)
        //     : minPriceValue;
        print('minPriceValue:${minPriceValue},maxPriceValue:$maxPriceValue');
        _barGroups.add(BarChartGroupData(
          x: MyDateUtils.getDateTimeByMs(
                  nbaPlayerBaseInfoEntity!.playerTrends[index].createTime)
              .day,
          barRods: [
            BarChartRodData(
              // fromY: Random().nextInt(5).toDouble(),
              toY: toY,
              borderRadius: BorderRadius.all(Radius.circular(5.w)),
              width: 10.w,
              color: Utils.getChartColor(toY),
              // gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ));
      }
      // minPriceValue =
      //     minPriceValue == maxPriceValue ? maxPriceValue / 5 : minPriceValue;
      print('maxPriceValue:$maxPriceValue');
      dataSource = <ChartSampleData>[
        ChartSampleData(x: 'PTS', y: 55, yValue: 30),
        ChartSampleData(x: '3PT', y: 55, yValue: 40),
        ChartSampleData(x: 'AST', y: 55, yValue: 35),
        ChartSampleData(x: 'REB', y: 55, yValue: 45),
        ChartSampleData(x: 'BLK', y: 55, yValue: 30),
        ChartSampleData(x: 'STL', y: 55, yValue: 40),
      ];

      var maxValue = capList.getMaxValue();
      var rate = (maxValue == 0) ? 1 : (maxValue / 55);
      maxValue = maxValue / rate;
      dataSource = <ChartSampleData>[
        ChartSampleData(
            x: 'PTS',
            y: maxValue.isNaN ? 0 : maxValue,
            yValue: (capList.pts / rate).isNaN ? 0 : capList.pts / rate),
        ChartSampleData(
            x: '3PT',
            y: maxValue.isNaN ? 0 : maxValue,
            yValue: (capList.getThreePT() / rate).isNaN
                ? 0
                : capList.getThreePT() / rate),
        ChartSampleData(
            x: 'AST',
            y: maxValue.isNaN ? 0 : maxValue,
            yValue: (capList.ast / rate).isNaN ? 0 : capList.ast / rate),
        ChartSampleData(
            x: 'REB',
            y: maxValue.isNaN ? 0 : maxValue,
            yValue: (capList.getValue('reb') / rate).isNaN
                ? 0
                : capList.getValue('reb') / rate),
        ChartSampleData(
            x: 'BLK',
            y: maxValue.isNaN ? 0 : maxValue,
            yValue: (capList.blk / rate).isNaN ? 0 : capList.blk / rate),
        ChartSampleData(
            x: 'STL',
            y: maxValue.isNaN ? 0 : maxValue,
            yValue: (capList.stl / rate).isNaN ? 0 : capList.stl / rate),
      ];
      if (cacheUuid != null) {
        uuidPlayerInfo = result[4] as TeamPlayerInfoEntity;
        starUpDefineEntity = (result[2] as List<StarUpDefineEntity>).firstWhere(
            (e) => e.starUp == uuidPlayerInfo?.getNextBreakThroughGrade());
        var allTeamPlayer = result[3] as List<AllTeamPlayersByUpStarEntity>;
        var playerBaseInfoList =
            (result[0] as NbaPlayerInfosEntity).playerBaseInfoList;
        var selfBaseInfoList = playerBaseInfoList
            .firstWhere((e) => e.playerId == arguments.playerId);
        teamPlayerList.clear();
        for (var i = 0; i < allTeamPlayer.length; i++) {
          var player = allTeamPlayer[i];
          var firstWhere = playerBaseInfoList
              .firstWhere((e) => e.playerId == player.playerId);
          var value2 = Grade.getGradeByName(selfBaseInfoList.grade);
          var value3 = Grade.getGradeByName(firstWhere.grade);
          if (value3.grade != value2.grade &&
              value3.grade != value2.grade - 1) {
            //只展示与球员卡同阶或低一阶的
            continue;
          }
          GradeUp gradeUp = GradeUp(
            teamPlayer: player,
            baseInfo: firstWhere,
          );
          teamPlayerList.add(gradeUp);
        }
        sort(0);
      }
      loadStatus.value = LoadDataStatus.success;
      // update([idPlayerDetailGameMain]);
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
    });
  }

  //false 倒序 true 正序
  bool breakThroughGradeSort = true;

  //false 倒序 true 正序
  bool gradeSort = true;

  // false breakThroughGradeSort排序 true gradeSort 排序
  bool isGradeSort = false;

  //type:
  //  0:breakThroughGrade
  //  1:grade
  //down: true 正序,false 倒序
  sort(int type) {
    if (type == 0) {
      if (isGradeSort) {
        breakThroughGradeSort = true;
      } else {
        breakThroughGradeSort = !breakThroughGradeSort;
      }
      isGradeSort = false;
    } else {
      if (!isGradeSort) {
        gradeSort = true;
      } else {
        gradeSort = !gradeSort;
      }
      isGradeSort = true;
    }
    var i = ((isGradeSort ? gradeSort : breakThroughGradeSort) ? 1 : -1);
    if (type == 0) {
      teamPlayerList.sort((a, b) =>
          i *
          (a.teamPlayer.breakThroughGrade!
              .compareTo(b.teamPlayer.breakThroughGrade!)));
    } else {
      teamPlayerList
          .sort((a, b) => i * (a.baseInfo.grade.compareTo(b.baseInfo.grade)));
    }
    teamPlayerList.refresh();
  }

  static get idPlayerDetailGameMain => "player_detail_game_main";

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    _initAnimations();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    _animationController.dispose();
    _rateAnimationController?.dispose();
    super.dispose();
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (BarChartGroupData group) {
            return Colors.transparent;
          },
          tooltipRoundedRadius: 10.h,
          // fitInsideVertically: true,
          // fitInsideHorizontally: true,
          tooltipMargin: -11.h,
          // tooltipPadding:
          // EdgeInsets.symmetric(horizontal: 9.w, vertical: 1.h),
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              Utils.formatMoney(rod.toY),
              11.w7(color: AppColors.c000000, height: 1),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text("${value.toInt()}", style: 10.w4(color: AppColors.cB3B3B3)),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35.w,
              getTitlesWidget: (value, titleMate) {
                // print('v:---: $value');
                // if (value % 100 != 0) {
                //   return const SizedBox.shrink();
                // }
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    Utils.formatMoney(value.toInt()),
                    style: 10.w4(color: AppColors.cB3B3B3),
                  ),
                );
              }),
        ),
      );

  FlGridData get gridData => FlGridData(
        show: true,
        // horizontalInterval: 3,
        checkToShowHorizontalLine: (value) => true,
        getDrawingHorizontalLine: (value) => FlLine(
            color: AppColors.cB3B3B3.withOpacity(.3),
            strokeWidth: 1.w,
            dashArray: [3, 3]),
        drawVerticalLine: false,
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => _barGroups;

  late AnimationController _animationController;
  late Animation<double> _starTranslateAnimation,
      _propertyBoxAnimation,
      _starSizeAnimation,
      _starRotateAnimation,
      _progressBorderAnimation,
      _otherAnimation,
      _rateBoxOpacityAnimation;

  final startLeft = 1.0.obs;
  final propertyLeft = (-161.w).obs;
  final starSize = 119.w.obs;
  final starRotate = 0.0.obs;
  final progressBorder = 0.0.obs;
  final rateBoxOpacity = 0.0.obs;
  final other = 0.0.obs;

  void _initAnimations() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addListener(() {
        startLeft.value = _starTranslateAnimation.value;
        propertyLeft.value = _propertyBoxAnimation.value;
        starSize.value = _starSizeAnimation.value;
        starRotate.value = _starRotateAnimation.value;
        progressBorder.value = _progressBorderAnimation.value;
        other.value = _otherAnimation.value;
        rateBoxOpacity.value = _rateBoxOpacityAnimation.value;
      });
    _otherAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, .2)));
    _starSizeAnimation = Tween(begin: 119.w, end: 68.w).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, .2)));
    _starTranslateAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.2, 0.4)));
    _starRotateAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.2, 0.4)));

    _propertyBoxAnimation = Tween(begin: -161.w, end: 10.w + 34.w).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(.4, .7)));

    _rateBoxOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(0.8, .9)))
      ..addListener(() {
        if (_rateBoxOpacityAnimation.status == AnimationStatus.completed) {
          _rateStartAnimation();
        }
        if (_rateBoxOpacityAnimation.status == AnimationStatus.reverse) {
          if (rateProgress.value > 0) {
            _rateAnimationStart(rateProgress.value, 0);
          }
        }
      });

    _progressBorderAnimation = Tween(begin: 0.0, end: 180.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: const Interval(.9, 1.0)));
  }

  void _rateStartAnimation() {
    double target = 0;
    for (int i = 0; i < teamPlayerList.length; i++) {
      var e = teamPlayerList[i];
      target += e.choice ? 180 * e.getUPPercent() : 0;
    }
    if (target > 0) {
      _rateAnimationStart(0, target);
    }
  }

  double maxPriceValue = 0, minPriceValue = 0;

  dialogListItemTap(int index) {
    var current = teamPlayerList[index];
    var list = teamPlayerList.where((e) => e.choice).toList();
    if (list.length >= 5 && !current.choice) {
      //最多选5个
      return;
    }
    double before = 0;
    for (int i = 0; i < teamPlayerList.length; i++) {
      var e = teamPlayerList[i];
      before += e.choice ? 180 * e.getUPPercent() : 0;
    }
    var target = 0.0;
    if (!current.choice) {
      target = (180 * current.getUPPercent()) + before;
    } else {
      target = before - (180 * current.getUPPercent());
      if (target < 0) {
        target = 0;
      }
    }
    _rateAnimationStart(before, target);
    teamPlayerList[index].choice = !current.choice;
    teamPlayerList.refresh();
  }

  _rateAnimationStart(double before, double target) {
    _rateAnimationController ??= AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        rateProgress.value = _rateAnimation!.value;
      });
    _rateAnimation =
        Tween(begin: before, end: target).animate(_rateAnimationController!);
    _rateAnimationController?.reset();

    _rateAnimationController?.forward();
  }
}

class GradeUp {
  final AllTeamPlayersByUpStarEntity teamPlayer;
  final NbaPlayerInfosPlayerBaseInfoList baseInfo;
  bool choice;

  GradeUp(
      {required this.teamPlayer, required this.baseInfo, this.choice = false});

  double getUPPercent() {
    return teamPlayer.probability / 100;
  }

  double getCost() {
    return teamPlayer.cost;
  }
}
