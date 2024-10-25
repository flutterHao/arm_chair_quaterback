import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_prop_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/rank_type.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
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

  RankListEntity rankInfo = RankListEntity();
  List<RankAwardPropEntity> awardInfo = [];
  int minRak = 1, maxRank = 100;

  var inTheRankList = false.obs;
  var tabIndex = 0.obs;

  var rewardDialogItemIndex = 0.obs;

  ///自己在榜单的什么区段
  int selfInRankListIndex = -1;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabTitles.length, vsync: this)
      ..addListener(() {
        tabIndex.value = tabController.index;
      });
    _initRankData();
    _initRewardData();
  }

  reloadRankData() {
    _initRankData();
  }

  reloadRewardData() {
    _initRewardData();
  }

  void _initRewardData() {
    Future.wait([
      CacheApi.getGameRankAwardRule(),
      CacheApi.getPropDefine(),
      PicksApi.getRedisRankInfo()
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
      update([idAwards]);
    });
  }

  void _initRankData() {
    PicksApi.getRedisRankInfo().then((result) {
      rankInfo = result;
      inTheRankList.value = rankInfo.ranks.indexWhere((e) =>
              e.teamId ==
              Get.find<HomeController>()
                  .userEntiry
                  .teamLoginInfo
                  ?.team
                  ?.teamId) !=
          -1;
      update([idRanks]);
    });
  }

  static String get idRanks => "ranks";

  static String get idAwards => "awards";

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  rewardDialogItemTap(int index) {
    rewardDialogItemIndex.value = index;
  }
}
