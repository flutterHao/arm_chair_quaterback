import 'package:get/get.dart';

import 'controller.dart';

class PicksHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PicksHistoryController>(() => PicksHistoryController());
  }
}
