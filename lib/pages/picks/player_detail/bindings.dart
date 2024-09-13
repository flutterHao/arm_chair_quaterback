import 'package:get/get.dart';

import 'controller.dart';

class PlayerDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerDetailController>(() => PlayerDetailController());
  }
}
