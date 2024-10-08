import 'package:flutter/cupertino.dart';

///
///@auther gejiahui
///created at 2024/10/8/14:51

class LineChartClipper extends CustomClipper<Path> {
  final List<Offset> points;

  LineChartClipper(this.points);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height / 2);
    for (var offset in points) {
      path.lineTo(offset.dx, offset.dy);
    }
    if (points.isNotEmpty) {
      path.lineTo(points[points.length - 1].dx, size.height / 2);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(LineChartClipper oldClipper) {
    return true;
    return points.length != oldClipper.points.length;
  }
}
