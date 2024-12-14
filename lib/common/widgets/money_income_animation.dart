import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/14/15:25

class MoneyIncomeAnimation extends StatefulWidget {
  const MoneyIncomeAnimation({
    super.key,
    required this.childWidget,
    required this.randRect,
    required this.targetPosition,
    this.count = 10,
    this.delayDuration = const Duration(milliseconds: 300),
    required this.childSize,
    this.onEnd,
  });

  final Widget childWidget;
  final Size childSize;
  final Rect randRect;
  final Offset targetPosition;
  final int count;
  final Duration delayDuration;
  final Function? onEnd;

  @override
  State<MoneyIncomeAnimation> createState() => _MoneyIncomeAnimationState();
}

class _MoneyIncomeAnimationState extends State<MoneyIncomeAnimation> {
  late int numberOfPositions;
  final Random random = Random();
  List<Offset> positions = [];

  var animationStatus = 0.obs;
  late Offset centerOffset = Offset.zero;

  List<Offset> generateRandomPositions(Rect size) {
    final double maxX = size.width;
    final double maxY = size.height;

    List<Offset> positions = [];
    for (int i = 0; i < numberOfPositions; i++) {
      double x = random.nextDouble() * (maxX - widget.childSize.width);
      double y = random.nextDouble() * (maxY - widget.childSize.height);
      positions.add(Offset(x, y));
    }

    return positions;
  }

  @override
  void initState() {
    super.initState();
    numberOfPositions = widget.count;
    centerOffset = widget.randRect.center;
    positions = generateRandomPositions(widget.randRect);
    Future.delayed(widget.delayDuration, () {
      animationStatus.value = 1;
    });
  }

  @override
  void didUpdateWidget(covariant MoneyIncomeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    animationStatus.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // animationStatus.value = 1;
        // animationStatus.value = !startObs.value;
      },
      child: Stack(
        children: [
          // 绘制随机位置的圆点
          ...positions.map((position) {
            return Obx(() {
              return AnimatedPositioned(
                duration: Duration(milliseconds: random.nextInt(500) + 100),
                onEnd: () {
                  if (animationStatus.value == 2) {
                    widget.onEnd?.call();
                  } else if (animationStatus.value == 1) {
                    Future.delayed(const Duration(milliseconds: 300), () {
                      animationStatus.value = 2;
                    });
                  }
                },
                curve: Curves.easeInOut,
                left: animationStatus.value == 1
                    ? (position.dx + widget.randRect.left)
                    : animationStatus.value == 2
                        ? widget.targetPosition.dx
                        : (centerOffset.dx - widget.childSize.width / 2),
                top: animationStatus.value == 1
                    ? (position.dy + widget.randRect.top)
                    : animationStatus.value == 2
                        ? widget.targetPosition.dy
                        : (centerOffset.dy - widget.childSize.height / 2),
                child: AnimatedOpacity(
                  opacity: animationStatus.value != 0 ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  child: widget.childWidget,
                ),
              );
            });
          }),
        ],
      ),
    );
  }
}
