import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RipperAnimation extends StatefulWidget {
  const RipperAnimation({super.key});

  @override
  State<RipperAnimation> createState() => _RipperAnimationState();
}

class _RipperAnimationState extends State<RipperAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  var progress = 0.0.obs;
  late Animation animation;
  late double width = 200.w, height = 200.w;

  void _scanStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
      animationController.forward();
    }
  }

  void _animationListener() {
    progress.value = animation.value;
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000))
      ..addStatusListener(_scanStatusListener);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(_animationListener);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double minSize = 50.w;
    double maxWidthHeight = max(width, height);
    return Container(
      width: width,
      height: height,
      // color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 大圆
          Obx(() {
            var p = progress.value;
            double rWidth = maxWidthHeight * p;
            return Positioned(
              width: rWidth,
              height: rWidth,
              child: rWidth <= minSize
                  ? const SizedBox.shrink()
                  : Container(
                      decoration: BoxDecoration(
                          color: AppColors.cFF7954.withOpacity(.5 * (1 - p)),
                          borderRadius: BorderRadius.circular(rWidth / 2),
                          border: Border.all(
                              color:
                                  AppColors.cFF7954.withOpacity(.8 * (1 - p)),
                              width: 3.w)),
                    ),
            );
          }),
          // 小圆
          Obx(() {
            var p = progress.value - 0.2;
            double rWidth = maxWidthHeight * p;
            return Positioned(
              width: rWidth,
              height: rWidth,
              child: rWidth <= minSize
                  ? const SizedBox.shrink()
                  : Container(
                      decoration: BoxDecoration(
                          color: AppColors.cFF7954.withOpacity(.5 * (1 - p)),
                          borderRadius: BorderRadius.circular(rWidth / 2),
                          border: Border.all(
                              color:
                                  AppColors.cFF7954.withOpacity(.6 * (1 - p)),
                              width: 2)),
                    ),
            );
          }),
        ],
      ),
    );
  }
}
