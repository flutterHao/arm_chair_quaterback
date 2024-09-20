/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:27:52
 * @LastEditTime: 2024-09-19 10:09:39
 */
import 'package:arm_chair_quaterback/pages/news/rank/widgets/stats_list_view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/team_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RankController();

  late TabController tabController;
  RxInt current = 0.obs;
  List<String> tabs = ["Player", "Team"];
  List<String> tabs2 = ["Eastean", "Westen"];

  RxDouble progress = 0.0.obs;
  List statsPages = const [
    PlayListView(),
    TeamListView(),
  ];

  List teamPages = const [
    EasTeamListView(),
    EasTeamListView(),
  ];

  RxInt divisionIndex = 1.obs;
  RxInt seasonIndex = 3.obs;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.animation?.addListener(() {
      progress.value = tabController.animation!.value;
    });
    tabController.addListener(() {
      int newIndex = tabController.index;
      if (current.value != newIndex) {
        current.value = newIndex;
      }
    });
  }

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

  void onTap(v) {
    current.value = v;
    tabController.animateTo(v);
  }
}
