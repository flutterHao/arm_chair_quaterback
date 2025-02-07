import 'package:arm_chair_quaterback/pages/team/team_historty/controller.dart';
import 'package:get/get.dart';

class TeamHistortyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamHistortyController>(() => TeamHistortyController());
  }
}
