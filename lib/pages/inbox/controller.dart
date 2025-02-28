import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/inbox_email_entity.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
    initConnectivity();
  }

  final Connectivity connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  RxBool connectivityStatus = false.obs;
  Future<void> initConnectivity() async {
    try {
      await connectivity.checkConnectivity();
    } catch (e) {
      print("无法获取网络状态: $e");
    }
    connectivitySubscription = connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.none)) {
        connectivityStatus.value = false;
      } else {
        connectivityStatus.value = true;
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
    var resMessageList = await CacheApi.getInboxMessageList();
    var mailVOList = await PicksApi.getMailVOList();
    var mailTypelist = [
      {'id': 5001, 'type': 3},
      {'id': 4001, 'type': 2},
      {'id': 1005, 'type': 1},
      {'id': 1001, 'type': 4},
    ];
    messageList = resMessageList.where((element) {
      var typeIndex = mailTypelist.indexWhere((e) => e['id'] == element.id);
      if (typeIndex != -1) {
        var res = mailVOList.firstWhere((e) => e.mailType == mailTypelist[typeIndex]['type'],
            orElse: () => InboxEmailEntity());
        if (res.mailList.isNotEmpty) {
          element.userText = res.mailList[0].content;
          element.time = DateTime.fromMillisecondsSinceEpoch(res.mailList[0].updateTime);
        } else {
          element.isRead = true;
          // return false;
        }
        return true;
      }
      return false;
    }).toList();
    loadDataSuccess = true;
    update(["inboxList"]);
  }
}
