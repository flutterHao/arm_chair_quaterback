import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
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
    with TickerProviderStateMixin {
  late TeamBattleController controller;

  late AnimationController animationController, bottomAnimationController;

  late Animation<double> animation, bottomAnimation;

  late double width;

  late var breakingNewsAnimationValue = 0.0.obs, bottomAnimationValue = 0.0.obs;

  late PageController pageController;

  late BattleAnimationController bottomProgressAnimationController,
      bottomAvatarAnimationController,
      bottomLeaveAnimationController;

  var breakingNewsComplete = false.obs;

  bool reverse = false;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    pageController = PageController();

    ///
    /// 1 底部滑动入场
    /// 2 入场之后进入条分阶动画
    /// 3 突发新闻或结束
    /// 4 突发新闻完成

    bottomAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(milliseconds: 500),
              () => bottomProgressAnimationController.forward());
        }
      });
    bottomAnimation =
        Tween(begin: 0.0, end: 1.0).animate(bottomAnimationController);
    bottomAnimation.addListener(() {
      bottomAnimationValue.value = bottomAnimation.value;
    });
    bottomAnimationController.forward();

    bottomProgressAnimationController = BattleAnimationController(
        vsync: this, begin: 0.0, end: 6.0, duration: const Duration(seconds: 1));
    bottomProgressAnimationController.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 500), () {
          /// 更换pageView
          pageController.animateToPage(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);

          /// 球员入场
          Future.delayed(const Duration(milliseconds: 500), () {
            bottomAvatarAnimationController.controller
                .addStatusListener((status) {
              if (status != AnimationStatus.completed) return;
              Future.delayed(const Duration(seconds: 1), () {
                if (controller.havaBreakingNews()) {
                  ///突发新闻
                  animation =
                      Tween(begin: 0.0, end: width).animate(animationController)
                        ..addListener(() {
                          breakingNewsAnimationValue.value = animation.value;
                        });
                  controller.onBreakingNewsStart();
                  animationController.forward();
                } else {
                  widget.onDown.call();
                }
              });
            });
            bottomAvatarAnimationController.forward();
          });
        });
      }
    });

    bottomAvatarAnimationController = BattleAnimationController(
        vsync: this,
        begin: 0.0,
        end: 5.0,
        duration: const Duration(milliseconds: 1000));

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          breakingNewsComplete.value = true;
        }
        if (status == AnimationStatus.dismissed) {
          widget.onDown.call();
        }
      });

    bottomLeaveAnimationController = BattleAnimationController(
        vsync: this,
        begin: 0.0,
        end: 1.0,
        duration: const Duration(milliseconds: 300));
  }

  Widget _buildBreakingNews(BuildContext context) {
    return Obx(() {
      var value = breakingNewsAnimationValue.value / width;
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Opacity(
          opacity: max(value, 0.5),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  right: width * value - width,
                  bottom: 423.h,
                  child: Container(
                    margin: EdgeInsets.only(top: 16.w),
                    decoration: BoxDecoration(
                        color: AppColors.cF2F2F2,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(32.h))),
                    child: Container(
                      width: width,
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
                                  iconWidth: 65.h, icon: Assets.uiBattleNewsPng)),
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
                  )),
              Positioned(
                  left: 208.w * value - 208.w,
                  bottom: 537.h,
                  child: Container(
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
                  )),
              Positioned(
                  bottom: 393.h,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: breakingNewsComplete.value ? 1 : 0,
                    child: Text(
                      "TAP SCREEN TO CONTINUE",
                      style: 14.w7(color: AppColors.c666666),
                    ),
                  ))
            ],
          ),
        ),
      );
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

              return Obx(() {
                double value = max(
                    bottomAvatarAnimationController.value.value -
                        calculate(index),
                    0);
                value = min(1, value);
                return Positioned(
                    left: value * dx,
                    top: dy,
                    child: Opacity(
                      opacity: value,
                      child: IconWidget(
                          iconWidth: 15.h, icon: Assets.uiIconLocation_02Png),
                    ));
              });
            }),

            /// right
            ...List.generate(positions.length, (index) {
              var dx = positions[index].dx;
              var dy = positions[index].dy;
              return Obx(() {
                double value = max(
                    bottomAvatarAnimationController.value.value -
                        calculate(index),
                    0);
                value = min(1, value);
                return Positioned(
                    right: dx,
                    top: dy,
                    child: Opacity(
                      opacity: value,
                      child: IconWidget(
                          iconWidth: 15.h, icon: Assets.uiIconLocation_01Png),
                    ));
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Obx(() {
      return Positioned(
        bottom: 40.h - 200.h * (1 - bottomAnimationValue.value),
        left: bottomLeaveAnimationController.value.value * -width,
        child: Opacity(
          opacity: bottomAnimationValue.value,
          child: SizedBox(
            width: width,
            height: 331.h,
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 46.h),
                  decoration: BoxDecoration(
                      color: AppColors.c262626,
                      borderRadius: BorderRadius.circular(20.w)),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: AnimatedList.separated(
                      initialItemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index, animation) {
                        return Obx(() {
                          double value = max(
                              bottomProgressAnimationController.value.value -
                                  calculate(index),
                              0);
                          value = min(1, value);

                          return Row(
                            children: [
                              Container(
                                width: 30.w,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${(75 * value).toStringAsFixed(0)}%",
                                  style: 14.w7(color: AppColors.c3B93FF),
                                ),
                              ),
                              13.hGap,
                              Expanded(
                                child: SizedBox(
                                  height: 8.w,
                                  child: Transform.rotate(
                                    angle: pi / 180 * 180,
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(4.w),
                                      value: .75 * value,
                                      color: AppColors.c3B93FF,
                                      backgroundColor: AppColors.c666666,
                                    ),
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
                                    value: .3 * value,
                                    color: AppColors.cB2B2B2,
                                    backgroundColor: AppColors.c666666,
                                  ),
                                ),
                              ),
                              13.hGap,
                              Container(
                                width: 30.w,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${(30 * value).toStringAsFixed(0)}%",
                                  style: 14.w7(color: AppColors.cFF7954),
                                ),
                              ),
                            ],
                          );
                        });
                      },
                      separatorBuilder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return Divider(
                          height: 24.h,
                          color: AppColors.cTransparent,
                        );
                      },
                      removedSeparatorBuilder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding: EdgeInsets.symmetric(vertical: 27.h),
                  decoration: BoxDecoration(
                      color: AppColors.c262626,
                      borderRadius: BorderRadius.circular(20.w)),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: AnimatedList.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      initialItemCount: 5,
                      itemBuilder: (context, index, animation) {
                        return Obx(() {
                          double value = max(
                              bottomAvatarAnimationController.value.value -
                                  calculate(index),
                              0);
                          value = min(1, value);
                          return SizedBox(
                            height: 48.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.rotate(
                                        angle: pi / 180 * 90,
                                        child: IconWidget(
                                          iconWidth: 7.h,
                                          icon: Assets.uiTriangleGPng,
                                          iconColor: AppColors.c3B93FF,
                                        )),
                                    Container(
                                      width: 113.w,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "C",
                                        style: 21.w7(color: AppColors.c666666),
                                      ),
                                    ),
                                    Transform.rotate(
                                        angle: -pi / 180 * 90,
                                        child: IconWidget(
                                          iconWidth: 7.h,
                                          icon: Assets.uiTriangleGPng,
                                          iconColor: AppColors.cFF7954,
                                        )),
                                  ],
                                ),
                                Positioned(
                                  left: value * 35.w,
                                  child: Opacity(
                                    opacity: value,
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            SizedBox(
                                              height: 48.h,
                                              width: 14.h,
                                            ),
                                            Obx(() {
                                              return AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                top: controller
                                                        .breakingNewsBreaking
                                                        .value
                                                    ? 9.h
                                                    : 0,
                                                child: SizedBox(
                                                  height: 30.h,
                                                  width: 14.h,
                                                  child: Visibility(
                                                    visible: controller
                                                        .breakingNewsBreaking
                                                        .value,
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 7.h),
                                                          child: IconWidget(
                                                            iconWidth: 14.h,
                                                            icon: Assets
                                                                .uiIconArrows_04Png,
                                                            iconColor: AppColors
                                                                .cE72646,
                                                          ),
                                                        ),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 7.h),
                                                            child: IconWidget(
                                                              iconWidth: 14.h,
                                                              icon: Assets
                                                                  .uiIconArrows_04Png,
                                                              iconColor:
                                                                  AppColors
                                                                      .cE72646,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                        8.hGap,
                                        PlayerAvatarWidget(
                                          playerBaseInfo: null,
                                          width: 48.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: value * 35.w,
                                  child: Opacity(
                                    opacity: value,
                                    child: Row(
                                      children: [
                                        PlayerAvatarWidget(
                                          playerBaseInfo: null,
                                          width: 48.h,
                                        ),
                                        8.hGap,
                                        Stack(
                                          children: [
                                            SizedBox(
                                              height: 48.h,
                                              width: 14.h,
                                            ),
                                            Obx(() {
                                              return AnimatedPositioned(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                top: controller
                                                        .breakingNewsBreaking
                                                        .value
                                                    ? 9.h
                                                    : 0,
                                                child: SizedBox(
                                                  height: 30.h,
                                                  width: 14.h,
                                                  child: Visibility(
                                                    visible: controller
                                                        .breakingNewsBreaking
                                                        .value,
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 7.h),
                                                          child: IconWidget(
                                                            iconWidth: 14.h,
                                                            icon: Assets
                                                                .uiIconArrows_04Png,
                                                            iconColor: AppColors
                                                                .cE72646,
                                                          ),
                                                        ),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 7.h),
                                                            child: IconWidget(
                                                              iconWidth: 14.h,
                                                              icon: Assets
                                                                  .uiIconArrows_04Png,
                                                              iconColor:
                                                                  AppColors
                                                                      .cE72646,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                      },
                      separatorBuilder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return Divider(
                          height: 9.h,
                          color: AppColors.cTransparent,
                        );
                      },
                      removedSeparatorBuilder: (BuildContext context, int index,
                          Animation<double> animation) {
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  double calculate(int n) {
    double t = 0.8;
    if (n == 0) {
      return 0; // 第 0 个值为 0
    } else if (n == 1) {
      return 1 * t; // 第 1 个值
    } else {
      return (calculate(n - 1) + 1) * t; // 递推公式
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    bottomAnimationController.dispose();
    bottomAvatarAnimationController.dispose();
    bottomProgressAnimationController.dispose();
    bottomLeaveAnimationController.dispose();
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
          animationController.reverse();
          bottomLeaveAnimationController.forward();
          reverse = true;
          breakingNewsComplete.value = false;
        }
      },
      child: Stack(
        children: [
          _buildBottom(),
          _buildPlayers(),
          _buildBreakingNews(context)
        ],
      ),
    );
  }
}
