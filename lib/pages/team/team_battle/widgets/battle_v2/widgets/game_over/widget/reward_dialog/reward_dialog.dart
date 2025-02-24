import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/game_over/widget/reward_dialog/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/24/11:15

class RewardDialog extends GetView<RewardDialogController> {
  RewardDialog({super.key});

  late GameOverController gameOverController;
  late TeamBattleV2Controller teamBattleV2Controller;

  @override
  Widget build(BuildContext context) {
    gameOverController = Get.find();
    teamBattleV2Controller = Get.find();
    return GetBuilder<RewardDialogController>(
        init: RewardDialogController(),
        builder: (logic) {
          return Column(
            children: [
              210.vGap,
              InkWell(
                onTap: ()=> Get.back(),
                child: Obx(() {
                  return Column(
                    children: [
                      AnimatedContainer(
                        height: controller.bottomShow.value ? 327.w : 243.h,
                        width: 356.w,
                        padding: EdgeInsets.all(7.w),
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.circular(12.r)),
                        duration: Duration(milliseconds: 300),
                        child: Stack(
                          children: [

                            /// bottom
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 68.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(Assets
                                              .managerUiManagerBattleTextbase02),
                                          fit: BoxFit.fill)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "MATCH PRIZE",
                                        style: 16.w5(
                                          color: AppColors.c000000,
                                          height: 1,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      ),
                                      7.vGap,
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          IconWidget(
                                              iconWidth: 25.w,
                                              icon: Assets.teamUiMoney02),
                                          3.hGap,
                                          Obx(() {
                                            return AnimatedNum(
                                                number:
                                                !controller.showMoney.value
                                                    ? controller
                                                    .getRewardMoney()
                                                    : 0,
                                                isMoney: true,
                                                textStyle: 16.w5(
                                                  color: AppColors.c000000,
                                                  height: 1,
                                                  fontFamily:
                                                  FontFamily.fOswaldMedium,
                                                ));
                                          })
                                        ],
                                      )
                                    ],
                                  ),
                                )),

                            /// top
                            AnimatedBuilder(
                                animation: controller.animationController,
                                builder: (context, child) {
                                  return Container(
                                    height: 229.h,
                                    width: 356.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.cF2F2F2,
                                      borderRadius: BorderRadius.circular(7.r),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        SizedBox(
                                          height: controller.animation.value *
                                              (229.h - 144.h) +
                                              144.h,
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      gameOverController
                                                          .isLeftWin()
                                                          ? "WINNER"
                                                          : "LOSER",
                                                      style: TextStyle(
                                                          fontSize: ((16 +
                                                              (30 - 16) *
                                                                  controller
                                                                      .animation
                                                                      .value))
                                                              .sp,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color:
                                                          gameOverController
                                                              .isLeftWin()
                                                              ? AppColors
                                                              .c1F8FE5
                                                              : AppColors
                                                              .c656565,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fOswaldMedium),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(
                                                              controller
                                                                  .animation
                                                                  .value *
                                                                  (29.w -
                                                                      19.w) +
                                                                  19.w),
                                                          border: Border.all(
                                                            color: gameOverController
                                                                .isLeftWin()
                                                                ? AppColors
                                                                .c1F8FE5
                                                                : AppColors
                                                                .c656565,
                                                            width: 1.w,
                                                          )),
                                                      child: ImageWidget(
                                                        url: Utils.getAvatarUrl(
                                                            teamBattleV2Controller
                                                                .battleEntity
                                                                .homeTeam
                                                                .teamLogo),
                                                        colorBlendMode:
                                                        BlendMode
                                                            .saturation,
                                                        color:
                                                        gameOverController
                                                            .isLeftWin()
                                                            ? null
                                                            : AppColors
                                                            .c656565,
                                                        width: controller
                                                            .animation
                                                            .value *
                                                            (58.w - 38.w) +
                                                            38.w,
                                                        borderRadius: BorderRadius
                                                            .circular(controller
                                                            .animation
                                                            .value *
                                                            (29.w -
                                                                19.w) +
                                                            19.w),
                                                      ),
                                                    ),
                                                    Text(
                                                      teamBattleV2Controller
                                                          .battleEntity
                                                          .homeTeam
                                                          .teamName,
                                                      style: TextStyle(
                                                          fontSize: ((12 +
                                                              (16 - 12) *
                                                                  controller
                                                                      .animation
                                                                      .value))
                                                              .sp,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color:
                                                          gameOverController
                                                              .isLeftWin()
                                                              ? AppColors
                                                              .c000000
                                                              : AppColors
                                                              .c656565,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fOswaldMedium),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  2.w),
                                                              child: IconWidget(
                                                                  iconWidth:
                                                                  23.w,
                                                                  icon: Assets
                                                                      .managerUiManagerIconCurrency04),
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              bottom: 1.w,
                                                              child: IconWidget(
                                                                iconWidth: 8.w,
                                                                rotateAngle:
                                                                gameOverController
                                                                    .isLeftWin()
                                                                    ? 0
                                                                    : 180,
                                                                icon: Assets
                                                                    .managerUiManagerTacticsArrow,
                                                                iconColor: gameOverController
                                                                    .isLeftWin()
                                                                    ? AppColors
                                                                    .c40F093
                                                                    : AppColors
                                                                    .cC01223,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        3.hGap,
                                                        Row(
                                                          children: [
                                                            Text(
                                                              gameOverController
                                                                  .isLeftWin()
                                                                  ? "+"
                                                                  : "-",
                                                              style: 16.w5(
                                                                  color: AppColors
                                                                      .c000000,
                                                                  height: 1,
                                                                  fontFamily:
                                                                  FontFamily
                                                                      .fOswaldMedium),
                                                            ),
                                                            AnimatedNum(
                                                              number: (gameOverController
                                                                  .isLeftWin()
                                                                  ? gameOverController
                                                                  .leftCup
                                                                  .value
                                                                  : gameOverController
                                                                  .rightCup
                                                                  .value)
                                                                  .abs(),
                                                              textStyle: 16.w5(
                                                                  color: AppColors
                                                                      .c000000,
                                                                  height: 1,
                                                                  fontFamily:
                                                                  FontFamily
                                                                      .fOswaldMedium),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: (40.h +
                                                        (80.h - 60.h) *
                                                            controller.animation
                                                                .value)),
                                                child: Text(
                                                  "VS",
                                                  style: TextStyle(
                                                    fontSize: ((30 +
                                                        (40 - 30) *
                                                            controller
                                                                .animation
                                                                .value))
                                                        .sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.cB3B3B3,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                  ),
                                                  // style: 32.w5(
                                                  //   color: AppColors.cB3B3B3,
                                                  //   height: 1,
                                                  //   fontFamily: FontFamily
                                                  //       .fOswaldMedium,
                                                  // ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceAround,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      !gameOverController
                                                          .isLeftWin()
                                                          ? "WINNER"
                                                          : "LOSER",
                                                      style: TextStyle(
                                                          fontSize: ((16 +
                                                              (30 - 16) *
                                                                  controller
                                                                      .animation
                                                                      .value))
                                                              .sp,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color:
                                                          !gameOverController
                                                              .isLeftWin()
                                                              ? AppColors
                                                              .c1F8FE5
                                                              : AppColors
                                                              .c656565,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fOswaldMedium),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(
                                                              controller
                                                                  .animation
                                                                  .value *
                                                                  (29.w -
                                                                      19.w) +
                                                                  19.w),
                                                          border: Border.all(
                                                            color: !gameOverController
                                                                .isLeftWin()
                                                                ? AppColors
                                                                .c1F8FE5
                                                                : AppColors
                                                                .c656565,
                                                            width: 1.w,
                                                          )),
                                                      child: ImageWidget(
                                                        url: Utils.getAvatarUrl(
                                                            teamBattleV2Controller
                                                                .battleEntity
                                                                .awayTeam
                                                                .teamLogo),
                                                        colorBlendMode:
                                                        BlendMode
                                                            .saturation,
                                                        color:
                                                        !gameOverController
                                                            .isLeftWin()
                                                            ? null
                                                            : AppColors
                                                            .c656565,
                                                        width: controller
                                                            .animation
                                                            .value *
                                                            (58.w - 38.w) +
                                                            38.w,
                                                        borderRadius: BorderRadius
                                                            .circular(controller
                                                            .animation
                                                            .value *
                                                            (29.w -
                                                                19.w) +
                                                            19.w),
                                                      ),
                                                    ),
                                                    Text(
                                                      teamBattleV2Controller
                                                          .battleEntity
                                                          .awayTeam
                                                          .teamName,
                                                      style: TextStyle(
                                                          fontSize: ((12 +
                                                              (16 - 12) *
                                                                  controller
                                                                      .animation
                                                                      .value))
                                                              .sp,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          color:
                                                          !gameOverController
                                                              .isLeftWin()
                                                              ? AppColors
                                                              .c000000
                                                              : AppColors
                                                              .c656565,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fOswaldMedium),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                  right:
                                                                  2.w),
                                                              child: IconWidget(
                                                                  iconWidth:
                                                                  23.w,
                                                                  icon: Assets
                                                                      .managerUiManagerIconCurrency04),
                                                            ),
                                                            Positioned(
                                                              right: 0,
                                                              bottom: 1.w,
                                                              child: IconWidget(
                                                                iconWidth: 8.w,
                                                                rotateAngle:
                                                                !gameOverController
                                                                    .isLeftWin()
                                                                    ? 0
                                                                    : 180,
                                                                icon: Assets
                                                                    .managerUiManagerTacticsArrow,
                                                                iconColor: !gameOverController
                                                                    .isLeftWin()
                                                                    ? AppColors
                                                                    .c40F093
                                                                    : AppColors
                                                                    .cC01223,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        3.hGap,
                                                        Row(
                                                          children: [
                                                            Text(
                                                              !gameOverController
                                                                  .isLeftWin()
                                                                  ? "+"
                                                                  : "-",
                                                              style: 16.w5(
                                                                  color: AppColors
                                                                      .c000000,
                                                                  height: 1,
                                                                  fontFamily:
                                                                  FontFamily
                                                                      .fOswaldMedium),
                                                            ),
                                                            AnimatedNum(
                                                              number: (!gameOverController
                                                                  .isLeftWin()
                                                                  ? gameOverController
                                                                  .leftCup
                                                                  .value
                                                                  : gameOverController
                                                                  .rightCup
                                                                  .value)
                                                                  .abs(),
                                                              textStyle: 16.w5(
                                                                  color: AppColors
                                                                      .c000000,
                                                                  height: 1,
                                                                  fontFamily:
                                                                  FontFamily
                                                                      .fOswaldMedium),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        /// money
                                        Positioned(
                                            top: 144.h,
                                            left: gameOverController.isLeftWin()
                                                ? 23.w
                                                : null,
                                            right:
                                            !gameOverController.isLeftWin()
                                                ? 23.w
                                                : null,
                                            child: Obx(() {
                                              return Opacity(
                                                opacity:
                                                controller.showMoney.value
                                                    ? 1
                                                    : 0,
                                                child: Container(
                                                  height: 31.h,
                                                  width: 96.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.c000000,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          6.r)),
                                                  child: Row(
                                                    children: [
                                                      8.hGap,
                                                      IconWidget(
                                                          iconWidth: 24.w,
                                                          icon: Assets
                                                              .commonUiCommonProp05),
                                                      13.hGap,
                                                      Expanded(
                                                        child: Center(
                                                          child: AnimatedNum(
                                                              onEnd: () =>
                                                                  controller
                                                                      .onMoneyAnimationEnd(),
                                                              number: controller
                                                                  .showMoney
                                                                  .value
                                                                  ? controller
                                                                  .getRewardMoney()
                                                                  : 0,
                                                              isMoney: true,
                                                              textStyle: 14.w5(
                                                                  color: AppColors
                                                                      .cFFFFFF,
                                                                  height: 1,
                                                                  fontFamily:
                                                                  FontFamily
                                                                      .fOswaldMedium)),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })),

                                        /// gift
                                        Positioned(
                                            top: 181.h,
                                            left: gameOverController.isLeftWin()
                                                ? 23.w
                                                : null,
                                            right:
                                            !gameOverController.isLeftWin()
                                                ? 23.w
                                                : null,
                                            child: Obx(() {
                                              return Opacity(
                                                opacity:
                                                controller.showGift.value
                                                    ? 1
                                                    : 0,
                                                child: Container(
                                                  height: 31.h,
                                                  width: 96.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.c000000,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          6.r)),
                                                  child: Row(
                                                    children: [
                                                      8.hGap,
                                                      IconWidget(
                                                          iconWidth: 24.w,
                                                          icon: Utils
                                                              .getBoxImageUrl(
                                                              gameOverController
                                                                  .getCardBoxId())),
                                                      13.hGap,
                                                      Expanded(
                                                          child: Center(
                                                            child: Text("CHEST",
                                                                style: 14.w5(
                                                                    color: AppColors
                                                                        .cFFFFFF,
                                                                    height: 1,
                                                                    fontFamily:
                                                                    FontFamily
                                                                        .fOswaldMedium)),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })),

                                        Positioned(
                                            top: 158.h,
                                            left:
                                            !gameOverController.isLeftWin()
                                                ? 61.w
                                                : null,
                                            right:
                                            gameOverController.isLeftWin()
                                                ? 61.w
                                                : null,
                                            child: Obx(() {
                                              return Opacity(
                                                opacity:
                                                controller.showMoney.value
                                                    ? 1
                                                    : 0,
                                                child: IconWidget(
                                                  iconWidth: 35.w,
                                                  icon: Assets
                                                      .managerUiManagerPlayerinfoIcon01,
                                                  iconColor: AppColors.cE6E6E6,
                                                ),
                                              );
                                            }))
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      Obx(() {
                        return Opacity(
                          opacity: !controller.bottomShow.value ? 1 : 0,
                          child: Container(
                            margin: EdgeInsets.only(top: 68.w),
                            child: Text(
                              "TAP TO PROCEED",
                              style: 19.w5(
                                color: AppColors.cFFFFFF,
                                height: 1,
                                fontFamily: FontFamily.fOswaldMedium,),
                            ),
                          ),
                        );
                      })
                    ],
                  );
                }),
              ),
            ],
          );
        });
  }
}
