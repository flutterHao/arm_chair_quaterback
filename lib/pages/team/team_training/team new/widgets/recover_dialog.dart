/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-29 16:06:50
 * @LastEditTime: 2024-12-13 11:32:06
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/custom_dialog.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecoverDialog extends GetView<TeamController> {
  const RecoverDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomDialog(
        title: "RECOVER",
        desc:
            "Your players will gain condition 1 time every 1h.  Do you want speed up the rest period for your entrire team?",
        content: Column(
          children: [
            IconWidget(
              iconWidth: 129.w,
              icon: Assets.managerUiManagerImageMorale,
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "COST:",
                  style: 16.w4(fontFamily: FontFamily.fOswaldBold),
                ),
                10.hGap,
                Image.asset(
                  Assets.commonUiCommonProp05,
                  width: 24.w,
                ),
                3.hGap,
                Text(
                  "10K",
                  style: 16.w4(fontFamily: FontFamily.fOswaldBold),
                ),
              ],
            ),
          ],
        ),
        onComfirm: () {
          controller.recoverPower(type: 2);
          Navigator.pop(context);
        });
  }
}
