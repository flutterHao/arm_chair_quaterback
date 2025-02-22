import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_rank_by_cycle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_prop_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickRankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PickRankController();

  late TabController tabController;
  List<String> tabTitles = ["Rank", "Reward"];

  GuessRankByCycleEntity? rankInfo;
  List<RankAwardPropEntity> awardInfo = [];

  ///
  var inTheRankList = false.obs;
  var tabIndex = 0.obs;

  var rewardDialogItemIndex = 0.obs;

  ///自己在榜单的什么区段
  int selfInRankListIndex = -1;

  var loadStatus = LoadDataStatus.loading.obs;

  var loadOtherStatus = LoadDataStatus.loading.obs;

  var hasPre = true.obs;
  var hasNext = true.obs;
  var currentStartMs = 0.obs;
  var currentEndMs = 0.obs;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabTitles.length, vsync: this)
      ..addListener(() {
        tabIndex.value = tabController.index;
      });
    _initData();
  }

  void _initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      CacheApi.getGameRankAwardRule(),
      CacheApi.getPropDefine(),
      PicksApi.getGuessRankByCycle(
          cycle: DateTime.now().millisecondsSinceEpoch),
      CacheApi.getPickDefine(),
    ]).then((result) {
      List<RankAwardEntity> rankAwardEntitys =
          result[0] as List<RankAwardEntity>;
      List<PropDefineEntity> props = result[1] as List<PropDefineEntity>;
      GuessRankByCycleEntity guessRankByCycleEntity =
          result[2] as GuessRankByCycleEntity;
      awardInfo.clear();
      int index = 0;
      for (RankAwardEntity r in rankAwardEntitys) {
        if(r.rankAwardType != "101"){
          continue;
        }
        if (int.parse(r.minRank) >= (guessRankByCycleEntity.myRank.rank ?? 0) &&
            int.parse(r.maxRank) <= (guessRankByCycleEntity.myRank.rank ?? 0)) {
          selfInRankListIndex = index;
        }
        index++;
        List<PropDefineNumEntity> awardPickData = [];
        for (var str in r.awardData.split("|")) {
          var split = str.split("_");
          if (split.length > 2) {
            int num = int.parse(split[2]);
            var propDefineEntity = props.firstWhereOrNull((e) =>
                e.propId.toString() == split[1]);
            if (propDefineEntity == null) {
              continue;
            }
            PropDefineNumEntity propDefineNumEntity =
                PropDefineNumEntity(num, propDefineEntity);
            awardPickData.add(propDefineNumEntity);
          }
        }
        RankAwardPropEntity rankAwardPropEntity =
            RankAwardPropEntity(r, awardPickData.reversed.toList());
        awardInfo.add(rankAwardPropEntity);
      }
      rankInfo = result[2] as GuessRankByCycleEntity;
      handlerRankInfoData();

      loadStatus.value = LoadDataStatus.success;
      loadOtherStatus.value = LoadDataStatus.success;
      update();
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  void handlerRankInfoData() {
    currentStartMs.value = rankInfo!.nowCycleStartTime;
    currentEndMs.value = rankInfo!.nowCycleEndTime;
    if (rankInfo!.firstRankTime >= rankInfo!.nowCycleStartTime) {
      hasPre.value = false;
    }else{
      hasPre.value = true;
    }
    if (rankInfo!.lastRankTime <= rankInfo!.nowCycleEndTime) {
      hasNext.value = false;
    }else{
      hasNext.value = true;
    }
    inTheRankList.value = rankInfo!.ranks.indexWhere((e) =>
            e.teamId ==
            Get.find<HomeController>()
                .userEntiry
                .teamLoginInfo
                ?.team
                ?.teamId) !=
        -1;
  }

  //开奖剩余时间：周三周六零点开奖
  int getRewardOpenTime() {
    // Duration difference = getTimeDifferenceToTarget();
    var endTime = MyDateUtils.getDateTimeByMs(rankInfo!.nowCycleEndTime);
    var difference = endTime.difference(MyDateUtils.getNowDateTime());
    return difference.inMilliseconds;
  }

  Duration getTimeDifferenceToTarget() {
    DateTime now = DateTime.now().subtract(Utils.getTimeZoneOffset());
    int currentWeekday = now.weekday;

    // 计算周三和周六的零点时间
    DateTime targetDate;
    if (currentWeekday < DateTime.wednesday) {
      // 当前时间在周三之前
      targetDate = DateTime(
          now.year, now.month, now.day + (DateTime.wednesday - currentWeekday));
    } else if (currentWeekday == DateTime.wednesday && now.hour < 24) {
      // 当前时间是周三，并且还没到当天结束
      targetDate = DateTime(now.year, now.month, now.day + 1);
    } else if (currentWeekday < DateTime.saturday) {
      // 当前时间在周六之前
      targetDate = DateTime(
          now.year, now.month, now.day + (DateTime.saturday - currentWeekday));
    } else {
      // 当前时间已经过了周六，计算到下周三的时间
      targetDate = DateTime(now.year, now.month,
          now.day + (7 - currentWeekday) + DateTime.wednesday);
    }

    // 将目标时间设为零点
    targetDate = DateTime(targetDate.year, targetDate.month, targetDate.day);

    // 计算当前时间与目标时间的差
    return targetDate.difference(now);
  }

  String formatDuration(Duration duration) {
    int days = duration.inDays;
    int hours = duration.inHours % 24;
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;
    // 格式化成 6d:08:19:63 的样式
    var day = days <= 0 ? "" : "${days}d:";
    var hour =
        hours == 0 && days == 0 ? "" : "${hours.toString().padLeft(2, '0')}:";
    var minute = minutes == 0 && hours == 0 && days == 0
        ? ""
        : "${minutes.toString().padLeft(2, '0')}:";
    var second = seconds == 0 && minutes == 0 && hours == 0 && days == 0
        ? "0"
        : seconds.toString().padLeft(2, '0');
    var s = "$day$hour$minute$second";
    return s;
  }

  static String get idRanks => "ranks";

  static String get idAwards => "awards";

  static String get idRankList => "rank_list";

  static String get idRankListBottomEmpty => "rank_list_bottom_empty";

  static String get idRankFloat => "rank_float";

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  rewardDialogItemTap(int index) {
    rewardDialogItemIndex.value = index;
  }

  num getBetRewardRank() {
    return CacheApi.pickDefine!.betRewardRank;
  }

  String getMonthDay(int ms) {
    var dateTime = MyDateUtils.getDateTimeByMs(ms);
    return "${MyDateUtils.getMonthEnName(dateTime, short: true)} ${(dateTime.day).toString().padLeft(2, "0")}";
  }

  next() {
    if (!hasNext.value) {
      return;
    }
    getOtherDayData(true);
  }

  void getOtherDayData(bool next) {
    int millisecondsSinceEpoch = calculateTime(next);
    loadOtherStatus.value = LoadDataStatus.loading;
    PicksApi.getGuessRankByCycle(cycle: millisecondsSinceEpoch).then((result) {
      if (result.ranks.isNotEmpty) {
        loadOtherStatus.value = LoadDataStatus.noData;
      } else {
        loadOtherStatus.value = LoadDataStatus.success;
      }
      rankInfo = result;
      handlerRankInfoData();
      update([idRankList, idRankListBottomEmpty, idRankFloat]);
    }, onError: (e) {
      loadOtherStatus.value = LoadDataStatus.error;
      ErrorUtils.toast(e);
    });
  }

  int calculateTime(bool next) {
    var endTime = MyDateUtils.getDateTimeByMs(rankInfo!.nowCycleEndTime);
    var startTime = MyDateUtils.getDateTimeByMs(rankInfo!.nowCycleStartTime);
    var stepDuration = const Duration(days: 2);
    DateTime targetTime;
    if (next) {
      targetTime = endTime.add(stepDuration);
    } else {
      targetTime = startTime.subtract(stepDuration);
    }
    print('targetTime:$targetTime');
    var millisecondsSinceEpoch = targetTime.millisecondsSinceEpoch;
    return millisecondsSinceEpoch;
  }

  pre() {
    if (!hasPre.value) {
      return;
    }
    getOtherDayData(false);
  }
}
