import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_prop_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/enums/rank_type.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PickRankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PickRankController();

  late TabController tabController;
  List<String> tabTitles = ["Rank", "Reward"];

  RankListEntity? rankInfo;
  List<RankAwardPropEntity> awardInfo = [];
  int minRak = 1, maxRank = 100;

  ///
  var inTheRankList = false.obs;
  var tabIndex = 0.obs;

  var rewardDialogItemIndex = 0.obs;

  ///自己在榜单的什么区段
  int selfInRankListIndex = -1;

  var loadStatus = LoadDataStatus.loading.obs;

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
      PicksApi.getRedisRankInfo(),
      CacheApi.getPickDefine(),
      PicksApi.getRedisRankInfo(),
    ]).then((result) {
      List<RankAwardEntity> rankAwardEntitys =
      result[0] as List<RankAwardEntity>;
      List<PropDefineEntity> props = result[1] as List<PropDefineEntity>;
      RankListEntity rankListEntity = result[2] as RankListEntity;
      awardInfo.clear();
      int index = 0;
      for (RankAwardEntity r in rankAwardEntitys) {
        if (int.parse(r.minRank) >= (rankListEntity.myRank.rank ?? 0) &&
            int.parse(r.maxRank) <= (rankListEntity.myRank.rank ?? 0)) {
          selfInRankListIndex = index;
        }
        index++;
        minRak = min(minRak, int.parse(r.minRank));
        maxRank = max(maxRank, int.parse(r.maxRank));
        var awardkeyData = r.awardData.split("_");
        List<PropDefineNumEntity> awardPickData = [];
        for (var str in r.awardPickData.split("|")) {
          var split = str.split("_");
          if (split.length > 2) {
            int num = int.parse(split[2]);
            print('split:$split');
            var propDefineEntity = props.firstWhereOrNull((e) =>
            e.propType.toString() == split[0] &&
                e.propId.toString() == split[1]);
            if (propDefineEntity == null) {
              continue;
            }
            PropDefineNumEntity propDefineNumEntity =
            PropDefineNumEntity(num, propDefineEntity);
            awardPickData.add(propDefineNumEntity);
          }
        }
        var awardData = props.firstWhereOrNull((e) =>
        e.propType.toString() == awardkeyData[0] &&
            e.propId.toString() == awardkeyData[1]);
        int awardDataNum = int.parse(awardkeyData[2]);
        if (awardData == null) {
          continue;
        }
        RankAwardPropEntity rankAwardPropEntity =
        RankAwardPropEntity(r, awardData, awardDataNum, awardPickData);
        awardInfo.add(rankAwardPropEntity);
      }
      rankInfo = result[4] as RankListEntity;
      inTheRankList.value = rankInfo!.ranks.indexWhere((e) =>
      e.teamId ==
          Get.find<HomeController>()
              .userEntiry
              .teamLoginInfo
              ?.team
              ?.teamId) !=
          -1;

      loadStatus.value = LoadDataStatus.success;
      update();
    },onError: (e){
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  //开奖剩余时间：周三周六零点开奖
  int getRewardOpenTime() {
    Duration difference = getTimeDifferenceToTarget();
    return difference.inMilliseconds;
  }

  Duration getTimeDifferenceToTarget() {
    DateTime now = DateTime.now();
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

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  rewardDialogItemTap(int index) {
    rewardDialogItemIndex.value = index;
  }

  num getBetRewardRank(){
    return CacheApi.pickDefine!.betRewardRank;
  }
}
