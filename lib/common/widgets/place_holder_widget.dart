import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/11/26/10:16

class PlaceHolderWidget extends StatelessWidget {
  const PlaceHolderWidget(
      {super.key,
      required this.width,
      required this.child,
      required this.showChild,
      this.height,
      this.borderRadius = BorderRadius.zero,
      this.bgColor = AppColors.ce5e5e5});

  final Widget child;
  final double width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final bool showChild;

  @override
  Widget build(BuildContext context) {
    return showChild ? child:Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius,
      ),
      width: width,
      height: height ?? width,
    );
  }
}
