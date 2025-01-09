import 'package:get/get.dart';

class IllustratiionsController extends GetxController {
  IllustratiionsController();

  _initData() {
    update(["illustratiions"]);
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
