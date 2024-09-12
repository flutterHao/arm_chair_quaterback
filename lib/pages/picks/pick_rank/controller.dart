import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PickRankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PickRankController();

  late TabController tabController;
  final state = PickRankState();
  var scrollValue = 0.0.obs;
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
    tabController = TabController(length: 2, vsync: this);
    tabController.animation?.addListener(
        () => scrollValue.value = tabController.animation?.value ?? 0);
    tabController.addListener(()=> tabIndex.value = tabController.index);
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
