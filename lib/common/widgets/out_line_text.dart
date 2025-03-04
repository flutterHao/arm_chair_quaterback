import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double strokeWidth;
  final Color strokeColor;
  final int? maxLines;

  const OutlinedText({
    super.key,
    required this.text,
    required this.textStyle,
    this.strokeWidth = 3,
    this.strokeColor = Colors.white,
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
          ),
        ),
        // 填充文字
        Text(text, maxLines: maxLines, style: textStyle),
      ],
    );
  }
}
