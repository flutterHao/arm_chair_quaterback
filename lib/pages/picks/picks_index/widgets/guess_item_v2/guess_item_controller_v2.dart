import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/16:44

class GuessItemControllerV2 extends GetxController {
  final PicksPlayerV2 playerV2;

  RxInt currentIndex = RxInt(-1);

  GuessItemControllerV2(this.playerV2);

  guessItemTap(int i) {
    print('guessItemTap----:$i');
    // 0 more 1 less
    if (currentIndex.value == i) {
      currentIndex.value = playerV2.status = -1;
    } else {
      currentIndex.value = playerV2.status = i;
    }
    Get.find<PicksIndexController>().choiceOne(player: playerV2);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
