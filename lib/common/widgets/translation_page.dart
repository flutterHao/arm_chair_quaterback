import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 转场
///@auther gejiahui
///created at 2025/3/14/17:58

class TranslationPage extends StatefulWidget {
  const TranslationPage({super.key, this.child, this.onEnd});

  final Widget? child;
  final Function? onEnd;

  @override
  State<TranslationPage> createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage>
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
        parent: animationController, curve: Interval(100 / milliseconds, 350 / milliseconds)));
    bottomRightAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Interval(800 / milliseconds, 1100 / milliseconds)));
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(1400 / milliseconds, 1700 / milliseconds)));
    Future.delayed(Duration.zero, () {
      animationController.forward().then((_){
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
