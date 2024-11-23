import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/11/12/14:27


class TitleBarClipper extends CustomClipper<Path>{

  final double rightWidth;

  TitleBarClipper(this.rightWidth);
  
  @override
  Path getClip(Size size) {
    var path = Path();  
    path.moveTo(0, size.height-3.w);
    path.lineTo(size.width-12.w-rightWidth, size.height-3.w);
    path.arcTo(Rect.fromLTWH(size.width-24.w-rightWidth, 20.w, 24.w, 24.w), pi/180*90, pi/180 * -90, false);
    path.lineTo(size.width-rightWidth, 12.w);
    path.arcTo(Rect.fromLTWH(size.width-rightWidth, 0, 24.w, 24.w), pi/180*180, pi/180*90, false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}