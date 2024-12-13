import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/10/11/21:26

class HeartbeatWidget extends StatefulWidget {
  const HeartbeatWidget({super.key, required this.child});

  final Widget child;

  @override
  State createState() => _HeartbeatWidgetState();
}

class _HeartbeatWidgetState extends State<HeartbeatWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 初始化动画控制器
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // 动画时长
      vsync: this,
    );

    // 缩放动画，值从 1.0 到 1.2，然后回到 1.0，模仿心跳效果
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse(); // 动画完成时反向播放
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value, // 根据动画值进行缩放
            child: widget.child,
          );
        },
      ),
    );
  }
}
