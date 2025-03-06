import 'package:flutter/material.dart';
import 'dart:math';

class EmojiAnimationWidget {
  static void show({
    required BuildContext context,
    required String emojiImg,
  }) {
    final overlayState = Overlay.of(context);
    final size = MediaQuery.of(context).size;

    // 创建动画管理
    final animationController = AnimationController(
      vsync: overlayState!,
      duration: const Duration(milliseconds: 800),
    );

    // 创建覆盖层条目
    final overlayEntry = OverlayEntry(
      builder: (context) => _EmojiAnimatedWidget(
        emojiImage: emojiImg,
        controller: animationController,
        initialOffset: Offset(size.width / 2, size.height / 2),
      ),
    );

    // 添加覆盖层
    overlayState.insert(overlayEntry);

    // 启动动画
    animationController.forward().whenComplete(() {
      overlayEntry.remove();
      animationController.dispose();
    });
  }
}

class _EmojiAnimatedWidget extends StatelessWidget {
  final String emojiImage;
  final AnimationController controller;
  final Offset initialOffset;
  final double imageSize = 60.0;

  const _EmojiAnimatedWidget({
    required this.emojiImage,
    required this.controller,
    required this.initialOffset,
  });

  @override
  Widget build(BuildContext context) {
    // 动画配置
    final opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.6, 1.0),
      ),
    );

    // 放大倍数调整到 1.5
    final scaleAnimation = Tween<double>(begin: 0.8, end: 1.5).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    // 向上移动距离（屏幕高度的 10%）
    final moveUpAnimation = Tween<double>(
            begin: 0.0, end: -MediaQuery.of(context).size.height * 0.1)
        .animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    // 左右摇摆动画（-8°到8°）
    final rotateAnimation = Tween<double>(begin: -0.14, end: 0.14).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    return Positioned(
      left: initialOffset.dx - imageSize / 2,
      top: initialOffset.dy - imageSize / 2,
      child: AnimatedBuilder(
        animation: controller,
        child: Image.asset(
          emojiImage,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.contain,
        ),
        builder: (context, child) {
          return Opacity(
            opacity: opacityAnimation.value,
            child: Transform.translate(
              offset: Offset(0, moveUpAnimation.value), // 向上移动
              child: Transform.rotate(
                angle: sin(controller.value * pi * 6) * 0.1, // 高频微颤
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: Transform.rotate(
                    angle: rotateAnimation.value, // 整体摇摆
                    child: child,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// 使用示例
// EmojiAnimationWidget.show(
//   context: context,
//   emojiImg: 'assets/emoji.png',
// );