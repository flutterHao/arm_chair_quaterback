import 'package:flutter/animation.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/11/09:45

class EasyAnimationController<T> {
  EasyAnimationController(
      {required TickerProvider vsync,
      required T begin,
      required T end,
      Duration duration = const Duration(milliseconds: 3000),
      List<T>? node, //未使用
      Curve? curve})
      : assert((curve != null || T is double) || curve == null,
            "'T' must be double when use curve") {
    value = Rx(begin);

    _animationController =
        AnimationController(vsync: vsync, duration: duration);
    _animationController.addListener(_animationListener);
    _tween = Tween(begin: begin, end: end);
    if (curve != null) {
      CurvedAnimation curvedAnimation = CurvedAnimation(
          parent: _animationController as Animation<double>, curve: curve);
      _animation = _tween.animate(curvedAnimation);
    } else {
      _animation = _tween.animate(_animationController);
    }
  }

  void _animationListener() {
    value.value = _animation.value;
  }

  late AnimationController _animationController;
  late Animation<T> _animation;
  late Tween<T> _tween;
  late Rx<T> value;

  AnimationController get controller => _animationController;

  Animation get animation => _animation;

  dispose() {
    controller.dispose();
  }

  forward({double? from}) {
    controller.forward(from: from);
  }

  reset() {
    controller.reset();
  }

  reverse({double? from}) {
    controller.reverse(from: from);
  }

  void stop({bool canceled = true}) {
    controller.stop(canceled: canceled);
  }

  void set(T begin,T end,{Curve? curve}){
    _tween = Tween(begin: begin, end: end);
    if (curve != null) {
      CurvedAnimation curvedAnimation = CurvedAnimation(
          parent: _animationController as Animation<double>, curve: curve);
      _animation = _tween.animate(curvedAnimation);
    } else {
      _animation = _tween.animate(_animationController);
    }
  }
}
