import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:get/get.dart';

import '../../../common/entities/inbox_email_entity.dart';

class InboxEmailController extends GetxController {
  InboxEmailController();
  RxList<InboxEmailEntity> emailList = <InboxEmailEntity>[].obs;
  initData() async {
    emailList.value = await PicksApi.getInBoxEmailList();
  }

  void onTap() {
    // CacheApi.propDefineMap
    // Uitil
  }

  // @override
  @override
  void onInit() {
    super.onInit();
    initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
