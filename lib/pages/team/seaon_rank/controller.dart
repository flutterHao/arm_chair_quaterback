import 'dart:async';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/cup_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/season_rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/match_level_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/season_rank_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/season_reward_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SeaonRankController extends GetxController {
  SeaonRankController();
  Timer? _timer;
  var gameStartTimeMs =
      DateTime.now().add(const Duration(days: 3)).millisecondsSinceEpoch;
  RxInt gameStartTimesCountDown = 0.obs;

  int day = 0;
  int hh = 0;
  int minute = 0;
  int second = 0;

  final PageController seaDialogPageController = PageController();

  RxInt pageviewIndex = 0.obs;
  RxList<CupDefineEntity> cupDefineList = RxList<CupDefineEntity>();
  Rx<LoadDataStatus> loadingStatus = LoadDataStatus.loading.obs;
  late Rx<TeamSimpleEntity> teamSimpleEntity;
  RxBool isShow = true.obs;
  RxList<GameSchedule> gameScheduleList = RxList();
  GlobalKey ranksBodyGlobalKey = GlobalKey();
  RxList<SeasonRankInfoEntity> seasonRankList = RxList();
  late Rx<SeasonRankInfoEntity> nowSeasonRankInfoEntity;
  @override
  void onInit() {
    super.onInit();
    timeCountDown();
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
    int teamId = homeController.userEntiry.teamLoginInfo?.team?.teamId ?? 0;
    teamSimpleEntity = (await PicksApi.getTeamSimple(teamId)).obs;
    cupDefineList.value = await CacheApi.getCupDefine();
    gameScheduleList.value = await PicksApi.getGameSchedules(teamId);
    SeasonRankInfoEntity seasonRankInfoEntity =
        await PicksApi.getSeasonRankInfo(1);
    nowSeasonRankInfoEntity = seasonRankInfoEntity.obs;
    seasonRankList.add(seasonRankInfoEntity);
    loadingStatus.value = LoadDataStatus.success;

    // seasonRankList.add(res);
    // seasonRankList.add(res);
    // print(res);
  }

  void timeCountDown() {
    _timer?.cancel();
    var nowMs = DateTime.now().millisecondsSinceEpoch;
    var diff = gameStartTimeMs - nowMs;

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

  String getcupUrl(int cardId) {
    var item = cupDefineList.firstWhere((e) => e.cupNumId == cardId);
    return 'assets/images/manager/${item.cupPicId}.png';
  }

  ///监听元素是否可见
  void onVisibilityChanged(VisibilityInfo visibilityInfo, int index) {
    var visiblePercentage = visibilityInfo.visibleFraction * 100;
    // Check if the item is mostly visible in the viewport and it's the target item.
    if (index == 3) {
      visiblePercentage < 50 ? isShow.value = true : isShow.value = false;
    }
  }

  void goTeamHistory() async {
    // Get.put(TeamBattleController(Get.context!));
    // Get.put(TeamBattleV2Controller(Get.context!));
    Get.toNamed(RouteNames.teamHistory);
  }
}
