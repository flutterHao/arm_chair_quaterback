import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///@author lihonghao
///@date 2024/9/9
///@description 可设置颜色图标
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
    this.rotateAngle,
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
  final double? rotateAngle;

  @override
  Widget build(BuildContext context) {
    Image image = Image.asset(
      icon,
      width: iconWidth,
      height: iconHeight,
      fit: BoxFit.fill,
      // errorBuilder: (context, error, stackTrace) {
      //   //可能需要更换为缺省图
      //   return Container(
      //     width: double.infinity,
      //     height: double.infinity,
      //     color: Colors.white,
      //     alignment: Alignment.center,
      //   );
      // },
    );
    //过多使用 colorFilter 会对性能有影响
    Widget iconWidget = iconColor != null
        ? ColorFiltered(
            colorFilter: ColorFilter.mode(
              iconColor!, // 修改为你想要的颜色
              BlendMode.srcIn,
            ),
            child: image, // 替换为你的 PNG 图片
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
