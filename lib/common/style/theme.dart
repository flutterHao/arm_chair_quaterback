import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.ce5e5e5,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    fontFamily: FontFamily.fMedium,
    primaryColor: AppColors.cF1F1F1,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.cF1F1F1,
    ),
    textTheme: TextTheme(),
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
