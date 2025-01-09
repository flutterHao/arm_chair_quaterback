/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-20 18:34:19
 * @LastEditTime: 2025-01-08 17:15:17
 */
import 'package:flutter/material.dart';

class AnimatedArrow extends StatefulWidget {
  const AnimatedArrow(
      {super.key, required this.child, required this.end, this.duration = 500});
  final Widget child;
  final double end;
  final int duration;

  @override
  State<AnimatedArrow> createState() => _AnimatedArrowState();
}

class _AnimatedArrowState extends State<AnimatedArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _verticalOffset;
  @override
  void initState() {
    super.initState();

    // 初始化 AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600), // 动画持续时间
      vsync: this,
    );

    // 设置循环模式为反向重复
    _controller.repeat(reverse: true);

    // 初始化 Tween 并绑定到 AnimationController
    _verticalOffset = Tween<double>(
      begin: 0.0, // 初始位置
      end: widget.end, // 最终位置
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // 缓动曲线
    ));
  }

  @override
  void dispose() {
    _controller.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _verticalOffset,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _verticalOffset.value), // 垂直偏移
          child: widget.child,
        );
      },
    );
  }
}
