/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 14:41:22
 * @LastEditTime: 2024-11-25 15:16:15
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-11 15:57:44
 * @LastEditTime: 2024-11-21 20:25:47
 */

import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/vertival_drag_back_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/add_ball_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/flip_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_sroller_view.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_slot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingPage extends GetView<TrainingController> {
  const TrainingPage({super.key});

  /// 准备
  Widget _preparation(TrainingInfoEntity trainingInfo) {
    return GestureDetector(
      onTap: () {
        final teamIndexCtrl = Get.find<TeamIndexController>();
        teamIndexCtrl.scroToSlot();
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20.w),
        margin: EdgeInsets.only(top: 9.w),
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Row(
          children: [
            29.hGap,
            SizedBox(
              width: 297.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "PREPARATION",
                        style: 19.w4(
                          color: AppColors.c000000,
                          height: 1,
                          fontFamily: FontFamily.fOswaldMedium,
                        ),
                      )),
                      Text(
                        "${(trainingInfo.playerReadiness * 100).toInt()}%",
                        style: 19.w4(color: AppColors.c000000, height: 1),
                      ),
                      9.hGap,
                    ],
                  ),
                  8.vGap,
                  Container(
                    width: 297.w,
                    height: 14.w,
                    alignment: Alignment.centerLeft,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      border: trainingInfo.playerReadiness < 1
                          ? Border.all(
                              width: 0.5,
                              color: AppColors.c666666,
                            )
                          : null,
                    ),
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 297.w * trainingInfo.playerReadiness,
                          height: 14.w,
                          constraints: BoxConstraints(maxWidth: 297.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(9.w)),
                            gradient: const LinearGradient(
                              colors: [
                                AppColors.cB3B3B3,
                                AppColors.c000000,
                              ],
                            ),
                          ),
                        ),
                        if (trainingInfo.playerReadiness > 1)
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width:
                                    297.w * (trainingInfo.playerReadiness - 1),
                                height: 14.w,
                                constraints: BoxConstraints(maxWidth: 297.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(9.w)),
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.c022A1D,
                                      AppColors.c23E8A9,
                                    ],
                                  ),
                                ),
                              ),
                              if ((trainingInfo.playerReadiness - 1) < 0.99)
                                Container(
                                  width: 2.w,
                                  height: 18.w,
                                  color: AppColors.cFFFFFF,
                                )
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            18.hGap,
            IconWidget(
              iconWidth: 12.w,
              icon: Assets.iconUiIconTriangle03,
              iconColor: AppColors.c000000,
              rotateAngle: 90,
            ),
          ],
        ),
      ),
    );
  }

  Widget _staminaAndTactics(TrainingInfoEntity trainingInfo) {
    final myTeamCtrl = Get.find<TeamController>();
    return Container(
        width: double.infinity,
        height: 115.w,
        margin: EdgeInsets.only(top: 9.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: Get.context!,
                    builder: (context) {
                      return const VerticalDragBackWidget(
                          child: TeamMenberView());
                    });
              },
              child: Container(
                width: 140.w,
                height: 115.w,
                padding: EdgeInsets.only(left: 34.w, right: 21.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "STAMINA",
                          style: 14.w4(
                              color: AppColors.c000000,
                              fontFamily: FontFamily.fOswaldRegular),
                        ),
                        18.hGap,
                        IconWidget(
                          iconWidth: 14.w,
                          iconHeight: 12.w,
                          icon: Assets.iconUiIconRead,
                          iconColor: AppColors.c000000,
                        )
                      ],
                    ),
                    13.vGap,
                    CircleProgressView(
                        progress: (myTeamCtrl.myTeamEntity.powerP < 100
                                ? myTeamCtrl.myTeamEntity.powerP
                                : myTeamCtrl.myTeamEntity.powerP - 100) *
                            1.0,
                        width: 55.w,
                        height: 55.w,
                        progressWidth: 5.w,
                        backgroundColor: myTeamCtrl
                            .getBackColor(myTeamCtrl.myTeamEntity.powerP),
                        progressColor: myTeamCtrl
                            .getProgressColor(myTeamCtrl.myTeamEntity.powerP),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconWidget(
                              iconWidth: 18.w,
                              icon: Assets.managerUiManagerIconRecover,
                            ),
                            3.vGap,
                            Text(
                              "${myTeamCtrl.myTeamEntity.powerP.toStringAsFixed(0)}%",
                              style: 10.w4(),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Container(
              width: 1.w,
              height: 91.w,
              color: AppColors.cE6E6E,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(left: 21.w, right: 21.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      18.vGap,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TACTICS",
                            style: 14.w4(
                                color: AppColors.c000000,
                                fontFamily: FontFamily.fOswaldRegular),
                          ),
                          18.hGap,
                          IconWidget(
                            iconWidth: 14.w,
                            iconHeight: 12.w,
                            icon: Assets.iconUiIconRead,
                            iconColor: AppColors.c000000,
                          )
                        ],
                      ),
                      17.vGap,
                      Stack(
                        children: [
                          SizedBox(
                            height: 43.w,
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 30.w,
                                    height: 43.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.cEEEEEE,
                                        borderRadius:
                                            BorderRadius.circular(6.w)),
                                  );
                                },
                                separatorBuilder: (context, index) => 7.hGap,
                                itemCount: 4),
                          ),
                          SizedBox(
                            height: 43.w,
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Image.asset(
                                    Assets.newsUiEmojiJoker,
                                    width: 30.w,
                                    height: 43.w,
                                  );
                                },
                                separatorBuilder: (context, index) => 7.hGap,
                                itemCount: 2),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  // 训练
  Widget _training(TrainingInfoEntity trainingInfo) {
    // final randon = Random();
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
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
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
                          number: trainingInfo.prop.num,
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

                if (trainingInfo.prop.num < controller.trainDefine.ballMaxNum)
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
                              controller.isPlaying.value ? "TRAINING" : "START",
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
                                    width: 1.w, color: AppColors.cD1D1D1)),
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
                            style: 14.w4(fontFamily: FontFamily.fOswaldMedium),
                          ),
                        ),
                        Positioned(
                          bottom: 33.5.w,
                          right: 55.5.w,
                          child: Text(
                            "180/220K",
                            style: 14.w4(fontFamily: FontFamily.fOswaldMedium),
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
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TrainingController());
    return GetBuilder<TrainingController>(
        // init: TrainingController(),
        id: "training_page",
        builder: (_) {
          // controller.swiperControl.startAutoplay();
          var trainInfo = controller.trainingInfo;
          return Column(
            children: [
              _preparation(trainInfo),
              _staminaAndTactics(trainInfo),
              9.vGap,
              _training(trainInfo),
            ],
          );
        });
  }
}
