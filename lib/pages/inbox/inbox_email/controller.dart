import 'package:get/get.dart';

class InboxEmailController extends GetxController {
  InboxEmailController();

  _initData() {
    update(["inbox_email"]);
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
