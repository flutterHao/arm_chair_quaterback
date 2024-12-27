import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/25/18:11
/// 自定义 Controller 用于控制滚动

class SlotListViewWidget extends StatefulWidget {
  const SlotListViewWidget(
      {required this.controller,
      super.key,
      required this.itemBuilder,
      required this.itemCount,
      this.onEnd,
      this.viewportFraction = 0.38});

  final SlotMachineController controller;
  final int itemCount;
  final double viewportFraction;
  final Widget Function(BuildContext context, int index, int selectIndex)
      itemBuilder;
  final void Function(int value)? onEnd;

  @override
  State<SlotListViewWidget> createState() => _SlotListViewWidgetState();
}

class _SlotListViewWidgetState extends State<SlotListViewWidget>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  final Random _random = Random();
  var selectIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: widget.itemCount * 1000, // 设置初始页面为中间，避免快速滑到边界
    );
    widget.controller._bindSpinCallback(_spin);
  }

  void _spin(int spins, int index, Duration duration) async {
    // 计算随机目标页面
    final int currentPage = _pageController.page!.toInt();
    final int s = spins * widget.itemCount; // 设置滚动圈数
    int randomTarget = index;

    /// 设置滚动目标下标
    randomTarget = randomTarget - currentPage % widget.itemCount;
    final int targetPage = currentPage + s + randomTarget;

    widget.controller._isAnimating = true;
    // 动画滚动到目标页面
    await _pageController.animateToPage(
      targetPage,
      duration: duration,
      curve: Curves.easeOutExpo, // 逐渐减速的效果
    );
    widget.controller._isAnimating = false;

    // 修正最终位置到循环索引
    final int finalPage = targetPage % widget.itemCount;
    _pageController.jumpToPage(widget.itemCount * 1000 + finalPage);
    widget.onEnd?.call(selectIndex % widget.itemCount);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: (v) => setState(() {
        selectIndex = v;
      }),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final int realIndex = index % widget.itemCount;
        final int realCurrentIndex = selectIndex % widget.itemCount;
        return widget.itemBuilder(context, realIndex, realCurrentIndex);
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

/// 自定义 Controller，用于控制 SlotMachine
class SlotMachineController {
  void Function(int spins, int index, Duration duration)? _spinCallback;
  bool _isAnimating = false;

  /// 外部调用此方法触发滚动 spins 圈数 index 目标位置
  void spin(
      {int spins = 3,
      int index = 0,
      Duration duration = const Duration(seconds: 4)}) {
    if (_spinCallback != null) {
      _spinCallback!(spins, index, duration);
    } else {
      throw Exception(
          "SlotMachineController is not attached to a SlotMachine.");
    }
  }

  /// 内部绑定滚动逻辑
  void _bindSpinCallback(
      void Function(int spins, int index, Duration duration) spinCallback) {
    _spinCallback = spinCallback;
  }

  bool get isAnimating => _isAnimating;
}
