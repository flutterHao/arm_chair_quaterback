import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///投篮篮球轨迹
///@auther gejiahui
///created at 2024/12/17/20:33

class BallPathPainter extends CustomPainter {
  BallPathPainter(
      {required this.offsets, required this.progress, required this.color});

  final List<Offset> offsets;
  final double progress;
  final Color color;

  var maxPaintWidth = 2.5;
  var linePaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < offsets.length; i++) {
      var p = (offsets.length-i)/offsets.length;
      linePaint
        ..color = color.withOpacity(max(0.1,p))
        ..strokeWidth = max(1,maxPaintWidth*p)
        ..strokeCap = StrokeCap.round;
      var c = Offset(size.width-offsets[i].dx-2.5.w, offsets[i].dy+2.w);
      // if(i == 0){
        // canvas.drawCircle(c, 10, Paint()..color=Colors.green);
      // }
      if (i + 1 < offsets.length) {
        var next = Offset(size.width-offsets[1+i].dx-2.5.w, offsets[1+i].dy+2.w);
        canvas.drawLine(c, next, linePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant BallPathPainter oldDelegate) {
    return offsets.length != oldDelegate.offsets.length;
  }
}
