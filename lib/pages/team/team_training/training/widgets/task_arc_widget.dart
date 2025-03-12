import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedArcWidget extends StatefulWidget {
  final double radius;
  final double progressWidth;
  final Color progressColor;
  final double startAngle;
  final double progressSweepAngle;
  final Color borderColor;
  final double borderWidth;
  final double borderSweepAngle;
  final Duration duration;
  final bool showIndicatorDot;

  const AnimatedArcWidget(
    this.radius, {
    super.key,
    this.progressWidth = 2.0,
    this.progressColor = Colors.blue,
    this.startAngle = 180,
    this.progressSweepAngle = 90,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.borderSweepAngle = 180,
    this.duration = const Duration(milliseconds: 300),
    this.showIndicatorDot = true,
  });

  @override
  State<AnimatedArcWidget> createState() => _AnimatedArcWidgetState();
}

class _AnimatedArcWidgetState extends State<AnimatedArcWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _prevSweepAngle = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<double>(
      begin: _prevSweepAngle,
      end: widget.progressSweepAngle,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedArcWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progressSweepAngle != widget.progressSweepAngle) {
      _prevSweepAngle = _animation.value;
      _animation = Tween<double>(
        begin: _prevSweepAngle,
        end: widget.progressSweepAngle,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.radius * 2, widget.radius),
          painter: _ArcPainter(
            widget.progressWidth,
            widget.progressColor,
            widget.startAngle,
            _animation.value,
            widget.borderColor,
            widget.borderWidth,
            widget.borderSweepAngle,
            showIndicatorDot: widget.showIndicatorDot,
          ),
        );
      },
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double progressWidth;
  final Color progressColor;
  final double startAngle;
  final double sweepAngle;
  final Color borderColor;
  final double borderWidth;
  final double borderSweepAngle;
  final bool showIndicatorDot;

  _ArcPainter(
    this.progressWidth,
    this.progressColor,
    this.startAngle,
    this.sweepAngle,
    this.borderColor,
    this.borderWidth,
    this.borderSweepAngle, {
    this.showIndicatorDot = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height - progressWidth / 2);
    final radius = size.width * 0.5 - progressWidth * 0.5;

    // 绘制背景环
    paintArc(
      canvas,
      center,
      radius,
      startAngle: startAngle,
      sweepAngle: borderSweepAngle,
      color: borderColor,
      strokeWidth: borderWidth,
    );

    // 绘制进度环
    paintArc(
      canvas,
      center,
      radius,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
      color: progressColor,
      strokeWidth: progressWidth,
    );

    // 绘制末端指示点
    if (showIndicatorDot && sweepAngle > 0) {
      final dotPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill;

      // 计算圆点位置
      final angle = (startAngle + sweepAngle) * (pi / 180);
      final dotX = center.dx + radius * cos(angle);
      final dotY = center.dy + radius * sin(angle);

      // 绘制白色圆点
      canvas.drawCircle(
        Offset(dotX, dotY),
        progressWidth * 0.3, // 圆点大小
        dotPaint,
      );

      // 添加外边框（可选）
      // final borderPaint = Paint()
      //   ..color = progressColor
      //   ..strokeWidth = 1
      //   ..style = PaintingStyle.stroke;

      // canvas.drawCircle(
      //   Offset(dotX, dotY),
      //   progressWidth * 0.5,
      //   borderPaint,
      // );
    }
  }

  @override
  bool shouldRepaint(covariant _ArcPainter oldDelegate) {
    return oldDelegate.sweepAngle != sweepAngle ||
        oldDelegate.showIndicatorDot != showIndicatorDot ||
        oldDelegate.progressColor != progressColor;
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
    const double rad = pi / 180.0;
    final rect = Rect.fromCircle(center: center, radius: radius);
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
