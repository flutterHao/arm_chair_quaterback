///
///@auther gejiahui
///created at 2024/10/8/10:45

import 'dart:math';

import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis; // 水平方向 & 垂直方向
  final double dashedWidth; // 虚线宽度
  final double dashedHeight; // 虚线高度
  final int count; // 虚线总个数
  final Color dashedColor; // 虚线颜色

  const DashedLine({
    super.key,
    required this.axis,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.dashedColor = const Color(0xffff0000),
  });

  Widget showDashedLineWidgets() {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: dashedColor,
                borderRadius:
                    BorderRadius.circular(max(dashedHeight, dashedWidth))),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return axis == Axis.horizontal
          ? SizedBox(
              width: constraints.maxWidth, child: showDashedLineWidgets())
          : SizedBox(
              height: constraints.minHeight, child: showDashedLineWidgets());
    });
  }
}
