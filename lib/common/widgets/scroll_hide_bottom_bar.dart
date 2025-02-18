import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScrollHideBottomBar extends StatefulWidget {
  final Widget child;
  final Widget bottomBar;

  const ScrollHideBottomBar({
    super.key,
    required this.child,
    required this.bottomBar,
  });

  @override
  State<ScrollHideBottomBar> createState() => _ScrollHideBottomBarState();
}

class _ScrollHideBottomBarState extends State<ScrollHideBottomBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  ScrollDirection _lastScrollDirection = ScrollDirection.idle;
  final double _bottomBarHeight = 80.0; // 底部栏高度，根据实际调整

  @override
  void initState() {
    super.initState();
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

    // 记录最后滚动方向
    _lastScrollDirection =
        delta > 0 ? ScrollDirection.down : ScrollDirection.up;
  }

  void _handleScrollEnd(ScrollEndNotification notification) {
    bool shouldHide;

    // 根据滚动方向决定是否隐藏
    if (_lastScrollDirection == ScrollDirection.down) {
      shouldHide = true;
    } else if (_lastScrollDirection == ScrollDirection.up) {
      shouldHide = false;
      if (notification.metrics.pixels >= notification.metrics.maxScrollExtent)
        shouldHide = true;
    } else {
      // 无滚动方向时，根据当前位置判断
      shouldHide = _animationController.value > 0.5;
    }

    // 目标动画值
    final double targetValue = shouldHide ? 1.0 : 0.0;

    // 启动动画
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
              _lastScrollDirection = ScrollDirection.idle;
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

enum ScrollDirection { idle, up, down }
