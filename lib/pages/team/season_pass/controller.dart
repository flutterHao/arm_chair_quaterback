import 'package:get/get.dart';

class SeasonPassController extends GetxController {
  SeasonPassController();

  _initData() {
    update(["season_pass"]);
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
