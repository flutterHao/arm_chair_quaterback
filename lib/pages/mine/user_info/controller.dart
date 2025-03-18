import 'package:get/get.dart';

class UserInfoController extends GetxController {
  UserInfoController();

  _initData() {
    update(["user_info"]);
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
