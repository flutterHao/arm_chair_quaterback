import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/9/14/10:03

class TLBuildWidget extends StatefulWidget {
  const TLBuildWidget(
      {required this.controller, required this.builder, super.key});

  final TabController controller;
  final Widget Function(
      int current, int next, double progress, double totalProgress) builder;

  @override
  State<TLBuildWidget> createState() => _TLBuildWidgetState();
}

class _TLBuildWidgetState extends State<TLBuildWidget> {
  double animationValue = 0;

  late int currentIndex, next;

  // progress 从current到next的进度，值范围0-1；
  // totalProgress 0到最大下标之间的进度，值范围0-length;
  double progress = 0, totalProgress = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = next = widget.controller.index;
    totalProgress = widget.controller.index.toDouble();
    widget.controller.animation?.addListener(() {
      animationValue = widget.controller.animation?.value ?? 0;
      currentIndex = widget.controller.index;
      totalProgress = animationValue;
      next =
          animationValue > currentIndex ? currentIndex + 1 : currentIndex - 1;
      progress = (animationValue - currentIndex).abs();
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(currentIndex, next, progress, totalProgress);
  }
}
