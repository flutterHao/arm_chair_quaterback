/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-11 16:05:49
 * @LastEditTime: 2025-03-07 19:05:26
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/user_entiry/team.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_detail/widgets/comments/user_avater_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/buy_go_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/free_box_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/tactic_card.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_slot_new.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_slot_new_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spine_flutter/spine_widget.dart';

class TrainingNewWidget extends GetView<TrainingController> {
  const TrainingNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.showAward();
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (ctrl) {
          return Container(
              color: AppColors.cFFFFFF,
              width: double.infinity,
              height: 607.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ///背景文字
                  Positioned(
                    top: 20.w,
                    left: 16.w,
                    child: Text(
                      "Hello uesername",
                      style: 14.w4(fontFamily: FontFamily.fRobotoRegular),
                    ),
                  ),
                  Positioned(
                    top: 42.5.w,
                    left: 16.w,
                    child: Text(
                      "${MyDateUtils.getWeekday(DateTime.now())},${MyDateUtils.getEnDDMM(DateTime.now())}",
                      style: 24.w4(
                        fontFamily: FontFamily.fOswaldBold,
                        height: 0.9,
                      ),
                    ),
                  ),

                  for (int i = 0; i < 3; i++)
                    Positioned(
                      top: 37.w,
                      right: 21.w + i * 19.w,
                      child: Image.asset(
                        ctrl.shieldCount.value > i
                            ? Assets.managerUiNewManger13
                            : Assets.managerUiNewManger12,
                        width: 24.w,
                        fit: BoxFit.fitWidth,
                      ),
                    ),

                  ///背景图
                  Positioned(
                    top: 76.w,
                    child: Image.asset(
                      Assets.managerUiNewManger03,
                      width: 343.w,
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  Positioned(
                      top: 91.w,
                      left: 29.w,
                      child: Container(
                        width: 46.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          color: AppColors.cF2F2F2.withOpacity(0.7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 4.w,
                              height: 4.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.w),
                                  color: AppColors.cC42F3F),
                            ),
                            4.5.hGap,
                            Text(
                              "live".toUpperCase(),
                              style:
                                  10.w4(fontFamily: FontFamily.fRobotoMedium),
                            )
                          ],
                        ),
                      )),

                  Positioned(
                    top: 121.w,
                    left: 29.w,
                    child: Container(
                      width: 165.w,
                      height: 105.w,
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(4.w),
                          border: Border.all(
                            width: 2,
                            color: AppColors.cD9D9D9,
                          )),
                      child: PreparationCard(),
                    ),
                  ),

                  ///美女动画
                  // Positioned(
                  //   top: 67,
                  //   left: 0,
                  //   right: 0,
                  //   child: GetBuilder<BeautyController>(
                  //       // init: BeautyController(),
                  //       builder: (beautyCtrl) {
                  //     return InkWell(
                  //       onTap: () {
                  //         Random random = Random();
                  //         beautyCtrl.setAnimation(random.nextBool() ? 1 : 2);
                  //       },
                  //       child: Container(
                  //           margin: EdgeInsets.only(left: 130.w, top: 20.w),
                  //           height: 468.5.w,
                  //           child: SpineWidget.fromAsset(
                  //             Assets.assetsSpineNv1,
                  //             "assets/spine/nv_1.json",
                  //             beautyCtrl.spineWidgetController,
                  //             fit: BoxFit.fitHeight,
                  //             alignment: Alignment.topCenter,
                  //           )),
                  //     );
                  //   }),
                  // ),

                  Positioned(
                    top: 417.w,
                    child: Container(
                      width: 343.w,
                      height: 142.5.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          color: AppColors.c262626,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(9.w),
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: AppColors.cD9D9D9.withOpacity(0.1)),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(5.w),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 436.w,
                    left: 35.5.w,
                    child: CollectWidget(),
                  ),

                  ///训练slot
                  Positioned(
                    top: 333.5.w,
                    left: 30.w,
                    right: 30.w,
                    child: const TrainingSlotNew(),
                  ),

                  //开始按钮
                  Positioned(
                    top: 443.5.w,
                    child: const _SlotButton(),
                  ),

                  ///恢复倒计时
                  if (ctrl.trainingInfo.prop.num < ctrl.trainDefine.ballMaxNum)
                    Positioned(
                      // bottom: 12.w,
                      top: 587.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${ctrl.trainDefine.ballRecoverNum} Go ready in ",
                            style: 12.w4(
                                height: 1,
                                fontFamily: FontFamily.fRobotoRegular,
                                color: AppColors.c000000),
                          ),
                          Obx(() {
                            return Text(
                              ctrl.recoverTimeStr.value,
                              style: 12.w4(
                                height: 1,
                                color: AppColors.c10A86A,
                                fontFamily: FontFamily.fRobotoRegular,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                ],
              ));
        });
  }
}

class CollectWidget extends StatelessWidget {
  const CollectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MtInkWell(
      onTap: () {},
      child: Container(
        width: 74.w,
        height: 103.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.w),
          color: AppColors.c515151,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 15.w,
              child: Container(
                width: 57.w,
                height: 57.w,
                decoration: BoxDecoration(
                    color: AppColors.c666666,
                    borderRadius: BorderRadius.circular(28.5.w)),
              ),
            ),
            Positioned(
              top: 31.w,
              child: Image.asset(
                Assets.managerUiNewManger07,
                height: 27.5.w,
                width: 28.w,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
                top: 83.w,
                child: Text(
                  "Collect",
                  style: 12.w4(
                      fontFamily: FontFamily.fRobotoRegular,
                      color: AppColors.cFFFFFF,
                      height: 0.8),
                ))
          ],
        ),
      ),
    );
  }
}

class PreparationCard extends GetView<TrainingController> {
  const PreparationCard({super.key});

  @override
  Widget build(BuildContext context) {
    var team = HomeController.to.userEntiry.teamLoginInfo?.team;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
            child: Image.asset(
          Assets.managerUiNewManger14,
          width: 161.w,
          fit: BoxFit.fitWidth,
        )),
        Positioned(
          top: 10.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  UserAvaterWidget(
                    url: Utils.getAvatarUrl(team?.teamLogo ?? 0),
                    radius: 16.w,
                    width: 32.w,
                    height: 32.w,
                  ),
                  4.5.vGap,
                  Text(
                    team?.teamName ?? "",
                    style: 9
                        .w4(fontFamily: FontFamily.fOswaldRegular, height: 0.8),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "VS",
                  style: 16.w4(fontFamily: FontFamily.fOswaldMedium),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 32.w,
                    height: 32.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.w),
                        color: AppColors.c262626),
                    child: Text(
                      "?",
                      style: 17.w4(
                          fontFamily: FontFamily.fRobotoBlack,
                          color: AppColors.cFFFFFF),
                    ),
                  ),
                  4.5.vGap,
                  Text(
                    ". . .",
                    style: 9
                        .w4(fontFamily: FontFamily.fOswaldRegular, height: 0.8),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 70.w,
          child: Column(
            children: [
              Container(
                width: 161.w,
                height: 18.w,
                color: AppColors.c262626,
                padding: EdgeInsets.only(left: 5.5.w, right: 8.w, bottom: 4.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        "Game Preparation",
                        style: 10.w4(
                            fontFamily: FontFamily.fRobotoRegular,
                            color: AppColors.cFFFFFF,
                            height: 0.8),
                      ),
                    ),
                    Text(
                      "${(controller.trainingInfo.playerReadiness * 100).toInt()}",
                      style: 14.w4(
                          fontFamily: FontFamily.fOswaldMedium,
                          color: AppColors.cFFFFFF,
                          height: 0.8),
                    ),
                    Text(
                      "%",
                      style: 10.w4(
                          fontFamily: FontFamily.fOswaldMedium,
                          color: AppColors.cFFFFFF,
                          height: 0.8),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 161.w,
                    height: 6.w,
                    color: AppColors.c262626,
                  ),
                  Positioned(
                    left: 0,
                    child: AnimatedContainer(
                      duration: 300.milliseconds,
                      width:
                          (120.75).w * controller.trainingInfo.playerReadiness,
                      height: 6.w,
                      color: controller.trainingInfo.playerReadiness <= 1
                          ? AppColors.c17C29C
                          : AppColors.cCC2639,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Image.asset(
                      Assets.managerUiNewManger05,
                      width: 161.w * 0.25,
                      color: AppColors.c4D4D4D,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SlotButton extends StatelessWidget {
  const _SlotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (controller) {
          return Obx(() {
            return InkWell(
              onTap: () {
                controller.onTapGoButton();
              },
              child: AnimatedScale(
                scale: controller.isPlaying.value ? 0.9 : 1,
                duration: const Duration(milliseconds: 50),
                child: Container(
                  width: 114.w + 6.w,
                  height: 85.w + 6.w,
                  alignment: Alignment.center,
                  child: Opacity(
                    opacity: controller.isPlaying.value ? 0.5 : 1,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          Assets.managerUiManagerIconButton,
                          width: 104.5.w,
                          height: 104.5.w,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 12.5.w,
                          child: AnimationArcWidget(
                            42.w,
                            progressWidth: 5.w,
                            progressColor: AppColors.cFFFFFF,
                            borderColor: Colors.black.withOpacity(0.3),
                            progressSweepAngle: 180 *
                                controller.ballNum.value /
                                controller.trainDefine.ballMaxNum,
                            borderWidth: 5.w,
                          ),
                        ),
                        Positioned(
                          // bottom: 16.w,
                          top: 74.w,
                          child: Container(
                            // height: 72.5.w,
                            width: 75.w,
                            alignment: Alignment.bottomCenter,
                            child: Obx(() {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnimatedScale(
                                    duration: 150.milliseconds,
                                    scale: controller.showBall.value ? 1.5 : 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Obx(() {
                                          int v = controller.ballNum.value;
                                          return AnimatedNum(
                                            milliseconds: 100,
                                            number: v,
                                            textStyle: 14.w4(
                                                color: AppColors.cFFFFFF,
                                                fontFamily:
                                                    FontFamily.fOswaldRegular,
                                                height: 0.8),
                                          );
                                        }),
                                        if (controller.showBall.value)
                                          Text(
                                            "+${controller.trainingInfo.prop.num - controller.ballNum.value}",
                                            style: 14.w4(
                                                color: AppColors.c31E99E,
                                                fontFamily:
                                                    FontFamily.fOswaldMedium,
                                                height: 0.8),
                                          )
                                      ],
                                    ),
                                  ),
                                  AnimatedScale(
                                    duration: 150.milliseconds,
                                    scale: controller.showBall.value ? 0 : 1,
                                    child: Text(
                                      "/${controller.trainDefine.ballMaxNum}",
                                      style: 14.w4(
                                          color: AppColors.cFFFFFF,
                                          fontFamily: FontFamily.fOswaldRegular,
                                          height: 0.8),
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
                ),
              ),
            );
          });
        });
  }
}
