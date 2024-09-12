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
      required this.child});
  final double? width;
  final double height;
  final Color borderColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height / 2),
        border: Border.all(width: 1, color: borderColor),
      ),
      child: child,
    );
  }
}
