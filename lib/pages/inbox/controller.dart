import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  InboxController();

  List<InboxMessageEntity> messageList = [];

  bool loadDataSuccess = false;

  late StreamSubscription<int> subscription;

  ScrollController scrollController = ScrollController();

  _initData() {
    getMessageList();
  }

  @override
  void onInit() {
    super.onInit();
    subscription = WSInstance.netStream.listen((_) {
      if (!loadDataSuccess) {
        _initData();
      }
    });
    // 监听滚动事件
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        // 判断是否滚动到边界
        Get.find<HomeController>()
            .scrollHideBottomBarController
            .changeHideStatus(false);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void scrollToTop() {
    try {
      if (scrollController.offset == 0) {
        return;
      }
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      print('InboxController--scrollToTop--error--: $e');
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void getMessageList() async {
    messageList = await CacheApi.getInboxMessageList();
    loadDataSuccess = true;
    update(["inboxList"]);
  }
}
