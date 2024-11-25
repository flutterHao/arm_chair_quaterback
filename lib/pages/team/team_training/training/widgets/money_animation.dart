/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-22 16:45:38
 * @LastEditTime: 2024-11-22 17:30:26
 */
import 'dart:ui';

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyAnimation extends StatefulWidget {
  final Offset fromPosition;
  final Offset toPosition;
  final double coinSize;
  final int coinCount;

  const MoneyAnimation({
    Key? key,
    required this.fromPosition,
    required this.toPosition,
    this.coinSize = 20.0,
    this.coinCount = 10,
  }) : super(key: key);

  @override
  _MoneyAnimationState createState() => _MoneyAnimationState();
}

class _MoneyAnimationState extends State<MoneyAnimation>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.coinCount, (_) {
      return AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      );
    });

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOut),
      );
    }).toList();

    for (int i = 0; i < widget.coinCount; i++) {
      Future.delayed(const Duration(milliseconds: 50)).then((v) {
        _controllers[i].forward().then((_) {
          if (i < widget.coinCount - 1) {
            Future.delayed(Duration(milliseconds: 0 * i), () {
              _controllers[i + 1].forward().then((_) {
                _controllers[i + 1].repeat();
              });
            });
          }
        });
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Offset _getPointOnPath(double t) {
    Path path = Path();
    path.moveTo(widget.fromPosition.dx, widget.fromPosition.dy);
    path.quadraticBezierTo(
      (widget.fromPosition.dx + widget.toPosition.dx) / 2,
      (widget.fromPosition.dy + widget.toPosition.dy) / 2 - 100,
      widget.toPosition.dx,
      widget.toPosition.dy,
    );

    PathMetric pathMetric = path.computeMetrics().first;
    Tangent? tangent = pathMetric.getTangentForOffset(pathMetric.length * t);
    return tangent?.position ?? Offset.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(widget.coinCount, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            Offset position = _getPointOnPath(_animations[index].value);
            return Positioned(
              left: position.dx,
              top: position.dy,
              child: Opacity(
                opacity: 1 - index * 0.1,
                child: Image.asset(
                  Assets.teamUiMoney02,
                  width: widget.coinSize.w,
                  height: widget.coinSize.w,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
