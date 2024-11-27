import 'package:get/get.dart';

import 'controller.dart';

class TeamBattleV2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamBattleV2Controller>(() => TeamBattleV2Controller());
  }
}
