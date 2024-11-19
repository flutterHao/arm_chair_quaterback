import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/11/19/16:30

class SupportPercentProgressWidget extends StatelessWidget {
  const SupportPercentProgressWidget(
      {super.key, required this.leftPercent, required this.rightPercent});

  final int leftPercent;
  final int rightPercent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9.w),
      child: Row(
        children: [
          if (leftPercent != 0)
            Expanded(
                flex: leftPercent,
                child: Container(
                  height: 18.w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.c000000,
                      border: Border(
                          right: BorderSide(
                              color: AppColors.cFFFFFF,
                              width: leftPercent == 100 ? 0 : 1))),
                )),
          if (rightPercent != 0)
            Expanded(
                flex: rightPercent,
                child: Container(
                  height: 18.w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.cB3B3B3,
                      border: Border(
                          left: BorderSide(
                              color: AppColors.cFFFFFF,
                              width: rightPercent == 100 ? 0 : 1))),
                )),
        ],
      ),
    );
  }
}
