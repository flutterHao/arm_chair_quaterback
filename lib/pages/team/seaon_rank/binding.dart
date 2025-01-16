import 'package:get/get.dart';

import 'controller.dart';

class SeaonRankBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeaonRankController>(() => SeaonRankController());
  }
}
