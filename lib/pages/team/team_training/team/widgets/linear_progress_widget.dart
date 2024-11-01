/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 20:30:20
 * @LastEditTime: 2024-11-01 16:36:37
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearProgressBar extends StatefulWidget {
  final double progress; // 进度值，0.0到1.0
  final double width; // 宽度
  final double? height; // 高度
  final Color? backgroundColor; // 背景颜色
  final Color? progressColor; // 进度颜色

  const CustomLinearProgressBar({
    super.key,
    required this.progress,
    required this.width,
    this.height,
    this.backgroundColor,
    this.progressColor,
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
      duration: const Duration(microseconds: 500),
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
            borderRadius: BorderRadius.circular((widget.height ?? 20) / 2),
            child: LinearProgressIndicator(
              value: _animation.value,
              backgroundColor: widget.backgroundColor ?? Colors.grey[300],
              color: widget.progressColor ?? Colors.blue,
              borderRadius: BorderRadius.circular((widget.height ?? 4.w) / 2),
            ),
          );
        },
      ),
    );
  }
}
