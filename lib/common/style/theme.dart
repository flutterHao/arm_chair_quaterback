/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-18 11:23:47
 * @LastEditTime: 2024-12-11 21:26:43
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.cF2F2F2,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: FontFamily.fRobotoMedium,
    primaryColor: AppColors.cF1F1F1,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.cF1F1F1,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.grey, // 设置全局的 CircularProgressIndicator 颜色
    ),
    // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.c666666,
      iconTheme: IconThemeData(
        color: AppColors.primaryText,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: AppColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.scaffoldBackground,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: AppColors.c333333,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColors.accentColor,
      unselectedLabelColor: AppColors.secondaryText,
    ),
  );
}
