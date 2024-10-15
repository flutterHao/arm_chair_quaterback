/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-19 15:45:08
 * @LastEditTime: 2024-09-24 18:04:05
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team_player_list.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PlayerDetailController extends GetxController
    with GetTickerProviderStateMixin {
  PlayerDetailController(this.arguments);

  final PlayerDetailPageArguments arguments;

  final ScrollController scrollController = ScrollController();

  final isUpgrading = false.obs;
  final rateProgress = 0.0.obs;
  final statsScrollController = ScrollController();
  final statsIsScrolling = false.obs;
  final validScreenWidth = 0.0.obs; //屏幕有效宽度，适配web屏幕

  var xDragValue = 0.0.obs;

  AnimationController? _rateAnimationController;
  Animation<double>? _rateAnimation;

  TeamPlayerList? uuidPlayerInfo;
  NbaPlayerInfosPlayerBaseInfoList? baseInfo;
  NbaPlayerInfosPlayerDataAvgList? avgList;
  NbaTeamEntity? teamInfo;
  NbaPlayerBaseInfoEntity? nbaPlayerBaseInfoEntity;
  List<BarChartGroupData> _barGroups = [];

  var loadStatus = LoadDataStatus.loading.obs;

  /// 0-180
  ///

  late List<ChartSampleData> dataSource;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
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
    statsScrollController.addListener(() {
      if (!statsIsScrolling.value && statsScrollController.offset > 5) {
        statsIsScrolling.value = true;
      }
      if (statsIsScrolling.value && statsScrollController.offset <= 5) {
        statsIsScrolling.value = false;
      }
    });
  }

  reloadData(){
    _initData();
  }

  _initData() {
    loadStatus.value = LoadDataStatus.loading;
    if (arguments.teamId != null) {
      uuidPlayerInfo = Get.find<HomeController>()
          .userEntiry
          .teamLoginInfo
          ?.teamPlayerList
          ?.firstWhere((e) => e.playerId == arguments.playerId);
    }
    Future.wait([
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine(getList: true),
      PicksApi.getNBAPlayerBaseInfo(arguments.playerId)
    ]).then((result) {
      loadStatus.value = LoadDataStatus.success;
      baseInfo = (result[0] as NbaPlayerInfosEntity)
          .playerBaseInfoList
          .firstWhere((e) => e.playerId == arguments.playerId);
      avgList = (result[0] as NbaPlayerInfosEntity)
          .playerDataAvgList
          .firstWhere((e) => e.playerId == arguments.playerId);
      teamInfo = (result[1] as List<NbaTeamEntity>)
          .firstWhere((e) => e.id == baseInfo?.teamId);
      nbaPlayerBaseInfoEntity = (result[2] as NbaPlayerBaseInfoEntity);
      _barGroups.clear();
      maxPriceValue = 0;
      minPriceValue = 100000000;
      for (int i = 0; i < (nbaPlayerBaseInfoEntity?.playerTrends.length ?? 0); i++) {
        int index = i;
        var toY = nbaPlayerBaseInfoEntity!
                    .playerTrends[index].playerMarketPrice
                    .toDouble();
        maxPriceValue = max(maxPriceValue,toY);
        minPriceValue = min(minPriceValue,toY);
        minPriceValue = (minPriceValue<(maxPriceValue-500))?(maxPriceValue-500):minPriceValue;
        print('minPriceValue:${minPriceValue}');
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
                color:
                index % 2 == 0 ? AppColors.c10A86A : AppColors.cE72646
              // gradient: _barsGradient,
            )
          ],
          // showingTooltipIndicators: [0],
        ));
      }
      minPriceValue = minPriceValue == maxPriceValue? maxPriceValue/5:minPriceValue;
      dataSource = <ChartSampleData>[
        ChartSampleData(
            x: 'PTS', y: avgList?.getMaxValue(), yValue: avgList?.pts ?? 0),
        ChartSampleData(
            x: '3PT', y: avgList?.getMaxValue(), yValue: avgList?.getThreePT()),
        ChartSampleData(
            x: 'AST', y: avgList?.getMaxValue(), yValue: avgList?.ast ?? 0),
        ChartSampleData(
            x: 'REB',
            y: avgList?.getMaxValue(),
            yValue: avgList?.getValue('reb') ?? 0),
        ChartSampleData(
            x: 'BLK', y: avgList?.getMaxValue(), yValue: avgList?.blk ?? 0),
        ChartSampleData(
            x: 'STL', y: avgList?.getMaxValue(), yValue: avgList?.stl ?? 0),
      ];
      update([idMain]);
    },onError: (e){
      loadStatus.value = LoadDataStatus.error;
    });
  }

  static get idMain => "player_detail_main";

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
          rod.toY.toStringAsFixed(0),
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
                    "${value.toInt()}K",
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

  final Rx<double> startLeft = RxDouble(-1111);
  final propertyLeft = (-161.w).obs;
  final starSize = 119.w.obs;
  final starRotate = 0.0.obs;
  final progressBorder = 0.0.obs;
  final rateBoxOpacity = 0.0.obs;
  final other = 0.0.obs;

  void _initAnimations() {
    print('validScreenWidth: ${validScreenWidth.value}');
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
    _starTranslateAnimation =
        Tween(begin: (validScreenWidth.value - 16.w - 119.w) / 2, end: -15.w)
            .animate(CurvedAnimation(
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
    for (int i = 0; i < dialogListDatas.length; i++) {
      var e = dialogListDatas[i];
      target += e ? 180 * .25 : 0;
    }
    if (target > 0) {
      _rateAnimationStart(0, target);
    }
  }

  final dialogListDatas = List.generate(10, (index) => false).obs;

  double maxPriceValue = 0,minPriceValue = 0;

  dialogListItemTap(int index) {
    var value = dialogListDatas[index];
    double before = 0;
    for (int i = 0; i < dialogListDatas.length; i++) {
      var e = dialogListDatas[i];
      before += e ? 180 * .25 : 0;
    }
    var target = 0.0;
    if (!value) {
      target = (180 * .25) + before;
    } else {
      target = before - (180 * .25);
      if (target < 0) {
        target = 0;
      }
    }
    _rateAnimationStart(before, target);
    dialogListDatas[index] = !value;
    dialogListDatas.refresh();
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
