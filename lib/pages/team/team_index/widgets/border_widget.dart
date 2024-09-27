import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///边框容器
class BorderWidget extends StatelessWidget {
  const BorderWidget({
    super.key,
    required this.offset,
    required this.width,
    required this.height,
    required this.child,
    required this.onTap,
    this.margin,
    required this.borderRadius,
  });
  final double width;
  final double height;
  final EdgeInsets? margin;
  final BorderRadius borderRadius;
  final Offset offset;
  final Function onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: AppColors.cFF7954, borderRadius: borderRadius),
          ),
        ),
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.c262626,
                borderRadius: borderRadius,
              ),
              child: child),
        )
      ],
    );
  }
}
