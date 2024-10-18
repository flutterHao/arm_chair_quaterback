import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
///@auther gejiahui
///created at 2024/10/17/18:42

class OneBoundaryPageScrollPhysics extends ScrollPhysics {
  const OneBoundaryPageScrollPhysics({required this.tabController, super.parent});

  final TabController tabController;

  // @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return OneBoundaryPageScrollPhysics(
        tabController: tabController,
        parent: BouncingScrollPhysics(parent: ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    print('applyBoundaryConditions:${position.pixels},offset:$value');
    if (tabController.index == 0 && value < 0) {
      return value - position.minScrollExtent;
    }
    return super.applyBoundaryConditions(position, value);
  }

}
