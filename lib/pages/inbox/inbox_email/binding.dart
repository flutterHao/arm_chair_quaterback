import 'package:arm_chair_quaterback/pages/inbox/inbox_email/index.dart';
import 'package:get/get.dart';

import '../controller.dart';

class InBoxEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxEmailController>(() => InboxEmailController());
  }
}
