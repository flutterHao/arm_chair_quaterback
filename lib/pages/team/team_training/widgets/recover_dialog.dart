/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-29 16:06:50
 * @LastEditTime: 2024-09-29 18:18:36
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecoverDialog extends GetView<TeamTrainingController> {
  const RecoverDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: "RECOVED",
        backgroudColor: AppColors.cBBE736,
        image: Assets.uiWindowsStaminaPng,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            50.vGap,
            SizedBox(
              width: 240.w,
              child: Text(
                "Your players will gain condition 1 time every 1h. Do you want to speed up the rest period for your entireteam?",
                maxLines: 4,
                style: 14.w4(color: AppColors.c666666),
              ),
            ),
            46.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cost:",
                  style: 14.w7(color: AppColors.c262626),
                ),
                5.hGap,
                IconWidget(
                  iconWidth: 15.w,
                  icon: Assets.uiIconMoneyBPng,
                  iconColor: AppColors.c262626,
                ),
                5.hGap,
                Text(
                  "100K",
                  style: 14.w7(color: AppColors.c262626),
                ),
              ],
            ),
            9.vGap,
          ],
        ),
        onTap: () {
          controller.isRecovering.value = false;
          controller.update();
        });
  }
}
