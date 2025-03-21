import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/clipper/translation_clipper.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 转场
///@auther gejiahui
///created at 2025/3/14/17:58

class TranslationPageV2 extends StatefulWidget {
  const TranslationPageV2({super.key, this.child, this.onEnd});

  final Widget? child;
  final Function? onEnd;

  @override
  State<TranslationPageV2> createState() => _TranslationPageV2State();
}

class _TranslationPageV2State extends State<TranslationPageV2>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation topLeftAnimation;
  late Animation bottomRightAnimation;
  late Animation opacityAnimation;

  @override
  void initState() {
    super.initState();
    var milliseconds = 2100;
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));
    topLeftAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(100 / milliseconds, 350 / milliseconds)));
    bottomRightAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(800 / milliseconds, 1100 / milliseconds)));
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(1400 / milliseconds, 1700 / milliseconds)));
    Future.delayed(Duration.zero, () {
      animationController.forward().then((_) {
        widget.onEnd?.call();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c000000,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
              animation: topLeftAnimation,
              builder: (context, child) {
                return Positioned(
                    top: topLeftAnimation.value * -169.w,
                    right: topLeftAnimation.value * 169.w,
                    child: IconWidget(
                      icon: Assets.managerUiMangerNew22,
                      iconWidth: 169.w,
                    ));
              }),
          AnimatedBuilder(
              animation: bottomRightAnimation,
              builder: (context, child) {
                return Positioned(
                    bottom: bottomRightAnimation.value * -204.w,
                    left: bottomRightAnimation.value * 204.w,
                    child: IconWidget(
                      icon: Assets.managerUiMangerNew21,
                      iconWidth: 204.w,
                    ));
              }),
          Positioned(
              top: 259.h,
              child: OutlinedText(
                  text: "EVENT",
                  strokeWidth: 1.w,
                  strokeColor: AppColors.c4D4D4D,
                  textStyle: 140.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium,
                  ))),
          Positioned(
              top: 305.h,
              child: AnimatedBuilder(
                  animation: opacityAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: opacityAnimation.value,
                      child: widget.child ??
                          Column(
                            children: [
                              Text(
                                "PLAYER",
                                style: 45.w5(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              ),
                              Text(
                                "POACHING",
                                style: 54.w7(
                                  color: AppColors.cFFFFFF,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold,
                                ),
                              ),
                            ],
                          ),
                    );
                  }))
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class TranslationPage extends StatefulWidget {
  const TranslationPage({super.key, this.child, this.onEnd});

  final Widget? child;
  final Function? onEnd;

  @override
  State<TranslationPage> createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation enterAnimation;
  late Animation splitAnimation;
  late Animation textEnterAnimation;

  // late AnimationController outAnimationController;
  late Animation outerAnimation;
  late Animation textTranslateAnimation;

  late ScrollController topRightScrollerController = ScrollController();
  late ScrollController bottomLeftScrollerController = ScrollController();

  Timer? timer;

  @override
  void initState() {
    super.initState();
    var milliseconds = 1600;
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));
    // outAnimationController = AnimationController(vsync: this,duration: Duration(milliseconds: ))
    enterAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(0, 500 / milliseconds)));
    splitAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(600 / milliseconds, 1000 / milliseconds)));
    textEnterAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(700 / milliseconds, 1000 / milliseconds)));

    outerAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(1300 / milliseconds, 1500 / milliseconds)));
    textTranslateAnimation = Tween(begin: -10.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(1400 / milliseconds, 1600 / milliseconds)));

    textEnterAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
          if (topRightScrollerController.hasClients) {
            topRightScrollerController.animateTo(
              topRightScrollerController.offset + 50, // 每次向下滚动 2px
              duration: Duration(milliseconds: 50),
              curve: Curves.linear,
            );
          }
          if (bottomLeftScrollerController.hasClients) {
            bottomLeftScrollerController.animateTo(
              bottomLeftScrollerController.offset + 51, // 每次向下滚动 2px
              duration: Duration(milliseconds: 50),
              curve: Curves.linear,
            );
          }
        });
      }
    });
    Future.delayed(Duration.zero, () {
      animationController.forward().then((_) {
        widget.onEnd?.call();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var shortHeight = 200.h;
    var longHeight = shortHeight + width;
    return Container(
      color: AppColors.c000000,
      child: Stack(
        children: [
          /// 未知事件
          AnimatedBuilder(
              animation: textEnterAnimation,
              builder: (context, child) {
                return Opacity(
                    opacity: textEnterAnimation.value,
                    child: SizedBox(
                      width: width,
                      height: size.height,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          OutlinedText(
                            text: "EVENT",
                            textStyle: 140.w5(
                              color: AppColors.c000000,
                              height: 1,
                              fontFamily: FontFamily.fOswaldMedium,
                            ),
                            strokeWidth: 2.w,
                            strokeColor: AppColors.c4D4D4D,
                          ),
                          AnimatedBuilder(
                              animation: outerAnimation,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: 1.0 - outerAnimation.value,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "?",
                                        style: 134.w7(
                                          color: AppColors.cFFFFFF,
                                          height: 1,
                                          fontFamily: FontFamily.fRobotoBlack,
                                        ),
                                      ),
                                      Text(
                                        "EVENTS",
                                        style: 40.w5(
                                          color: AppColors.cFFFFFF,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          AnimatedBuilder(
                              animation: Listenable.merge(
                                  [outerAnimation, textTranslateAnimation]),
                              builder: (context, child) {
                                return Transform.translate(
                                  offset:
                                      Offset(0, textTranslateAnimation.value),
                                  child: Opacity(
                                      opacity: outerAnimation.value,
                                      child: widget.child ??
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              60.vGap,
                                              Text(
                                                "PLAYER",
                                                style: 45.w5(
                                                  color: AppColors.cFFFFFF,
                                                  fontFamily:
                                                      FontFamily.fOswaldMedium,
                                                  height: 1,
                                                ),
                                              ),
                                              Text(
                                                "POACHING",
                                                style: 54.w7(
                                                  color: AppColors.cFFFFFF,
                                                  fontFamily:
                                                      FontFamily.fOswaldBold,
                                                  height: 1,
                                                ),
                                              ),
                                            ],
                                          )),
                                );
                              }),
                        ],
                      ),
                    ));
              }),

          ///上方梯形
          AnimatedBuilder(
              animation: splitAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset:
                      Offset(0, -(longHeight - 160.h) * splitAnimation.value),
                  child: AnimatedBuilder(
                      animation: enterAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(-width * enterAnimation.value,
                              -width * enterAnimation.value),
                          child: ClipPath(
                            clipper:
                                TranslationClipper(longHeight, shortHeight),
                            child: Container(
                              width: width,
                              height: longHeight,
                              color: AppColors.cBD1C09,
                            ),
                          ),
                        );
                      }),
                );
              }),

          /// 上方进度条
          Positioned(
            right: 165.h,
            top: -250.h,
            child: Transform.rotate(
              angle: -pi / 4,
              child: SizedBox(
                width: 7,
                height: 500.h,
                child: ListView.builder(
                    controller: topRightScrollerController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      bool first = index == 0;
                      return Container(
                        width: 7,
                        height: 250.h,
                        margin: EdgeInsets.only(
                            top: first ? 500.w : 15.w, bottom: 15.w),
                        child: ClipPath(
                          clipper: TranslationProgressClipper(),
                          child: Container(
                            color: index % 2 == 0
                                ? AppColors.c1F8FE5
                                : AppColors.cBD1C09,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),

          /// 下方梯形
          Positioned(
            bottom: 0,
            child: AnimatedBuilder(
                animation: splitAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset:
                        Offset(0, (longHeight - 160.h) * splitAnimation.value),
                    child: AnimatedBuilder(
                        animation: enterAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(width * enterAnimation.value,
                                width * enterAnimation.value),
                            child: Transform.rotate(
                              angle: pi,
                              child: ClipPath(
                                clipper:
                                    TranslationClipper(longHeight, shortHeight),
                                child: Container(
                                  width: width,
                                  height: longHeight,
                                  color: AppColors.c1F8FE5,
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }),
          ),

          /// 下方进度条
          Positioned(
            left: 165.h,
            bottom: -250.h,
            child: Transform.rotate(
              angle: pi / 4 * 3,
              child: SizedBox(
                width: 7,
                height: 500.h,
                child: ListView.builder(
                    controller: bottomLeftScrollerController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      bool first = index == 0;
                      return Container(
                        width: 7,
                        height: 250.h,
                        margin: EdgeInsets.only(
                            top: first ? 500.w : 15.w, bottom: 15.w),
                        child: ClipPath(
                          clipper: TranslationProgressClipper(),
                          child: Container(
                            color: index % 2 == 0
                                ? AppColors.c1F8FE5
                                : AppColors.cBD1C09,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    timer?.cancel();
    super.dispose();
  }
}
