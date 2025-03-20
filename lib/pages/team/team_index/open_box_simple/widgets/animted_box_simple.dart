/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-20 16:11:51
 * @LastEditTime: 2025-03-20 14:44:26
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box_simple/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AnimatedBoxSimple extends StatefulWidget {
  const AnimatedBoxSimple({super.key, required this.child});
  final Widget child;

  @override
  State<AnimatedBoxSimple> createState() => _AnimatedBoxSimpleState();
}

class _AnimatedBoxSimpleState extends State<AnimatedBoxSimple>
    with TickerProviderStateMixin {
  OpenBoxSimpleController ctrl = Get.find();

  late Animation<double> _compressScaleX;
  late Animation<double> _compressScaleY;
  late Animation<double> _jumpHeight;
  late Animation<double> _opacity;
  //摇动卡牌动画
  late AnimationController shakeController;
  late Animation<double> shakeAnimation;
  //光影动画
  // bool isOpen = false;

  @override
  void initState() {
    super.initState();
    ctrl.isOpen = false;
    ctrl.boxAniCtrl = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    //压缩变宽、上升变长、上升复原--下降变长，下降复原、下降压缩
    // 向下压缩变扁变宽
    _compressScaleX = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 20),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 20),
    ]).animate(ctrl.boxAniCtrl);

    _compressScaleY = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.7), weight: 20),
      //
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.2), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.7), weight: 20),

      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.1), weight: 10),

      TweenSequenceItem(tween: Tween(begin: 1.1, end: 0.7), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 10),
    ]).animate(ctrl.boxAniCtrl);

    // 弹射跳起并恢复原形
    _jumpHeight = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 150.h), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 150.h, end: 0.0), weight: 10),
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 30),
    ]).animate(ctrl.boxAniCtrl);

    // 落下渐隐藏消失
    _opacity = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 60),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 40),
    ]).animate(ctrl.boxAniCtrl);

    shakeAnimation = TweenSequence([
      for (int i = 0; i < 3; i++)
        TweenSequenceItem<double>(
            tween: Tween(begin: 0, end: -0.015), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: -0.015, end: 0), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 0.02), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: 0.02, end: 0), weight: 4),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 60),
    ]).animate(
      CurvedAnimation(
        parent: ctrl.boxAniCtrl,
        curve: Curves.linear,
      ),
    );

    // ctrl.fallOutAnimatedCtrl.reset();
    Future.delayed(200.milliseconds).then((v) {
      // ctrl.fallOutAnimatedCtrl.reset();
      ctrl.fallOutAnimatedCtrl.forward().then((v) {
        ctrl.update(["open_box_simple"]);
      });
    });
  }

  @override
  void dispose() {
    ctrl.boxAniCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ctrl.boxAniCtrl,
      builder: (context, child) {
        double fallOutScale = 0;
        if (ctrl.fallOutAnimation.value > 0.9) {
          fallOutScale = ctrl.fallOutAnimation.value - 1;
        }
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: Offset(0, -_jumpHeight.value),
            child: Transform.scale(
              alignment: Alignment.center,
              scaleX: _compressScaleX.value,
              scaleY: _compressScaleY.value + fallOutScale * 1.5,
              child: RotationTransition(
                  alignment: Alignment.center,
                  turns: shakeAnimation,
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        widget.child,
                        // if (showLight)
                        //   AnimatedBuilder(
                        //       animation: _lightController,
                        //       builder: (context, child) {
                        //         return Positioned(
                        //             top: 50.h,
                        //             left:
                        //                 startx + 100.h * lightAnimation.value,
                        //             child: Opacity(
                        //               opacity: 1 -
                        //                   lightAnimation.value *
                        //                       lightAnimation.value,
                        //               child: Image.asset(
                        //                 color: AppColors.cFFFFFF
                        //                     .withOpacity(0.6),
                        //                 Assets
                        //                     .cheerleadersUiCheerleadersBgLight,
                        //                 width: 120.h,
                        //               ),
                        //               // child: Container(
                        //               //     width: 100.h,
                        //               //     height: 120.h,
                        //               //     decoration: BoxDecoration(
                        //               //         gradient:
                        //               //             LinearGradient(colors: [
                        //               //       AppColors.cFFFFFF
                        //               //           .withOpacity(0.8),
                        //               //       AppColors.cFFFFFF
                        //               //           .withOpacity(0.6),
                        //               //       AppColors.cFFFFFF.withOpacity(0)
                        //               //     ]))),
                        //             ));
                        //       }),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
