import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PersonalCenterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PersonalCenterController();

  final state = PersonalCenterState();

  List<String> titles = ["Game", "Picks", "Comments"];

  late TabController tabController;

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
    tabController =
        TabController(length: titles.length, vsync: this, initialIndex: 1);
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
}
