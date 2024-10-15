import 'package:get/get.dart';

import 'controller.dart';

class MineSettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineSettingController>(() => MineSettingController());
  }
}
