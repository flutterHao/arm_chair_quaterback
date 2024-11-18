/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-11 15:57:44
 * @LastEditTime: 2024-11-18 12:12:44
 */

import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/add_ball_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_slot_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/slot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingPage extends GetView<TrainingController> {
  const TrainingPage({super.key});

  /// 准备和buff
  Widget _preparationAndBouns(TrainingInfoEntity trainingInfo) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 20.w),
      margin: EdgeInsets.only(top: 9.w),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12.w),
      ),
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
            width: 317.w,
            height: 18.w,
            alignment: Alignment.centerLeft,
            clipBehavior: Clip.antiAlias,
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
                  width: 317.w * trainingInfo.playerReadiness,
                  height: 18.w,
                  constraints: BoxConstraints(maxWidth: 317.w),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(9.w)),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.cB3B3B3,
                        AppColors.c000000,
                      ],
                    ),
                  ),
                  // child: Container(
                  //   width: 2.w,
                  //   height: 18.w,
                  //   color: AppColors.cFFFFFF,
                  //   margin: EdgeInsets.only(
                  //       left: 317.w * trainingInfo.playerReadiness),
                  // ),
                ),
                if (trainingInfo.playerReadiness > 1)
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 317.w * (trainingInfo.playerReadiness - 1),
                        height: 18.w,
                        constraints: BoxConstraints(maxWidth: 317.w),
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
          19.vGap,
          Stack(
            children: [
              SizedBox(
                height: 55.w,
                width: double.infinity,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (context, index) => 10.hGap,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 55.w,
                        height: 55.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.cEEEEEE,
                            borderRadius: BorderRadius.circular(30.w)),
                        child: Text(
                          "NONE",
                          style: 14.w4(color: AppColors.ccccccc),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 55.w,
                width: double.infinity,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: trainingInfo.buff.length,
                    separatorBuilder: (context, index) => 10.hGap,
                    itemBuilder: (context, index) {
                      var item = trainingInfo.buff[index];
                      return CircleProgressView(
                        title: Utils.getPosition(item.position),
                        progress: item.buffValue * 100,
                        width: 55.w,
                        height: 55.w,
                        progressWidth: 4.5.w,
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }

  // 训练
  Widget _training(TrainingInfoEntity trainingInfo) {
    return AspectRatio(
      aspectRatio: 375 / 390.5,
      child: Container(
        margin: EdgeInsets.only(top: 9.w),
        width: 375.w,
        height: 390.5.w,
        decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Column(
          children: [
            25.vGap,
            Container(
              // height: 72.5.w,
              // color: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "TRAINING",
                      style: 30.w7(
                          color: AppColors.c262626,
                          fontFamily: FontFamily.fOswaldMedium,
                          height: 0.7),
                    ),
                  ),
                  IconWidget(
                      iconWidth: 21.w, icon: Assets.iconUiIconBasketball),
                  4.hGap,
                  Text(
                    "${trainingInfo.prop.num}/${controller.trainDefine.ballMaxNum}",
                    style: 16.w7(
                      color: AppColors.c262626,
                      fontFamily: FontFamily.fOswaldMedium,
                    ),
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
                      width: 24.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        border: Border.all(width: 1, color: AppColors.c666666),
                      ),
                      child: IconWidget(
                        icon: Assets.iconUiIconPlus,
                        iconWidth: 12.w,
                        iconHeight: 12.w,
                        iconColor: AppColors.c000000,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (trainingInfo.prop.num < controller.trainDefine.ballMaxNum)
              Container(
                margin: EdgeInsets.only(top: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${controller.trainDefine.ballRecoverNum} balls ready in ",
                      style: 12.w4(fontFamily: FontFamily.fRobotoRegular),
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
            10.vGap,
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  MirrorImageWidget(
                    imagePath: Assets.managerUiManagerTrainingBg,
                    fullWidth: 375.w,
                    imageHeight: 275.5.w,
                  ),

                  ///金钱奖励
                  Positioned(
                    top: 46.w,
                    child: Visibility(
                      visible: false,
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
                            Text(
                              "250K",
                              style: 16.w4(color: AppColors.cFFFFFF),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///球员列表
                  Positioned(
                    top: 46.w,
                    left: -0.w,
                    child: PlayerSrollerView(),
                  ),

                  ///slot
                  Positioned(
                    top: 140.w,
                    child: SlotMachine(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
              _preparationAndBouns(trainInfo),
              _training(trainInfo),
            ],
          );
        });
  }
}
