import 'package:get/get.dart';

class NbaPlayerController extends GetxController {
  NbaPlayerController();

  _initData() {
    update(["nba_player"]);
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
