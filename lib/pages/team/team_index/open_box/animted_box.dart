/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-20 16:11:51
 * @LastEditTime: 2025-02-06 15:32:54
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key, required this.child, required this.onTap});
  final Widget child;
  final Function onTap;

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with TickerProviderStateMixin {
  TeamIndexController ctrl = Get.find();
  late AnimationController _controller;
  late Animation<double> _compressScaleX;
  late Animation<double> _compressScaleY;
  late Animation<double> _jumpHeight;
  late Animation<double> _opacity;
  //摇动卡牌动画
  late AnimationController shakeController;
  late Animation<double> shakeAnimation;
  //光影动画
  late AnimationController _lightController;
  late Animation<double> lightAnimation;
  late bool showLight = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _lightController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    //压缩变宽、上升变长、上升复原--下降变长，下降复原、下降压缩
    // 向下压缩变扁变宽
    _compressScaleX = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 20),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 20),
    ]).animate(_controller);

    _compressScaleY = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.7), weight: 20),
      //
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.2), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.7), weight: 20),

      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.1), weight: 10),

      TweenSequenceItem(tween: Tween(begin: 1.1, end: 0.7), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 10),
    ]).animate(_controller);

    // 弹射跳起并恢复原形
    _jumpHeight = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 150.h), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 150.h, end: 0.0), weight: 10),
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 30),
    ]).animate(_controller);

    // 落下渐隐藏消失
    _opacity = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 60),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 40),
    ]).animate(_controller);

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
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    lightAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _lightController,
      curve: Curves.easeInOut,
    ));
    // ctrl.fallOutAnimatedCtrl.reset();
    Future.delayed(200.milliseconds).then((v) {
      // ctrl.fallOutAnimatedCtrl.reset();
      ctrl.fallOutAnimatedCtrl.forward().then((v) {
        Future.delayed(const Duration(milliseconds: 500), () {
          showLight = true;
          setState(() {});
          _lightController.forward();
          _lightController.addListener(() {
            if (lightAnimation.value == 1.0) {
              Future.delayed(const Duration(milliseconds: 1000), () {
                _lightController.reset();
                _lightController.forward();
              });
            }
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _lightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Log.d("打开宝箱");
        showLight = false;
        setState(() {});
        _controller.reset();
        _controller.forward().then((v) {
          widget.onTap();
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double fallOutScale = 0;
          if (ctrl.fallOutAnimatedCtrl.value > 0.8) {
            fallOutScale = ctrl.fallOutAnimatedCtrl.value - 1;
          }
          return Opacity(
            opacity: _opacity.value,
            child: Transform.translate(
              offset: Offset(0, -_jumpHeight.value),
              child: Transform.scale(
                scaleX: _compressScaleX.value,
                scaleY: _compressScaleY.value + fallOutScale,
                child: RotationTransition(
                    alignment: Alignment.center,
                    turns: shakeAnimation,
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          if (showLight)
                            Positioned(
                              bottom: -50.h,
                              child: AnimatedBuilder(
                                animation: _lightController,
                                builder: (context, child) {
                                  return Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()
                                      ..scale(0.4 + lightAnimation.value * 0.8)
                                      ..setEntry(3, 2, 0.001)
                                      ..rotateX(pi / 2.25)
                                      ..rotateZ(pi / 4),
                                    child: Opacity(
                                      opacity: 1 -
                                          lightAnimation.value *
                                              lightAnimation.value,
                                      child: Container(
                                        width: 210.h,
                                        height: 210.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.c1F83C8
                                                .withOpacity(0.2),
                                            gradient: RadialGradient(colors: [
                                              AppColors.c1F83C8
                                                  .withOpacity(0.0),
                                              AppColors.c1F83C8
                                                  .withOpacity(0.0),
                                              AppColors.c1F83C8
                                                  .withOpacity(0.0),
                                              AppColors.c1F83C8
                                                  .withOpacity(0.0),
                                              AppColors.c1F83C8
                                                  .withOpacity(0.6),
                                              AppColors.c1F83C8.withOpacity(0.8)
                                            ]),
                                            border: Border.all(
                                                color: AppColors.c1F83C8
                                                    .withOpacity(0.6),
                                                width: 8.h)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
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
      ),
    );
  }
}
