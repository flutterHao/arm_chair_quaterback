/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-04 11:52:50
 * @LastEditTime: 2024-11-04 16:59:06
 */
import 'package:flutter/material.dart';

/*
 * @Description: 动画按钮缩小放大
 * @Author: lihonghao
 * @Date:  2024-11-04 09:46:00
 * @LastEditTime: 2024-11-04 16:55:07
 */
class AnimatedButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;

  const AnimatedButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 初始化 AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    // 创建 Tween，从 1.0 缩小到 0.95，再恢复到 1.0
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (_controller.isDismissed) {
      _controller.forward().then((_) {
        _controller.reverse();
      });
    }
    widget.onTap.call();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: InkWell(
            onTap: _onTap,
            child: widget.child,
          ),
        );
      },
    );
  }
}
