import 'package:flutter/cupertino.dart';

///
///@auther gejiahui
///created at 2025/3/20/19:47

class TranslationClipper extends CustomClipper<Path> {
  final double longHeight;
  final double shortHeight;

  TranslationClipper(this.longHeight, this.shortHeight);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, longHeight);
    path.lineTo(0, shortHeight);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


class TranslationProgressClipper extends CustomClipper<Path> {

  TranslationProgressClipper();

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 10);
    path.lineTo(size.width, 0);
    path.lineTo(size.height-10, size.width);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
