import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
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
              height: 75.w,
              width: double.infinity,
              alignment: Alignment.center,
              // padding: EdgeInsets.symmetric(vertical: 20.w),
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
                            AnimatedNum(
                                number: (trainingInfo.playerReadiness * 100)
                                    .toInt(),
                                textStyle:
                                    19.w4(color: AppColors.c000000, height: 1)),
                            Text(
                              "%",
                              style: 19.w4(color: AppColors.c000000, height: 1),
                            ),
                            7.hGap,
                          ],
                        ),
                        8.vGap,
                        Stack(
                          children: [
                            Container(
                              width: 297.w,
                              height: 14.w,
                              alignment: Alignment.centerLeft,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.w),
                                border: Border.all(
                                  width: 1.w,
                                  color: AppColors.cD1D1D1,
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 297.w * trainingInfo.playerReadiness,
                              height: 14.w,
                              constraints: BoxConstraints(maxWidth: 297.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.w),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.c000000,
                                    Utils.getProgressColor(
                                        trainingInfo.playerReadiness * 100),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
        });
  }
}
