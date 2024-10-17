import 'package:get/get.dart';

import 'controller.dart';

class TradeIndexBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradeIndexController>(() => TradeIndexController());
  }
}
