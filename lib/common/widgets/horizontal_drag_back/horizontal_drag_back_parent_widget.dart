import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:flutter/material.dart';

/// 要放在HorizontalDragBackWidget上层
///@auther gejiahui
///created at 2025/1/22/17:00

class HorizontalDragBackParentWidget extends StatefulWidget {
  const HorizontalDragBackParentWidget({super.key, required this.child});

  final Widget child;

  @override
  State<HorizontalDragBackParentWidget> createState() =>
      _HorizontalDragBackParentWidgetState();
}

class _HorizontalDragBackParentWidgetState
    extends State<HorizontalDragBackParentWidget>
    with SingleTickerProviderStateMixin {
  late StreamController<num> controller = StreamController();
  num? offsetX;
  AnimationController? animationController;

  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    HorizontalDragBackController().addController(controller);
    controller.stream.listen((num value) {
      // print('horizontalDragBack----2222---offsetX: $value');
      if (animationController?.isAnimating ?? false) {
        return;
      }
      if (value == -1) {
        backAnimation();
      } else {
        offsetX = value;
        setState(() {});
      }
    });
  }

  backAnimation() {
    animationController ??= AnimationController(
        vsync: this,
        duration: Duration(milliseconds: Constant.transitionDuration));
    var begin = MediaQuery.of(context).size.width;
    animation = Tween(begin: 0.0, end: begin).animate(animationController!)
      ..addListener(() {
        // print('begin222: ${animation!.value}');
        offsetX = animation!.value;
        if (offsetX == 0) {
          offsetX = null;
        }
        setState(() {});
      });
    animationController?.forward(from: 0);
  }

  @override
  void dispose() {
    HorizontalDragBackController().removeController(controller);
    controller.close();
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return HorizontalDragBackParentState(
      controller: controller,
      child: Transform.translate(
        offset: Offset(
            offsetX == null ? 0 : min(0, (-width + (offsetX ?? 0)) / 10 * 3),
            0),
        child: widget.child,
      ),
    );
  }
}

class HorizontalDragBackParentState extends InheritedWidget {
  final StreamController<num> controller;

  const HorizontalDragBackParentState(
      {super.key, required this.controller, required super.child});

  @override
  bool updateShouldNotify(covariant HorizontalDragBackParentState oldWidget) {
    return oldWidget.controller != controller;
  }

  static HorizontalDragBackParentState? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HorizontalDragBackParentState>();
  }
}

class HorizontalDragBackController {
  final List<StreamController> _controllers = [];

  static final HorizontalDragBackController _instance =
      HorizontalDragBackController._();

  factory HorizontalDragBackController() => _instance;

  void addController(StreamController controller) {
    _controllers.add(controller);
  }

  void removeController(StreamController controller) {
    _controllers.remove(controller);
  }

  void notify(num value, {bool hasDragBackParent = false}) {
    if (_controllers.isEmpty) {
      return;
    }
    if (hasDragBackParent) {
      var length = _controllers.length;
      if (length < 2) {
        return;
      }
      var controller = _controllers[length - 2];
      controller.add(value);
    } else {
      _controllers.last.add(value);
    }
  }

  HorizontalDragBackController._();
}
