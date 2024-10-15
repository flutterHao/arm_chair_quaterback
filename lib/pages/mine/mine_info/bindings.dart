import 'package:get/get.dart';

import 'controller.dart';

class MineInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineInfoController>(() => MineInfoController());
  }
}
