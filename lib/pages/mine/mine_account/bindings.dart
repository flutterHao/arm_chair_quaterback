import 'package:get/get.dart';

import 'controller.dart';

class MineAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineAccountController>(() => MineAccountController());
  }
}
