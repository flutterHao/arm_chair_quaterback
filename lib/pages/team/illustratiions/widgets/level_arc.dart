import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// class LevelWidget extends StatelessWidget {
//   const LevelWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 133.w,
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//             AppColors.c333333,
//             AppColors.c1A1A1A,
//           ])),
//       child: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           Positioned(
//             top: 14.w,
//             child: CustomPaint(
//               painter: LevelArcPainter(currentLevel: 4, progress: 0.5),
//               size: Size(871.w, 871.w),
//             ),
//           ),
//           Positioned(
//             top: 62.5.w,
//             child: Text(
//               "1250/2000",
//               style: 14.w4(
//                   fontFamily: FontFamily.fRobotoRegular,
//                   color: AppColors.cFFFFFF,
//                   height: 0.8),
//             ),
//           ),
//           Positioned(
//             top: 93.5.w,
//             child: Row(
//               children: [
//                 Text(
//                   "SALARY CAP",
//                   style: 19.w4(
//                       fontFamily: FontFamily.fOswaldMedium,
//                       color: AppColors.cFFFFFF,
//                       height: 0.8),
//                 ),
//                 13.5.hGap,
//                 Text(
//                   "999K",
//                   style: 19.w4(
//                       fontFamily: FontFamily.fOswaldMedium,
//                       color: AppColors.cFFFFFF,
//                       height: 0.8),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class LevelWidget extends StatelessWidget {
  const LevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IllustratiionsController>(
        id: "progress",
        builder: (ctrl) {
          var info = ctrl.playerCollectEntity.teamBookPlayerCollect;
          return InkWell(
            onTap: () {
              // a += 0.1;
              int newLevel = ctrl.currentLevel + 1;
              ctrl.updateProgress(newLevel, info.exp / info.needExp);
            },
            child: Container(
              width: double.infinity,
              height: 133.w,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.c333333,
                    AppColors.c1A1A1A,
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: 14.w,
                    child: AnimatedBuilder(
                      animation: ctrl.progressAnimation,
                      builder: (context, child) {
                        return AnimatedRotation(
                          duration: ctrl.rotateDuration,
                          turns: ctrl.rotateAngle,
                          curve: Curves.linear,
                          alignment: Alignment.center,
                          onEnd: () {
                            // 示例：动画结束时，更新进度
                            // updateProgress(_progressAnimation.value);
                          },
                          child: CustomPaint(
                            painter: LevelArcPainter(
                              currentLevel: ctrl.currentLevel,
                              progress: ctrl.progressAnimation.value,
                            ),
                            size: Size(871.w, 871.w),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 62.5.w,
                    child: Text(
                      "${info.exp}/${info.needExp}",
                      style: 14.w4(
                        fontFamily: FontFamily.fRobotoRegular,
                        color: AppColors.cFFFFFF,
                        height: 0.8,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 93.5.w,
                    child: Row(
                      children: [
                        Text(
                          "SALARY CAP",
                          style: 19.w4(
                            fontFamily: FontFamily.fOswaldMedium,
                            color: AppColors.cFFFFFF,
                            height: 0.8,
                          ),
                        ),
                        13.5.hGap,
                        Text(
                          Utils.formatMoney(info.addSalaryCap),
                          style: 19.w4(
                            fontFamily: FontFamily.fOswaldMedium,
                            color: AppColors.cFFFFFF,
                            height: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class LevelArcPainter extends CustomPainter {
  final int currentLevel;
  final double progress;

  LevelArcPainter({
    required this.currentLevel,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // int device = 15;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 30.w;
    const levelAngle = 2 * pi * 10 / 360;

    // 绘制背景圆弧
    final backgroundPaint = Paint()
      ..color = AppColors.c4F4F4F
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.w;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        2 * pi, false, backgroundPaint);

    // 当前右边绘制进度圆弧
    final progressPaint = Paint()
      ..color = AppColors.cFF7954
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.w;
    final sweepAngle = levelAngle * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi * 3 / 2,
        sweepAngle, false, progressPaint);

    // 当前左边绘制进度圆弧
    final sweepAngle1 = -levelAngle * (currentLevel);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi * 3 / 2,
        sweepAngle1, false, progressPaint);

    ///----------------右边-------------------------
    // 绘制等级文字和圆圈点
    for (int i = 0; i <= 10; i++) {
      final angle = -pi / 2 + i * levelAngle;
      final point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      // 绘制圆圈点
      final circlePaint = Paint()
        ..color = i == 0 ? Colors.white : Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3; // 设置合适的线条宽度
      canvas.drawCircle(point, 5, circlePaint);

      // 绘制圆圈点
      final circlePaint1 = Paint()
        ..color = i == 0 ? AppColors.cFF7954 : Colors.transparent
        ..style = PaintingStyle.fill
        ..strokeWidth = 4; // 设置合适的线条宽度
      canvas.drawCircle(point, 4, circlePaint1);

      // 绘制等级文字
      final textPainter = TextPainter(
        text: TextSpan(
          text: 'Lv${currentLevel + i}',
          style: TextStyle(
            color: i == 0 ? Colors.white : AppColors.c666666,
            fontSize: i == 0 ? 22.spMin : 16.spMin,
            fontFamily: FontFamily.fOswaldRegular,
            height: 1,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      // 计算文字旋转角度
      final textAngle = angle + pi / 2; // 文字旋转角度
      final textOffset = Offset(
        center.dx - textPainter.width / 2 + (radius + 30) * cos(angle),
        center.dy + (radius + 30) * sin(angle),
        // center.dx - 10 + (size.width / 2) * cos(angle),
        // center.dy + (size.height / 2 - 5.w) * sin(angle),
      );

      canvas.save();
      canvas.translate(textOffset.dx, textOffset.dy);
      canvas.rotate(textAngle);
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }

    ///----------------左边-------------------------
    for (int i = 1; i <= currentLevel; i++) {
      final angle = -pi / 2 - (i) * levelAngle;
      final point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      // 绘制背景圆
      final backgroundPaint = Paint()
        ..color =
            currentLevel >= i ? AppColors.cFF7954 : Colors.transparent // 设置背景颜色
        ..style = PaintingStyle.fill;
      canvas.drawCircle(point, 5, backgroundPaint);

// 绘制圆圈点
      final circlePaint = Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3; // 设置合适的线条宽度
      canvas.drawCircle(point, 5, circlePaint);

      // 绘制等级文字
      final textPainter = TextPainter(
        text: TextSpan(
          text: 'Lv${currentLevel - i}',
          style: TextStyle(
            color: AppColors.c666666,
            fontSize: 16.sp,
            height: 1,
            fontFamily: FontFamily.fOswaldRegular,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      // 计算文字旋转角度
      final textAngle = angle + pi / 2;
      //位置
      final textOffset = Offset(
        center.dx - textPainter.width / 2 + (size.width / 2) * cos(angle),
        center.dy + (size.height / 2 - 5.w) * sin(angle),
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
