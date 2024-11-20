import 'package:get/get.dart';

import 'controller.dart';

class LeagueDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeagueDetailController>(() => LeagueDetailController());
  }
}
