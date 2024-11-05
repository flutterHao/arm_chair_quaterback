import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///@author lihonghao
///@date 2024/9/9
///@description 可设置颜色图标

/// @author lihonghao
/// @date 2024/9/9
/// @description 可设置颜色和旋转的图标
class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.iconWidth,
    this.iconHeight,
    required this.icon,
    this.backgroudWitdh,
    this.backgroudheight,
    this.borderRadius,
    this.iconColor,
    this.backgroudColor,
    this.border,
    // this.rotation = 0.0,
    this.rotateAngle,
    this.fit,
  });

  final double iconWidth;
  final double? iconHeight;
  final String icon;
  final Color? iconColor;
  final double? backgroudWitdh;
  final double? backgroudheight;
  final BorderRadius? borderRadius;
  final Color? backgroudColor;
  final Border? border;
  // final double rotation; // 添加旋转角度
  final double? rotateAngle;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    Image image = Image.asset(
      icon,
      width: iconWidth,
      height: iconHeight,
      fit: fit ?? BoxFit.fill,
      // errorBuilder: (context, error, stackTrace) {
      //   // 可能需要更换为缺省图
      //   return Container(
      //     width: double.infinity,
      //     height: double.infinity,
      //     color: Colors.white,
      //     alignment: Alignment.center,
      //   );
      // },
    );

    // 过多使用 colorFilter 会对性能有影响
    Widget iconWidget = iconColor != null
        ? ColorFiltered(
            colorFilter: ColorFilter.mode(
              iconColor!,
              BlendMode.srcIn,
            ),
            child: image,
          )
        : image;

    return Transform.rotate(
      angle: pi / 180 * (rotateAngle ?? 0),
      child: Container(
        width: backgroudWitdh,
        height: backgroudheight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: border,
          color: backgroudColor,
          borderRadius: borderRadius,
        ),
        child: iconWidget,
      ),
    );
  }
}
