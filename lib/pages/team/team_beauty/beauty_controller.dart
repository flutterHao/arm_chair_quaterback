/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-16 17:24:51
 * @LastEditTime: 2025-03-03 14:42:11
 */
import 'dart:ui';

import 'package:arm_chair_quaterback/common/entities/gilr_entity.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/animtion_love.dart';
import 'package:get/get.dart';
import 'package:spine_flutter/spine_flutter.dart';
import 'dart:async';

class BeautyController extends GetxController {
  RxInt beautyIndex = 0.obs;
  List<GirlEntity> girlList = [];

  int clothingIndex = 0;

  ///宝箱
  var box1Claimed = false.obs;
  var box2Claimed = false.obs;
  var box1Timer = 0.obs;
  var box2Timer = 0.obs;
  var isCountdownActive = false.obs; // 倒计时是否激活
  Timer? boxTimer;

  late SpineWidgetController spineWidgetController;
  final List<AnimationLove> hearts = [];
  bool compeleted = true;
  bool expandedGirl = false;

  @override
  void onInit() {
    super.onInit();
    girlList.clear();
    girlList = _gilrConfig.map((e) => GirlEntity.fromJson(e)).toList();
    spineWidgetController = SpineWidgetController(onInitialized: (controller) {
      // Set the default mixing time between animations
      controller.animationState.getData().setDefaultMix(0.2);
      // Set the portal animation on track 0
      controller.animationState.setAnimationByName(0, "stand", true);
      // Queue the run animation after the portal animation
      // controller.animationState.addAnimationByName(0, "run", true, 0);
    });
  }

  GirlEntity get currentGirl {
    return girlList[beautyIndex.value];
  }

  void setAnimation(int position) {
    if (!compeleted) return;
    compeleted = false;
    var type = position == 2 ? "click1" : "click2";
    spineWidgetController.animationState
        .setAnimationByName(0, type, false)
        .setListener((type, trackEntry, event) {
      if (type == EventType.complete) {
        spineWidgetController.animationState
            .setAnimationByName(0, "stand", true);
        compeleted = true;
      }
    });
  }

  void onClothingTap(int index) {
    clothingIndex = index;
    update();
  }

  ///打开宝箱
  void claimBox(int boxNumber) {
    if (boxNumber == 1 && !box1Claimed.value) {
      box1Claimed.value = true;
      box1Timer.value = 4 * 60 * 60; // 4小时
    } else if (boxNumber == 2 && !box2Claimed.value) {
      box2Claimed.value = true;
      box2Timer.value = 4 * 60 * 60; // 4小时
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

  void addHeart(Offset offset) {
    hearts.add(
      AnimationLove(
        startPosition: offset,
        onCompleted: () {
          // hearts.removeWhere((heart) => heart.startPosition == offset);
          // update();
        },
      ),
    );
    update();
  }

  @override
  void onClose() {
    boxTimer?.cancel();
    super.onClose();
  }
}

List _gilrConfig = [
  {
    "textColor": [0xFF822156, 0xFFA7286D, 0xFF822156],
    "backGroundColor": [0xFF000000, 0xFFA6276C, 0xFF000000],
    "lightColor": 0xFFDC3590,
    "girlImg": Assets.cheerleadersUiCheerleaders02,
    "grade": "SR",
    // "bgColor": 0xFFD5BD89,
    "bgColor": 0xFFDC3590,
  },
  {
    "textColor": [0xFF812533, 0xFFA92F42, 0xFF812533],
    "backGroundColor": [0xFF000000, 0xFFA62F41, 0xFF000000],
    "lightColor": 0xFFF1415A,
    "girlImg": Assets.cheerleadersUiCheerleaders01,
    "grade": "S",
    "bgColor": 0xFFDC4258,
  },
  {
    "textColor": [0xFF53217C, 0xFF6C2DA0, 0xFF53217C],
    "backGroundColor": [0xFF000000, 0xFF2B6BBE, 0xFF000000],
    "lightColor": 0xFF2FA6EB,
    "girlImg": Assets.cheerleadersUiCheerleaders03,
    "grade": "S",
    "bgColor": 0xFF3471C3,
  },
  {
    "textColor": [0xFF822156, 0xFFA7286D, 0xFF822156],
    "backGroundColor": [0xFF000000, 0xFF5E258D, 0xFF000000],
    "lightColor": 0xFF9F47E9,
    "girlImg": Assets.cheerleadersUiCheerleaders04,
    "grade": "S",
    "bgColor": 0xFF913ED7,
  },
  {
    "textColor": [0xFF135658, 0xFF1F7B7E, 0xFF135658],
    "backGroundColor": [0xFF000000, 0xFF166365, 0xFF000000],
    "lightColor": 0xFF3ED2D7,
    "girlImg": Assets.cheerleadersUiCheerleaders05,
    "grade": "SR",
    "bgColor": 0xFF3ED2D7,
  },
  {
    "textColor": [0xFF672611, 0xFF95391C, 0xFF672611],
    "backGroundColor": [0xFF000000, 0xFF6F2812, 0xFF000000],
    "lightColor": 0xFFDF592F,
    "girlImg": Assets.cheerleadersUiCheerleaders06,
    "grade": "SR",
    "bgColor": 0xFFDF592F,
  },
  // {
  //   "textColor": [0xFF672611, 0xFF95391C, 0xFF672611],
  //   "backGroundColor": [0xFF000000, 0xFF6F2812, 0xFF000000],
  //   "lightColor": 0xFFDF592F,
  //   "girlImg": Assets.cheerleadersUiCheerleaders00,
  //   "grade": "SR",
  //   "bgColor": 0xFFDF592F,
  // },
];
