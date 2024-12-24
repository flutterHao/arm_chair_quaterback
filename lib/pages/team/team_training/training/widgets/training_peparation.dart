/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-25 16:03:12
 * @LastEditTime: 2024-12-24 11:49:35
 */
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/widgets/linear_progress_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/tactics/training_tactics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingPeparation extends StatelessWidget {
  const TrainingPeparation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainingController>(
        id: "training_page",
        builder: (controller) {
          TrainingInfoEntity trainingInfo = controller.trainingInfo;
          return GestureDetector(
            onTap: () {
              final teamIndexCtrl = Get.find<TeamIndexController>();
              teamIndexCtrl.scroToSlot();
            },
            child: Container(
              height: 177.w,
              width: double.infinity,
              alignment: Alignment.topCenter,
              // padding: EdgeInsets.symmetric(vertical: 20.w),
              margin: EdgeInsets.only(top: 9.w),
              decoration: BoxDecoration(
                color: AppColors.cFFFFFF,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 331.w,
                    height: 59.5.w,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 7.w),
                          child: Row(
                            children: [
                              Text(
                                "PREPARATION",
                                style: 16.w4(
                                  color: AppColors.c000000,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldMedium,
                                ),
                              ),
                              12.5.hGap,
                              AnimatedNum(
                                  number: (trainingInfo.playerReadiness * 100)
                                      .toInt(),
                                  textStyle: 16
                                      .w4(color: AppColors.c000000, height: 1)),
                              Text(
                                "%",
                                style:
                                    16.w4(color: AppColors.c000000, height: 1),
                              ),
                              const Expanded(child: SizedBox.shrink()),
                              MtInkwell(
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "DETAIL",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        decoration: TextDecoration.underline,
                                        // textBaseline: TextBaseline.ideographic,
                                        color: AppColors.c000000,
                                        height: 1,
                                        fontFamily: FontFamily.fRobotoMedium,
                                      ),
                                    ),
                                    6.hGap,
                                    IconWidget(
                                      iconWidth: 9.w,
                                      icon: Assets.iconUiIconArrows04,
                                      rotateAngle: -90,
                                      iconColor: Colors.black,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        8.vGap,
                        OutLineProgressWidget(
                            width: 331.w,
                            height: 14.w,
                            progress: trainingInfo.playerReadiness,
                            progressColor: Utils.getProgressColor(
                                trainingInfo.playerReadiness * 100)),
                      ],
                    ),
                  ),
                  const TrainingTactics()
                ],
              ),
            ),
          );
        });
  }
}
