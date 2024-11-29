import 'dart:math';

import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle/widgets/battle_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/29/10:32

class ShootMarkAnimationWidget extends StatefulWidget {
  const ShootMarkAnimationWidget({super.key, required this.child});

  final Widget child;

  @override
  State<ShootMarkAnimationWidget> createState() =>
      _ShootMarkAnimationWidgetState();
}

class _ShootMarkAnimationWidgetState extends State<ShootMarkAnimationWidget>
    with TickerProviderStateMixin {
  late EasyAnimationController jumpAnimationController;
  late EasyAnimationController rotateAnimationController;

  @override
  void initState() {
    super.initState();
    jumpAnimationController = EasyAnimationController(
        vsync: this,
        begin: 0.0,
        end: 5.0,
        duration: const Duration(milliseconds: 500));
    jumpAnimationController.controller.repeat(reverse: true);
    rotateAnimationController = EasyAnimationController(
        vsync: this,
        begin: 0.0,
        end: -2 * pi,
        duration: const Duration(milliseconds: 1000));
    rotateAnimationController.controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double bottom = jumpAnimationController.value.value;
      return Container(
          height: 30,
          padding: EdgeInsets.only(bottom: bottom),
          child: widget.child);
      // 跳跃+旋转
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateY(rotateAnimationController.value.value),
        child: Container(
            height: 30,
            padding: EdgeInsets.only(bottom: bottom),
            child: widget.child),
      );
    });
  }

  @override
  void dispose() {
    jumpAnimationController.dispose();
    rotateAnimationController.dispose();
    super.dispose();
  }
}
