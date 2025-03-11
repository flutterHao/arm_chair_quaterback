import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/team/season_pass/pages/battle_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';

///通行证领取状态按钮
// ignore: must_be_immutable
class ClaimStatusWidget extends StatelessWidget {
  ClaimStatusWidget(this.type, this.level, {super.key});
  late BattleRewardType type;
  late int level;
  final SeasonPassController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Visibility(
            visible: type == BattleRewardType.received,
            child: MtInkWell(
                child: Container(
              width: 60.w,
              height: 40.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.w),
                  border: Border.all(color: AppColors.cE6E6E)),
              child: IconWidget(
                  iconWidth: 21.w,
                  iconColor: AppColors.c10A86A,
                  icon: Assets.commonUiCommonStatusBarMission02),
            ))),
        Visibility(
            visible: type == BattleRewardType.canReceived,
            child: MtInkWell(
                onTap: () => controller.claimLevelReward(level),
                child: Container(
                  width: 59.w,
                  height: 40.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.w),
                      color: AppColors.c000000),
                  child: Text('claim'.toUpperCase(),
                      style: 16.w5(
                          color: Colors.white,
                          fontFamily: FontFamily.fOswaldMedium)),
                ))),
        Spacer()
      ],
    );
  }
}
