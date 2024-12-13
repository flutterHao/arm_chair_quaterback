import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/11/19/16:30

class SupportPercentProgressWidget extends StatelessWidget {
  const SupportPercentProgressWidget(
      {super.key,
      required this.leftPercent,
      required this.rightPercent,
      this.leftColor,
      this.rightColor,this.height,});

  final int leftPercent;
  final Color? leftColor;
  final int rightPercent;
  final Color? rightColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,c) {
        var width = c.maxWidth;
        return ClipRRect(
          borderRadius: BorderRadius.circular(9.w),
          child: SizedBox(
            width: width,
            height: height??18.w,
            child: Stack(
              children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: -width + width * min(100,leftPercent) / 100,
                    child: Container(
                      height: height??18.w,
                      width: width,
                      decoration: BoxDecoration(
                          color: leftColor??AppColors.c000000,
                          border: Border(
                              right: BorderSide(
                                  color: AppColors.cFFFFFF,
                                  width: leftPercent == 100 ? 0 : 1))),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    right: -width + width * min(100,rightPercent) / 100,
                    child: Container(
                      height: height??18.w,
                      width: width,
                      decoration: BoxDecoration(
                          color: rightColor??AppColors.cB3B3B3,
                          border: Border(
                              left: BorderSide(
                                  color: AppColors.cFFFFFF,
                                  width: rightPercent == 100 ? 0 : 1))),
                    ),
                  ),
              ],
            ),
          ),
        );
      }
    );
  }
}
