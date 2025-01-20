import 'package:get/get.dart';

class TeamHistortyController extends GetxController {
  TeamHistortyController();

  _initData() {
    update(["team_historty"]);
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
