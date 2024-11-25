import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/add_ball_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_sroller_view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingWidget extends StatelessWidget {
  const TrainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (controller) {
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
                    color: AppColors.c002B5C,
                    borderRadius: BorderRadius.circular(12.w),
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      MirrorImageWidget(
                        imagePath: Assets.managerUiManagerTrainingBg,
                        fullWidth: 375.w,
                        imageHeight: 275.5.w,
                      ),

                      Positioned(
                          top: 356.5.w - 30.w - 283.w,
                          child: Image.asset(
                            Assets.managerUiManagerTrainingBg02,
                            width: 155.w,
                          )),

                      Positioned(
                        top: 16.w,
                        right: 16.w,
                        child: Container(
                          // height: 72.5.w,
                          // color: Colors.amber,
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
                              AnimatedNum(
                                number: controller.trainingInfo.prop.num,
                                textStyle: 16.w7(
                                    color: AppColors.cFFFFFF,
                                    fontFamily: FontFamily.fOswaldMedium,
                                    height: 1),
                              ),
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
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.w),
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

                      if (controller.trainingInfo.prop.num <
                          controller.trainDefine.ballMaxNum)
                        Positioned(
                          top: 45.w,
                          left: 266.w,
                          child: Container(
                            margin: EdgeInsets.only(top: 4.w),
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
                                      color: AppColors.c10A86A,
                                      fontFamily: FontFamily.fRobotoRegular,
                                    ),
                                  );
                                }),
                                16.hGap,
                              ],
                            ),
                          ),
                        ),

                      ///Slot
                      Positioned(top: 94.w, child: TrainingSlot()),

                      ///start
                      Positioned(
                        top: 205.w,
                        child: Column(
                          children: [
                            Row(
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
                          height: 0.5.w,
                          width: double.infinity,
                          color: AppColors.cE6E6E,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                      ),

                      ///道具
                      Positioned(
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
                                    width: 290.w * 0.5,
                                    duration: const Duration(microseconds: 300),
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
                                    icon: Assets.managerUiManagerFreegift01),
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
                                child: Text(
                                  "180/220K",
                                  style: 14
                                      .w4(fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                              Positioned(
                                bottom: 20.5.w,
                                right: 13.5.w,
                                child: Image.asset(
                                  Assets.managerUiManagerFreegift01,
                                  width: 33.5.w,
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
                              controller.showPlayer.value ||
                              true,
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

                      ///球员列表
                      Positioned(
                        top: 26.w,
                        left: -37.w,
                        right: -37.w,
                        child: Obx(() {
                          return AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: controller.showPlayer.value ? 1 : 1,
                            child: PlayerSrollerView(),
                          );
                        }),
                      ),

                      ///金钱奖励
                      Positioned(
                        top: 46.w,
                        child: Obx(() {
                          return AnimatedOpacity(
                            opacity: controller.showCash.value ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              width: 126.w,
                              height: 61.w,
                              decoration: BoxDecoration(
                                color: AppColors.c000000,
                                borderRadius: BorderRadius.circular(9.w),
                                border: Border.all(
                                  width: 2.w,
                                  color: AppColors.cFF7954,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconWidget(
                                    iconWidth: 32.5.w,
                                    icon: Assets.teamUiMoney02,
                                  ),
                                  5.hGap,
                                  Obx(() {
                                    // return AnimatedNum(
                                    //   number: controller.cash.value,
                                    //   unit: "K",
                                    //   textStyle: 16.w4(color: AppColors.cFFFFFF),
                                    // );
                                    return Text(
                                      Utils.formatMoney(controller.cash.value),
                                      style: 16.w4(color: AppColors.cFFFFFF),
                                    );
                                  })
                                ],
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
                      // Positioned(
                      //   top: 140.w,
                      //   left: 50.w,
                      //   right: 50.w,
                      //   child: Obx(() {
                      //     return Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: controller.isOpenList.map(
                      //           (e) {
                      //             return FlipCard(
                      //                 isFlipped: e.value,
                      //                 onFlip: () => e.value = !e.value);
                      //           },
                      //         ).toList());
                      //   }),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
