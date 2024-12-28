/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-25 15:56:43
 * @LastEditTime: 2024-12-25 10:44:07
 */

import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/add_ball_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/award_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/flip_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_sroller_view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_slot.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingWidget extends GetView<TrainingController> {
  const TrainingWidget({super.key});

  // void test(TrainingController controller) async {
  //   controller.showCash.value = true;
  //   controller.caShScale.value = true;
  //   controller.cash.value = Random().nextInt(500) + 500;
  //   Future.delayed(const Duration(milliseconds: 1000), () {
  //     controller.caShScale.value = false;
  //   });
  //   await Future.delayed(const Duration(milliseconds: 2000));
  //   controller.showCash.value = false;
  // }

  @override
  Widget build(BuildContext context) {
    // controller.startScroller();
    // controller.showAward();
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (controller) {
          // test(controller);
          // controller.startPlayerScroll(0);
          return GestureDetector(
            onTap: () {
              controller.colosePlayerAwards();
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 2.w,
                    width: double.infinity,
                    color: AppColors.c000000,
                  ),
                  AspectRatio(
                    aspectRatio: 375 / 308.5,
                    child: Container(
                      width: 375.w,
                      height: 308.5.w,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: MirrorImageWidget(
                              imagePath: Assets.managerUiManagerTrainingBg,
                              fullWidth: 375.w,
                              imageHeight: 245.5.w,
                              fit: BoxFit.fitWidth,
                            ),
                          ),

                          Positioned(
                              top: 50.w,
                              child: Image.asset(
                                Assets.managerUiManagerTrainingBg02,
                                width: 155.w,
                              )),

                          // Positioned(
                          //   top: 16.w,
                          //   right: 16.w,
                          //   child:
                          // ),

                          if (controller.trainingInfo.prop.num <
                              controller.trainDefine.ballMaxNum)
                            Positioned(
                              bottom: 12.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${controller.trainDefine.ballRecoverNum} balls ready in ",
                                    style: 12.w4(
                                        fontFamily: FontFamily.fRobotoRegular,
                                        color: AppColors.c000000),
                                  ),
                                  Obx(() {
                                    return Text(
                                      controller.recoverTimeStr.value,
                                      style: 12.w4(
                                        color: AppColors.c10A86A,
                                        fontFamily: FontFamily.fRobotoRegular,
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),

                          ///Slot
                          Positioned(top: 94.w, child: const TrainingSlot()),

                          ///start
                          Positioned(
                            top: 205.w,
                            child: Column(
                              children: [
                                controller.ballNum.value > 0
                                    ? Container(
                                        // height: 72.5.w,
                                        width: 75.w,
                                        height: 24.w,

                                        child: Obx(() {
                                          return Row(
                                            children: [
                                              AnimatedScale(
                                                duration: 150.milliseconds,
                                                scale: controller.showBall.value
                                                    ? 1.5
                                                    : 1,
                                                child: Row(
                                                  children: [
                                                    IconWidget(
                                                        iconWidth: 21.w,
                                                        icon: Assets
                                                            .commonUiCommonProp04),
                                                    5.hGap,
                                                    Obx(() {
                                                      int v = controller
                                                          .ballNum.value;
                                                      return AnimatedNum(
                                                        milliseconds: 150,
                                                        number: v,
                                                        textStyle: 16.w4(
                                                            fontFamily:
                                                                FontFamily
                                                                    .fOswaldBold,
                                                            height: 0.8),
                                                      );
                                                    }),
                                                    if (controller
                                                        .showBall.value)
                                                      Text(
                                                        "+${controller.trainingInfo.prop.num - controller.ballNum.value}",
                                                        style: 16.w4(
                                                            color: AppColors
                                                                .c31E99E,
                                                            fontFamily: FontFamily
                                                                .fOswaldMedium,
                                                            height: 0.8),
                                                      )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: AnimatedScale(
                                                  duration: 150.milliseconds,
                                                  scale:
                                                      controller.showBall.value
                                                          ? 0
                                                          : 1,
                                                  child: Text(
                                                    "/${controller.trainDefine.ballMaxNum}",
                                                    style: 16.w4(
                                                        fontFamily: FontFamily
                                                            .fOswaldBold,
                                                        height: 0.8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "COST:",
                                            style: 16.w4(
                                                fontFamily:
                                                    FontFamily.fOswaldBold),
                                          ),
                                          10.hGap,
                                          Image.asset(
                                            Assets.commonUiCommonIconCurrency02,
                                            width: 20.w,
                                          ),
                                          5.hGap,
                                          Text(
                                            "${controller.getBallCost()}",
                                            style: 16.w4(
                                                fontFamily:
                                                    FontFamily.fOswaldBold),
                                          ),
                                        ],
                                      ),
                                5.vGap,
                                Obx(() {
                                  return MtInkwell(
                                    // vibrate: true,
                                    onTap: controller.isPlaying.value
                                        ? null
                                        : () async {
                                            if (controller.ballNum.value <= 0 &&
                                                !Utils.getNoTip("ball")) {
                                              BottomTipDialog.show(
                                                  context: Get.context!,
                                                  desc:
                                                      "Automatically use Coins for training when there's a shortage of balls ",
                                                  centerWidget: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "COST:",
                                                        style: 16.w4(
                                                            fontFamily: FontFamily
                                                                .fOswaldBold),
                                                      ),
                                                      10.hGap,
                                                      Image.asset(
                                                        Assets
                                                            .commonUiCommonIconCurrency02,
                                                        width: 20.w,
                                                      ),
                                                      5.hGap,
                                                      Text(
                                                        "${controller.getBallCost()}",
                                                        style: 16.w4(
                                                            fontFamily: FontFamily
                                                                .fOswaldBold),
                                                      ),
                                                    ],
                                                  ),
                                                  onTap: () {
                                                    Get.back();
                                                    controller.startSlot();
                                                    Utils.saveNotTip("ball");
                                                  });
                                            } else {
                                              controller.startSlot();
                                            }
                                          },
                                    child: Container(
                                      width: 188.w,
                                      height: 41.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: controller.isPlaying.value
                                              ? AppColors.cEEEEEE
                                              : AppColors.c000000,
                                          borderRadius:
                                              BorderRadius.circular(9.w)),
                                      child: Text(
                                        controller.isPlaying.value
                                            ? "TRAINING"
                                            : "START",
                                        style: 19.w4(
                                          color: controller.isPlaying.value
                                              ? AppColors.ccccccc
                                              : AppColors.cFFFFFF,
                                          fontFamily: FontFamily.fOswaldMedium,
                                        ),
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                          // Positioned(
                          //   bottom: 60.w,
                          //   left: 0,
                          //   right: 0,
                          //   child: Container(
                          //     height: 0.8.w,
                          //     width: double.infinity,
                          //     color: AppColors.cE6E6E,
                          //     margin: EdgeInsets.symmetric(horizontal: 16.w),
                          //   ),
                          // ),

                          ///道具
                          Positioned(
                            left: 85.w,
                            right: 75.w,
                            top: 13.5.w,
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AwardDialog();
                                    });
                              },
                              child: Container(
                                height: 60.w,
                                // color: Colors.red,
                                alignment: Alignment.topCenter,
                                width: double.infinity,
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Positioned(
                                      top: 9.5.w,
                                      left: 14.w,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 180.w,
                                            height: 9.w,
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            alignment: Alignment.centerLeft,
                                            decoration: BoxDecoration(
                                                color: AppColors.c000000,
                                                borderRadius:
                                                    BorderRadius.circular(5.w),
                                                border: Border.all(
                                                    width: 1.w,
                                                    color: AppColors.c666666)),
                                          ),
                                          Obx(() {
                                            return Positioned(
                                              left: 0,
                                              child: AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                width: 180.w *
                                                    controller.taskValue.value /
                                                    controller.currentTaskNeed,
                                                height: 9.w,
                                                constraints: BoxConstraints(
                                                    maxWidth: 290.w),
                                                decoration: const BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                      AppColors.c3296F2,
                                                      AppColors.c3BE1FF
                                                    ])),
                                              ),
                                            );
                                          }),
                                          Row(
                                            children: [
                                              Obx(() {
                                                return AnimatedNum(
                                                    number: controller
                                                        .taskValue.value,
                                                    textStyle: 12.w4(
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
                                                      height: 0.8,
                                                      color: AppColors.cFFFFFF,
                                                    ));
                                              }),
                                              Text("/",
                                                  style: 12.w4(
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                    height: 0.8,
                                                    color: AppColors.cFFFFFF,
                                                  )),
                                              AnimatedNum(
                                                  number: controller
                                                      .currentTaskNeed,
                                                  textStyle: 12.w4(
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                    height: 0.8,
                                                    color: AppColors.cFFFFFF,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.w,
                                      left: 0.w,
                                      child: IconWidget(
                                        iconWidth: 24.w,
                                        icon: Assets.commonUiCommonProp03,
                                      ),
                                    ),

                                    // Positioned(
                                    //   top: 0.w,
                                    //   left: 27.5.w,
                                    //   child: Text(
                                    //     "TRAINING TASK",
                                    //     style: 12.w4(
                                    //       fontFamily: FontFamily.fOswaldMedium,
                                    //       height: 0.8,
                                    //       color: AppColors.cFFFFFF,
                                    //     ),
                                    //   ),
                                    // ),

                                    Positioned(
                                      top: 5.5.w,
                                      right: 4.w,
                                      child: MtInkwell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return const AwardDialog();
                                              });
                                        },
                                        child: Obx(() {
                                          return AnimatedScale(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            scale: controller.showProp.value
                                                ? 1.5
                                                : 1,
                                            child: Image.asset(
                                              Assets.commonUiCommonProp05,
                                              width: 20.5.w,
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          ///开奖阴影背景
                          Obx(() {
                            return Visibility(
                              visible: controller.showCash.value ||
                                  controller.showBuff.value ||
                                  controller.showPlayerBox.value,
                              child: Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 245.5.w,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                          Colors.black.withOpacity(0.9),
                                          Colors.black.withOpacity(0)
                                        ])),
                                  )),
                            );
                          }),

                          Obx(() {
                            return Visibility(
                              visible: controller.showBuff.value &&
                                  !controller.isChange.value,
                              child: Positioned(
                                top: 15.w,
                                child: Container(
                                  width: 335.w,
                                  height: 23.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColors.c000000,
                                      borderRadius: BorderRadius.circular(4.w)),
                                  child: Text(
                                    "CHOOSE A ACTICS",
                                    style: 12.w4(
                                        color: AppColors.cFFFFFF,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ),
                                ),
                              ),
                            );
                          }),

                          Obx(() {
                            return Visibility(
                              visible: controller.showBuff.value &&
                                  !controller.isChange.value &&
                                  !controller.tacticFly.value,
                              child: Positioned(
                                top: 205.w,
                                child: MtInkwell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    if (Utils.getNoTip("tactics")) {
                                      controller.chooseFinish();
                                      return;
                                    }
                                    BottomTipDialog.show(
                                        context: Get.context!,
                                        title: "Tip",
                                        desc:
                                            "Are you confirm to qiut the tactics pick?",
                                        onTap: () {
                                          Utils.saveNotTip("tactics");
                                          controller.chooseFinish();
                                          Get.back();
                                        });
                                    // showModalBottomSheet(
                                    //     isScrollControlled: true,
                                    //     context: Get.context!,
                                    //     builder: (context) {
                                    //       // return RecoverDialog();
                                    //       return const TacticTipDialog();
                                    //     });
                                  },
                                  child: Container(
                                    width: 30.w,
                                    height: 30.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.cEB0000,
                                        borderRadius:
                                            BorderRadius.circular(6.w)),
                                    child: Image.asset(
                                      Assets.iconUiIconDelete02,
                                      width: 16.w,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),

                          Positioned(
                            top: 80.w,
                            left: 0,
                            right: 0,
                            child: Obx(() {
                              return Visibility(
                                visible: controller.showPlayer.value,
                                child: Container(
                                  width: double.infinity,
                                  height: 94.w,
                                  color: AppColors.c000000,
                                ),
                              );
                            }),
                          ),

                          ///球员列表
                          // if (controller.showPlayer.value)
                          Positioned(
                            top: 49.w,
                            left: -40.w,
                            right: -40.w,
                            child: Obx(() {
                              return GestureDetector(
                                onTap: () {
                                  controller.colosePlayerAwards();
                                },
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: controller.showPlayer.value ? 1 : 0,
                                  child: PlayerSrollerView(),
                                ),
                              );
                            }),
                            // child: PlayerSrollerView(),
                          ),

                          Positioned(
                              top: 74.w,
                              left: -40.w,
                              right: -40.w,
                              child: PlayerSelectBox()),

                          Positioned(top: 60.w, child: PlayerArrow()),

                          ///金钱奖励
                          Positioned(
                            top: 66.w,
                            child: Obx(() {
                              return AnimatedOpacity(
                                opacity: controller.showCash.value ? 1 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  width: 126.w,
                                  height: 51.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.c000000,
                                    borderRadius: BorderRadius.circular(9.w),
                                    border: Border.all(
                                      width: 2.w,
                                      color: AppColors.cFF7954,
                                    ),
                                  ),
                                  child: AnimatedScale(
                                    scale: controller.caShScale.value ? 1.3 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconWidget(
                                          iconWidth: 32.w,
                                          icon: Assets.teamUiMoney02,
                                        ),
                                        4.hGap,
                                        Text(
                                          "+",
                                          style: 16.w4(
                                              color: AppColors.cFFFFFF,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium),
                                        ),
                                        Obx(() {
                                          return AnimatedNum(
                                            fromZero: true,
                                            number: controller.cash.value,
                                            milliseconds: 800,
                                            isMoney: true,
                                            textStyle: 16.w4(
                                                color: AppColors.cFFFFFF,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium),
                                          );
                                          // return Text(
                                          //   Utils.formatMoney(controller.cash.value),
                                          //   style: 16.w4(color: AppColors.cFFFFFF),
                                          // );
                                        })
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// class TacticTipDialog extends GetView<TrainingController> {
//   const TacticTipDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomBottomDialog(
//         title: "Tip",
//         desc: "Are you confirm to qiut the tactics pick?",
//         // content: content,
//         onComfirm: () {
//           controller.saveNotTip();
//           controller.chooseFinish();
//         });
//   }
// }
