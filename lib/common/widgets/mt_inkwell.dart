import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

///
/// 点击反馈组件
///@auther gejiahui
///created at 2024/11/6/14:02

class MtInkwell extends StatelessWidget {
  const MtInkwell(
      {super.key, required this.child, this.highlightColor, this.onTap});

  final Widget child;
  final GestureTapCallback? onTap;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cTransparent,
      child: InkWell(
        highlightColor: highlightColor ?? AppColors.cFFFFFF.withOpacity(0.2),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
