import 'package:arm_chair_quaterback/common/utils/utils.dart';
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
                            borderRadius: BorderRadius.circular(7.w),
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.cD1D1D1,
                            ),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 297.w * trainingInfo.playerReadiness,
                            height: 12.w,
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
                          // child: Stack(
                          //   children: [
                          // AnimatedContainer(
                          //   duration: const Duration(milliseconds: 300),
                          //   width:
                          //       297.w * trainingInfo.playerReadiness * 0.2,
                          //   height: 14.w,
                          //   constraints: BoxConstraints(maxWidth: 297.w),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.horizontal(
                          //         left: Radius.circular(9.w)),
                          //     gradient: LinearGradient(
                          //       colors: [
                          //         AppColors.c333333,
                          //         Utils.getProgressColor(
                          //             trainingInfo.playerReadiness * 100),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // if (trainingInfo.playerReadiness > 1)
                          //   Row(
                          //     children: [
                          //       AnimatedContainer(
                          //         duration:
                          //             const Duration(milliseconds: 300),
                          //         width: 297.w *
                          //             (trainingInfo.playerReadiness - 1),
                          //         height: 14.w,
                          //         constraints:
                          //             BoxConstraints(maxWidth: 297.w),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.horizontal(
                          //               left: Radius.circular(9.w)),
                          //           gradient: const LinearGradient(
                          //             colors: [
                          //               AppColors.c022A1D,
                          //               AppColors.c23E8A9,
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //       if ((trainingInfo.playerReadiness - 1) <
                          //           0.99)
                          //         Container(
                          //           width: 2.w,
                          //           height: 18.w,
                          //           color: AppColors.cFFFFFF,
                          //         )
                          //     ],
                          //   ),
                          //   ],
                          // ),
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
