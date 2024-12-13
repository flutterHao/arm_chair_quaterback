import 'package:arm_chair_quaterback/common/widgets/getsure_recognizer/custom_drag_gesture_recognizer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/9/26/09:35

class HorizontalDragBackWidget extends StatefulWidget {
  const HorizontalDragBackWidget({
    required this.child,
    this.onWidgetOut,
    this.canPop = true,
    this.responseDepth = const [],
    this.hasScrollChild = false,
    this.noBackAnimation = false,
    super.key,
  });

  final Widget child;

  ///是否支持右滑返回，实体/虚拟按键返回
  final bool canPop;

  ///响应哪个子滚动组件
  final List<int> responseDepth;
  final bool hasScrollChild;

  /// 自定义返回响应
  final Function()? onWidgetOut;

  /// 只响应事件，不执行动画
  final bool noBackAnimation;

  @override
  State<HorizontalDragBackWidget> createState() =>
      _HorizontalDragBackWidgetState();
}

class _HorizontalDragBackWidgetState extends State<HorizontalDragBackWidget>
    with SingleTickerProviderStateMixin {
  ///手指按下的x位置
  double startX = -1;

  ///移动的距离
  double offsetX = 0;

  /// 布局宽度
  double width = 0;
  late AnimationController animationController;
  late Tween<double> tween;

  /// 回收动画的最小时长
  int minMilliseconds = 100;

  /// 回收动画的最大时长
  int maxMilliseconds = 200;
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
        if (mounted && !isReset) {
          offsetX = animation.value;
          // print('addListener---offsetX: $offsetX');
          if(!widget.noBackAnimation) {
            setState(() {});
          }
        }
        if (animationController.status == AnimationStatus.completed) {
          if (offsetX > width && !isOut) {
            if(widget.onWidgetOut != null){
              widget.onWidgetOut!.call();
            }else{
              isOut = true;
              Navigator.of(context).pop();
            }
          }
        }
      });
    animation = tween.animate(animationController);
  }

  bool hasHorizontalScroll(BuildContext context) {
    final scrollable = Scrollable.of(context);
    return scrollable.axisDirection == AxisDirection.right ||
        scrollable.axisDirection == AxisDirection.left;
  }

  @override
  Widget build(BuildContext context) {
    print('widget.noBackAnimation----------:${widget.noBackAnimation}');
    width = MediaQuery.of(context).size.width;
    onHorizontalDragStart(DragStartDetails detail) {
      if (!isOnLeftSide) {
        return;
      }
      // print('onHorizontalDragStart: ${detail.localPosition}');
      offsetX = 0;
      startX = detail.localPosition.dx;
    }

    onHorizontalDragEnd(DragEndDetails detail) {
      if (!isOnLeftSide) {
        return;
      }
      if (animationController.isAnimating || isOut) {
        return;
      }
      // print('onHorizontalDragEnd: ${detail.localPosition}');
      // print('onHorizontalDragEnd: ${detail.velocity}');
      _recycleAnimation(velocity: detail.velocity.pixelsPerSecond.dx);
    }

    onHorizontalDragCancel() {
      if (!isOnLeftSide) {
        return;
      }
      if (animationController.isAnimating || isOut) {
        return;
      }
      // print('onHorizontalDragCancel: ');
      _recycleAnimation();
    }

    onHorizontalDragDown(DragDownDetails detail) {
      if (!isOnLeftSide) {
        return;
      }
      // print('onHorizontalDragDown: ${detail.localPosition}');
      offsetX = 0;
      startX = detail.localPosition.dx;
    }

    onHorizontalDragUpdate(DragUpdateDetails detail) {
      // print('onHorizontalDragUpdate: ${detail.localPosition}');
      if (!isOnLeftSide) {
        return;
      }
      if (animationController.isAnimating || isOut) {
        return;
      }
      // print('onHorizontalDragUpdate-offsetX:$offsetX');
      // print('detail.delta.dy:${detail.delta}');
      if (detail.delta.dy.abs() > detail.delta.dx.abs()) {
        return;
      }
      if (startX <= 0) {
        offsetX = 0;
        startX = detail.localPosition.dx;
      }
      // offsetX = detail.localPosition.dx - startX;
      offsetX += detail.delta.dx;
      if (offsetX < 0) {
        offsetX = 0;
      }
      if(!widget.noBackAnimation) {
        setState(() {});
      }
    }

    Widget child = NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        /// 查看滚动容器的depth
        // print('notification:${notification.runtimeType}'
        //     ',pixels:${notification.metrics.pixels}'
        //     ',minScrollExtent:${notification.metrics.minScrollExtent}'
        //     ',axisDirection:${notification.metrics.axisDirection}'
        //     ',depth:${notification.depth}');
        if (notification is OverscrollNotification) {
          // print('notification.metrics.pixels:${notification.metrics.pixels}');
          if (notification.metrics.pixels <=
                  notification.metrics.minScrollExtent &&
              !isOnLeftSide &&
              notification.metrics.axisDirection == AxisDirection.right &&
              startScrollFlag &&
              checkDepth(notification)) {
            //到达左边界
            isOnLeftSide = true;
          }
        }
        if (notification is ScrollUpdateNotification &&
            !isOnLeftSide &&
            startScrollFlag) {
          // print(
          //     'notification.metrics.pixels:${notification.metrics.pixels}');
          if (notification.metrics.pixels <=
                  notification.metrics.minScrollExtent &&
              !isOnLeftSide &&
              notification.metrics.axisDirection == AxisDirection.right &&
              checkDepth(notification)) {
            //到达左边界
            isOnLeftSide = true;
          }
        }
        if (notification is ScrollStartNotification) {
          isOnLeftSide = false;
          //在边界
          if (notification.metrics.pixels <=
                  notification.metrics.minScrollExtent &&
              checkDepth(notification)) {
            startScrollFlag = true;
          }
        }
        if (notification is ScrollEndNotification) {
          startScrollFlag = false;
        }
        // true 阻止向上冒泡 ,false 继续向上冒泡
        return true;
      },
      child: RawGestureDetector(
        gestures: {
          CustomDragGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<CustomDragGestureRecognizer>(
            () => CustomDragGestureRecognizer(),
            (DragGestureRecognizer detector) {
              detector
                ..onDown = onHorizontalDragDown
                ..onStart = onHorizontalDragStart
                ..onUpdate = onHorizontalDragUpdate
                ..onEnd = onHorizontalDragEnd
                ..onCancel = onHorizontalDragCancel;
            },
          )
        },
        child: Stack(
          children: [
            Container(
              color: Color.lerp(Colors.black.withOpacity(.3),
                  Colors.black.withOpacity(.0), offsetX / width),
            ),
            Transform.translate(
                offset: Offset((widget.noBackAnimation?0:offsetX), 0),
                child: widget.child),
          ],
        ),
      ),
    );

    if (!widget.hasScrollChild) {
      child = GestureDetector(
          onHorizontalDragDown: (detail) {
            // print('onHorizontalDragDown');
            //处理没有滚动子组件的情况
            if (!isOnLeftSide) {
              isOnLeftSide = true;
            }
          },
          onHorizontalDragStart: (detail) {
            // print('onHorizontalDragStart');
            //处理没有滚动子组件的情况
            if (!isOnLeftSide) {
              isOnLeftSide = true;
            }
          },
          child: child);
    }
    return PopScope(
      canPop: widget.canPop,
      child: child,
    );
  }

  bool checkDepth(ScrollNotification notification) =>
      widget.responseDepth.contains(notification.depth) ||
      widget.responseDepth.isEmpty;

  ///松手执行回收动画
  void _recycleAnimation({double velocity = 0}) {
    double beforeResetOffsetX = offsetX;
    animationController.reset();
    isReset = true;
    if ((beforeResetOffsetX > 0 && velocity > 700) ||
        (beforeResetOffsetX > 50 && velocity > 500) ||
        (beforeResetOffsetX > width / 5 && velocity >= 250) ||
        beforeResetOffsetX > width * 2 / 5) {
      /// 最后距离大于宽度的 1/5 且停止接触屏幕时移动的速度大于 250 则进入退出动画
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

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
