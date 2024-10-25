/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-16 17:24:51
 * @LastEditTime: 2024-10-25 11:45:49
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:get/get.dart';

class BeautyController extends GetxController {
  RxInt beautyIndex = 0.obs;
  List beautyList = [
    // Assets.uiBelle_01Png,
    Assets.uiBelle_04Png,
    // Assets.uiBelle_02Png,
    Assets.uiBelle_05Png,
    // Assets.uiBelle_03Png,
    Assets.uiBelle_06Png
  ];

  int clothingIndex = 0;
  List<String> clothingList = [
    Assets.uiClothing_01Png,
    Assets.uiClothing_02Png,
    Assets.uiClothing_03Png,
  ];

  void onClothingTap(int index) {
    clothingIndex = index;
    update();
  }
}
