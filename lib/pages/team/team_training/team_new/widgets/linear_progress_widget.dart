/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 20:30:20
 * @LastEditTime: 2025-02-24 14:57:42
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomLinearProgressBar extends StatefulWidget {
  final double progress; // 进度值，0.0到1.0
  final double width; // 宽度
  final double? height; // 高度
  final Color? backgroundColor; // 背景颜色
  final Color? progressColor; // 进度颜色
  final int milliseconds;
  final BorderRadius? borderRadius;

  const CustomLinearProgressBar({
    super.key,
    required this.progress,
    required this.width,
    this.height,
    this.backgroundColor,
    this.progressColor,
    this.milliseconds = 500,
    this.borderRadius,
  });

  @override
  State<CustomLinearProgressBar> createState() =>
      _CustomLinearProgressBarState();
}

class _CustomLinearProgressBarState extends State<CustomLinearProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // 初始化 AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // 创建 Tween，从 0.0 到目标进度值
    _animation =
        Tween<double>(begin: 0.0, end: widget.progress).animate(_controller);

    // 开始动画
    _controller.forward();
  }

  @override
  void didUpdateWidget(CustomLinearProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.progress != widget.progress) {
      // 更新目标进度值
      _animation = Tween<double>(begin: _animation.value, end: widget.progress)
          .animate(_controller);

      // 重置并重新播放动画
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 4.w,
      width: widget.width,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return ClipRRect(
            borderRadius: widget.borderRadius ??
                BorderRadius.circular((widget.height ?? 20) / 2),
            child: LinearProgressIndicator(
              value: _animation.value,
              backgroundColor: widget.backgroundColor ?? AppColors.cD7D7D7,
              color: widget.progressColor ?? AppColors.c10A86A,
              borderRadius: widget.borderRadius ??
                  BorderRadius.circular((widget.height ?? 4.w) / 2),
            ),
          );
        },
      ),
    );
  }
}

class OutLineProgressWidget extends StatelessWidget {
  const OutLineProgressWidget({
    super.key,
    required this.width,
    required this.height,
    required this.progress,
    this.progressColorBegin,
    required this.progressColor,
    this.border,
    this.backgroundColor,
  });
  final double width;
  final double height;
  final double progress;
  final Color? progressColorBegin;
  final Color progressColor;
  final Border? border;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.transparent,
                border: border ?? Border.all(color: AppColors.cD1D1D1),
                borderRadius: BorderRadius.circular(height / 2),
              ),
            ),
            AnimatedContainer(
              duration: 300.milliseconds,
              alignment: Alignment.centerLeft,
              width: width * (progress.clamp(0, 1)),
              height: height,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(height / 2)),
                  gradient: LinearGradient(colors: [
                    progressColorBegin ?? progressColor,
                    progressColor
                  ])),
            ),
          ],
        ),
      ),
    );
  }
}
