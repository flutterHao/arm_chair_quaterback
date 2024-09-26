import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/9/26/09:35

class HorizontalDragBackWidget extends StatefulWidget {
  const HorizontalDragBackWidget(
      {required this.child, this.onWidgetOut, super.key});

  final Widget child;
  final Function()? onWidgetOut;

  @override
  State<HorizontalDragBackWidget> createState() =>
      _HorizontalDragBackWidgetState();
}

class _HorizontalDragBackWidgetState extends State<HorizontalDragBackWidget>
    with SingleTickerProviderStateMixin {
  ///手指按下的x位置
  double startX = 0;

  ///移动的距离
  double offsetX = 0;

  /// 布局宽度
  double width = 0;
  late AnimationController animationController;
  late Tween<double> tween;

  /// 回收动画的最小时长
  int minMilliseconds = 10;

  /// 回收动画的最大时长
  int maxMilliseconds = 100;
  late Animation<double> animation;
  late Duration duration;

  bool isReset = false;

  @override
  void initState() {
    super.initState();
    duration = Duration(milliseconds: maxMilliseconds);
    tween = Tween(begin: 0, end: 1);
    animationController = AnimationController(vsync: this)
      ..addListener(() {
        if (mounted && !isReset) {
          offsetX = animation.value;
          // print('addListener---offsetX: $offsetX');
          setState(() {});
        }
        if (animationController.status == AnimationStatus.completed) {
          if (offsetX > width) {
            widget.onWidgetOut != null
                ? widget.onWidgetOut!()
                : Navigator.of(context).pop();
          }
        }
      });
    animation = tween.animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails detail) {
        // print('onHorizontalDragStart: ${detail.localPosition}');
        startX = detail.localPosition.dx;
      },
      onHorizontalDragEnd: (DragEndDetails detail) {
        // print('onHorizontalDragEnd: ${detail.localPosition}');
        // print('onHorizontalDragEnd: ${detail.velocity}');
        _recycleAnimation(velocity: detail.velocity.pixelsPerSecond.dx);
      },
      onHorizontalDragCancel: () {
        // print('onHorizontalDragCancel: ');
        _recycleAnimation();
      },
      onHorizontalDragDown: (DragDownDetails detail) {
        // print('onHorizontalDragDown: ${detail.localPosition}');
        startX = detail.localPosition.dx;
      },
      onHorizontalDragUpdate: (DragUpdateDetails detail) {
        // print('onHorizontalDragUpdate: ${detail.localPosition}');
        offsetX = detail.localPosition.dx - startX;
        // print('onHorizontalDragUpdate-offsetX:$offsetX');
        if (offsetX < 0) {
          offsetX = 0;
        }
        setState(() {});
      },
      child: Stack(
        children: [
          Container(
            color: Color.lerp(Colors.black.withOpacity(.3),
                Colors.black.withOpacity(.0), offsetX / width),
          ),
          Transform.translate(offset: Offset(offsetX, 0), child: widget.child),
        ],
      ),
    );
  }

  ///松手执行回收动画
  void _recycleAnimation({double velocity = 0}) {
    double beforeResetOffsetX = offsetX;
    animationController.reset();
    isReset = true;
    if ((beforeResetOffsetX > 0 && velocity > 1500) ||
        (beforeResetOffsetX > 100 && velocity > 1000) ||
        (beforeResetOffsetX > width / 5 && velocity >= 250) ||
        beforeResetOffsetX > width * 2 / 5) {
      /// 最后距离大于宽度的 1/5 且停止接触屏幕时移动的速度大于 500 则进入退出动画
      /// 最后距离大于宽度的 2/5 进入退出动画
      tween.begin = beforeResetOffsetX;
      tween.end = width + 100;
      animationController.duration = Duration(
          milliseconds: velocity > 1000 ? minMilliseconds : maxMilliseconds);
    } else {
      tween.begin = beforeResetOffsetX;
      tween.end = 0.0;
      animationController.duration = Duration(milliseconds: maxMilliseconds);
    }
    animationController.forward();
    isReset = false;
  }
}
