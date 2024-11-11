/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-16 17:24:51
 * @LastEditTime: 2024-10-26 19:06:30
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BeautyController extends GetxController {
  RxInt beautyIndex = 0.obs;
  List beautyList = [
    Assets.uiBelle_01Png,
    Assets.uiBelle_04Png,
    Assets.uiBelle_02Png,
    Assets.uiBelle_05Png,
    Assets.uiBelle_03Png,
    Assets.uiBelle_06Png
  ];

  int clothingIndex = 0;
  List<String> clothingList = [
    Assets.uiClothing_01Png,
    Assets.uiClothing_02Png,
    Assets.uiClothing_03Png,
  ];

  ///宝箱
  var box1Claimed = false.obs;
  var box2Claimed = false.obs;
  var box1Timer = 0.obs;
  var box2Timer = 0.obs;
  var isCountdownActive = false.obs; // 倒计时是否激活
  Timer? boxTimer;

  void onClothingTap(int index) {
    clothingIndex = index;
    update();
  }

  ///打开宝箱
  void claimBox(int boxNumber) {
    if (boxNumber == 1 && !box1Claimed.value) {
      box1Claimed.value = true;
      box1Timer.value = 4 * 60 * 60; // 4小时
      Log.d("领取宝箱$boxNumber");
    } else if (boxNumber == 2 && !box2Claimed.value) {
      box2Claimed.value = true;
      box2Timer.value = 4 * 60 * 60; // 4小时
      Log.d("领取宝箱$boxNumber");
    }

    // 如果两个都已领取，开始倒计时
    if (box1Claimed.value && box2Claimed.value) {
      startTimer();
    }
  }

  void startTimer() {
    if (boxTimer != null) {
      boxTimer!.cancel();
    }

    isCountdownActive.value = true;

    // 每秒更新倒计时
    boxTimer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (box1Timer.value > 0 || box2Timer.value > 0) {
        if (box1Timer.value > 0) box1Timer.value--;
        if (box2Timer.value > 0) box2Timer.value--;

        // 确保只显示剩余时间较短的一个
        if (box1Timer.value <= 0 && box2Timer.value <= 0) {
          t.cancel();
          isCountdownActive.value = false;
        }
      } else {
        t.cancel();
        isCountdownActive.value = false;
      }
    });
  }

  String getCountDownTimeStr() {
    int seconds = isCountdownActive.value
        ? (box1Timer.value < box2Timer.value
            ? box1Timer.value
            : box2Timer.value)
        : 0;
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$secs";
  }

  @override
  void onClose() {
    boxTimer?.cancel();
    super.onClose();
  }
}
