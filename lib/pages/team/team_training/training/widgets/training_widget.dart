/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-25 15:56:43
 * @LastEditTime: 2024-11-28 15:53:40
 */

import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/add_ball_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/award_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_sroller_view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_slot.dart';
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
    // controller.showAward();
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (controller) {
          // test(controller);
          // controller.startPlayerScroll(0);

          return Column(
            children: [
              Container(
                height: 2.w,
                width: double.infinity,
                color: AppColors.c000000,
              ),
              AspectRatio(
                aspectRatio: 375 / 356.5,
                child: Container(
                  width: 375.w,
                  height: 356.5.w,
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
                          imageHeight: 275.5.w,
                        ),
                      ),

                      Positioned(
                          top: 50.w,
                          child: Image.asset(
                            Assets.managerUiManagerTrainingBg02,
                            width: 155.w,
                          )),

                      Positioned(
                        top: 16.w,
                        right: 16.w,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: Get.context!,
                                builder: (context) {
                                  return const AddBallDialog();
                                });
                          },
                          child: Container(
                            // height: 72.5.w,
                            // width: 95.w,
                            // height: 24.w,
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: AppColors.c000000.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Obx(() {
                                  return AnimatedScale(
                                    scale: controller.showBall.value ? 1.2 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    child: IconWidget(
                                        iconWidth: 18.w,
                                        icon: Assets.commonUiCommonProp04),
                                  );
                                }),
                                4.hGap,
                                Obx(() {
                                  int v = controller.ballNum.value;
                                  return AnimatedNum(
                                    number: v,
                                    textStyle: 16.w7(
                                        color: AppColors.cFFFFFF,
                                        fontFamily: FontFamily.fOswaldMedium,
                                        height: 1),
                                  );
                                }),
                                Text(
                                  "/${controller.trainDefine.ballMaxNum}",
                                  style: 16.w7(
                                      color: AppColors.cFFFFFF,
                                      fontFamily: FontFamily.fOswaldMedium,
                                      height: 1),
                                ),
                                7.hGap,
                                MtInkwell(
                                  onTap: () {
                                    showDialog(
                                        context: Get.context!,
                                        builder: (context) {
                                          return const AddBallDialog();
                                        });
                                  },
                                  child: Container(
                                    width: 20.w,
                                    height: 20.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.w),
                                        color: AppColors.c000000),
                                    child: IconWidget(
                                      icon: Assets.iconUiIconPlus,
                                      iconWidth: 12.w,
                                      iconHeight: 12.w,
                                      iconColor: AppColors.cFF7954,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      if (controller.trainingInfo.prop.num <=
                          controller.trainDefine.ballMaxNum)
                        Positioned(
                          top: 45.w,
                          right: 16.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${controller.trainDefine.ballRecoverNum} balls ready in ",
                                style: 12.w4(
                                    fontFamily: FontFamily.fRobotoRegular,
                                    color: AppColors.cFFFFFF),
                              ),
                              Obx(() {
                                return Text(
                                  controller.recoverTimeStr.value,
                                  style: 12.w4(
                                    color: AppColors.c31E99E,
                                    fontFamily: FontFamily.fRobotoRegular,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),

                      ///Slot
                      Positioned(top: 94.w, child: TrainingSlot()),

                      ///start
                      Positioned(
                        top: 205.w,
                        child: Column(
                          children: [
                            Obx(() {
                              return Opacity(
                                opacity: controller.isPlaying.value ? 0 : 1,
                                child: Row(
                                  children: [
                                    Text(
                                      "COST:",
                                      style: 16.w7(
                                          color: AppColors.c262626,
                                          fontFamily: FontFamily.fOswaldMedium,
                                          height: 0.7),
                                    ),
                                    7.hGap,
                                    IconWidget(
                                        iconWidth: 21.w,
                                        icon: Assets.commonUiCommonProp04),
                                    4.hGap,
                                    Text(
                                      "1",
                                      style: 16.w7(color: AppColors.c262626),
                                    )
                                  ],
                                ),
                              );
                            }),
                            5.vGap,
                            MtInkwell(
                              // vibrate: true,
                              onTap: () => controller.startSlot(),
                              child: Obx(() {
                                return Container(
                                  width: 188.w,
                                  height: 41.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: controller.isPlaying.value
                                          ? AppColors.cEEEEEE
                                          : AppColors.c000000,
                                      borderRadius: BorderRadius.circular(9.w)),
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
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 60.w,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 1.w,
                          width: double.infinity,
                          color: AppColors.cE6E6E,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                      ),

                      ///道具
                      Positioned(
                        // top: 296.w,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SizedBox(
                          height: 60.w,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 21.w,
                                left: 34.w,
                                child: Container(
                                  width: 290.w,
                                  height: 9.w,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.w),
                                      border: Border.all(
                                          width: 1.w,
                                          color: AppColors.cD1D1D1)),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: 297.w *
                                        controller.trainingInfo.training
                                            .taskItemCount /
                                        controller.currentTask,
                                    height: 12.w,
                                    constraints:
                                        BoxConstraints(maxWidth: 290.w),
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                      AppColors.c3296F2,
                                      AppColors.c3BE1FF
                                    ])),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 18.5.w,
                                left: 21.w,
                                child: IconWidget(
                                    iconWidth: 27.w,
                                    icon: Assets.commonUiCommonProp03),
                              ),
                              Positioned(
                                bottom: 33.5.w,
                                left: 52.w,
                                child: Text(
                                  "TRAINING TASK",
                                  style: 14
                                      .w4(fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                              Positioned(
                                bottom: 33.5.w,
                                right: 55.5.w,
                                child: Row(
                                  children: [
                                    AnimatedNum(
                                        number: controller.trainingInfo.training
                                            .taskItemCount,
                                        textStyle: 14.w4(
                                            fontFamily:
                                                FontFamily.fOswaldMedium)),
                                    Text("/",
                                        style: 14.w4(
                                            fontFamily:
                                                FontFamily.fOswaldMedium)),
                                    AnimatedNum(
                                        number: controller.currentTask,
                                        textStyle: 14.w4(
                                            fontFamily:
                                                FontFamily.fOswaldMedium))
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 20.5.w,
                                right: 13.5.w,
                                child: MtInkwell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AwardDialog();
                                        });
                                  },
                                  child: Image.asset(
                                    Assets.managerUiManagerFreegift01,
                                    width: 33.5.w,
                                  ),
                                ),
                              ),
                            ],
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
                                height: 245.5,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.black.withOpacity(0)
                                    ])),
                              )),
                        );
                      }),

                      Obx(() {
                        return Visibility(
                          visible: controller.showBuff.value,
                          child: Positioned(
                            top: 170.w,
                            child: Container(
                              width: 249.w,
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
                          visible: controller.showBuff.value,
                          child: Positioned(
                            top: 205.w,
                            child: MtInkwell(
                              onTap: () {
                                if (controller.isNotTip.value) {
                                  controller.chooseFinish();
                                  return;
                                }
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CustomDialog(
                                          content: Center(
                                            // padding: EdgeInsets.symmetric(
                                            //     vertical: 30.w),
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30.w),
                                                  child: Text(
                                                    "Are yout confirm to qiut the 'Tactics Pick'",
                                                    style: 16.w4(),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                MtInkwell(
                                                  onTap: () {
                                                    controller.isNotTip.value =
                                                        !controller
                                                            .isNotTip.value;
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Obx(() {
                                                        return Checkbox(
                                                            value: controller
                                                                .isNotTip.value,
                                                            activeColor:
                                                                AppColors
                                                                    .cFF7954,
                                                            onChanged: (v) {
                                                              controller
                                                                      .isNotTip
                                                                      .value =
                                                                  !controller
                                                                      .isNotTip
                                                                      .value;
                                                            });
                                                      }),
                                                      Text(
                                                        "No more tips today",
                                                        style: 12.w4(),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            controller.saveNotTip();
                                            controller.chooseFinish();
                                          });
                                    });
                              },
                              child: Container(
                                width: 23.w,
                                height: 23.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.cEB0000,
                                    borderRadius: BorderRadius.circular(4.w)),
                                child: Image.asset(
                                  Assets.iconUiIconDelete02,
                                  width: 16.w,
                                  height: 16.w,
                                  color: AppColors.cFFFFFF,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),

                      ///球员列表
                      // if (controller.showPlayer.value)
                      Positioned(
                        top: 26.w,
                        left: -40.w,
                        right: -40.w,
                        child: Obx(() {
                          return AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: controller.showPlayer.value ? 1 : 0,
                            child: PlayerSrollerView(),
                          );
                        }),
                        // child: PlayerSrollerView(),
                      ),

                      Positioned(
                        top: 60.w,
                        left: -40.w,
                        right: -40.w,
                        child: Obx(() {
                          return AnimatedOpacity(
                            duration: const Duration(milliseconds: 400),
                            opacity: controller.showPlayerBox.value ? 1 : 0,
                            child: Container(
                              height: 78.w,
                              alignment: Alignment.center,
                              child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .trainingInfo.statusReplyPlayers.length,
                                  separatorBuilder: (context, index) => 6.hGap,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 59.w,
                                      height: 78.w,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.w),
                                          border: Border.all(
                                              color: AppColors.cFF7954,
                                              width: 2.w)),
                                    );
                                  }),
                            ),
                          );
                        }),
                      ),

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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                          fontFamily: FontFamily.fOswaldMedium),
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

                      // Obx(() {
                      //   var a = controller.showCash.value;
                      //   return Visibility(
                      //     visible: true,
                      //     child: Stack(
                      //       children: [
                      //         ...List.generate(6, (index) {
                      //           double x = 50.w * index + 50.w;
                      //           return MoneyAnimation(
                      //             fromPosition: Offset(x, 140.w), // 从 slot 位置开始
                      //             toPosition: Offset(165.w, 70.w), // 到金钱奖励组件的位置
                      //             coinSize: 20.0,
                      //           );
                      //         })
                      //       ],
                      //     ),
                      //   );
                      // }),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
