/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 17:09:20
 * @LastEditTime: 2024-10-18 20:39:15
 */
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerticalDragBackWidget extends StatefulWidget {
  const VerticalDragBackWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<VerticalDragBackWidget> createState() => _VerticalDragBackWidgetState();
}

class _VerticalDragBackWidgetState extends State<VerticalDragBackWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  var isDragging = false.obs;
  var isOnTopSide = false;

  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 300), // 设置动画持续时间
    // );

    // // 初始化动画
    // animation = Tween(
    //         begin: teamCtrl.myTeamBottom.value,
    //         end: teamCtrl.myTeamBottom.value)
    //     .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    onVerticalDragStart(DragStartDetails detail) {
      if (isOnTopSide) {
        return;
      }
    }

    onVerticalDragEnd(DragEndDetails detail) {
      if (isOnTopSide) {
        return;
      }

      isDragging.value = false;
      _animateToPosition(detail);
    }

    onVerticalDragCancel() {
      if (isOnTopSide) {
        return;
      }
    }

    onVerticalDragDown(DragDownDetails detail) {
      if (isOnTopSide) {
        return;
      }
    }

    onVerticalDragUpdate(DragUpdateDetails details) {
      if (isOnTopSide) {
        return;
      }
      // isDragging.value = true;
      // double newBottom = teamCtrl.myTeamBottom.value - details.delta.dy;
      // newBottom = newBottom.clamp(minBottom, maxBottom);
      // teamCtrl.myTeamBottom.value = newBottom;
    }

    Widget body = GestureDetector(
      // onVerticalDragUpdate: (details) {
      //   if (isOnTopSide) return;
      //   isDragging.value = true;
      //   double newBottom = teamCtrl.myTeamBottom.value - details.delta.dy;
      //   newBottom = newBottom.clamp(minBottom, maxBottom);
      //   teamCtrl.myTeamBottom.value = newBottom;
      // },
      // onVerticalDragEnd: (details) {
      //   if (isOnTopSide) return;
      //   isDragging.value = false;
      //   _animateToPosition(details);
      // },
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          // print('notification:${notification.runtimeType}');
          if (notification is OverscrollNotification) {
            // print('notification.metrics.pixels:${notification.metrics.pixels}');
            if (notification.metrics.pixels <=
                    notification.metrics.minScrollExtent &&
                isOnTopSide &&
                notification.metrics.axisDirection == AxisDirection.down) {
              isOnTopSide = true;
              return false;
            }
          }
          if (notification is ScrollUpdateNotification && isOnTopSide) {
            // print('notification.metrics.pixels:${notification.metrics.pixels}');
            if (notification.metrics.pixels <=
                    notification.metrics.minScrollExtent &&
                isOnTopSide &&
                notification.metrics.axisDirection == AxisDirection.up) {
              isOnTopSide = true;
              return false;
            }
          }
          if (notification is ScrollStartNotification && isOnTopSide) {
            isOnTopSide = false;
            return false;
          }
          // true 阻止向上冒泡 ,false 继续向上冒泡
          return true;
        },
        child: RawGestureDetector(
          gestures: {
            MyVerticalGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                MyVerticalGestureRecognizer>(
              () => MyVerticalGestureRecognizer(),
              (VerticalDragGestureRecognizer detector) {
                detector
                  ..onDown = onVerticalDragDown
                  ..onStart = onVerticalDragStart
                  ..onUpdate = onVerticalDragUpdate
                  ..onEnd = onVerticalDragEnd
                  ..onCancel = onVerticalDragCancel;
              },
            )
          },
          child: widget.child,
        ),
      ),
    );

    return body;
  }

  void _animateToPosition(DragEndDetails details) {
    Log.d(
        "globalPosition:${details.globalPosition},localPosition${details.localPosition.toString()} velocity${details.velocity.toString()}");

    // double targetBottom;
    // Log.d("details:___"+details.toString());
    // if ((teamCtrl.isShow.value && details.localPosition.dy <= 0) ||
    //     (!teamCtrl.isShow.value && details.localPosition.dy >= 0)) {
    //   return;
    // }
    // if (details.velocity.pixelsPerSecond.dy < -1000) {
    //   // targetBottom = maxBottom; // 快速上滑到最大位置
    //   teamCtrl.pageOnTap();
    // } else {
    //   // targetBottom = minBottom; // 否则返回最小位置
    //   teamCtrl.pageOnTap();
    // }
    // teamCtrl.pageOnTap();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class MyVerticalGestureRecognizer extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    //不，我不要失败，我要成功
    //super.rejectGesture(pointer);
    //宣布成功
    super.acceptGesture(pointer);
  }
}
