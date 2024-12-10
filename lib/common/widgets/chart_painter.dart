import 'dart:ui';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

///
///@auther gejiahui
///created at 2024/10/8/18:07

class ChartPainter extends CustomPainter {
  final List<Offset> listPoint;
  final double height;

  ChartPainter(this.listPoint, this.height) {
    // print('list.len2222:${listPoint.length}');

    var list = listPoint;
    _list2 = [];
    // print('------------height:${height/2}');
    for (int i = 0; i < list.length; i++) {
      var next = list[i + 1 >= list.length ? i : i + 1];
      var current = list[i];
      if ((current.dy > height / 2 && next.dy < height / 2) ||
          (current.dy < height / 2 && next.dy > height / 2)) {
        // print('current:$current,$next');
        var addItem = Offset(((current + next) / 2).dx, height / 2.00);
        // print('addItem:$addItem');
        _list2.add(addItem);
      }
      _list2.add(list[i]);
    }
  }

  var linePaint = Paint()
    ..color = AppColors.cD60D20
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round;

  late List<Offset> _list2;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < _list2.length; i++) {
      var next = _list2[i + 1 >= _list2.length ? i : i + 1];
      var current = _list2[i];
      if (_list2[i].dy > size.height / 2) {
        linePaint.color = AppColors.cD60D20;
      } else {
        linePaint.color = AppColors.c1F8FE5;
      }
      canvas.drawLine(current, next, linePaint);
    }
    // canvas.drawPoints(PointMode.points, _list2, linePaint..color = Colors.green .. strokeWidth = 3);
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) {
    return true;
  }
}
