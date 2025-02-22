import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScrollHideBottomBar extends StatefulWidget {
  final Widget child;
  final Widget bottomBar;
  final ScrollHideBottomBarController? controller;

  const ScrollHideBottomBar({
    super.key,
    required this.child,
    required this.bottomBar,
    this.controller,
  });

  @override
  State<ScrollHideBottomBar> createState() => _ScrollHideBottomBarState();
}

class _ScrollHideBottomBarState extends State<ScrollHideBottomBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  final double _bottomBarHeight = 80.0; // 底部栏高度，根据实际调整

  @override
  void initState() {
    super.initState();
    widget.controller?._changeHideStatus = changeHideStatus;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    // 偏移动画：0 -> 完全显示，1 -> 完全隐藏（向下移动底部栏高度）
    _offsetAnimation = Tween<double>(
      begin: 0,
      end: -_bottomBarHeight.w,
    ).animate(_animationController);

    // 透明度动画：显示时为1，隐藏时变为0.2
    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0,
    ).animate(_animationController);

    _offsetAnimation.addListener(() {});
  }

  void _handleScroll(double delta) {
    // 将滚动距离转换为动画进度的变化量
    double deltaValue = delta / _bottomBarHeight.w;
    double newValue = _animationController.value + deltaValue;

    // 限制动画进度在0到1之间
    newValue = newValue.clamp(0.0, 1.0);
    _animationController.value = newValue;
    bool shouldHide = _animationController.value > 0.5;
    if (shouldHide != widget.controller?.barHideStatus.value) {
      widget.controller?.barHideStatus.value = shouldHide;
    }
  }

  void _handleScrollEnd(ScrollEndNotification notification) {
    bool atEdge = notification.metrics.extentAfter == 0 ||
        notification.metrics.extentBefore == 0;
    if (atEdge) {
      changeHideStatus(false);
      return;
    }
    bool shouldHide = _animationController.value > 0.5;
    double targetValue = _animationController.value > 0.5 ? 1.0 : 0.0;
    if (shouldHide != widget.controller?.barHideStatus.value) {
      widget.controller?.barHideStatus.value = shouldHide;
    }
    _animateTo(targetValue);
  }

  /// true:hide false:show
  changeHideStatus(bool hide) {
    // if (widget.controller?.barHideStatus.value == hide) {
    //   return;
    // }
    double targetValue = hide ? 1.0 : 0.0;
    widget.controller?.barHideStatus.value = hide;
    _animateTo(targetValue);
  }

  // 启动动画
  void _animateTo(double targetValue) {
    _animationController.animateTo(
      targetValue,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.axis != Axis.vertical) return true;
            if (notification is ScrollEndNotification) {
              if (notification.metrics.pixels >= 0) {
                _handleScrollEnd(notification);
              }
            } else if (notification is ScrollUpdateNotification) {
              if (notification.metrics.pixels > 0 &&
                  notification.metrics.pixels <=
                      notification.metrics.maxScrollExtent &&
                  notification.scrollDelta != null) {
                _handleScroll(notification.scrollDelta!);
              }
            } else if (notification is ScrollStartNotification) {
              // 滚动开始时重置方向
            }
            return true;
          },
          child: widget.child,
        ),

        // 底部栏动画
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              bottom: _offsetAnimation.value,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: widget.bottomBar,
              ),
            );
          },
        ),
      ],
    );
  }
}

class ScrollHideBottomBarController {
  var barHideStatus = false.obs;
  Function(bool hide)? _changeHideStatus;

  void changeHideStatus(bool hide) {
    _changeHideStatus?.call(hide);
  }
}
