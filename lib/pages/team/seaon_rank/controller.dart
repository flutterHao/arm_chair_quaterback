import 'dart:async';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/config/game_constant_entity.dart';
import 'package:arm_chair_quaterback/common/entities/cup_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/now_season_entity.dart';
import 'package:arm_chair_quaterback/common/entities/season_rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/award_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/top_toast_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/match_level_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/season_rank_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/season_reward_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SeaonRankController extends GetxController {
  SeaonRankController();
  Timer? _timer;

  ///赛季结束时间
  late int seasonEndTime;
  RxInt gameStartTimesCountDown = 0.obs;

  int day = 0;
  int hh = 0;
  int minute = 0;
  int second = 0;

  // final PageController seaDialogPageController = PageController();

  RxInt pageviewIndex = 0.obs;
  RxList<CupDefineEntity> cupDefineList = RxList<CupDefineEntity>();
  Rx<LoadDataStatus> loadingStatus = LoadDataStatus.loading.obs;
  late Rx<TeamSimpleEntity> teamSimpleEntity;
  RxBool isShow = true.obs;

  /// 比赛记录
  RxList<GameSchedule> gameScheduleList = RxList();

  GlobalKey ranksBodyGlobalKey = GlobalKey();

  /// 多赛季排名
  RxList<SeasonRankInfoEntity> seasonRankList = RxList();
  Rx<LoadDataStatus> rankDialogloadingStatus = LoadDataStatus.success.obs;

  /// 当前赛季排名
  late Rx<SeasonRankInfoEntity> nowSeasonRankInfoEntity;

  /// 当前赛季信息
  late NowSeasonEntity nowSeasonEntity;

  /// 赛季排行榜展示人数
  GameConstantEntity? showNumGameConstantEntity;

  /// 参与X场后上排行榜
  GameConstantEntity? distanceSeasonGameConstantEntity;

  PageController pageController = PageController();

  late int teamId;
  @override
  void onInit() {
    super.onInit();

    initData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future initData() async {
    HomeController homeController = Get.find();
    teamId = homeController.userEntiry.teamLoginInfo?.team?.teamId ?? 0;
    teamSimpleEntity = (await PicksApi.getTeamSimple(teamId)).obs;
    cupDefineList.value = await CacheApi.getCupDefine();
    gameScheduleList.value = await PicksApi.getGameSchedules(teamId);
    nowSeasonEntity = await PicksApi.getNowSeason();

    /// 获取比赛常量
    await CacheApi.getGameConstant();
    showNumGameConstantEntity = Utils.getGameConstant(10018);
    SeasonRankInfoEntity seasonRankInfoEntity =
        await PicksApi.getSeasonRankInfo(nowSeasonEntity.seasonId,
            pageSize: showNumGameConstantEntity!.constantValue);
    nowSeasonRankInfoEntity = seasonRankInfoEntity.obs;
    seasonEndTime = nowSeasonEntity.seasonEndTime;
    seasonRankList.add(seasonRankInfoEntity);
    timeCountDown();
    loadingStatus.value = LoadDataStatus.success;
    distanceSeasonGameConstantEntity = Utils.getGameConstant(10019);
  }

  void timeCountDown() {
    _timer?.cancel();
    var nowMs = DateTime.now().millisecondsSinceEpoch;
    var diff = seasonEndTime - nowMs;

    if (diff <= 0) {
      return;
    }
    gameStartTimesCountDown.value = diff;
    day = gameStartTimesCountDown.value ~/ 1000 ~/ 86400;
    hh = gameStartTimesCountDown.value ~/ 1000 % 86400 ~/ 3600;
    minute = gameStartTimesCountDown.value ~/ 1000 % 3600 ~/ 60;
    second = gameStartTimesCountDown.value ~/ 1000 % 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      var temp = gameStartTimesCountDown.value - 1000;
      if (temp <= 0) {
        t.cancel();
      } else {
        gameStartTimesCountDown.value = temp;
        day = gameStartTimesCountDown.value ~/ 1000 ~/ 86400;
        hh = gameStartTimesCountDown.value ~/ 1000 % 86400 ~/ 3600;
        minute = gameStartTimesCountDown.value ~/ 1000 % 3600 ~/ 60;
        second = gameStartTimesCountDown.value ~/ 1000 % 60;
      }
    });
  }

  /// 格式化为两位数
  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  /// 格式化为Kd单位
  String formatToK(num value) {
    if (value >= 1000) {
      // Divide by 1000 and round to one decimal place, then directly return the string.
      return '${(value / 1000).toStringAsFixed(0)}k';
    } else {
      // If the value is less than 1000, return it as a string without 'k'.
      return value.toString();
    }
  }

  /// 格式化为W单位
  String formatToW(num num) {
    if (num >= 10000) {
      double convertedNum = num / 10000;
      String formattedNum = convertedNum.toStringAsFixed(1);

      // 如果小数部分是 .0 则去掉小数点和零
      if (formattedNum.endsWith('.0')) {
        formattedNum = formattedNum.substring(0, formattedNum.length - 2);
      }

      return '$formattedNum' 'w';
    } else {
      return num.toString();
    }
  }

  void goSeasonRankDialog() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        // barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const SeasonRankDialog();
        });
    pageviewIndex.value = 0;
  }

  void goSeasonRewardDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        // barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const SeasonRewardDialog();
        });
  }

  void goMatchLevelDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        // barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const MatchLevelDialog();
        });
  }

  CupDefineEntity getCupDefineItem(int cupRankId) {
    var item = cupDefineList.firstWhere((e) => e.cupNumId == cupRankId);
    return item;
  }

  /// 获取杯牌图片
  String getcupUrl(int cardId) {
    var item = cupDefineList.firstWhere((e) => e.cupNumId == cardId);
    return 'assets/images/manager/${item.cupPicId}.png';
  }

  void goTeamHistory(GameSchedule gameSchedule) async {
    // Get.put(TeamBattleController(Get.context!));
    // Get.put(TeamBattleV2Controller(Get.context!));
    Get.toNamed(RouteNames.teamHistory, arguments: gameSchedule);
  }

  /// 获取日期格式 July 01
  String getEnMMDD(int time) {
    return MyDateUtils.getEnMMDD(DateTime.fromMillisecondsSinceEpoch(time),
        short: true);
  }

  /// 下一页
  void nextSeasonRank() async {
    /// 判断是否还有下一页
    if (seasonRankList[pageviewIndex.value].nextRank != null) {
      /// 判断是否还有下一页数据
      if (seasonRankList.length > pageviewIndex.value + 1) {
        /// 直接下一页
        ++pageviewIndex.value;
        pageController.jumpToPage(pageviewIndex.value);
      } else {
        rankDialogloadingStatus.value = LoadDataStatus.loading;
        SeasonRankInfoEntity seasonRankInfoEntity =
            await PicksApi.getSeasonRankInfo(
                seasonRankList[pageviewIndex.value].nextRank!.seasonId,
                pageSize: showNumGameConstantEntity!.constantValue);
        await Future.delayed(const Duration(milliseconds: 500));
        seasonRankList.add(seasonRankInfoEntity);
        rankDialogloadingStatus.value = LoadDataStatus.success;
        ++pageviewIndex.value;
        pageController.jumpToPage(pageviewIndex.value);
      }
    }
  }

  /// 上一页
  void preSeasonRank() async {
    /// 判断是否还有上一页
    if (seasonRankList[pageviewIndex.value].lastRank != null) {
      /// 判断是否还有上一页数据
      if (pageviewIndex.value > 0) {
        /// 直接上一页
        --pageviewIndex.value;
        pageController.jumpToPage(pageviewIndex.value);
      } else {
        rankDialogloadingStatus.value = LoadDataStatus.loading;
        SeasonRankInfoEntity seasonRankInfoEntity =
            await PicksApi.getSeasonRankInfo(
                seasonRankList[pageviewIndex.value].lastRank!.seasonId,
                pageSize: showNumGameConstantEntity!.constantValue);

        seasonRankList.insert(0, seasonRankInfoEntity);
        rankDialogloadingStatus.value = LoadDataStatus.success;
        // ++pageviewIndex.value;
        pageController.jumpToPage(pageviewIndex.value);
      }
    }
  }

  ///领取奖励
  ///cupRankId:领取的段位杯牌id
  void receiveReward(int cupRankId) async {
    await PicksApi.getSeasonRankAward(cupRankId);
    teamSimpleEntity.value = await PicksApi.getTeamSimple(teamId);

    showTopToastDialog(
        needBg: false,
        child: Container(
            margin: EdgeInsets.only(top: 44.w),
            child: AwardWidget(
                image: Assets.managerUiManagerGift00,
                text: "YOU GOT 3  treasure chest".toUpperCase())));
    Get.back();
  }
}
