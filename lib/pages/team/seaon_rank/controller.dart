import 'package:get/get.dart';

class SeaonRankController extends GetxController {
  SeaonRankController();

  _initData() {
    update(["seaon_rank"]);
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
