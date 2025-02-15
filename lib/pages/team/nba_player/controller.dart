import 'package:get/get.dart';

class NbaPlayerController extends GetxController {
  NbaPlayerController();
  RxList nbaPlayerList = RxList();

  initData() async {
    nbaPlayerList.addAll([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
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
    initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
