/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-10 14:39:42
 * @LastEditTime: 2024-09-26 20:23:54
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color backgroudColor;
  final Color? shadowColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const CustomContainer(
      {super.key,
      this.width,
      this.height,
      this.backgroudColor = AppColors.cF1F1F1,
      this.shadowColor,
      required this.child,
      this.borderRadius,
      this.margin,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroudColor,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: shadowColor ?? Colors.grey.withOpacity(0.2),
        //     spreadRadius: 1,
        //     blurRadius: 1,
        //     // offset: Offset(1, 1), // 设置阴影的偏移量
        //   ),
        // ],
      ),
      child: child,
    );
  }
}
