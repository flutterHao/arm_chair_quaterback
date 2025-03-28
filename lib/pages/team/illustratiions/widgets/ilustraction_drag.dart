/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 17:09:20
 * @LastEditTime: 2025-02-08 10:56:43
 */
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/detail_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IllustractionDragWidget extends StatefulWidget {
  const IllustractionDragWidget(
      {required this.child, super.key, this.onChange});

  final Widget child;
  final Function? onChange;

  @override
  State<IllustractionDragWidget> createState() =>
      _IllustractionDragWidgetState();
}

class _IllustractionDragWidgetState extends State<IllustractionDragWidget>
    with SingleTickerProviderStateMixin {
  IlluSctrationDtlCtrl ctrl = Get.find();

  final max = 437.w;
  final min = 143.w;

  ///手指按下的x位置
  double startY = -1;

  ///移动的距离
  double offsetY = 0.w;

  /// 布局宽度
  double height = 300.w;

  ///
  late AnimationController animationController;
  late Tween<double> tween;

  /// 回收动画的最小时长
  int minMilliseconds = 150;

  /// 回收动画的最大时长
  int maxMilliseconds = 300;
  late Animation<double> animation;
  late Duration duration;

  bool isReset = false;

  bool isOnLeftSide = false;

  bool isOut = false;

  // 开始滚动时是否在边界
  bool startScrollFlag = false;

  @override
  void initState() {
    super.initState();
    duration = Duration(milliseconds: maxMilliseconds);
    tween = Tween(begin: 0, end: 1);
    animationController = AnimationController(vsync: this)
      ..addListener(() {
        // Log.e("animationValue:${animation.value}");
        if (mounted && animation.value != 0 && !isReset) {
          ctrl.currentY = animation.value;
          ctrl.scale = ((ctrl.currentY - min) / (max - min)).clamp(0, 1);
          Log.d(" ctrl.currentY${ctrl.currentY}---,scale__:${ctrl.scale}");
          ctrl.update(["detail"]);
          // setState(() {});
        }
      });
    animation = tween.animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    onVerticalDragStart(DragStartDetails detail) {
      if (ctrl.scrollController.position.pixels != 0 && ctrl.currentY == min) {
        return;
      }
      startY = detail.localPosition.dy;
    }

    onDragCancel() {
      // _recycleAnimation();
    }

    onVerticalDragEnd(DragEndDetails detail) {
      // if (ctrl.scrollController.position.pixels != 0 &&
      //     ctrl.currentY == min) {
      //   return;
      // }
      // //结束更新当前位置
      offsetY = detail.localPosition.dy - startY;
      ctrl.currentY = (ctrl.currentY + offsetY).clamp(min, max);
      ctrl.scale = (ctrl.currentY - min) / (max - min);
      print(
          'onVerticalDragEnd-currentY:${ctrl.currentY}--offsetY:$offsetY--scale：${ctrl.scale}');
      // ctrl.update(["detail"]);
      _recycleAnimation(velocity: detail.velocity.pixelsPerSecond.dy);
    }

    onVerticalDragDown(DragDownDetails detail) {
      if (ctrl.scrollController.position.pixels != 0 && ctrl.currentY == min) {
        return;
      }
      startY = detail.localPosition.dy;
    }

    onVerticalDragUpdate(DragUpdateDetails detail) {
      if (ctrl.scrollController.position.pixels != 0 && ctrl.currentY == min) {
        return;
      }
      offsetY = detail.localPosition.dy - startY;
      var cur = (ctrl.currentY + offsetY).clamp(min, max);
      // ctrl.currentY = cur;
      ctrl.scale = (cur - min) / (max - min);
      print('onVerticalDragUpdate-cur:$cur--scale：${ctrl.scale}');

      ctrl.update(["detail"]);
    }

    return Positioned(
      top: (ctrl.currentY + offsetY).clamp(min, max),
      // top: ctrl.currentY,
      left: 0.w,
      bottom: 0,
      right: 0,
      child: NotificationListener<ScrollNotification>(
        child: RawGestureDetector(
          gestures: {
            MyVerticalGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                MyVerticalGestureRecognizer>(
              () => MyVerticalGestureRecognizer(),
              (MyVerticalGestureRecognizer detector) {
                detector
                  ..onDown = onVerticalDragDown
                  ..onStart = onVerticalDragStart
                  ..onUpdate = onVerticalDragUpdate
                  ..onEnd = onVerticalDragEnd
                  ..onCancel = onDragCancel;
              },
            )
          },
          child: widget.child,
        ),
      ),
    );
  }

  ///松手执行回收动画
  void _recycleAnimation({double velocity = 0}) {
    double current = ctrl.currentY;

    // animationController.value=ctrl.currentY;
    animationController.reset();
    animationController.duration = Duration(
        milliseconds: velocity > 1000 ? minMilliseconds : minMilliseconds);
    isReset = true;
    if ((offsetY > 0 && velocity > 1500) ||
        (offsetY > 100 && velocity > 1000) ||
        (offsetY > height / 5 && velocity >= 500) ||
        offsetY > height * 2 / 5 ||
        (offsetY < 0 && current > max - 50)) {
      tween.begin = current;
      tween.end = max;
    } else {
      tween.begin = current;
      tween.end = min;
    }
    offsetY = 0;
    isReset = false;

    animationController.forward().then((v) {
      // ctrl.currentY = animation.value;
    });
  }
}

class MyVerticalGestureRecognizer extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    super.acceptGesture(pointer);
  }
}
