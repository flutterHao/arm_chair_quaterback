import 'package:get/get.dart';

import 'controller.dart';

class RankBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankController>(() => RankController());
  }
}
