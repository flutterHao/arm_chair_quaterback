import 'dart:math';

import 'package:flutter/cupertino.dart';

///
///@auther gejiahui
///created at 2024/9/29/18:28

class CircleClipper extends CustomClipper<Path> {
  CircleClipper({this.leftCut = false});

  final bool leftCut;

  @override
  getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    double radius = size.height /3;
    path.lineTo(size.width - radius, 0);
    path.arcTo(Rect.fromLTWH(size.width - radius * 2, 0, radius*2, radius*2),
        pi / 180 * -90, pi / 180 * 90, false);

    // path.lineTo(size.width, 0);

    double bottomRightRadius = 10;
    path.lineTo(
        size.width - bottomRightRadius, size.height - bottomRightRadius);

    path.arcTo(
        Rect.fromLTWH(
            size.width - bottomRightRadius * 3,
            size.height - bottomRightRadius * 2,
            bottomRightRadius * 2,
            bottomRightRadius * 2),
        0,
        pi / 180 * 90,
        false);
    if(leftCut){
      path.arcTo(Rect.fromLTWH(0, size.height- 2 * radius, radius * 2, radius * 2),
          pi / 180 * 90, pi / 180 * 90, false);

      path.lineTo(
          bottomRightRadius, bottomRightRadius);

      path.arcTo(
          Rect.fromLTWH(
              bottomRightRadius ,
              0,
              bottomRightRadius * 2,
              bottomRightRadius * 2),
          pi ,
          pi / 180 * 90,
          false);
    }else {
      path.lineTo(0, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return true;
  }
}
