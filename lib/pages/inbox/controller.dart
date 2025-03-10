import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/inbox_email_entity.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/inbox.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InboxController extends GetxController {
  InboxController();

  RxList<InboxMessageEntity> messageList = RxList();

  bool loadDataSuccess = false;

  late StreamSubscription<int> subscription;

  ScrollController scrollController = ScrollController();
  RefreshController refreshController = RefreshController();
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
  RxBool connectivityStatus = true.obs;
  Future<void> initConnectivity() async {
    try {
      await connectivity.checkConnectivity();
    } catch (e) {
      print("无法获取网络状态: $e");
    }
    connectivitySubscription = connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
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

  var mailTypeList = [
    {'id': 5001, 'type': 3},
    {'id': 4001, 'type': 2},
    {'id': 1005, 'type': 1},
    {'id': 1001, 'type': 4},
  ];
  List<InboxEmailEntity> mailVOList = [];
  getMessageList() async {
    getStorageData();
    var resMessageList = await CacheApi.getInboxMessageList();
    mailVOList = await InboxApi.getMailVOList();
    messageList.value = resMessageList.where((element) {
      var typeIndex = mailTypeList.indexWhere((e) => e['id'] == element.id);
      if (typeIndex != -1) {
        var res = mailVOList.firstWhere(
            (e) => e.mailType == mailTypeList[typeIndex]['type'],
            orElse: () => InboxEmailEntity());
        if (res.mailList.isNotEmpty) {
          element.userText = res.mailList[0].content;
          element.time =
              DateTime.fromMillisecondsSinceEpoch(res.mailList[0].updateTime);
          element.noReadNum = res.mailList.where((e) => e.state == 0).length;
        } else {
          element.isRead = true;
          return false;
        }
        return true;
      }
      return false;
    }).toList();
    messageList.sort((a, b) => b.time.compareTo(a.time));
    messageList.sort((a, b) {
      print(topChatList.contains(a.id));
      if (topChatList.contains(a.id) == topChatList.contains(b.id)) return 0;
      return topChatList.contains(a.id) ? -1 : 1;
    });
    loadDataSuccess = true;
    update(["inboxList"]);
  }

  /// 获取存储免打扰和置顶
  void getStorageData() {
    doNotDisturb = StorageService.to
        .getList('locatDoNotDisturb')
        .map((e) => int.parse(e))
        .toList();
    topChatList = StorageService.to
        .getList('locatTopChatList')
        .map((e) => int.parse(e))
        .toList();
  }

  ///免打扰
  List<int> doNotDisturb = [];
  void itemDoNotDisturb(InboxMessageEntity item) async {
    if (doNotDisturb.contains(item.id)) {
      //取消免打扰
      doNotDisturb.remove(item.id);
    } else {
      //设置免打扰
      doNotDisturb.add(item.id);
    }
    StorageService.to.setList('locatDoNotDisturb',
        doNotDisturb.map((element) => element.toString()).toList());
    update(["inboxList"]);
  }

  ///删除email
  void deteleMail(InboxMessageEntity item) async {
    messageList.remove(item);
    update(["inboxList"]);

    var typeIndex = mailTypeList.indexWhere((e) => e['id'] == item.id);
    var mailIds = mailVOList
        .firstWhere((e) => e.mailType == mailTypeList[typeIndex]['type'])
        .mailList
        .map((item) => item.mailId.toString())
        .join('|');
    await InboxApi.deleteMail(mailIds);
  }

  ///置顶
  List<int> topChatList = [];
  void itemTopChat(InboxMessageEntity item) async {
    if (topChatList.contains(item.id)) {
      //取消免打扰
      topChatList.remove(item.id);
    } else {
      //设置免打扰
      topChatList.add(item.id);
    }
    StorageService.to.setList('locatTopChatList',
        topChatList.map((element) => element.toString()).toList());
    update(["inboxList"]);
  }
}
