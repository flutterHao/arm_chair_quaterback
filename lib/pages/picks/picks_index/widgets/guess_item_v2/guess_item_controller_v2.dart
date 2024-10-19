import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/16:44

class GuessItemControllerV2 extends GetxController{
  final int index;

  RxInt currentIndex = RxInt(-1);

  GuessItemControllerV2(this.index);

  guessItemTap(int i){
    Get.find<PicksIndexController>().choiceOne(index,double.parse("$index.$i"));
    if(currentIndex.value == i){
      currentIndex.value = -1;
      return;
    }
    currentIndex.value = i;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}