import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/battle_before_game.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/battle_game.dart';
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

  var isStartAnimationComplete = false.obs;

  var startAnimationValue = 0.0.obs;
  var headerAnimationValue = 0.0.obs;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed &&
            !isStartAnimationComplete.value) {
          isStartAnimationComplete.value = true;
          animation.removeListener(_startAnimationListener);
          animationController.reset();
          animation.addListener(() {
            headerAnimationValue.value = animation.value;
          });
          animationController.forward();
        }
      });
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animation.addListener(_startAnimationListener);
    animationController.forward();
  }

  void _startAnimationListener() {
    startAnimationValue.value = animation.value;
    // setState(() {});
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return Obx(() {
      return Transform.scale(
        scale: startAnimationValue.value > 1 ? 1 : startAnimationValue.value,
        child: Opacity(
          opacity:
              startAnimationValue.value > 1 ? 1 : startAnimationValue.value,
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
                    Assets.teamUiBgBattle,
                    fit: BoxFit.cover,
                  ),
                )),
                Obx(() {
                  return !isStartAnimationComplete.value
                      ? const SizedBox.shrink()
                      : Stack(
                          children: [
                            if (controller.step.value == 3)
                              BattleBeforeGame(
                                onDown: () {
                                  controller.nextStep();
                                },
                              )
                            else
                              BattleGame(onGameOver: () {
                                controller.nextStep();
                              }),
                            _buildHeader(context)
                          ],
                        );
                })
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildHeader(BuildContext context) {
    return Obx(() {
      return Positioned(
        top: -129.h + headerAnimationValue.value * 129.h,
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                            controller.battleEntity.homeTeam.teamName,
                            style: 14.w7(color: AppColors.cF2F2F2, height: 1),
                          ),
                          Text("${controller.battleEntity.homeTeamPower} POW",style: 10.w4(color: AppColors.cF2F2F2,height: 1),),
                        ],
                      ),
                      10.hGap,
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.w),
                          child: ImageWidget(url: Utils.getAvaterUrl(
                              controller.battleEntity.awayTeam.teamLogo),
                            width: 36.h,
                            height: 36.h,)),
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
                          child: ImageWidget(url: Utils.getAvaterUrl(
                              controller.battleEntity.awayTeam.teamLogo),
                            width: 36.h,
                            height: 36.h,)),
                      10.hGap,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "OPPONENT",
                            style: 10.w4(color: AppColors.cFF7954, height: 1),
                          ),
                          Text(
                            controller.battleEntity.awayTeam.teamName,
                            style: 14.w7(color: AppColors.cF2F2F2, height: 1),
                          ),
                          Text("POW ${controller.battleEntity.homeTeamPower}",style: 10.w4(color: AppColors.cF2F2F2,height: 1),),
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
                                  visible:
                                      controller.breakingNewsBreaking.value,
                                  child: SizedBox(
                                    height: 7.h,
                                    width: 8.h,
                                    child: IconWidget(
                                        iconWidth: 7.h,
                                        icon: Assets.picksUiTriangleR),
                                  ),
                                ),
                                5.hGap,
                                Text(
                                  "${(controller.battleEntity.homeTeam.playerReadiness*100)}%",
                                  style: 14.w4(
                                      color:AppColors.cF2F2F2,
                                      height: 1),
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
                          color: AppColors.cFFFFFF.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10.w)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.battleEntity.awayTeam.playerReadiness*100}%",
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
        ),
      );
    });
  }
}
