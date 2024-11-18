/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-14 15:06:14
 * @LastEditTime: 2024-11-18 11:55:43
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter/material.dart';

class CircleProgressView extends StatefulWidget {
  ///背景圆形色值
  final Color backgroundColor;

  ///当前进度 0-100
  final double progress;

  ///进度条颜色
  final Color progressColor;

  ///圆环宽度
  final double progressWidth;

  ///宽度
  final double width;

  ///高度
  final double height;

  ///title
  final String title;

  ///是否展示动画
  final bool showAnimation;

  ///文字颜色
  final Color textColor;

  const CircleProgressView({
    super.key,
    required this.title,
    required this.progress,
    required this.width,
    required this.height,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.progressColor = const Color(0xFF10A86A),
    this.progressWidth = 2,
    this.showAnimation = true,
    this.textColor = const Color(0xFF000000), // 默认展示动画
  });

  @override
  State<CircleProgressView> createState() => _CircleProgressViewState();
}

class _CircleProgressViewState extends State<CircleProgressView>
    with TickerProviderStateMixin {
  static const double _Pi = 3.14;
  late Animation<double> animation;
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;
  late Tween<double> tween;
  late double oldProgress;

  @override
  void initState() {
    super.initState();
    oldProgress = widget.progress;

    if (widget.showAnimation) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      );
      curvedAnimation = CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      );
      tween = Tween<double>(begin: 0.0, end: oldProgress);
      animation = tween.animate(curvedAnimation);

      animation.addListener(() {
        setState(() {});
      });
      controller.forward();
    }
  }

  /// 这里是在重新赋值进度时，再次刷新动画
  void startAnimation() {
    if (widget.showAnimation) {
      controller.reset();
      tween.begin = oldProgress;
      tween.end = widget.progress;
      animation = tween.animate(curvedAnimation);
      controller.forward();
    }
    oldProgress = widget.progress;
  }

  @override
  void dispose() {
    if (widget.showAnimation) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 更新时判断进度变化，控制是否重启动画
    if (oldProgress != widget.progress && widget.showAnimation) {
      startAnimation();
    }

    final currentProgress =
        widget.showAnimation ? animation.value : widget.progress;

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.cEEEEEE,
        borderRadius: BorderRadius.circular(widget.width / 2),
      ),
      child: CustomPaint(
        painter: ProgressPaint(
          currentProgress / 50 * _Pi,
          widget.progressWidth,
          widget.backgroundColor,
          widget.progressColor,
        ),
        child: Container(
          width: widget.width - widget.progressWidth * 2,
          height: widget.height - widget.progressWidth * 2,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(widget.width / 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: 21.w7(color: widget.progressColor, height: 1),
              ),
              4.vGap,
              Text(
                "+${currentProgress.toInt()}%",
                style: 12.w4(color: widget.textColor, height: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressPaint extends CustomPainter {
  ProgressPaint(
      this.progress, //进度
      this.width, //画笔宽度
      this.backgroundColor, //背景画笔颜色
      this.progressColor) {
    //背景画笔
    paintBg = Paint()
      ..color = backgroundColor
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true //是否开启抗锯齿
      ..style = PaintingStyle.stroke; // 画笔风格，线
    //进度画笔
    paintProgress = Paint()
      ..color = progressColor
      ..strokeWidth = width
      ..isAntiAlias = true //是否开启抗锯齿
      ..strokeCap = StrokeCap.round // 笔触设置为圆角
      ..style = PaintingStyle.stroke; // 画笔风格，线
  }

  final Color backgroundColor;
  final double progress; // 进度，范围应该是0到π
  final Color progressColor;
  final double width;

  var paintBg;
  var paintProgress;

  @override
  void paint(Canvas canvas, Size size) {
    // 半径，这里为防止宽高不一致，取较小值的一半作为半径大小
    double radius = size.width > size.height ? size.height / 2 : size.width / 2;

    // 计算半圆的矩形区域
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: radius);

    // 绘制半圆背景
    canvas.drawArc(rect, -pi / 2, pi, false, paintBg);

    // 根据进度绘制半圆弧
    canvas.drawArc(rect, -pi / 2, progress, false, paintProgress);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
