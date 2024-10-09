// import 'package:arm_chair_quaterback/common/style/color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class PieChart extends StatelessWidget {
//   final double progress; // 进度值，范围为 0.0 到 1.0

//   ///TODO
//   const PieChart({super.key, required this.progress});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 7.w, // 宽度
//       height: 7.w, // 高度
//       child: CustomPaint(
//         painter: PieChartPainter(progress: progress),
//       ),
//     );
//   }
// }

// class PieChartPainter extends CustomPainter {
//   final double progress;

//   PieChartPainter({required this.progress});

//   Color _getColor(double progress) {
//     if (progress == 1) {
//       return AppColors.cFF7954;
//     } else if (progress > 0) {
//       return AppColors.cFFFFFF;
//     } else if (progress == 0) {
//       return AppColors.c4D4D4D;
//     } else {
//       return Colors.black;
//     }
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paintBackground = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final paintProgress = Paint()
//       ..color = _getColor(progress)
//       ..style = PaintingStyle.fill;

//     // 绘制背景圆
//     canvas.drawCircle(
//       Offset(size.width / 2, size.height / 2),
//       size.width / 2,
//       paintBackground,
//     );

//     // 绘制进度部分
//     double sweepAngle = 2 * 3.141592653589793 * progress; // 计算扫过的角度
//     canvas.drawArc(
//       Rect.fromCircle(
//           center: Offset(size.width / 2, size.height / 2),
//           radius: size.width / 2),
//       -3.141592653589793 / 2, // 从顶部开始绘制
//       sweepAngle,
//       true,
//       paintProgress,
//     );
//   }

//   @override
//   bool shouldRepaint(PieChartPainter oldDelegate) {
//     return oldDelegate.progress != progress; // 如果进度改变则重绘
//   }
// }
