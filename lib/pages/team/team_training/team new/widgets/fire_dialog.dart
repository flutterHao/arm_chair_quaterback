/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-05 17:46:56
 * @LastEditTime: 2024-12-05 20:31:10
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';

import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FireDialog extends StatefulWidget {
  const FireDialog({super.key, required this.item});
  final TeamPlayerInfoEntity item;

  @override
  State<FireDialog> createState() => _FireDialogState();
}

class _FireDialogState extends State<FireDialog>
    with SingleTickerProviderStateMixin {
  TeamController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 419.w,
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.vertical(top: Radius.circular(9.w))),
      child: Column(
        children: [
          12.vGap,
          Container(
            decoration: BoxDecoration(
                color: AppColors.ccccccc,
                borderRadius: BorderRadius.circular(2.w)),
            height: 4.w,
            width: 44.w,
          ),
          37.vGap,
          IconWidget(
            iconWidth: 61.5.w,
            icon: Assets.commonUiCommonIconSystemDanger,
            iconColor: AppColors.c000000,
          ),
          29.5.vGap,
          Text(
            "ARE YOU SURE",
            style: 27.w4(fontFamily: FontFamily.fOswaldMedium, height: 0.75),
          ),
          11.5.vGap,
          Text(
            "Do you want to fire this player?",
            style: 14.w4(
                fontFamily: FontFamily.fRobotoRegular,
                color: AppColors.c000000),
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
          7.5.vGap,
          MtInkwell(
            onTap: () {
              ctrl.dismissPlayer(widget.item.uuid);
            },
            child: Container(
              height: 51.w,
              width: 343.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.cD60D20,
                  borderRadius: BorderRadius.circular(9.w)),
              child: Text(
                "FIRE",
                style: 23.w5(
                    color: AppColors.cFFFFFF,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
          9.vGap,
          MtInkwell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 51.w,
              width: 343.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.w, color: AppColors.c666666),
                  borderRadius: BorderRadius.circular(9.w)),
              child: Text(
                "CANCEL",
                style: 23.w5(
                    color: AppColors.c000000,
                    height: 1,
                    fontFamily: FontFamily.fOswaldMedium),
              ),
            ),
          ),
          41.vGap,
        ],
      ),
    );
  }
}
