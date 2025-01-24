import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_route_observer.dart';
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
  late _HorizontalDragBackController<num> controller =
      _HorizontalDragBackController();
  num? offsetX;
  AnimationController? animationController;

  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    HorizontalDragBackController().addController(
        HorizontalRouteObserver.getInstance().history.length, controller);
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
    controller.dispose();
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
  final _HorizontalDragBackController<num> controller;

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
  final Map<int, _HorizontalDragBackController> _controllers = {};


  static final HorizontalDragBackController _instance =
      HorizontalDragBackController._();

  factory HorizontalDragBackController() => _instance;

  void addController(int page, _HorizontalDragBackController controller) {
    _controllers[page] = controller;
  }

  void removeController(_HorizontalDragBackController controller) {
    _controllers.remove(controller);
  }

  void removeIndex(int page) {
    _controllers.removeWhere((e, _) => e == page);
  }

  void notify(num value) {
    if (_controllers.isEmpty) {
      return;
    }
    var index = HorizontalRouteObserver.getInstance().history.length-1;
    _controllers[index]?.add(value);
  }

  HorizontalDragBackController._();
}

class _HorizontalDragBackController<T> {
  final StreamController<T> _controller = StreamController<T>();
  int flag = 0;

  _HorizontalDragBackController();

  Stream<T> get stream => _controller.stream;

  void add(T event) {
    _controller.add(event);
  }

  dispose() {
    _controller.close();
  }
}
