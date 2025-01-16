/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 17:09:20
 * @LastEditTime: 2025-01-16 15:49:02
 */
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
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

  ///手指按下的x位置
  double startY = -1;

  ///移动的距离
  double offsetY = 0.w;

  @override
  Widget build(BuildContext context) {
    onVerticalDragStart(DragStartDetails detail) {
      if (ctrl.scrollController.position.pixels != 0 &&
          ctrl.currentY == 143.w) {
        return;
      }
      startY = detail.localPosition.dy;
    }

    onVerticalDragEnd(DragEndDetails detail) {
      if (ctrl.scrollController.position.pixels != 0 &&
          ctrl.currentY == 143.w) {
        return;
      }
      //结束更新当前位置
      offsetY = detail.localPosition.dy - startY;
      ctrl.currentY = (ctrl.currentY + offsetY).clamp(143.w, 437.w);
      offsetY = 0;
      ctrl.scale = (ctrl.currentY - 143.w) / 294.w;
      print('onVerticalDragUpdate-cur:${ctrl.currentY}--scale：${ctrl.scale}');
      ctrl.update(["detail"]);
    }

    onVerticalDragDown(DragDownDetails detail) {
      if (ctrl.scrollController.position.pixels != 0 &&
          ctrl.currentY == 143.w) {
        return;
      }
      startY = detail.localPosition.dy;
    }

    onVerticalDragUpdate(DragUpdateDetails detail) {
      if (ctrl.scrollController.position.pixels != 0 &&
          ctrl.currentY == 143.w) {
        return;
      }
      offsetY = detail.localPosition.dy - startY;
      var cur = (ctrl.currentY + offsetY).clamp(143.w, 437.w);
      ctrl.scale = (cur - 143.w) / 294.w;
      print('onVerticalDragUpdate-cur:$cur--scale：${ctrl.scale}');

      ctrl.update(["detail"]);
    }

    return Positioned(
      top: (ctrl.currentY + offsetY).clamp(143.w, 437.w),
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
                  ..onEnd = onVerticalDragEnd;
              },
            )
          },
          child: widget.child,
        ),
      ),
    );
  }
}

class MyVerticalGestureRecognizer extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    super.acceptGesture(pointer);
  }
}
