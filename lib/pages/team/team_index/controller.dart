/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2024-10-08 18:13:47
 */

import 'dart:async';

import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamIndexController extends GetxController {
  TeamIndexController();

  ///布局
  RxBool isShow = false.obs;
  RxDouble trainingLeft = 0.0.obs;
  RxDouble bettleRight = 0.0.obs;
  RxDouble myTeamBottom = (-546.h).obs;
  RxDouble pageLeft = 0.0.obs;
  RxDouble pageRight = 0.0.obs;
  RxDouble turns = 0.5.obs;

  ///宝箱
  var box1Claimed = false.obs;
  var box2Claimed = false.obs;
  var box1Timer = 0.obs;
  var box2Timer = 0.obs;
  var isCountdownActive = false.obs; // 倒计时是否激活
  Timer? boxTimer;

  @override
  void onReady() {
    super.onReady();
  }

  void pageOnTap() {
    !isShow.value ? openPage() : closePage();
    update(["team_index"]);
  }

  void openPage() {
    trainingLeft.value = -152.h;
    bettleRight.value = -163.h;
    myTeamBottom.value = 0.h;
    pageLeft.value = -250.w;
    pageRight.value = -220.w;
    turns.value += 1 / 2;
    isShow.value = true;
  }

  void closePage() {
    trainingLeft.value = 0.0;
    bettleRight.value = 0.0;
    myTeamBottom.value = -556.0.h;
    pageLeft.value = 0.0;
    pageRight.value = 0.0;
    turns.value -= 1 / 2;
    isShow.value = false;
  }

  void updatePagePosition() {
    trainingLeft.value = 0.0;
    bettleRight.value = 0.0;
    myTeamBottom.value = -556.0.h;
    pageLeft.value = 0.0;
    pageRight.value = 0.0;
    isShow.value = false;
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
