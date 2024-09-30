import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/border_container.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/linear_progress_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/my_team_list.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/recover_confirm_button.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/recover_dialog.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LineUpTab extends GetView<TeamTrainingController> {
  const LineUpTab({super.key});

  Widget _blackContainer({required double width, required Widget child}) {
    return Container(
      width: width,
      height: 70.w,
      padding: EdgeInsets.only(top: 11.w, left: 9.w, right: 9.w),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              12.vGap,

              ///头部卡片
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _blackContainer(
                      width: 70.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "199%",
                            style: 19.w7(color: AppColors.cF2F2F2, height: 1),
                          ),
                          22.vGap,
                          Text(
                            "OVR",
                            style: 12.w4(height: 1, color: AppColors.c666666),
                          ),
                        ],
                      )),
                  4.hGap,
                  _blackContainer(
                    width: 109.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("999k",
                                  style: 19
                                      .w4(color: AppColors.cF2F2F2, height: 1)),
                              SizedBox(height: 4.h),
                              Text("/999k",
                                  style: 10
                                      .w4(color: AppColors.cF2F2F2, height: 1)),
                            ]),
                        SizedBox(height: 6.h),
                        CustomLinearProgressBar(width: 91.w, progress: 0.8),
                        12.vGap,
                        Text(
                          "SALARY",
                          style: 12.w4(height: 1, color: AppColors.c666666),
                        ),
                      ],
                    ),
                  ),
                  4.hGap,
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: Get.context!,
                          builder: (context) {
                            return const RecoverDialog();
                          });
                    },
                    child: _blackContainer(
                        width: 156.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("99%",
                                      style: 19.w4(
                                          color: AppColors.cF2F2F2, height: 1)),
                                  4.hGap,
                                  Text("Team Rest",
                                      style: 10.w4(
                                          color: AppColors.cF2F2F2, height: 1)),
                                  Text(
                                      DateUtil.formatDateStr(
                                          DateUtil.getNowDateStr(),
                                          format: DateFormats.h_m_s),
                                      style: 10.w4(
                                          color: AppColors.c10A86A, height: 1)),
                                ]),
                            SizedBox(height: 6.h),
                            CustomLinearProgressBar(
                              width: 138.w,
                              progress: 0.8,
                              progressColor: AppColors.cE72646,
                            ),
                            SizedBox(height: 5.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "TEAM condition",
                                    style: 12.w4(
                                        height: 1, color: AppColors.c666666),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                8.hGap,
                                BorderContainer(
                                  height: 22.w,
                                  width: 22.w,
                                  borderColor: AppColors.cB3B3B3,
                                  child: IconWidget(
                                    iconWidth: 11.w,
                                    icon: Assets.uiIconPlusPng,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
              SizedBox(height: 25.h),

              ///球员列表
              Row(
                children: [
                  16.hGap,
                  Text(
                    "Main",
                    style: 19.w7(color: AppColors.cF1F1F1),
                  ),
                  8.hGap,
                  Text(
                    "expend more stamina",
                    style: 10.w7(color: AppColors.cB3B3B3),
                  ),
                ],
              ),
              const MainPlayerList(),
              8.vGap,
              Row(
                children: [
                  16.hGap,
                  Text(
                    "Substitute",
                    style: 19.w7(color: AppColors.cF1F1F1),
                  ),
                  8.hGap,
                  Text(
                    "expend less stamina",
                    style: 10.w7(color: AppColors.cB3B3B3),
                  ),
                ],
              ),
              const SubPlayerList(),
            ],
          ),
        ),
        Obx(() {
          return AnimatedPositioned(
              bottom: controller.isRecovering.value ? 25.w : -50.w,
              duration: const Duration(milliseconds: 300),
              child: const RecoverConfirmButton());
        })
      ],
    );
  }
}
