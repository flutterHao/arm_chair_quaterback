import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/*
 * @Description: 换人+宝箱
 * @Author: lihonghao
 * @Date: 2024-11-11 14:05:07
 * @LastEditTime: 2024-11-11 15:04:44
 */
class BeautyIndex extends GetView<BeautyController> {
  const BeautyIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 389.w + 219.w,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              child: Text(
                "ARMCHAIR",
                style: 121.w7(color: AppColors.c262626, height: 0.74),
              ),
            ),
          ),
          Positioned(
            top: 32.w,
            left: 0,
            right: 0,
            child: Container(
              color: AppColors.cF2F2F2,
              height: 30.w,
              alignment: Alignment.center,
              child: Text(
                "QUARTERBACK",
                style: TextStyle(fontSize: 21.sp, letterSpacing: 15),
              ),
            ),
          ),
          // Positioned(
          //   top: 21.w,
          //   left: 0,
          //   right: 0,
          //   child: Obx(() {
          //     return Image.asset(
          //         controller.beautyList[controller.beautyIndex.value],
          //         fit: BoxFit.fitHeight,
          //         height: 546.w,
          //         alignment: Alignment.topRight);
          //   }),
          // ),
          Positioned(
            // top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // height: 219.w,
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 204,
                          child: Container(
                            height: 51.w,
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 10.w),
                            decoration: BoxDecoration(
                              color: AppColors.c000000,
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      "Battle Pass",
                                      style: 14.w4(
                                          color: AppColors.cFFFFFF,
                                          height: 0.75),
                                    )),
                                    IconWidget(
                                      iconWidth: 14.w,
                                      icon: Assets.uiIconReadPng,
                                      iconColor: AppColors.cFFFFFF,
                                    )
                                  ],
                                ),
                                const Expanded(child: SizedBox.shrink()),
                                CustomLinearProgressBar(
                                  progress: 0.3,
                                  height: 8.w,
                                  width: double.infinity,
                                  backgroundColor: AppColors.c4D4D4D,
                                  progressColor: AppColors.cFFFFFF,
                                ),
                              ],
                            ),
                          )),
                      SizedBox(width: 9.w),
                      Expanded(
                        flex: 134,
                        child: SizedBox(
                          height: 55.w,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                bottom: 0,
                                top: 3.5.w,
                                right: 3.5.w,
                                child: Container(
                                  padding: EdgeInsets.only(left: 13.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.w),
                                      border: Border.all(
                                          width: 1.w,
                                          color: AppColors.c666666)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Free Gift",
                                        style: 14.w4(
                                            color: AppColors.c262626,
                                            height: 0.75),
                                      ),
                                      10.vGap,
                                      Row(
                                        children: [
                                          Text(
                                            "Click to get",
                                            style: 10.w4(
                                                color: AppColors.cFF7954,
                                                height: 0.75),
                                          ),
                                          4.hGap,
                                          IconWidget(
                                            iconWidth: 5.w,
                                            icon: Assets.uiIconShrinkPng,
                                            iconColor: AppColors.cFF7954,
                                            rotateAngle: 90,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: SizedBox(
                                  width: 55.w,
                                  height: 45.w,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Obx(() {
                                            return Image.asset(
                                              controller.box2Claimed.value
                                                  ? Assets.uiTeamBox_04Png
                                                  : Assets.uiTeamBox_03Png,
                                              width: 23.h,
                                              fit: BoxFit.fill,
                                            );
                                          })),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: Obx(() {
                                          return Image.asset(
                                            controller.box1Claimed.value
                                                ? Assets.uiTeamBox_02Png
                                                : Assets.uiTeamBox_01Png,
                                            width: 38.h,
                                            fit: BoxFit.fill,
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
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
