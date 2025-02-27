import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/animated_number.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';

class MoneyInfoWidget extends GetView<TeamGiftController> {
  const MoneyInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 58.h,
        right: 16.w,
        child: Row(
          children: [
            IconWidget(iconWidth: 17.w, icon: Assets.commonUiCommonIconCurrency02),
            2.hGap,
            AnimatedNum(
              number: controller.userEntiry.teamLoginInfo!.getCoin().toInt(),
              textStyle: 12.w4(color: AppColors.cF2F2F2, height: 1, fontFamily: FontFamily.fOswaldRegular),
            ),
            10.hGap,
            IconWidget(iconWidth: 20.w, icon: Assets.teamUiMoney02),
            2.hGap,
            AnimatedNum(
              number: controller.userEntiry.teamLoginInfo!.getMoney().toInt(),
              isMoney: true,
              milliseconds: 1000,
              textStyle: 12.w4(color: AppColors.cF2F2F2, height: 1, fontFamily: FontFamily.fOswaldRegular),
            )
          ],
        ));
  }
}
