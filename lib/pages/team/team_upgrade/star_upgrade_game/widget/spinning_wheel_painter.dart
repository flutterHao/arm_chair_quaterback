import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

///
///@auther gejiahui
///created at 2025/2/28/10:38

class SpinningWheelPainter extends CustomPainter {
  final ui.Image? iconImage12;
  final ui.Image? iconImage13;

  SpinningWheelPainter(
      {this.iconImage12, this.iconImage13, required this.rotation});

  final double rotation;
  final List<String> texts = [
    'GREEN',
    'GREEN',
    'BLUE',
    'PURPLE',
    'GREEN',
    'GREEN',
    'BLUE',
    'PURPLE',
    'GREEN',
    'GREEN',
    'BLUE',
    'PURPLE',
  ];

  // 定义12种颜色，每个扇形对应一个颜色
  List<Color> colors = [
    AppColors.c42F3E1,
    AppColors.c1CBEAD,
    AppColors.c378CFF,
    AppColors.cA25EFF,
    AppColors.c4EA5FF,
    AppColors.c1CBEAD,
    AppColors.c378CFF,
    AppColors.cA25EFF,
    AppColors.cC98AFF,
    AppColors.c1CBEAD,
    AppColors.c378CFF,
    AppColors.cA25EFF,
  ];

  List<int> values = [8, 4, 3, 2, 8, 5, 4, 3, 8, 3, 2, 1];

  List<int> bigRewardList = [0, 4, 8];

  List<RadialGradient> bigRewardRadialOuterGradientList = [
    RadialGradient(
      colors: [AppColors.c44EEDC, AppColors.c37D3C3], // 从红色渐变到紫色
      stops: [0.4, 1],
    ),
    RadialGradient(
      colors: [AppColors.c47AFFF, AppColors.c2E87FF], // 从红色渐变到紫色
      stops: [0.4, 1],
    ),
    RadialGradient(
      colors: [AppColors.cC07DFF, AppColors.cA05BFF], // 从红色渐变到紫色
      stops: [0.4, 1],
    ),
  ];

  List<RadialGradient> bigRewardRadialGradientList = [
    RadialGradient(
      colors: [AppColors.c35CBBC, AppColors.c00726E], // 从红色渐变到紫色
      stops: [0.4, 1],
    ),
    RadialGradient(
      colors: [AppColors.c378CFF, AppColors.c113B87], // 从红色渐变到紫色
      stops: [0.4, 1],
    ),
    RadialGradient(
      colors: [AppColors.cA25EFF, AppColors.c5B1CB1], // 从红色渐变到紫色
      stops: [0.4, 1],
    ),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.c000000;
    double radius = size.width / 2;
    double angleStep = 2 * pi / 12; // 每块的角度 30 度

    // 画圆盘背景
    var center = Offset(radius, radius);
    canvas.drawCircle(center, radius, paint);

    // 画白色外圈
    paint.color = AppColors.cFFFFFF;
    canvas.drawCircle(center, radius - 3.w, paint);
    // 画黑色内圈
    paint.color = AppColors.c000000;
    canvas.drawCircle(center, radius - 10.w, paint);

    TextStyle textStyle;
    TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // 创建画笔
    paint.style = PaintingStyle.fill; // 填充样式

    double initAngle = -90;
    double radius2 = radius - 13.w;
    // 绘制12个扇形，起始角度为-90°
    for (int i = 0; i < 12; i++) {
      // 每个扇形起始角度，从-90°开始，逐渐增加
      double startAngle = (initAngle + (i * 30)) * pi / 180; // 每个扇形30度

      // 设置扇形的颜色
      paint.color = colors[i];

      // 绘制每个背景色扇形，注意，useCenter为true表示扇形的两端连接到圆心
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius2),
        startAngle,
        30 * pi / 180, // 扇形的角度 30度
        true, // 使用圆心，形成扇形
        paint,
      );

      // 设置扇形的颜色
      paint.color = AppColors.cDADADA;

      // 绘制每个灰色扇形，注意，useCenter为true表示扇形的两端连接到圆心
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius2 - 7.w),
        startAngle,
        30 * pi / 180, // 扇形的角度 30度
        true, // 使用圆心，形成扇形
        paint,
      );

      // 绘制分隔线，避免最后一条分隔线重复
      if (i < 11) {
        // 不绘制最后一个分隔线
        Paint linePaint = Paint()
          ..color = Colors.black // 分隔线颜色
          ..strokeWidth = 4.w; // 分隔线宽度

        // 计算分隔线的结束点（圆弧边缘）
        double endAngle = startAngle + 30 * pi / 180; // 每个分隔线对应30度
        double endX = center.dx + radius2 * cos(endAngle);
        double endY = center.dy + radius2 * sin(endAngle);

        // 绘制分隔线
        canvas.drawLine(center, Offset(endX, endY), linePaint);
      }
    }

    // 最后一根分隔线需要特别绘制，因为它连接第12个扇形与第一个扇形
    Paint linePaint = Paint()
      ..color = Colors.black // 分隔线颜色
      ..strokeWidth = 4.w; // 分隔线宽度

    // 计算最后一根分隔线的结束位置
    double lastEndAngle = (initAngle + (11 * 30) + 30) * pi / 180;
    double lastEndX = center.dx + radius2 * cos(lastEndAngle);
    double lastEndY = center.dy + radius2 * sin(lastEndAngle);

    // 绘制最后一根分隔线
    canvas.drawLine(center, Offset(lastEndX, lastEndY), linePaint);

    for (int i = 0; i < texts.length; i++) {
      // 每个扇形起始角度，从-90°开始，逐渐增加
      double startAngle = (initAngle + (i * 30)) * pi / 180; // 每个扇形30度

      if (bigRewardList.contains(i)) {
        // 计算扇形路径
        Path sectorPath = Path()
          ..moveTo(center.dx, center.dy)
          ..arcTo(
            Rect.fromCircle(center: center, radius: radius),
            startAngle,
            30 * pi / 180, // 扇形的角度 30度
            false,
          )
          ..close();
        // 阴影
        canvas.drawShadow(sectorPath, Colors.black, 10.w, true);

        //边框
        paint.color = colors[i];
        paint.style = PaintingStyle.stroke;
        paint.strokeWidth = 4.w;
        paint.shader = bigRewardRadialOuterGradientList[i ~/ 4]
            .createShader(
            Rect.fromCircle(center: center, radius: radius2 - 7.w));

        // 绘制每个大奖外扇形，注意，useCenter为true表示扇形的两端连接到圆心
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          30 * pi / 180, // 扇形的角度 30度
          true, // 使用圆心，形成扇形
          paint,
        );

        // 填充颜色
        paint.color = colors[i];
        paint.style = PaintingStyle.fill;
        paint.shader = bigRewardRadialOuterGradientList[i ~/ 4]
            .createShader(
            Rect.fromCircle(center: center, radius: radius2 - 7.w));

        // 绘制每个大奖外扇形，注意，useCenter为true表示扇形的两端连接到圆心
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          30 * pi / 180, // 扇形的角度 30度
          true, // 使用圆心，形成扇形
          paint,
        );

        // 设置内扇形的颜色
        paint.color = AppColors.c10A86A;
        paint.style = PaintingStyle.fill;
        paint.shader = bigRewardRadialGradientList[i ~/ 4]
            .createShader(
            Rect.fromCircle(center: center, radius: radius2 - 7.w));

        // 绘制每个大奖内扇形
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius2 - 7.w),
          startAngle,
          30 * pi / 180, // 扇形的角度 30度
          true, // 使用圆心，形成扇形
          paint,
        );
      }

      ui.Image? iconImage;
      if (!bigRewardList.contains(i)) {
        iconImage = iconImage13;
      } else {
        iconImage = iconImage12;
      }
      // 绘制小图标
      if (iconImage != null) {
        // 计算图标位置
        double iconOffset = 0.w; // 控制图标离圆心的距离（适当调节）

        double iconX = center.dx +
            (radius - 6.w + iconOffset) * cos(startAngle + 30 * pi / 180 / 2);
        double iconY = center.dy +
            (radius - 6.w + iconOffset) * sin(startAngle + 30 * pi / 180 / 2);
        double iconSize = 8.w; // 图标大小
        Rect src = Rect.fromLTWH(
            0, 0, iconImage.width.toDouble(), iconImage.height.toDouble());
        Rect dst = Rect.fromCenter(
            center: Offset(iconX, iconY), width: iconSize, height: iconSize);
        canvas.drawImageRect(iconImage, src, dst, Paint());
      }
    }

    // 偏移的距离 (接近圆心)
    double offsetFromCenter = 145.w; // 控制文字离圆心的距离，数值越小越接近圆心
    // 绘制每个文字
    for (int i = 0; i < texts.length; i++) {
      String text = texts[i];

      // 计算每个文字的角度，调整起始角度使得第一个文字在 Y 轴上
      double angle = (i * angleStep) + (angleStep / 2) + rotation - pi / 2;

      // 设置文字样式
      textStyle = 15.w5(
        color: colors[i],
        fontFamily: FontFamily.fOswaldMedium,
      );
      // 计算文字的大小
      textPainter.text = TextSpan(text: text, style: textStyle);
      textPainter.layout();

      // 计算文字的坐标（圆弧上的位置），修改半径为偏移量
      double x = radius + offsetFromCenter * cos(angle);
      double y = radius + offsetFromCenter * sin(angle);

      // 文字偏移量，调整文字位置使其居中
      double dx = x - textPainter.width / 2;
      double dy = y - textPainter.height / 2;

      // 文字的旋转，使其始终保持垂直于转盘
      double textAngle = angle + pi / 2;
      canvas.save();
      canvas.translate(dx + textPainter.width / 2, dy + textPainter.height / 2);
      canvas.rotate(textAngle);
      canvas.translate(-textPainter.width / 2, -textPainter.height / 2);

      textPainter.paint(canvas, Offset(0, 0));

      canvas.restore();
    }

    // 偏移的距离 (接近圆心)
    double offsetFromCenter2 = 115.w; // 控制文字离圆心的距离，数值越小越接近圆心

    // 绘制每个数字
    for (int i = 0; i < texts.length; i++) {
      String text = "+${values[i]}";

      // 计算每个文字的角度，调整起始角度使得第一个文字在 Y 轴上
      double angle = (i * angleStep) + (angleStep / 2) + rotation - pi / 2;

      // 设置文字样式
      textStyle = 31.w5(
        color:
            bigRewardList.contains(i) ? AppColors.cFFFFFF : AppColors.c000000,
        fontFamily: FontFamily.fOswaldMedium,
      );
      // 计算文字的大小
      textPainter.text = TextSpan(text: text, style: textStyle);
      textPainter.layout();

      // 计算文字的坐标（圆弧上的位置），修改半径为偏移量
      double x = radius + offsetFromCenter2 * cos(angle);
      double y = radius + offsetFromCenter2 * sin(angle);

      // 文字偏移量，调整文字位置使其居中
      double dx = x - textPainter.width / 2;
      double dy = y - textPainter.height / 2;

      // 文字的旋转，使其始终保持垂直于转盘
      double textAngle = angle + pi / 2;
      canvas.save();
      canvas.translate(dx + textPainter.width / 2, dy + textPainter.height / 2);
      canvas.rotate(textAngle);
      canvas.translate(-textPainter.width / 2, -textPainter.height / 2);

      textPainter.paint(canvas, Offset(0, 0));

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
