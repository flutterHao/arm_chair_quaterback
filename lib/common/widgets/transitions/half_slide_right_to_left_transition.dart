
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
        begin: const Offset(0.7, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
      child: child,
    );
  }
}
