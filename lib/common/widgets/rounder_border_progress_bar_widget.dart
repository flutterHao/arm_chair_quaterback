///
///@auther gejiahui
///created at 2025/1/20/18:45

import 'dart:math';
import 'dart:ui';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';


class RoundedBorderProgressBar extends StatelessWidget {
  final double progress; // 进度值 (0.0 ~ 1.0)
  final double strokeWidth; // 边框宽度
  final Color progressColor; // 进度颜色
  final Color backgroundColor; // 背景颜色
  final double borderRadius; // 圆角半径
  final Widget child;

  const RoundedBorderProgressBar({
    super.key,
    required this.progress,
    this.strokeWidth = 8.0,
    this.progressColor = AppColors.cFF7954,
    this.backgroundColor = AppColors.cF2F2F2,
    this.borderRadius = 12.0, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RoundedBorderProgressPainter(
        progress: progress,
        strokeWidth: strokeWidth,
        progressColor: progressColor,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: Container(
        margin: EdgeInsets.all(strokeWidth), // 内容与边框间距
        child: child,
      ),
    );
  }
}

class _RoundedBorderProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;
  final double borderRadius;

  _RoundedBorderProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.progressColor,
    required this.backgroundColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 定义圆角矩形区域
    RRect rRect = RRect.fromRectAndRadius(
      Offset.zero & size, // 容器的大小
      Radius.circular(borderRadius), // 圆角半径
    );

    // 背景边框
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(
      rRect.deflate(strokeWidth / 2), // 确保边框在区域内
      backgroundPaint,
    );

    // 进度边框
    Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // 设置圆头效果

    // 计算总路径长度（四边路径）
    Path path = Path()..addRRect(rRect.deflate(strokeWidth / 2));
    PathMetric pathMetric = path.computeMetrics().first;

    // 根据进度提取路径
    double totalLength = pathMetric.length;
    Path extractPath = pathMetric.extractPath(0, totalLength * progress);


    canvas.drawPath(extractPath, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}





