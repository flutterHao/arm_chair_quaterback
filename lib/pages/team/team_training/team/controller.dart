import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/line_up_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_bag_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamController extends GetxController with GetTickerProviderStateMixin {
  final random = Random();
  late TabController tabController;
  RxInt current = 0.obs;
  // double turns = 0;
  final List<String> tabs = ["Line-up", "Player bag"];
  final List<Widget> pages = const [
    LineUpTab(),
    PlayerBagTab(),
  ];
  List<String> teamList = ["C", "PG", "SG", "SF", "PF"];
  RxBool isRecovering = false.obs;
  List<int> lineUpList = [];
  RxBool showThirdCard = true.obs;

  var isShot = false.obs; // 使用 GetX 的响应式状态
  var isAscending = true.obs; // 动画是否在上升

  // final List<String> awardList = [
  //   Assets.uiIconPicks_01Png,
  //   Assets.uiIconTeam_01Png
  // ];
  // List<String> currentAward = ['', '', ''].obs;

  // late AnimationController prizeController;
  // late List<Leaf> leaves;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
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

  void onTabChange(v) {
    current.value = v;
    tabController.animateTo(v);
  }
}
