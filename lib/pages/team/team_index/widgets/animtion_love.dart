/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-12-26 20:30:27
 * @LastEditTime: 2024-12-26 21:15:22
 */

import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimationLove extends StatefulWidget {
  final Offset startPosition;
  final VoidCallback onCompleted;

  const AnimationLove({
    super.key,
    required this.startPosition,
    required this.onCompleted,
  });

  @override
  _AnimationLoveState createState() => _AnimationLoveState();
}

class _AnimationLoveState extends State<AnimationLove>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    final random = Random();
    final endX = widget.startPosition.dx + random.nextDouble() * 200 - 100;
    final endY = widget.startPosition.dy - 200 - random.nextDouble() * 50;

    _offsetAnimation = Tween<Offset>(
      begin: widget.startPosition,
      end: Offset(endX, endY),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // 随机旋转角度和方向
    // final randomRotation = random.nextDouble() * 2 * pi;
    // final randomRotationSpeed = random.nextDouble() * 2 - 1; // -1 to 1

    double begin = Random().nextDouble() * 0.04;
    begin = begin * (random.nextBool() ? -1 : 1);
    _rotationAnimation = Tween<double>(begin: begin, end: -begin).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _shakeAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleted();
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
    return AnimatedBuilder(
      animation: Listenable.merge(
          [_offsetAnimation, _rotationAnimation, _shakeAnimation]),
      builder: (context, child) {
        final offset = _offsetAnimation.value;
        final rotation = _rotationAnimation.value;
        final shake = _shakeAnimation.value;

        // 计算摇晃偏移
        final horizontalShake = shake * sin(rotation * 4); // 增加摇晃频率
        final verticalShake = shake * cos(rotation * 4); // 增加摇晃频率

        return Positioned(
          left: offset.dx - 15 + horizontalShake,
          top: offset.dy - 15 + verticalShake,
          child: Opacity(
            opacity: _animation.value,
            child: RotationTransition(
              turns: _rotationAnimation,
              // child: const Icon(
              //   Icons.favorite,
              //   color: Colors.red,
              //   size: 30,
              // ),
              child: IconWidget(
                  iconWidth: 40.w, icon: Assets.commonUiCommonIconHeart),
            ),
          ),
        );
      },
    );
  }
}
