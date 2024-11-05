import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/10/14/14:51

class DialogBackground extends StatelessWidget {
  const DialogBackground({
    super.key,
    required this.child,
    this.frontColor = AppColors.cFFFFFF,
    this.backgroundColor = AppColors.cFF7954,
    this.borderHeight,
    this.borderRadius,
  });

  final Color frontColor;
  final Color backgroundColor;
  final Widget child;
  final double? borderHeight;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius ??
                  BorderRadius.vertical(top: Radius.circular(16.w))),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: borderHeight ?? 4.w),
          decoration: BoxDecoration(
              color: frontColor,
              borderRadius: borderRadius ??
                  BorderRadius.vertical(top: Radius.circular(16.w))),
          child: child,
        )
      ],
    );
  }
}
