/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 11:33:27
 * @LastEditTime: 2025-01-08 18:10:49
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///@author lihonghao
///@date 2024/9/9
///@description 拓展num功能,间距、文字
extension NumExt on num {
  Widget get hGap => SizedBox(width: kIsWeb ? toDouble() : toDouble().w);

  Widget get vGap => SizedBox(height: kIsWeb ? toDouble() : toDouble().w);

  Radius get ra => Radius.circular(kIsWeb ? toDouble() : toDouble().r);

  BorderRadius get br => BorderRadius.all(ra);

  EdgeInsets get ea => EdgeInsets.all(kIsWeb ? toDouble() : toDouble().w);

  // TextStyle w5({Color color = AppColors.c262626}) => TextStyle(
  //     fontWeight: FontWeight.w500,
  //     fontSize: kIsWeb ? toDouble() : toDouble().spMin,
  //     color: color);

  TextStyle w4(
          {Color color = AppColors.c000000,
          TextOverflow? overflow,
          double? height,
          String? fontFamily}) =>
      TextStyle(
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          height: height,
          overflow: overflow,
          // overflow: overflow??TextOverflow.ellipsis,
          // fontSize: toDouble().h,

          ///TODO
          fontSize: kIsWeb ? toDouble() : toDouble().spMin,
          color: color,
          fontFamily: fontFamily);

  TextStyle w5(
          {Color color = AppColors.c000000,
          TextOverflow? overflow,
          double? height,
          String? fontFamily}) =>
      TextStyle(
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
          height: height,
          overflow: overflow,
          // overflow: overflow??TextOverflow.ellipsis,
          // fontSize: toDouble().h,

          ///TODO
          fontSize: kIsWeb ? toDouble() : toDouble().spMin,
          color: color,
          fontFamily: fontFamily);

  TextStyle w7(
          {Color color = AppColors.c000000,
          TextOverflow? overflow,
          double? height,
          String? fontFamily}) =>
      TextStyle(
          letterSpacing: 0,
          height: height,
          fontWeight: FontWeight.w700,
          fontSize: kIsWeb ? toDouble() : toDouble().spMin,
          // fontSize: toDouble().h,
          overflow: overflow,
          color: color,
          fontFamily: fontFamily ?? FontFamily.fOswaldBold);

  Divider get hLine => Divider(
        color: AppColors.cB3B3B3,
        height: toDouble(),
      );

  VerticalDivider get vLine => VerticalDivider(
        color: AppColors.cB3B3B3,
        width: toDouble(),
      );

  String formatToString([int fractionDigits = 1]) {
    String stringAsFixed = toStringAsFixed(fractionDigits).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
    return stringAsFixed;
  }

  num format() {
    var stringAsFixed = toStringAsFixed(1);
    var source =
        stringAsFixed.endsWith(".0") ? toInt().toString() : stringAsFixed;
    if (!source.contains(".")) {
      return int.parse(source);
    }
    return double.parse(source);
  }

  num handlerNaNInfinity({num defaultValue = 0}) {
    if (isNaN || isInfinite) {
      return defaultValue;
    }
    return this;
  }
}
