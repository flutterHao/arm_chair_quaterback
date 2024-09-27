import 'package:flutter/material.dart';
import 'dart:math';

class CircleProgressView extends StatefulWidget {
  final Color backgroundColor;
  final double progress;
  final Color progressColor;
  final double progressWidth;
  final double width;
  final double height;
  final Color innerBackgroundColor; // 内部圆形背景色

  CircleProgressView({
    required Key key,
    required this.progress,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.progressWidth = 10.0,
    this.innerBackgroundColor = Colors.white, // 默认内圆背景为白色
  }) : super(key: key);

  @override
  _CircleProgressViewState createState() => _CircleProgressViewState();
}

class _CircleProgressViewState extends State<CircleProgressView>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Tween<double> tween;
  late double oldProgress;

  @override
  void initState() {
    super.initState();
    oldProgress = widget.progress;
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    tween = Tween();
    tween.begin = 0.0;
    tween.end = oldProgress;
    animation = tween.animate(curvedAnimation);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  void startAnimation() {
    controller.reset();
    tween.begin = oldProgress;
    tween.end = widget.progress;
    animation = tween.animate(curvedAnimation);
    controller.forward();
    oldProgress = widget.progress;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (oldProgress != widget.progress) {
      startAnimation();
    }
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 内圆背景
          Container(
            width:
                widget.width - widget.progressWidth * 2 - 2, // 减去进度条宽度和1像素的间隙
            height: widget.height - widget.progressWidth * 2 - 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.innerBackgroundColor,
            ),
          ),
          // 自定义画布
          CustomPaint(
            size: Size(widget.width, widget.height),
            painter: ProgressPaint(
              animation.value / 100 * 360, // 将进度映射为角度（0到360）
              widget.progressWidth,
              widget.backgroundColor,
              widget.progressColor,
            ),
          ),
          // 显示进度百分比
          Text(
            "${animation.value.toInt()}%",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: widget.progressColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressPaint extends CustomPainter {
  final double sweepAngle; // 绘制的角度（0到360）
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  ProgressPaint(this.sweepAngle, this.strokeWidth, this.backgroundColor,
      this.progressColor);

  @override
  void paint(Canvas canvas, Size size) {
    // 圆心
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width / 2) - strokeWidth / 2 - 1; // 圆半径

    // 背景圆
    Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    // 进度圆
    Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round // 圆形的进度条尾端
      ..isAntiAlias = true;

    // 画背景圆
    canvas.drawCircle(center, radius, backgroundPaint);

    // 画进度圆弧
    double startAngle = -pi / 2; // 从顶部开始绘制
    double sweepRadians = sweepAngle * pi / 180; // 将角度转为弧度
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepRadians,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
