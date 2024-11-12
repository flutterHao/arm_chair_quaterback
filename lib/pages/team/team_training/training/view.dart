/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-11 15:57:44
 * @LastEditTime: 2024-11-12 12:19:03
 */

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/player_slot_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingPage extends GetView<TrainingController> {
  const TrainingPage({super.key});

  /// 准备和buff
  Widget _preparationAndBouns() {
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
                "32%",
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.w),
              border: Border.all(
                width: 0.5,
                color: AppColors.c666666,
              ),
            ),
            child: Container(
              width: 317.w * 0.4,
              height: 18.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(9.w),
                ),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.cB3B3B3,
                    AppColors.c000000,
                  ],
                ),
              ),
            ),
          ),
          19.vGap,
          SizedBox(
            height: 55.w,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => 10.hGap,
                itemBuilder: (context, index) {
                  return index < 4
                      ? CircleProgressView(
                          title: "PF",
                          progress: 50,
                          width: 55.w,
                          height: 55.w,
                          progressWidth: 4.w,
                        )
                      : Container(
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
          )
        ],
      ),
    );
  }

  // 训练
  Widget _training() {
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
            Container(
              // height: 72.5.w,
              // color: Colors.amber,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
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
                  IconWidget(iconWidth: 21.w, icon: Assets.uiIconBasketballPng),
                  3.hGap,
                  Text(
                    "156",
                    style: 16.w7(color: AppColors.c262626),
                  ),
                  7.hGap,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 24.w,
                      height: 24.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        border: Border.all(width: 1, color: AppColors.c666666),
                      ),
                      child: IconWidget(
                        icon: Assets.uiIconPlusPng,
                        iconWidth: 12.w,
                        iconHeight: 12.w,
                        iconColor: AppColors.c000000,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(
                    Assets.uiBgBattleJpg,
                    width: 375.w,
                    height: 275.5.w,
                    fit: BoxFit.fitWidth,
                  ),

                  ///金钱
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
                              icon: Assets.uiMoney_02Png,
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
                  Positioned(top: 46.w, child: SlotMachineWheelView())
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
          var trainInfo = controller.trainingInfo.training;
          return Column(
            children: [
              _preparationAndBouns(),
              _training(),
            ],
          );
        });
  }
}
