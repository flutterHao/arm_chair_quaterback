import 'package:get/get.dart';

import 'controller.dart';

class PickRankBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickRankController>(() => PickRankController());
  }
}
