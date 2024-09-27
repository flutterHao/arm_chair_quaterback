/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-11 17:45:52
 * @LastEditTime: 2024-09-27 10:57:07
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

/// author: lihonghao
/// date: 2024/9/11
/// 边框容器
class BorderContainer extends StatelessWidget {
  const BorderContainer(
      {super.key,
      this.width,
      required this.height,
      this.borderColor = AppColors.cB3B3B3,
      required this.child,
      this.padding,
      this.borderRadius});
  final double? width;
  final double height;
  final Color borderColor;
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
        border: Border.all(width: 1, color: borderColor),
      ),
      child: child,
    );
  }
}
