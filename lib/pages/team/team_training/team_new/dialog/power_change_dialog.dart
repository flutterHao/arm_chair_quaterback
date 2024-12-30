/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-12 20:02:41
 * @LastEditTime: 2024-12-13 10:01:00
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PowerChangeDialog extends StatelessWidget {
  const PowerChangeDialog(this.newValue, this.oldValue, {super.key});
  final int newValue;
  final int oldValue;

  @override
  Widget build(BuildContext context) {
    int change = newValue - oldValue;
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 57.w,
              height: 64.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: AppColors.c262626),
            ),
            Positioned(
              bottom: 21.5.w,
              child: IconWidget(
                  iconWidth: 34.5.w, icon: Assets.commonUiCommonIconCombat),
            ),
            Positioned(
              bottom: 26.5.w,
              right: 3.5.w,
              child: IconWidget(
                  iconWidth: 18.5.w,
                  icon: change > 0
                      ? Assets.commonUiCommonIconElevate01
                      : Assets.commonUiCommonIconElevate02),
            ),
            Positioned(
                bottom: 4.5.w,
                child: Text(
                  change > 0 ? "+$change" : "$change",
                  style: 14.w4(
                    fontFamily: FontFamily.fOswaldMedium,
                    color: change > 0 ? AppColors.c40F093 : AppColors.cFF004E,
                  ),
                )),
          ],
        ),
        SizedBox(width: 14.5.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "power boost".toUpperCase(),
              style: 19.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fOswaldRegular),
            ),
            10.vGap,
            Row(
              children: [
                Text(
                  "$oldValue",
                  style: 12.w4(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fRobotoMedium),
                ),
                10.5.hGap,
                Container(
                  width: 15.w,
                  height: 11.5.w,
                  // color: Colors.red,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        left: 0,
                        child: IconWidget(
                          iconWidth: 11.w,
                          // iconHeight: 11.w,
                          icon: Assets.iconUiIconArrows04,
                          rotateAngle: -90,
                          iconColor: AppColors.c000000.withOpacity(0.5),
                        ),
                      ),
                      Positioned(
                        left: 6.w,
                        child: IconWidget(
                          iconHeight: 6.5.w,
                          iconWidth: 11.5.w,
                          icon: Assets.iconUiIconArrows04,
                          rotateAngle: -90,
                          iconColor: AppColors.c000000,
                        ),
                      )
                    ],
                  ),
                ),
                10.5.hGap,
                Text(
                  "$newValue",
                  style: 12.w4(
                      color: AppColors.c000000,
                      height: 1,
                      fontFamily: FontFamily.fRobotoMedium),
                ),
                6.hGap,
                IconWidget(
                  iconWidth: 5.5.w,
                  // iconHeight: 5.5.w,
                  icon: Assets.commonUiCommonIconSystemArrow,
                  rotateAngle: change > 0 ? -90 : 90,
                  iconColor: AppColors.c000000,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
