/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-29 16:06:50
 * @LastEditTime: 2024-12-12 14:44:02
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddBallDialog extends GetView<TrainingController> {
  const AddBallDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: "ADD BALL",
        backgroudColor: AppColors.c262626,
        // image: Assets.uiWindowsStaminaPng,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            50.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconWidget(iconWidth: 30.w, icon: Assets.newsUiIconBall),
                5.hGap,
                Text(
                  "x1",
                  style: 20.w7(color: AppColors.c262626),
                ),
              ],
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
                5.hGap,
                Text(
                  "1",
                  style: 14.w7(color: AppColors.c262626),
                ),
              ],
            ),
            9.vGap,
          ],
        ),
        onTap: () {
          // controller.buyTrainingBall(10);
          Navigator.pop(context, true);
        });
  }
}
