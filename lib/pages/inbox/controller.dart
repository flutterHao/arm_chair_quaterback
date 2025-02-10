import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
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
    subscription = WSInstance.netStream.listen((_){
      if(!loadDataSuccess){
        _initData();
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
