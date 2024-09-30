import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/battle_before_game.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/battle_game.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/battle_game_over.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/28/19:06

class BattleMain extends StatefulWidget {
  const BattleMain({super.key});

  @override
  State<BattleMain> createState() => _BattleMainState();
}

class _BattleMainState extends State<BattleMain>
    with SingleTickerProviderStateMixin {
  late TeamBattleController controller;

  late AnimationController animationController;

  late Animation<double> animation;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animation.addListener(_startAnimationListener);
    animationController.forward();
  }

  void _startAnimationListener() {
    setState(() {});
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    double v = animation.value > 1 ? 1 : animation.value;
    return Transform.scale(
      scale: v,
      child: Opacity(
        opacity: v,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.cE6E6E6,
          ),
          child: Stack(
            children: [
              Positioned(
                  child: SizedBox(
                    height: 530.h,
                    child: Image.asset(
                      Assets.uiBgBattleJpg,
                      fit: BoxFit.cover,
                    ),
                  )),
              PageView(
                physics: const NeverScrollableScrollPhysics(),///测试时注释
                scrollDirection: Axis.vertical,
                controller: pageController,
                children: [
                  BattleBeforeGame(onDown: () {
                    controller.nextStep();
                    pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                  },),
                  BattleGame(onGameOver: (){
                    controller.nextStep();
                    pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                  }),
                  const BattleGameOver()
                ],
              ),

              _buildHeader(),

            ],
          ),
        ),
      ),
    );
  }


  Container _buildHeader() {
    return Container(
      height: 129.h,
      padding: EdgeInsets.only(top: 32.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
          color: AppColors.c262626,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.w),
              bottomRight: Radius.circular(32.w))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "ME",
                        style: 10.w4(color: AppColors.c3B93FF, height: 1),
                      ),
                      Text(
                        "USERNAME",
                        style: 14.w7(color: AppColors.cF2F2F2, height: 1),
                      )
                    ],
                  ),
                  10.hGap,
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: IconWidget(
                          iconWidth: 36.h, icon: controller.meAvatar)),
                ],
              ),
              Container(
                width: 57.w,
                alignment: Alignment.center,
                child: Text(
                  "VS",
                  style: 24.w7(color: AppColors.c8A8A8A),
                ),
              ),
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: IconWidget(
                          iconWidth: 36.h, icon: controller.opponentAvatar)),
                  10.hGap,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OPPONENT",
                        style: 10.w4(color: AppColors.cFF7954, height: 1),
                      ),
                      Text(
                        "USERNAME",
                        style: 14.w7(color: AppColors.cF2F2F2, height: 1),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          5.vGap,
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 20.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                      color: AppColors.c666666,
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "OVR",
                        style: 14.w4(color: AppColors.cF2F2F2, height: 1),
                      ),
                      Obx(() {
                        return Row(
                          children: [
                            Visibility(
                              visible: controller.breakingNewsBreaking.value,
                              child: SizedBox(
                                height: 7.h,
                                width: 8.h,
                                child: IconWidget(
                                    iconWidth: 7.h,
                                    icon: Assets.uiTriangleRPng),
                              ),
                            ),
                            5.hGap,
                            Text(
                              "${controller.ovr}%",
                              style: 14.w4(
                                  color: controller.breakingNewsBreaking.value
                                      ? AppColors.cFF3B5C
                                      : AppColors.cF2F2F2, height: 1),
                            ),
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ),
              51.hGap,
              Expanded(
                child: Container(
                  height: 20.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                      color: AppColors.c666666,
                      borderRadius: BorderRadius.circular(10.w)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "75%",
                        style: 14.w4(color: AppColors.cF2F2F2, height: 1),
                      ),
                      Text(
                        "OVR",
                        style: 14.w4(color: AppColors.cF2F2F2, height: 1),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
