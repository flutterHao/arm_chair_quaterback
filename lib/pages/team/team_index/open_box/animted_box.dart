/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-20 16:11:51
 * @LastEditTime: 2025-01-13 11:35:49
 */
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key, required this.child, required this.onTap});
  final Widget child;
  final Function onTap;

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _compressScaleX;
  late Animation<double> _compressScaleY;
  late Animation<double> _jumpHeight;
  late Animation<double> _opacity;
  //摇动卡牌动画
  late AnimationController shakeController;
  late Animation<double> shakeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    //压缩变宽、上升变长、上升复原--下降变长，下降复原、下降压缩
    // 向下压缩变扁变宽
    _compressScaleX = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 20),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 60),
    ]).animate(_controller);

    _compressScaleY = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.7), weight: 20),
      //
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.2), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.7), weight: 10),
      TweenSequenceItem(tween: Tween(begin: 0.7, end: 1.0), weight: 10),
    ]).animate(_controller);

    // 弹射跳起并恢复原形
    _jumpHeight = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 100.0), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 100.0, end: 0.0), weight: 20),
      TweenSequenceItem(tween: ConstantTween(0.0), weight: 20),
    ]).animate(_controller);

    // 落下渐隐藏消失
    _opacity = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 60),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 40),
    ]).animate(_controller);

    shakeAnimation = TweenSequence([
      for (int i = 0; i < 3; i++)
        TweenSequenceItem<double>(
            tween: Tween(begin: 0, end: -0.015), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: -0.015, end: 0), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 0.02), weight: 4),
      TweenSequenceItem<double>(tween: Tween(begin: 0.02, end: 0), weight: 4),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 60),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Log.d("打开宝箱");
        _controller.reset();
        _controller.forward().then((v) {
          widget.onTap();
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _opacity.value,
            child: Transform.translate(
              offset: Offset(0, -_jumpHeight.value),
              child: Transform.scale(
                scaleX: _compressScaleX.value,
                scaleY: _compressScaleY.value,
                child: RotationTransition(
                    alignment: Alignment.center,
                    turns: shakeAnimation,
                    child: widget.child),
              ),
            ),
          );
        },
      ),
    );
  }
}
