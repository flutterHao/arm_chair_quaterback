import 'package:get/get.dart';

import 'controller.dart';

class ReciveRwardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReciveRwardController>(() => ReciveRwardController());
  }
}
