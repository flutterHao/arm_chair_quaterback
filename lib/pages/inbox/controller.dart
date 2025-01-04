import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:get/get.dart';

class InboxController extends GetxController {
  InboxController();

  List<InboxMessageEntity> messageList = [];

  _initData() {
    getMessageList();
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void getMessageList() async {
    messageList = await CacheApi.getInboxMessageList();
    update(["inboxList"]);
  }
}
