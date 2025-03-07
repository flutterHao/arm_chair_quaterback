/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-01 19:20:51
 * @LastEditTime: 2025-02-24 17:23:40
 */
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
  const IconWidget(
      {super.key,
      this.iconWidth,
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
      this.alignment = Alignment.center,
      this.fieldPath});

  final double? iconWidth;
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
  final Alignment alignment;
  final String? fieldPath;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 180 * (rotateAngle ?? 0),
      child: Container(
        width: backgroudWitdh,
        height: backgroudheight,
        alignment: alignment,
        decoration: BoxDecoration(
          border: border,
          color: backgroudColor,
          borderRadius: borderRadius,
        ),
        child: Image.asset(
          icon,
          width: iconWidth,
          height: iconHeight,
          fit: fit ?? BoxFit.fill,
          color: iconColor,
          errorBuilder: (context, error, stackTrace) {
            // 可能需要更换为缺省图
            if (fieldPath != null) {
              return Image.asset(fieldPath!,
                  width: iconWidth,
                  height: iconHeight,
                  fit: fit ?? BoxFit.fill,
                  color: iconColor);
            }
            return Container(
              width: iconWidth,
              height: backgroudheight,
              color: Colors.white,
              alignment: Alignment.center,
            );
          },
        ),
      ),
    );
  }
}
