import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2025/1/20/11:17

class AwardWidget extends StatelessWidget {
  const AwardWidget({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 61.w,
        width: 355.w,
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        margin: EdgeInsets.only(bottom: 9.w),
        decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(9.w),
            boxShadow: [
              BoxShadow(
                color: AppColors.c000000.withOpacity(0.2),
                offset: Offset.zero,
                blurRadius: 4.w,
                spreadRadius: 4.w,
              )
            ]
        ),
        child: Row(
          children: [
            IconWidget(iconWidth: 34.w, icon: image),
            16.hGap,
            Text(
              text,
              style: 18.w5(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
