import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

///
///@auther gejiahui
///created at 2024/10/17/18:42

class OneBoundaryScrollPhysics extends ScrollPhysics {
  OneBoundaryScrollPhysics({required this.scrollController, super.parent}) {
    startPixels = scrollController.initialScrollOffset;
    scrollController.addListener(() {
      // print('pixels---:${scrollController.position.pixels}');
      // print('userScrollDirection---:${scrollController.position.userScrollDirection}');
      // print('scrollController.position.isScrollingNotifier:${scrollController.position.isScrollingNotifier.value}');
      if (listener == null) {
        scrollController.position.isScrollingNotifier
            .addListener(listener = () {
          // print('scrollController.position.isScrollingNotifier22222-----:${scrollController.position.isScrollingNotifier.value}');
          // print('pixels11111---:${scrollController.position.pixels}');

          if (scrollController.position.isScrollingNotifier.value) {
            startPixels = scrollController.position.pixels;
            // print('pixels22222---:${scrollController.position.pixels}');
          } else {
            startPixels = 0;
          }
        });
      }
    });
  }

  final ScrollController scrollController;
  Function? listener;

  // 开始滑动时候滚动位置的缓存
  double startPixels = 0;

  // @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return OneBoundaryScrollPhysics(
        scrollController: scrollController,
        parent: BouncingScrollPhysics(parent: ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    if (startPixels == 0 && value < 0) {
      return value - position.minScrollExtent;
    }
    return super.applyBoundaryConditions(position, value);
  }
}
