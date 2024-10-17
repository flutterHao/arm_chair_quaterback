/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 10:54:14
 * @LastEditTime: 2024-10-17 15:50:45
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

///边框容器
class BorderWidget extends StatelessWidget {
  const BorderWidget({
    super.key,
    required this.offset,
    required this.width,
    required this.height,
    required this.child,
    this.onTap,
    this.margin,
    required this.borderRadius,
    this.backgroudColor = AppColors.c262626,
  });

  final double width;
  final double height;
  final EdgeInsets? margin;
  final BorderRadius borderRadius;
  final Offset offset;
  final Function? onTap;
  final Widget child;
  final Color backgroudColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        margin: margin,
        // alignment: Alignment.center,
        width: width + offset.dx.abs(),
        height: height + offset.dy.abs(),
        // decoration: BoxDecoration(
        //   borderRadius: borderRadius,
        // ),
        // alignment: Alignment.center,
        child: Stack(
          clipBehavior: Clip.none, // 确保内容不被剪裁
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: AppColors.cFF7954,
                borderRadius: borderRadius,
              ),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: backgroudColor,
                  borderRadius: borderRadius,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
