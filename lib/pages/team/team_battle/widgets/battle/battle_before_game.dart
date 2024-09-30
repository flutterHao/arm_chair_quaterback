import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/29/15:23

class BattleBeforeGame extends StatefulWidget {
  const BattleBeforeGame({super.key, required this.onDown});

  final Function onDown;

  @override
  State<BattleBeforeGame> createState() => _BattleBeforeGameState();
}

class _BattleBeforeGameState extends State<BattleBeforeGame>
    with SingleTickerProviderStateMixin {
  late TeamBattleController controller;

  late AnimationController animationController;

  late Animation<double> animation;

  late double width;

  late var breakingNewsAnimationValue = 0.0.obs;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    pageController = PageController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.onBreakingNewsComplete();
        }
      });
    Future.delayed(const Duration(seconds: 2), () {
      /// 更换pageView
      pageController.animateToPage(1,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
      Future.delayed(const Duration(seconds: 2), () {
        if (controller.havaBreakingNews()) {
          ///突发新闻
          animation = Tween(begin: 0.0, end: width).animate(animationController)
            ..addListener(() {
              breakingNewsAnimationValue.value = animation.value;
            });
          animationController.duration = const Duration(milliseconds: 100);
          controller.onBreakingNewsStart();
          animationController.forward();
        } else {
          widget.onDown.call();
        }
      });
    });
  }

  Widget _buildBreakingNews() {
    return Obx(() {
      return Positioned(
          bottom: 384.h,
          left: width - breakingNewsAnimationValue.value,
          right: -width + breakingNewsAnimationValue.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    // height: 130.h,
                    margin: EdgeInsets.only(top: 16.w),
                    decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.h))),
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 32.h, bottom: 16.h, right: 32.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                              width: 82.h,
                              height: 82.h,
                              decoration: BoxDecoration(
                                  color: AppColors.cFFFFFF,
                                  borderRadius: BorderRadius.circular(19.h)),
                              child: IconWidget(
                                  iconWidth: 65.h,
                                  icon: Assets.uiBattleNewsPng)),
                          Expanded(
                              child: Text.rich(TextSpan(
                                  style: 12.w4(color: AppColors.cB2B2B2),
                                  children: [
                                const TextSpan(
                                    text:
                                        "Recently, Kevin Durant because of drinking some unknown substances, resulting in infection to the team.so that"),
                                TextSpan(
                                    text: " the physical value of ",
                                    style: 12.w7(color: AppColors.c000000)),
                                TextSpan(
                                    text: "the team's",
                                    style: 12.w7(color: AppColors.c3B93FF)),
                                TextSpan(
                                    text: " starting players",
                                    style: 12.w7(color: AppColors.c000000)),
                                TextSpan(
                                    text: " -5%.",
                                    style: 12.w7(color: AppColors.cE72646)),
                              ])))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 32.h,
                    width: 208.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.cE72646,
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(16.h))),
                    child: Text(
                      "BREAKING NEWS",
                      style: 21.w7(color: AppColors.cFFFFFF),
                    ),
                  )
                ],
              ),
              20.vGap,
              Text(
                "TAP SCREEN TO CONTINUE",
                style: 14.w7(color: AppColors.c666666),
              )
            ],
          ));
    });
  }

  Widget _buildPlayers() {
    /// 垂直范围 320.h - 370.h
    List<Offset> positions = [
      Offset(30.h, 14.h),
      Offset(99.h, 10.h),
      Offset(180.h, 15.h),
      Offset(70.h, 35.h),
      Offset(130.h, 40.h),
    ];
    return Positioned(
      top: 320.h,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 70.h,
        child: Stack(
          children: [
            /// left
            ...List.generate(positions.length, (index) {
              var dx = positions[index].dx;
              var dy = positions[index].dy;
              return Positioned(
                  left: dx,
                  top: dy,
                  child: IconWidget(
                      iconWidth: 15.h, icon: Assets.uiIconLocation_02Png));
            }),
            // right
            ...List.generate(positions.length, (index) {
              var dx = positions[index].dx;
              var dy = positions[index].dy;
              return Positioned(
                  right: dx,
                  top: dy,
                  child: IconWidget(
                      iconWidth: 15.h, icon: Assets.uiIconLocation_01Png));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Positioned(
      bottom: 40.h,
      left: 0,
      right: 0,
      child: Container(
        width: double.infinity,
        height: 331.h,
        constraints: BoxConstraints(maxWidth: 344.w),
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 46.h),
              decoration: BoxDecoration(
                  color: AppColors.c262626,
                  borderRadius: BorderRadius.circular(20.w)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Row(
                    children: [
                      Text(
                        "75%",
                        style: 14.w7(color: AppColors.c3B93FF),
                      ),
                      13.hGap,
                      Expanded(
                        child: SizedBox(
                          height: 8.w,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(4.w),
                            value: .75,
                            color: AppColors.c3B93FF,
                            backgroundColor: AppColors.c666666,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 40.w,
                          child: Center(
                              child: Text(
                            "POINT",
                            style: 10.w4(color: AppColors.c666666),
                          ))),
                      Expanded(
                        child: SizedBox(
                          height: 8.w,
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(4.w),
                            value: .3,
                            color: AppColors.cB2B2B2,
                            backgroundColor: AppColors.c666666,
                          ),
                        ),
                      ),
                      13.hGap,
                      Text(
                        "30%",
                        style: 14.w7(color: AppColors.cFF7954),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 27.h),
              decoration: BoxDecoration(
                  color: AppColors.c262626,
                  borderRadius: BorderRadius.circular(20.w)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30.h,
                        width: 14.h,
                        child: Visibility(
                          visible: true,

                          /// 设置是否可见
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 7.h),
                                child: IconWidget(
                                  iconWidth: 14.h,
                                  icon: Assets.uiIconArrows_04Png,
                                  iconColor: AppColors.cE72646,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 7.h),
                                  child: IconWidget(
                                    iconWidth: 14.h,
                                    icon: Assets.uiIconArrows_04Png,
                                    iconColor: AppColors.cE72646,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      8.hGap,
                      PlayerAvatarWidget(
                        playerBaseInfo: null,
                        width: 48.h,
                      ),
                      10.hGap,
                      Transform.rotate(
                          angle: pi / 180 * 90,
                          child: IconWidget(
                            iconWidth: 7.h,
                            icon: Assets.uiTriangleGPng,
                            iconColor: AppColors.c3B93FF,
                          )),
                      Expanded(
                          child: Center(
                              child: Text(
                        "C",
                        style: 21.w7(color: AppColors.c666666),
                      ))),
                      Transform.rotate(
                          angle: -pi / 180 * 90,
                          child: IconWidget(
                            iconWidth: 7.h,
                            icon: Assets.uiTriangleGPng,
                            iconColor: AppColors.cFF7954,
                          )),
                      10.hGap,
                      PlayerAvatarWidget(
                        playerBaseInfo: null,
                        width: 48.h,
                      ),
                      8.hGap,
                      SizedBox(
                        height: 30.h,
                        width: 14.h,
                        child: Visibility(
                          visible: true,

                          /// 设置是否可见
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 7.h),
                                child: IconWidget(
                                  iconWidth: 14.h,
                                  icon: Assets.uiIconArrows_04Png,
                                  iconColor: AppColors.cE72646,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 7.h),
                                  child: IconWidget(
                                    iconWidth: 14.h,
                                    icon: Assets.uiIconArrows_04Png,
                                    iconColor: AppColors.cE72646,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        /// 有突发新闻且已显示才可以点击
        if ((controller.havaBreakingNews() &&
            animationController.status == AnimationStatus.completed)) {
          controller.onBreakingNewsComplete();
          widget.onDown.call();
        }
      },
      child: Stack(
        children: [_buildBottom(), _buildPlayers(), _buildBreakingNews()],
      ),
    );
  }
}
