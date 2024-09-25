import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/enums/rank_type.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PickRankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PickRankController();

  late TabController tabController;
  final state = PickRankState();
  List<String> tabTitles = ["Rank", "Reward"];

  RankListEntity rankInfo = RankListEntity();
  List<RankAwardEntity> rankAwards = [];

  var inTheRankList = false.obs;
  var tabIndex = 0.obs;

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
      print('inTheRankList:${inTheRankList.value}');
      update([idRanks]);
    });
    // PicksApi.getGameRankAwardRule().then((result){
    //   rankAwards = result;
    //   update([idAwards]);
    // });
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
}
