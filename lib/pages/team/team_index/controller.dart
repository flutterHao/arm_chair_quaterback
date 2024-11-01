/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2024-11-01 18:28:31
 */

import 'dart:async';

import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamIndexController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamIndexController();

  ///布局
  RxBool isShow = false.obs;
  RxDouble trainingLeft = 0.0.obs;
  RxDouble bettleRight = 0.0.obs;
  RxDouble myTeamBottom = (-556.h).obs;
  RxDouble pageX = 0.0.obs;
  RxDouble turns = 0.5.obs;
  bool isOnTopSide = true;
  // late AnimationController pageAnimationCtrl;
  // late Animation<double> pageAnimation;

  ///宝箱
  var box1Claimed = false.obs;
  var box2Claimed = false.obs;
  var box1Timer = 0.obs;
  var box2Timer = 0.obs;
  var isCountdownActive = false.obs; // 倒计时是否激活
  Timer? boxTimer;

  // MyTeamEntity myTeamEntity = MyTeamEntity();

  @override
  void onInit() {
    super.onInit();
    // pageAnimationCtrl = AnimationController(
    //   duration: const Duration(milliseconds: 500),
    //   vsync: this,
    // );

    // pageAnimation =
    //     Tween<double>(begin: 0.0, end: 1.0).animate(pageAnimationCtrl);
    // pageAnimationCtrl.addListener(() {
    //   pageLeft.value = pageAnimationCtrl.value;
    //   update(["team_index"]);
    // });
    CacheApi.getNBATeamDefine();
    CacheApi.getNBAPlayerInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // void getMyTeamPlayer() {
  //   int teamId =
  //       Get.find<HomeController>().userEntiry.teamLoginInfo!.team!.teamId ?? 0;
  //   TeamApi.getMyTeamPlayer(teamId).then((v) {
  //     myTeamEntity = v;
  //   });
  // }

  void pageOnTap() {
    // pageAnimation = Tween<double>(
    //         begin: !isShow.value ? 0.w : -250, end: !isShow.value ? -250.w : 0)
    //     .animate(pageAnimationCtrl);
    // pageAnimationCtrl.forward(from: pageLeft.value);
    !isShow.value ? openPage() : closePage();
  }

  void openPage() {
    Log.d("打开");
    trainingLeft.value = -152.h;
    bettleRight.value = -163.h;
    myTeamBottom.value = 0.h;
    pageX.value = -250.w;
    turns.value += isShow.value ? 0 : 1 / 2;
    isShow.value = true;
    update(["team_index"]);
    TeamController teamController = Get.find();
    teamController.initData();
  }

  void closePage() {
    Log.d("关闭");
    trainingLeft.value = 0.0;
    bettleRight.value = 0.0;
    myTeamBottom.value = -556.0.h;
    pageX.value = 0.0;
    turns.value -= !isShow.value ? 0 : 1 / 2;
    isShow.value = false;
    isOnTopSide = true;
    update(["team_index"]);
  }

  // void updatePagePosition() {
  //   trainingLeft.value = 0.0;
  //   bettleRight.value = 0.0;
  //   myTeamBottom.value = -556.0.h;
  //   pageLeft.value = 0.0;
  //   pageRight.value = 0.0;
  //   isShow.value = false;
  //   isOnTopSide = true;
  // }

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
