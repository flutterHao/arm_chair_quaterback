/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-09 15:57:09
 * @LastEditTime: 2025-01-09 17:46:38
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class IllustratiionsPage extends GetView<IllustratiionsController> {
  const IllustratiionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IllustratiionsController>(
      init: IllustratiionsController(),
      id: "illustratiions",
      builder: (_) {
        return HorizontalDragBackWidget(
          child: BlackAppWidget(
            const UserInfoBar(),
            bodyWidget: Expanded(
              child: SizedBox(
                height: 133.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 50.w,
                      child: CustomPaint(
                        painter: LevelArcPainter(
                            currentLevel: 2, totalLevels: 15, progress: 0.5),
                        size: Size(500.w, 500.w),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LevelArcPainter extends CustomPainter {
  final int currentLevel;
  final int totalLevels;
  final double progress;

  LevelArcPainter({
    required this.currentLevel,
    required this.totalLevels,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 30;

    // 绘制背景圆弧
    final backgroundPaint = Paint()
      ..color = AppColors.c4F4F4F
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi, false, backgroundPaint);

    // 绘制进度圆弧
    final progressPaint = Paint()
      ..color = AppColors.cFF7954
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final sweepAngle = pi / 2 + 2 * pi / 20 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi,
        sweepAngle, false, progressPaint);

    // 绘制等级文字和圆圈点
    final levelAngle = 2 * pi / totalLevels;
    for (int i = 0; i <= totalLevels; i++) {
      final angle = -pi / 2 + i * levelAngle;
      final point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      // 绘制圆圈点
      final circlePaint = Paint()
        ..color = i == currentLevel ? Colors.white : Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3; // 设置合适的线条宽度
      canvas.drawCircle(point, 5, circlePaint);

      // 绘制等级文字
      final textPainter = TextPainter(
        text: TextSpan(
          text: 'Lv ${i + 1}',
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      // 计算文字旋转角度
      final textAngle = angle + pi / 2; // 文字旋转角度
      final textOffset = Offset(
        center.dx + (radius + 30) * cos(angle),
        center.dy + (radius + 30) * sin(angle),
      );

      canvas.save();
      canvas.translate(textOffset.dx, textOffset.dy);
      canvas.rotate(textAngle);
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
