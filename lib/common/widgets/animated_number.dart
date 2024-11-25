/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-04 16:18:54
 * @LastEditTime: 2024-11-24 19:46:45
 */

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
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
  final String? unit;
  final int milliseconds;

  ///单位
  final TextStyle textStyle;

  const AnimatedNum({
    super.key,
    required this.number,
    required this.textStyle,
    this.unit = "",
    this.milliseconds = 300,
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
        vsync: this, duration: const Duration(milliseconds: 200));
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
      _currentNumber = oldWidget.number;
      // controller.reset();
      controller.reset();
      animation = IntTween(begin: _currentNumber, end: widget.number).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.linear,
        ),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
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
        return Text(
          '${animation.value}${widget.unit}',
          style: widget.textStyle,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


// class AnimatedNum<T extends num> extends StatefulWidget {
//   final T number;
//   final TextStyle textStyle;

//   const AnimatedNum({
//     super.key,
//     required this.number,
//     required this.textStyle,
//   });

//   @override
//   State<StatefulWidget> createState() => AnimState<T>();
// }

// class AnimState<T extends num> extends State<AnimatedNum<T>>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation animation;
//   late T _currentNumber;

//   @override
//   void initState() {
//     super.initState();
//     _currentNumber = widget.number;
//     _setupAnimation();
//   }

//   void _setupAnimation() {
//     final int duration = _calculateDuration(_currentNumber, widget.number);
//     controller = AnimationController(
//         vsync: this, duration: Duration(milliseconds: duration));
//     final Animation<double> curve =
//         CurvedAnimation(parent: controller, curve: Curves.linear);

//     if (T == int) {
//       animation =
//           IntTween(begin: _currentNumber as int, end: widget.number as int)
//               .animate(curve)
//             ..addStatusListener((status) {
//               if (status == AnimationStatus.completed) {
//                 // 动画完成时，可以执行一些操作
//               }
//             });
//     } else if (T == double) {
//       animation = Tween<double>(
//               begin: _currentNumber as double, end: widget.number as double)
//           .animate(curve)
//         ..addStatusListener((status) {
//           if (status == AnimationStatus.completed) {
//             // 动画完成时，可以执行一些操作
//           }
//         });
//     }
//   }

//   int _calculateDuration(T start, T end) {
//     final double change = (end - start).abs().toDouble();
//     int baseDuration = 200;
//     // 根据变化量调整时长，这里简单地按比例计算
//     return (baseDuration * (change / 100)).clamp(baseDuration, 1000).toInt();
//   }

//   @override
//   void didUpdateWidget(AnimatedNum<T> oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.number != widget.number) {
//       _currentNumber = oldWidget.number;
//       controller.reset();
//       _setupAnimation();
//       controller.forward();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         return Text(
//           T == int
//               ? '${animation.value}'
//               : '${animation.value.toStringAsFixed(2)}',
//           style: widget.textStyle,
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
