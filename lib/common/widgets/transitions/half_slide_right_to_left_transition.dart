///
///@auther gejiahui
///created at 2024/11/6/10:47

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HalfSlideRightToLeftTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // 设置缩放动画和透明度动画
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
      child: child,
    );
  }
}

class EnterExitRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  static var leftValue = 0.0.obs;

  EnterExitRoute({
    required this.exitPage,
    required this.enterPage,
    super.transitionDuration,
    super.reverseTransitionDuration,
    super.opaque = false,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.maintainState,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              enterPage,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              stack(animation, exitPage, enterPage),
        );

  static Stack stack(
      Animation<double> animation, Widget exitPage, Widget enterPage) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.0),
            end: const Offset(-1.0, 0.0),
          ).animate(animation),
          child: Obx(() {
            var value = leftValue.value;
              return exitPage;
            }
          ),
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: GestureDetector(onHorizontalDragUpdate: (detail) {
            leftValue.value = detail.localPosition.dx;
          }, child: Obx(() {
            var value = leftValue.value;
            return enterPage;
          })),
        )
      ],
    );
  }
}
