/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 18:34:12
 * @LastEditTime: 2024-09-28 17:49:46
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PieChart extends StatelessWidget {
  final double progress; // 进度值，范围为 0.0 到 1.0

  const PieChart({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 7.w, // 宽度
      height: 7.w, // 高度
      child: CustomPaint(
        painter: PieChartPainter(progress: progress),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final double progress;

  PieChartPainter({required this.progress});

  Color _getColor(double progress) {
    if (progress >= 1.0) {
      return AppColors.cFF7954; // 100% 进度颜色
    } else if (progress > 0) {
      return Colors.white; // 0 < progress < 1 颜色
    } else if (progress == 0) {
      return AppColors.c4D4D4D; // 0% 进度颜色
    } else {
      return AppColors.c262626;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..color = AppColors.c4D4D4D // 背景颜色
      ..style = PaintingStyle.fill;

    final paintProgress = Paint()
      ..color = _getColor(progress) // 进度颜色
      ..style = PaintingStyle.fill;

    // 绘制背景圆 (未完成部分)
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paintBackground,
    );

    // 限制 progress 范围在 [0, 1]
    double clampedProgress = progress.clamp(0.0, 1.0);

    // 计算扇形扫过的角度，2π表示完整圆，乘以 clampedProgress 来确定进度扇形区域
    double sweepAngle = 2 * 3.141592653589793 * clampedProgress;

    // 绘制进度扇形区域
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
      -3.141592653589793 / 2, // 从顶部开始绘制（-π/2 表示顶部的 12 点方向）
      sweepAngle, // 根据进度值计算的扫过角度
      true, // true 表示绘制为扇形区域
      paintProgress,
    );
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) {
    return oldDelegate.progress != progress; // 如果进度改变则重绘
  }
}
