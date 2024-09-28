/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 20:30:20
 * @LastEditTime: 2024-09-27 20:47:55
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

class CustomLinearProgressBar extends StatelessWidget {
  final double progress; // 进度值，0.0到1.0
  final double width; // 宽度
  final double height; // 高度
  final Color? backgroundColor; // 背景颜色
  final Color? progressColor; // 进度颜色

  const CustomLinearProgressBar({
    super.key,
    required this.progress,
    this.width = double.infinity, // 默认填充父容器的宽度
    this.height = 4.0, // 默认高度
    this.backgroundColor, // 默认背景颜色
    this.progressColor, // 默认进度条颜色
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor??AppColors.c666666, // 背景颜色
        borderRadius: BorderRadius.circular(height / 2), // 圆角半径为高度的一半
      ),
      child: Stack(children: [
        Container(
        width: width * progress, // 根据进度计算进度条的宽度
        height: height,
        decoration: BoxDecoration(
          color: progressColor??AppColors.cF2F2F2, // 进度条颜色
          borderRadius: BorderRadius.circular(height / 2), // 圆角
        ),
      )
      ],),
    );
  }
}
