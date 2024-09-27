import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamTrainingController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final state = TeamTrainingState();

  late TabController tabController;
  RxInt current = 0.obs;
  final List<String> tabs = ["Line-up", "Player bag"];

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

  void onTap(v) {
    current.value = v;
    tabController.animateTo(v);
  }
}
