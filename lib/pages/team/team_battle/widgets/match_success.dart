import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/28/15:30

class MatchSuccess extends StatefulWidget {
  const MatchSuccess({required this.onCompleted, super.key});
  final Function() onCompleted;

  @override
  State<MatchSuccess> createState() => _MatchSuccessState();
}

class _MatchSuccessState extends State<MatchSuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  var progress = 0.0.obs;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200))
      ..addStatusListener(_matchStatusListener);
    animation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 3),
      TweenSequenceItem(tween: Tween(begin: 2.0, end: 3.0), weight: 3),
      TweenSequenceItem(tween: Tween(begin: 4.0, end: 5.0), weight: 4),
    ]).animate(animationController)
      ..addListener(_animationListener);
    animationController.forward();
  }

  void _animationListener() {
    progress.value = animation.value;
  }

  void _matchStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.onCompleted.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Obx(() {
      return Stack(
        children: _buildStartWidget(width, height),
      );
    });
  }

  List<Widget> _buildStartWidget(double width, double height) {
    TeamBattleController controller = Get.find();
    double designHeight = 261.w;
    return [
      /// left
      Positioned(
        left: -282.w * (progress.value < 2 ? (1 - progress.value) : 0),
        top: (height - designHeight) / 2,
        child: SizedBox(
          width: 282.w,
          height: 86.w,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 3.w),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    centerSlice: Rect.fromLTWH(0, 0, 2, 50),
                    image: AssetImage(Assets.uiBattlePanel_01Png),
                    colorFilter: ColorFilter.mode(
                      AppColors.c3B93FF, // 修改为你想要的颜色
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 3.w, right: 3.w),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    centerSlice: Rect.fromLTWH(0, 0, 2, 50),
                    image: AssetImage(Assets.uiBattlePanel_01Png),
                    colorFilter: ColorFilter.mode(
                      AppColors.cFFFFFF, // 修改为你想要的颜色
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "ME",
                                style: 10.w4(color: AppColors.c3B93FF,height: 1),
                              ),
                              Text("USER NAME",style: 19.w7(color: AppColors.c262626,height: 1),)
                            ],
                          ),
                        ),
                        7.vGap,
                        Container(
                          width: 143.w,
                          height: 20.w,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            color: AppColors.c3B93FF,
                            borderRadius: BorderRadius.circular(10.w)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("OVR",style: 14.w4(color: AppColors.cF2F2F2,height: 1),),
                              Text("75%",style: 14.w4(color: AppColors.cF2F2F2,height: 1),)
                            ],
                          ),
                        )
                      ],
                    ),
                    9.hGap,
                    Container(
                        width: 64.w,
                        height: 64.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.w),
                            border: Border.all(
                                color: AppColors.c3B93FF, width: 2.w)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.w),
                            child: IconWidget(
                                iconWidth: 64.w,
                                icon: controller.meAvatar))),
                    12.hGap,
                    IconWidget(
                      iconWidth: 7.w,
                      icon: Assets.uiTriangleGPng,
                      iconColor: AppColors.c3B93FF,
                      rotateAngle: 90,
                    ),
                    25.hGap
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      /// v
      Positioned(
          left: -width / 2 * (progress.value > 4 ? (5 - progress.value) : 1),
          top: (height - designHeight) / 2 + 86.w,
          bottom: (height - designHeight) / 2 + 86.w,
          child: Container(
            width: width / 2,
            height: 86.w,
            alignment: Alignment.centerRight,
            child: Text(
              "V",
              style: 64.w7(color: AppColors.cFFFFFF, height: 1),
            ),
          )),

      /// s
      Positioned(
          right: -width / 2 * (progress.value > 4 ? (5 - progress.value) : 1),
          top: (height - designHeight) / 2 + 86.w,
          bottom: (height - designHeight) / 2 + 86.w,
          child: Container(
            width: width / 2,
            height: 86.w,
            alignment: Alignment.centerLeft,
            child: Text(
              "S",
              style: 64.w7(color: AppColors.cFFFFFF, height: 1),
            ),
          )),

      /// right
      Positioned(
          right: -282.w *
              (progress.value > 2 && progress.value < 3
                  ? (1 - progress.value + 2)
                  : progress.value > 3
                      ? 0
                      : 1),
          // right: -282.w,
          bottom: (height - designHeight) / 2,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Transform.rotate(
                angle: pi,
                child: SizedBox(
                  width: 282.w,
                  height: 86.w,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 3.w),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            centerSlice: Rect.fromLTWH(0, 0, 2, 50),
                            image: AssetImage(Assets.uiBattlePanel_01Png),
                            colorFilter: ColorFilter.mode(
                              AppColors.cFF7954, // 修改为你想要的颜色
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3.w, right: 3.w),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            centerSlice: Rect.fromLTWH(0, 0, 2, 50),
                            image: AssetImage(Assets.uiBattlePanel_01Png),
                            colorFilter: ColorFilter.mode(
                              AppColors.cFFFFFF, // 修改为你想要的颜色
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  25.hGap,
                  IconWidget(
                    iconWidth: 7.w,
                    icon: Assets.uiTriangleGPng,
                    iconColor: AppColors.cFF7954,
                    rotateAngle: -90,
                  ),
                  12.hGap,
                  Container(
                      width: 64.w,
                      height: 64.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.w),
                          border: Border.all(
                              color: AppColors.cFF7954, width: 2.w)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(14.w),
                          child: IconWidget(
                              iconWidth: 64.w,
                              icon: controller.opponentAvatar))),
                  9.hGap,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "OPPONENT",
                              style: 10.w4(color: AppColors.cFF7954,height: 1),
                            ),
                            Text("USER NAME",style: 19.w7(color: AppColors.c262626,height: 1),)
                          ],
                        ),
                      ),
                      7.vGap,
                      Container(
                        width: 143.w,
                        height: 20.w,
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        decoration: BoxDecoration(
                            color: AppColors.cFF7954,
                            borderRadius: BorderRadius.circular(10.w)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("OVR",style: 14.w4(color: AppColors.cF2F2F2,height: 1),),
                            Text("75%",style: 14.w4(color: AppColors.cF2F2F2,height: 1),)
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          )),
    ];
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
