import 'dart:math';

import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/9/18/16:53

class AnimationArcWidget extends StatefulWidget {
  const AnimationArcWidget(
    this.radius, {
    super.key,
    this.progressWidth = 2.0,
    this.progressColor = Colors.blue,
    this.startAngle = 180,
    this.progressSweepAngle = 90,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.duration = const Duration(milliseconds: 700),
  });

  /// 半径
  final double radius;

  /// 进度宽度
  final double progressWidth;

  /// 进度颜色
  final Color progressColor;

  /// 开始角度
  final double startAngle;

  /// 间隔角度
  final double progressSweepAngle;

  /// 圆环背景色
  final Color borderColor;

  /// 背景圆环宽度
  final double borderWidth;

  /// 动画时间
  final Duration duration;

  @override
  State<AnimationArcWidget> createState() => _AnimationArcWidgetState();
}

class _AnimationArcWidgetState extends State<AnimationArcWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..addListener(() {
            setState(() {});
          });
    _animation = Tween(begin: 0.0, end: 180.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ArcWidget(widget.radius,
        progressWidth: widget.progressWidth,
        progressColor: widget.progressColor,
        startAngle: widget.startAngle,
        progressSweepAngle: widget.progressSweepAngle,
        borderColor: widget.borderColor,
        borderWidth: widget.borderWidth,
        borderSweepAngle: _animation.value);
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class ArcWidget extends StatelessWidget {
  const ArcWidget(this.radius,
      {super.key,
      this.progressWidth = 2.0,
      this.progressColor = Colors.blue,
      this.startAngle = 180,
      this.progressSweepAngle = 90,
      this.borderColor = Colors.grey,
      this.borderWidth = 1.0,
      this.borderSweepAngle = 180});

  /// 半径
  final double radius;

  /// 进度宽度
  final double progressWidth;

  /// 进度颜色
  final Color progressColor;

  /// 开始角度
  final double startAngle;

  /// 间隔角度
  final double progressSweepAngle;

  /// 圆环背景色
  final Color borderColor;

  /// 背景圆环宽度
  final double borderWidth;

  /// 背景角度
  final double borderSweepAngle;

  @override
  Widget build(BuildContext context) {
    double p = progressSweepAngle>180?180:progressSweepAngle;
    return CustomPaint(
      size: Size(radius * 2, radius),
      painter: ArcPainter(progressWidth, progressColor, startAngle,
          p, borderColor, borderWidth, borderSweepAngle),
    );
  }
}

class ArcPainter extends CustomPainter {
  /// 进度宽度
  final double progressWidth;

  /// 进度颜色
  final Color progressColor;

  /// 开始角度
  final double startAngle;

  /// 间隔角度
  final double sweepAngle;

  /// 圆环背景色
  final Color borderColor;

  /// 背景圆环宽度
  final double borderWidth;

  /// 背景角度
  final double borderSweepAngle;

  ArcPainter(
      this.progressWidth,
      this.progressColor,
      this.startAngle,
      this.sweepAngle,
      this.borderColor,
      this.borderWidth,
      this.borderSweepAngle);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width * 0.5, size.height-progressWidth/2);
    double radius = size.width * 0.5 - progressWidth * 0.5;
    paintArc(canvas, center, radius,
        startAngle: 180,
        sweepAngle: borderSweepAngle,
        color: borderColor,
        strokeWidth: borderWidth);
    paintArc(canvas, center, radius,
        startAngle: startAngle,
        sweepAngle: sweepAngle,
        color: progressColor,
        strokeWidth: progressWidth);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  static void paintArc(
    Canvas canvas,
    Offset center,
    double radius, {
    double startAngle = 0.0,
    double sweepAngle = 360.0,
    Color color = Colors.blue,
    double strokeWidth = 1,
  }) {
    /// 1度对应的弧度
    const double rad = pi / 180.0;
    Rect rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(
      rect,
      startAngle * rad,
      sweepAngle * rad,
      false,
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke,
    );
  }
}
