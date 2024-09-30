/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 11:33:27
 * @LastEditTime: 2024-09-30 16:04:26
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
  //     fontSize: kIsWeb ? toDouble() : toDouble().sp,
  //     color: color);

  TextStyle w4(
          {Color color = AppColors.c262626,
          TextOverflow? overflow,
          double? height}) =>
      TextStyle(
          fontWeight: FontWeight.w400,
          height: height,
          overflow: overflow,
          // overflow: overflow??TextOverflow.ellipsis,
          fontSize: toDouble().h,

          ///TODO
          // fontSize: kIsWeb ? toDouble() : toDouble().sp,
          color: color,
          fontFamily: FontFamily.fMedium);

  TextStyle w7(
          {Color color = AppColors.c262626,
          TextOverflow? overflow,
          double? height}) =>
      TextStyle(
          height: height,
          fontWeight: FontWeight.w700,
          // fontSize: kIsWeb ? toDouble() : toDouble().sp,
          fontSize: toDouble().h,
          overflow: overflow??TextOverflow.ellipsis,
          color: color,
          fontFamily: FontFamily.fBlack);

  Divider get hLine => Divider(
        color: AppColors.cB3B3B3,
        height: toDouble(),
      );

  VerticalDivider get vLine => VerticalDivider(
        color: AppColors.cB3B3B3,
        width: toDouble(),
      );
}
