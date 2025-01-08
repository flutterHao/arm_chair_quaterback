import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  InboxController();

  List<InboxMessageEntity> messageList = [];

  bool loadDataSuccess = false;

  late StreamSubscription<int> subscription;

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
