/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-04 16:18:54
 * @LastEditTime: 2024-12-09 09:43:08
 */

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/material.dart';

class AnimatedScaleNumber extends StatefulWidget {
  final int number;

  const AnimatedScaleNumber({
    super.key,
    required this.number,
  });

  @override
  State<AnimatedScaleNumber> createState() => _AnimatedScaleNumberState();
}

class _AnimatedScaleNumberState extends State<AnimatedScaleNumber>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  int _currentNumber = 0;

  @override
  void initState() {
    super.initState();
    _currentNumber = widget.number;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener(_statusListener);
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.removeStatusListener(_statusListener);
    }
  }

  @override
  void didUpdateWidget(AnimatedScaleNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.number != widget.number) {
      _currentNumber = widget.number;
      _controller.reset();
      _controller.addStatusListener(_statusListener);
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
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Text(
            '$_currentNumber',
            style: 14.w7(color: AppColors.c262626),
          ),
        );
      },
    );
  }
}

class AnimatedNum extends StatefulWidget {
  final int number;
  final bool isMoney;
  final int milliseconds;
  final bool fromZero;
  final bool withConma; //是否显示千分符
  final Function? onEnd;

  ///单位
  final TextStyle textStyle;

  const AnimatedNum({
    super.key,
    required this.number,
    required this.textStyle,
    this.isMoney = false,
    this.milliseconds = 300,
    this.fromZero = false,
    this.withConma = false,
    this.onEnd,
  });

  @override
  State<StatefulWidget> createState() => AnimState();
}

class AnimState extends State<AnimatedNum> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> animation;
  int _currentNumber = 0;

  @override
  void initState() {
    super.initState();
    _currentNumber = widget.number;
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.milliseconds));
    final Animation<double> curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation =
        IntTween(begin: _currentNumber, end: widget.number).animate(curve);
  }

  @override
  void didUpdateWidget(AnimatedNum oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.number != widget.number) {
      // int change = widget.number - oldWidget.number;
      // int duration = max(change * 10, 2000);
      _currentNumber = widget.fromZero ? 0 : oldWidget.number;
      // controller.reset();
      controller.reset();
      animation = IntTween(begin: _currentNumber, end: widget.number).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.linear,
        ),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            widget.onEnd?.call();
            // 动画完成时，可以执行一些操作
          }
        });
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        Widget numWidget;
        if (widget.isMoney) {
          numWidget = (controller.value != 0 && controller.value != 1)
              ? Text(
                  '${animation.value}k',
                  style: widget.textStyle,
                )
              : Text(
                  Utils.formatMoney(animation.value),
                  style: widget.textStyle,
                );
        } else {
          numWidget = widget.withConma
              ? Text(
                  Utils.numberWithThousandths(animation.value),
                  style: widget.textStyle,
                )
              : Text(
                  '${animation.value}',
                  style: widget.textStyle,
                );
        }
        return numWidget;
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
