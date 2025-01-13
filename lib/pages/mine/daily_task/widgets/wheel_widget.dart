import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/10/14:18

class WheelWidget extends StatefulWidget {
  const WheelWidget({
    super.key,
    required this.rowCount,
    required this.columnCount,
    required this.itemWidth,
    required this.itemHeight,
    required this.radius,
    required this.bigRadius,
    required this.builder,
    this.controller,
  });

  final int rowCount;
  final int columnCount;
  final double itemWidth;
  final double itemHeight;
  final double radius;
  final double bigRadius;
  final Widget Function(int index) builder;
  final WheelController? controller;

  @override
  State<WheelWidget> createState() => _WheelWidgetState();
}

class _WheelWidgetState extends State<WheelWidget>
    with SingleTickerProviderStateMixin {
  /// 总数
  int size = 0;

  /// 四个角落的下标
  List<int> cornerItemIndexList = [];

  late EasyAnimationController animationController;

  var isAnimatingStatus = false.obs;
  var isAnimateEnd = false.obs;

  @override
  void initState() {
    super.initState();
    size = widget.rowCount * 2 + (widget.columnCount - 2) * 2;
    animationController = EasyAnimationController(
        vsync: this,
        begin: 0,
        end: size * 4,
        duration: const Duration(milliseconds: 300 * 4),
        curve: Curves.easeOut);
    cornerItemIndexList = [
      0,
      widget.rowCount - 1,
      widget.rowCount + widget.columnCount - 2,
      widget.rowCount + widget.columnCount + widget.rowCount - 3
    ];
    if (widget.controller != null) {
      widget.controller!._startWheel = startWheel;
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  startWheel() {
    if (animationController.controller.isAnimating) {
      return;
    }
    Random random = Random();
    var nextInt = random.nextInt(4) + 5;
    animationController.set(0, size * nextInt + nextInt,
        curve: Curves.easeOut, duration: const Duration(milliseconds: 800 * 6));
    isAnimatingStatus.value = true;
    isAnimateEnd.value = false;
    animationController.forward(from: 0).then((_) {
      /// 动画结束 开启其他动画
      Future.delayed(const Duration(milliseconds: 300),(){
        isAnimatingStatus.value = false;
        isAnimateEnd.value = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(size, (index) {
        int connerIndex = cornerItemIndexList.indexOf(index);
        BorderRadius borderRadius;
        if (connerIndex != -1) {
          if (connerIndex == 0) {
            borderRadius = BorderRadius.only(
              topLeft: Radius.circular(widget.bigRadius),
              topRight: Radius.circular(widget.radius),
              bottomLeft: Radius.circular(widget.radius),
              bottomRight: Radius.circular(widget.radius),
            );
          } else if (connerIndex == 1) {
            borderRadius = BorderRadius.only(
              topRight: Radius.circular(widget.bigRadius),
              topLeft: Radius.circular(widget.radius),
              bottomLeft: Radius.circular(widget.radius),
              bottomRight: Radius.circular(widget.radius),
            );
          } else if (connerIndex == 2) {
            borderRadius = BorderRadius.only(
              bottomRight: Radius.circular(widget.bigRadius),
              topRight: Radius.circular(widget.radius),
              bottomLeft: Radius.circular(widget.radius),
              topLeft: Radius.circular(widget.radius),
            );
          } else {
            borderRadius = BorderRadius.only(
              bottomLeft: Radius.circular(widget.bigRadius),
              topRight: Radius.circular(widget.radius),
              topLeft: Radius.circular(widget.radius),
              bottomRight: Radius.circular(widget.radius),
            );
          }
        } else {
          borderRadius = BorderRadius.circular(widget.radius);
        }
        double left = 0, top = 0;
        double w = widget.itemWidth + 3.w;
        double h = widget.itemHeight + 3.w;
        if (index <= cornerItemIndexList[1]) {
          left = index * w;
          top = 0;
        } else if (index <= cornerItemIndexList[2]) {
          left = (widget.rowCount - 1) * w;
          top = (index - cornerItemIndexList[1]) * h;
        } else if (index <= cornerItemIndexList[3]) {
          left = (cornerItemIndexList[3] - index) * w;
          top = (widget.columnCount - 1) * h;
        } else {
          left = 0;
          top = (size - index) * h;
        }

        return Positioned(
            left: left,
            top: top,
            child: Obx(() {
              //todo 选中状态
              int value = (animationController.value.value % size).toInt();
              var isFirst = (index == value && isAnimatingStatus.value);
              var isSecond = (index == value - 1 && isAnimatingStatus.value);
              var isThird = (index == value - 2 && isAnimatingStatus.value);
              var isFour = (index == value - 3 && isAnimatingStatus.value);
              Color bgColor, borderColor,shadowColor;
              if (isFirst) {
                bgColor = AppColors.cFFFFFF;
                borderColor = AppColors.cFF7954;
                shadowColor = AppColors.cFF7954;
              } else if (isSecond) {
                bgColor = AppColors.cFFFFFF.withOpacity(0.8);
                borderColor = AppColors.cFF7954.withOpacity(0.8);
                shadowColor = AppColors.cFF7954.withOpacity(0.8);
              } else if (isThird) {
                bgColor = AppColors.cFFFFFF.withOpacity(0.6);
                borderColor = AppColors.cFF7954.withOpacity(0.6);
                shadowColor = AppColors.cFF7954.withOpacity(0.6);
              } else if (isFour) {
                bgColor = AppColors.cFFFFFF.withOpacity(0.4);
                borderColor = AppColors.cFF7954.withOpacity(0.4);
                shadowColor = AppColors.cFF7954.withOpacity(0.4);
              }else if(index == value && isAnimateEnd.value){
                bgColor = AppColors.cFF7954;
                borderColor = AppColors.cFF7954;
                shadowColor = AppColors.cTransparent;
              } else {
                bgColor = AppColors.c000000;
                borderColor = AppColors.c4c4c4c;
                shadowColor = AppColors.c000000;
              }

              return Stack(
                children: [
                  Container(
                    width: widget.itemWidth,
                    height: widget.itemHeight,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                      boxShadow: isFirst || isSecond || isThird
                          ? [
                        BoxShadow(
                          color: shadowColor,
                          offset: const Offset(0, 0),
                          blurRadius: 3.w,
                          spreadRadius: 2.w,
                        )
                      ]
                          : [],
                    ),
                  ),
                  Container(
                    width: widget.itemWidth,
                    height: widget.itemHeight,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: borderRadius,
                      border: Border.all(
                        color: borderColor,
                        width: isFirst || isSecond || isThird
                            ? 2.w
                            : 1.w,
                      ),
                    ),
                    child: widget.builder(index),
                  ),
                ],
              );
            }));
      }),
    );
  }
}

class WheelController {
  Function()? _startWheel;

  start() {
    return _startWheel?.call();
  }
}
