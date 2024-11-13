import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///
///@auther gejiahui
///created at 2024/11/12/16:59

class FixedHeightSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  FixedHeightSliverHeaderDelegate({required this.child, required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant FixedHeightSliverHeaderDelegate oldDelegate) {
    return height != oldDelegate.height|| child != oldDelegate.child;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      const PersistentHeaderShowOnScreenConfiguration(
          minShowOnScreenExtent: double.infinity);
}
