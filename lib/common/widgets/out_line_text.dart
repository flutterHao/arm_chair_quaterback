/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-05 09:53:29
 * @LastEditTime: 2025-03-04 19:25:12
 */
import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double strokeWidth;
  final Color strokeColor;
  final List<Shadow> shadows; // 添加投影属性
  final int? maxLines;

  const OutlinedText({
    super.key,
    required this.text,
    required this.textStyle,
    this.strokeWidth = 3,
    this.strokeColor = Colors.white,
    this.shadows = const [], // 默认无投影
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 描边
        Text(
          text,
          maxLines: maxLines,
          style: textStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
            shadows: shadows, // 添加投影
          ),
        ),
        // 填充文字
        Text(
          text,
          style: textStyle.copyWith(
            shadows: shadows, // 添加投影
          ),
        ),
        Text(text, maxLines: maxLines, style: textStyle),
      ],
    );
  }
}
