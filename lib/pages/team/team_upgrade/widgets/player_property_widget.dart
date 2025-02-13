import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/12/24/14:30

class PlayerPropertyWidget extends StatelessWidget {
  const PlayerPropertyWidget(
      {super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return _buildProperty(title, value);
  }

  Container _buildProperty(String title, String value) {
    return Container(
      height: 29.w,
      // width: 55.w,
      constraints: BoxConstraints(minWidth: 55.w),
      margin: EdgeInsets.only(right: 4.w),
      padding: EdgeInsets.only(left: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        border: Border.all(width: 1.w, color: AppColors.cE6E6E),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: 8.w4(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fRobotoRegular),
          ),
          3.vGap,
          Text(
            value,
            style: 12.w5(
                color: AppColors.c010101,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium),
          )
        ],
      ),
    );
  }
}
