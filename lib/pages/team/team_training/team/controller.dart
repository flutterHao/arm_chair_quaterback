import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/line_up_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/player_bag_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamController extends GetxController with GetTickerProviderStateMixin {
  final random = Random();
  late TabController tabController;
  RxInt current = 0.obs;
  // double turns = 0;
  final List<String> tabs = ["Line-up", "Player bag"];
  final List<Widget> pages = const [
    LineUpTab(),
    PlayerBagTab(),
  ];
  List<String> teamList = ["C", "PG", "SG", "SF", "PF"];
  RxBool isRecovering = false.obs;
  List<int> lineUpList = [];
  RxBool showThirdCard = true.obs;

  var isShot = false.obs; // 使用 GetX 的响应式状态
  var isAscending = true.obs; // 动画是否在上升

  // final List<String> awardList = [
  //   Assets.uiIconPicks_01Png,
  //   Assets.uiIconTeam_01Png
  // ];
  // List<String> currentAward = ['', '', ''].obs;

  // late AnimationController prizeController;
  // late List<Leaf> leaves;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  void onTabChange(v) {
    current.value = v;
    tabController.animateTo(v);
  }
}

class Leaf {
  final int index;
  double x;
  double y;
  Widget widget;

  Leaf()
      : index = Random().nextInt(20),
        x = Random().nextDouble() * 375.w,
        y = Random().nextDouble() * -200.h,
        widget = Image.asset(
          Assets.uiBgMoneyPng,
          width: 50,
          fit: BoxFit.fitWidth,
        );
}

List<TweenSequenceItem<Offset>> _bounceList(double x) {
  return [
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.3), // 初始位置
        end: Offset(x, -0.45), // 到达下落终点
      ).chain(CurveTween(curve: Curves.easeIn)), // 加速下落
      weight: 10, // 占总时间的 40%
    ),
    // 第二阶段：第一次弹起（高弹）
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.45),
        end: Offset(x, -0.3), // 第一次弹起的高度
      ).chain(CurveTween(curve: Curves.easeOut)), // 弹起时减速
      weight: 10, // 占总时间的 20%
    ),
    // 第三阶段：第二次弹起（高度较低）
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.3),
        end: Offset(x, -0.4), // 弹回接近终点
      ).chain(CurveTween(curve: Curves.easeInOut)), // 缓和过渡
      weight: 10, // 占总时间的 20%
    ),
    // 第四阶段：小幅度的余震弹跳
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(x, -0.4),
        end: Offset(x, -0.3), // 最终停止的位置
      ).chain(CurveTween(curve: Curves.easeOut)), // 最后弹回减速
      weight: 10, // 占总时间的 20%
    ),
  ];
}

TweenSequence<Offset> _customBounceSequence(double xPosition) {
  return TweenSequence<Offset>([
    // 第一阶段：快速下落到较低位置
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(xPosition, -0.5), // 初始位置
        end: Offset(xPosition, 0.3), // 到达下落终点
      ).chain(CurveTween(curve: Curves.easeIn)), // 加速下落
      weight: 12, // 占总时间的 40%
    ),
    // 第二阶段：第一次弹起（高弹）
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(xPosition, 0.3),
        end: Offset(xPosition, -0.2), // 第一次弹起的高度
      ).chain(CurveTween(curve: Curves.easeOut)), // 弹起时减速
      weight: 6, // 占总时间的 20%
    ),
    // 第三阶段：第二次弹起（高度较低）
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(xPosition, -0.2),
        end: Offset(xPosition, 0.1), // 弹回接近终点
      ).chain(CurveTween(curve: Curves.easeInOut)), // 缓和过渡
      weight: 6, // 占总时间的 20%
    ),
    // 第四阶段：小幅度的余震弹跳
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset(xPosition, 0.1),
        end: Offset(xPosition, 0), // 最终停止的位置
      ).chain(CurveTween(curve: Curves.easeOut)), // 最后弹回减速
      weight: 6, // 占总时间的 20%
    ),
  ]);
}


// class HighBounceOutCurve extends Curve {
//   // const HighBounceOutCurve._();
//   @override
//   double transformInternal(double t) {
//     // 通过更平滑的方式增加弹跳高度
//     double bounceHeightFactor = 1.2; // 适度提升弹跳高度

//     if (t < 0.5) {
//       // 第一阶段（弹跳进入）
//       return (1.0 - _highBounce(1.0 - t * 2.0, bounceHeightFactor)) * 0.5;
//     } else {
//       // 第二阶段（弹跳退出）
//       return _highBounce(t * 2.0 - 1.0, bounceHeightFactor) * 0.5 + 0.5;
//     }
//   }

//   // 修改后的 _bounce 函数，保持较小的弹跳高度变化，避免计算过多
//   double _highBounce(double t, double bounceHeightFactor) {
//     const double scale = 7.5625;
//     // 通过简化条件分支，减少 t 的不必要变化
//     if (t < 1 / 2.75) {
//       return scale * t * t * bounceHeightFactor; // 第一阶段
//     } else if (t < 2 / 2.75) {
//       t -= 1.5 / 2.75;
//       return scale * (t * t + 0.75) * bounceHeightFactor; // 第二阶段
//     } else if (t < 2.5 / 2.75) {
//       t -= 2.25 / 2.75;
//       return scale * (t * t + 0.9375) * bounceHeightFactor; // 第三阶段
//     } else {
//       t -= 2.625 / 2.75;
//       return scale * (t * t + 0.984375) * bounceHeightFactor; // 第四阶段
//     }
//   }
// }
