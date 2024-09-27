import 'package:get/get.dart';

class TeamBattleController extends GetxController {
  TeamBattleController();

  _initData() {
    update(["team_battle"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
