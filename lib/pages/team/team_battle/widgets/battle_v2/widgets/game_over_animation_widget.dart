import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2025/3/24/11:16

class GameOverAnimationWidget extends StatefulWidget {
  const GameOverAnimationWidget(
      {super.key,
      required this.status,
      required this.firstChild,
      this.secondChild});

  /// status: false 显示 firstChild ， true 显示 secondChild
  final bool status;
  final Widget firstChild;
  final Widget? secondChild;

  @override
  State<GameOverAnimationWidget> createState() =>
      _GameOverAnimationWidgetState();
}

class _GameOverAnimationWidgetState extends State<GameOverAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation outerTranslateAnimation;
  late Animation outerOpacityAnimation;

  late Animation enterTranslateAnimation;
  late Animation enterOpacityAnimation;

  @override
  void initState() {
    super.initState();
    var milliseconds = 1000;
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));

    outerTranslateAnimation = Tween(begin: 0.0, end: 20.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0, 500 / milliseconds)));
    outerOpacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0, 500 / milliseconds)));

    enterTranslateAnimation = Tween(begin: 20.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(500 / milliseconds, 1000 / milliseconds)));
    enterOpacityAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(500 / milliseconds, 1000 / milliseconds)));
  }

  @override
  void didUpdateWidget(covariant GameOverAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.status != widget.status) {
      animationController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
            animation: Listenable.merge(
                [outerOpacityAnimation, outerTranslateAnimation]),
            builder: (context, child) {
              return Transform.translate(
                  offset: Offset(0, outerTranslateAnimation.value),
                  child: Opacity(
                      opacity: outerOpacityAnimation.value,
                      child: widget.firstChild));
            }),
        if (widget.status)
          AnimatedBuilder(
              animation: Listenable.merge(
                  [enterTranslateAnimation, enterOpacityAnimation]),
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(0, enterTranslateAnimation.value),
                    child: Opacity(
                        opacity: enterOpacityAnimation.value,
                        child: widget.secondChild));
              }),
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
