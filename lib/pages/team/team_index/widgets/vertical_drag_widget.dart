/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 17:09:20
 * @LastEditTime: 2024-10-14 12:18:14
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
    this.onWidgetOut,
    super.key,
  });

  final Widget child;
  final Function()? onWidgetOut;

  @override
  State<VerticalDragBackWidget> createState() => _VerticalDragBackWidgetState();
}

class _VerticalDragBackWidgetState extends State<VerticalDragBackWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  var isDragging = false.obs;

  final double minBottom = -546.0.h; // 最小位置
  final double maxBottom = 0.h; // 最大位置

  TeamIndexController teamCtrl = Get.find();

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
      if (!teamCtrl.isOnTopSide) {
        return;
      }
      // print('onHorizontalDragStart: ${detail.localPosition}');
      // startX = detail.localPosition.dx;
    }

    onVerticalDragEnd(DragEndDetails detail) {
      if (!teamCtrl.isOnTopSide) {
        return;
      }

      isDragging.value = false;
      _animateToPosition(detail);
      // if(animationController.isAnimating || isOut){
      //   return;
      // }
      // // print('onHorizontalDragEnd: ${detail.localPosition}');
      // // print('onHorizontalDragEnd: ${detail.velocity}');
      // _recycleAnimation(velocity: detail.velocity.pixelsPerSecond.dx);

      //       isDragging.value = false;
      // _animateToPosition(detail);
    }

    onVerticalDragCancel() {
      if (!teamCtrl.isOnTopSide) {
        return;
      }
      // if(animationController.isAnimating || isOut){
      //   return;
      // }
      // // print('onHorizontalDragCancel: ');
      // _recycleAnimation();
    }

    onVerticalDragDown(DragDownDetails detail) {
      if (!teamCtrl.isOnTopSide) {
        return;
      }
      // print('onHorizontalDragDown: ${detail.localPosition}');
      // startX = detail.localPosition.dx;
    }

    onVerticalDragUpdate(DragUpdateDetails details) {
      if (!teamCtrl.isOnTopSide) {
        return;
      }
      Log.d("onVerticalDragUpdate: ${details.delta}");
      isDragging.value = true;
      double newBottom = teamCtrl.myTeamBottom.value - details.delta.dy;
      newBottom = newBottom.clamp(minBottom, maxBottom);
      teamCtrl.myTeamBottom.value = newBottom;
    }

    Widget body = GestureDetector(
      // onVerticalDragUpdate: (details) {
      //   isDragging.value = true;
      //   double newBottom = teamCtrl.myTeamBottom.value - details.delta.dy;
      //   newBottom = newBottom.clamp(minBottom, maxBottom);
      //   teamCtrl.myTeamBottom.value = newBottom;
      // },
      // onVerticalDragEnd: (details) {
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
                !teamCtrl.isOnTopSide &&
                notification.metrics.axisDirection == AxisDirection.down) {
              teamCtrl.isOnTopSide = true;
              return false;
            }
          }
          if (notification is ScrollUpdateNotification &&
              !teamCtrl.isOnTopSide) {
            // print('notification.metrics.pixels:${notification.metrics.pixels}');
            if (notification.metrics.pixels <=
                    notification.metrics.minScrollExtent &&
                !teamCtrl.isOnTopSide &&
                notification.metrics.axisDirection == AxisDirection.up) {
              teamCtrl.isOnTopSide = true;
              return false;
            }
          }
          if (notification is ScrollStartNotification && teamCtrl.isOnTopSide) {
            teamCtrl.isOnTopSide = false;
            return false;
          }
          // true 阻止向上冒泡 ,false 继续向上冒泡
          return true;
        },
        child: RawGestureDetector(
          gestures: {
            CustomTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
                CustomTapGestureRecognizer>(
              () => CustomTapGestureRecognizer(),
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

    return Obx(() {
      return AnimatedPositioned(
          duration: Duration(milliseconds: isDragging.value ? 0 : 300),
          bottom: teamCtrl.myTeamBottom.value,
          left: 0,
          right: 0,
          child: body);
    });
  }

  void _animateToPosition(DragEndDetails details) {
    Log.d(
        "globalPosition:${details.globalPosition},localPosition${details.localPosition.toString()} velocity${details.velocity.toString()}");

    // double targetBottom;
    if ((teamCtrl.isShow.value && details.localPosition.dy <= 0) ||
        (!teamCtrl.isShow.value && details.localPosition.dy >= 0)) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dy < -1000) {
      // targetBottom = maxBottom; // 快速上滑到最大位置
      teamCtrl.pageOnTap();
    } else {
      // targetBottom = minBottom; // 否则返回最小位置
      teamCtrl.pageOnTap();
    }
    // teamCtrl.pageOnTap();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class CustomTapGestureRecognizer extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    //不，我不要失败，我要成功
    //super.rejectGesture(pointer);
    //宣布成功
    super.acceptGesture(pointer);
  }
}
