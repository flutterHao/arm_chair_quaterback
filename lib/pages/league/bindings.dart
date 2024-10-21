import 'package:get/get.dart';

import 'controller.dart';

class LeagueBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeagueController>(() => LeagueController());
  }
}
