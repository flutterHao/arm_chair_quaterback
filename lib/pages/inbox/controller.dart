import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/chat_room_entity.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_email_entity.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/entities/simple_message_push_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/inbox.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InboxController extends GetxController {
  InboxController();

  RxList<InboxMessageEntity> messageList = RxList();

  bool loadDataSuccess = false;

  late StreamSubscription<int> subscription;
  late StreamSubscription wsSubscription;

  ScrollController scrollController = ScrollController();
  RefreshController refreshController = RefreshController();
  RefreshController refreshControllerDefault = RefreshController();

  int page = 0, limit = 50;
  RxList<ChatRoomEntity> chatRoomList = RxList();

  var loadStatus = LoadDataStatus.noData.obs;

  _initData() {
    if (loadStatus.value == LoadDataStatus.loading) {
      return;
    }
    getMessageList(refresh: true);
  }

  @override
  void onInit() {
    super.onInit();
    subscription = WSInstance.netStream.listen((_) {
      if (!loadDataSuccess) {
        _initData();
      }
    });
    wsSubscription = WSInstance.stream.listen((res) {
      if (res.serviceId == Api.wsSimpleMessagePush) {
        SimpleMessagePushEntity simpleMessagePushEntity =
            SimpleMessagePushEntity.fromJson(res.payload);
        var indexWhere = chatRoomList
            .indexWhere((e) => e.roomId == simpleMessagePushEntity.roomId);
        if (indexWhere < 0) {
          chatRoomList.add(ChatRoomEntity().copyWith(simpleMessagePushEntity));
        }else {
          chatRoomList[indexWhere] =
              chatRoomList[indexWhere].copyWith(simpleMessagePushEntity);
        }
        chatRoomListSort();
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
    wsSubscription.cancel();
    super.dispose();
  }

  var mailTypeList = [
    {'id': 5001, 'type': 3},
    {'id': 4001, 'type': 2},
    {'id': 1005, 'type': 1},
    {'id': 1001, 'type': 4},
  ];
  List<InboxEmailEntity> mailVOList = [];

  Future getMessageList({bool refresh = false}) async {
    loadStatus.value = LoadDataStatus.loading;
    getStorageData();
    Completer completer = Completer();
    Future.wait([
      CacheApi.getInboxMessageList(),
      InboxApi.getMailVOList(),
      // getChatRoomList(refresh: refresh),
    ]).then((result) {
      var resMessageList = result[0] as List<InboxMessageEntity>;
      mailVOList = result[1] as List<InboxEmailEntity>;
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
      loadStatus.value = LoadDataStatus.success;
      update(["inboxList"]);
      completer.complete();
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
      completer.completeError(e);
    });
    return completer.future;
  }

  Future<List<ChatRoomEntity>> getChatRoomList({bool refresh = false}) {
    Completer<List<ChatRoomEntity>> completer = Completer();
    if(refresh){
      page = 0;
    }
    InboxApi.getChatRoomList(page: page, limit: limit).then((result) {
      if (refresh) {
        chatRoomList.clear();
      }
      if (result.length < limit) {
        refreshController.loadNoData();
      } else {
        page++;
        refreshController.loadComplete();
      }
      chatRoomList.addAll(result);
      chatRoomListSort();
      completer.complete(result);
    }, onError: (e) {
      refreshController.loadFailed();
      completer.completeError(e);
    });
    return completer.future;
  }

  /// 聊天排序
  void chatRoomListSort() {
    chatRoomList.sort((a, b) {
      if (a.pinnedStatus) {
        return -1;
      }
      if (b.pinnedStatus) {
        return 1;
      }
      return b.lastMessageSendTime.compareTo(a.lastMessageSendTime);
    });
  }

  setPinned(int chatId, bool isPinned) {
    InboxApi.setPinned(chatId: chatId, isPinned: isPinned).then((res) {
      var indexWhere = chatRoomList.indexWhere((e) => e.id == chatId);
      if (indexWhere != -1) {
        chatRoomList[indexWhere].pinnedStatus = isPinned;
        chatRoomListSort();
      }
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  delChatRoom(int chatId) {
    InboxApi.delChatRoom(chatId: chatId).then((res) {
      var firstWhereOrNull =
          chatRoomList.firstWhereOrNull((e) => e.id == chatId);
      if (firstWhereOrNull != null) {
        chatRoomList.remove(firstWhereOrNull);
        chatRoomList.refresh();
      }
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
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

  void onChatTap(ChatRoomEntity item, Map<String, int> arguments) {
    clearUnReadMessageCount(item);
    Get.toNamed(RouteNames.message, arguments: arguments);
  }

  /// 清空未读消息
  void clearUnReadMessageCount(ChatRoomEntity item) {
    var indexWhere = chatRoomList.indexWhere((e) => e.id == item.id);
    chatRoomList[indexWhere].unreadMessageCount = 0;
    chatRoomList.refresh();
  }
}
