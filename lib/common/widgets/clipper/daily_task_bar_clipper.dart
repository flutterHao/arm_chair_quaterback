import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2025/1/22/09:53

class DailyTaskBarClipper extends CustomClipper<Path>{

  final double rightWidth;

  DailyTaskBarClipper(this.rightWidth);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width-12.w-rightWidth, size.height-3.w);
    path.arcTo(Rect.fromLTWH(size.width-24.w-rightWidth, 20.w, 24.w, 24.w), pi/180*90, pi/180 * -90, false);
    path.lineTo(size.width-rightWidth, 12.w);
    path.arcTo(Rect.fromLTWH(size.width-rightWidth, 0, 24.w, 24.w), pi/180*180, pi/180*90, false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height-3.w);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}