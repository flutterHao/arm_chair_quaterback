import 'dart:math';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/click_feed_back.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

///
/// 点击反馈组件
///@auther gejiahui
///created at 2024/11/6/14:02

enum CallTapStatus {
  start, //不执行动画直接回调onTap
  center, //执行完缩小（即一半）回调onTap
  end; //执行完动画回调onTap
}

class MtInkwell extends StatefulWidget {
  const MtInkwell({
    super.key,
    required this.child,
    this.splashColor,
    this.onTap,
    this.callTapStatus = CallTapStatus.end,
    this.minScale = 0.8,
    this.scaleX = false,
    this.scaleY = false,
    this.vibrate = false,
  });

  final Widget child;
  final GestureTapCallback? onTap;
  final Color? splashColor;

  //在什么状态时回调onTap
  final CallTapStatus callTapStatus;

  //最小缩放比例
  final double minScale;

  //缩放方向 默认x,y一期缩放
  // 缩放x轴
  final bool scaleX;

  // 缩放y轴
  final bool scaleY;

  final bool vibrate;

  @override
  State<MtInkwell> createState() => _MtInkwellState();
}

class _MtInkwellState extends State<MtInkwell>
    with SingleTickerProviderStateMixin {
  late EasyAnimationController easyAnimationController;

  @override
  void initState() {
    super.initState();
    easyAnimationController = EasyAnimationController(
        vsync: this,
        begin: 1.0,
        end: widget.minScale,
        duration: const Duration(milliseconds: 100));
    easyAnimationController.controller.removeStatusListener(statusListener);
    easyAnimationController.controller.addStatusListener(statusListener);
  }

  @override
  void dispose() {
    easyAnimationController.dispose();
    super.dispose();
  }

  statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (widget.callTapStatus == CallTapStatus.center) {
        easyAnimationController.reset();
        widget.onTap?.call();
        return;
      }
      easyAnimationController.reverse();
    }
    if (status == AnimationStatus.reverse) {
      if (widget.callTapStatus == CallTapStatus.end) {
        easyAnimationController.reset();
        widget.onTap?.call();
      }
    }
  }

  vibrate() {
    ClickFeedBack.selectionClick();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.cTransparent,
      child: LayoutBuilder(builder: (context, constraints) {
        return InkWell(
          borderRadius: BorderRadius.circular(
              max(constraints.maxWidth, constraints.maxHeight) / 2),
          splashColor: widget.splashColor ?? AppColors.cFFFFFF.withOpacity(0.2),
          hoverColor: Colors.transparent,
          onTap: () {
            if (easyAnimationController.controller.isAnimating) {
              return;
            }
            if (widget.vibrate) {
              vibrate();
            }
            if (widget.callTapStatus == CallTapStatus.start) {
              widget.onTap?.call();
              return;
            }
            easyAnimationController.forward();
          },
          child: Obx(() {
            var scale = easyAnimationController.value.value;
            return Transform.scale(
              scale: widget.scaleX
                  ? null
                  : widget.scaleY
                      ? null
                      : scale,
              scaleX: widget.scaleX ? scale : null,
              scaleY: widget.scaleY ? scale : null,
              child: widget.child,
            );
          }),
        );
      }),
    );
  }
}
