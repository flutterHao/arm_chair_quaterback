/*
 * @Description: 换人换装页面
 * @Author: lihonghao
 * @Date: 2024-10-12 17:33:59
 * @LastEditTime: 2025-01-09 12:07:46
 */

import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/widget/beauty_list.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/widget/beauty_progress.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_paint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BeautyPage extends GetView<BeautyController> {
  const BeautyPage({super.key});

  Widget _blackIconButton(
      {required double top,
      required double width,
      required String icon,
      bool? visible,
      bool withArrow = false,
      required Function onTap}) {
    return Positioned(
      top: top + 48.h,
      right: 16.w,
      child: MtInkWell(
        splashColor: Colors.transparent,
        onTap: () => onTap(),
        child: Visibility(
          visible: visible ?? !controller.expandedGirl,
          child: SizedBox(
            width: 41.h + 10.h,
            height: 41.h,
            child: Stack(
              children: [
                if (withArrow)
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 41.h,
                      height: 41.h,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 2.5.h),
                      decoration: BoxDecoration(
                        color: AppColors.cFFFFFF,
                        borderRadius: BorderRadius.circular(9.w),
                      ),
                      child: Transform.rotate(
                        angle: pi / 2,
                        child: Image.asset(
                          Assets.iconUiIconArrows04,
                          width: 9.h,
                          height: 5.h,
                          fit: BoxFit.fill,
                          color: AppColors.c000000,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 41.h,
                    height: 41.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.c000000,
                      borderRadius: BorderRadius.circular(9.w),
                    ),
                    child: IconWidget(iconWidth: width, icon: icon),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _grade() {
    return Positioned(
      top: 31.5.h + 48.h,
      left: 0,
      child: Visibility(
        visible: !controller.expandedGirl,
        child: Container(
          width: 68.w,
          height: 41.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.c000000,
              borderRadius:
                  BorderRadius.horizontal(right: Radius.circular(21.w))),
          child: OutlinedText(
            text: controller.gradeList[controller.beautyIndex.value],
            textStyle: TextStyle(
                fontFamily: FontFamily.fRobotoBlack,
                height: 1,
                fontSize: 30.spMin),
          ),
        ),
      ),
    );
  }

  Widget _backText({
    required double top,
    double? left,
    required String text,
    required Color color,
    required double fontSize,
    String? fontFamily,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          // height: 0.8,
          fontFamily: fontFamily ?? FontFamily.fOswaldMedium,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
        child: BlackAppWidget(
      // const UserInfoBar(showPop: true),
      Container(),
      bodyWidget: Expanded(
          child: GetBuilder<BeautyController>(
              init: BeautyController(),
              builder: (_) {
                return Container(
                  color: Color(
                      controller.backgroundColor[controller.beautyIndex.value]),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      _backText(
                          top: 0.h,
                          left: 75.5.w,
                          text: "GIRLS",
                          color: AppColors.cFFFFFF,
                          fontFamily: FontFamily.fCalcioDemo,
                          fontSize: 187.h),
                      _backText(
                          top: 193.h + 48.h,
                          left: 10.w,
                          text: "SEXY",
                          color: AppColors.c000000,
                          fontFamily: FontFamily.fOswaldMedium,
                          fontSize: 20.h),
                      _backText(
                          top: 193.h + 48.h + 35.h,
                          left: 0.w,
                          text: "GIRLS",
                          color: AppColors.c000000,
                          fontFamily: FontFamily.fCalcioDemo,
                          fontSize: 187.h),
                      Positioned(
                        top: controller.expandedGirl
                            ? 0
                            : (controller.beautyIndex.value != 3 ? 27.5.h : 0) +
                                48.h,
                        bottom: controller.expandedGirl ? 0 : 150.h,
                        child: Image.asset(
                          controller.beautyList[controller.beautyIndex.value],
                          // height: ,
                          // width: 250.w,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      _grade(),
                      _blackIconButton(
                        top: 34.h,
                        width: 20.h,
                        visible: true,
                        icon: controller.expandedGirl
                            ? Assets.cheerleadersUiCheerleadersIconFullscreen01
                            : Assets.cheerleadersUiCheerleadersIconFullscreen02,
                        onTap: () {
                          controller.expandedGirl = !controller.expandedGirl;
                          controller.update();
                        },
                      ),
                      _blackIconButton(
                        top: 252.h,
                        width: 22.h,
                        icon: Assets.cheerleadersUiCheerleadersIconShow,
                        onTap: () {},
                      ),
                      _blackIconButton(
                        top: 311.h,
                        width: 22.h,
                        icon: Assets.cheerleadersUiCheerleadersIconChat,
                        onTap: () {},
                      ),
                      _blackIconButton(
                        top: 370.h,
                        width: 22.h,
                        icon: Assets.cheerleadersUiCheerleadersIconPhoto,
                        onTap: () {},
                      ),
                      _blackIconButton(
                        top: 429.h,
                        width: 23.5.h,
                        withArrow: true,
                        icon: Assets.cheerleadersUiCheerleadersIconClothing,
                        onTap: () {},
                      ),
                      Positioned(
                        top: -1,
                        left: 0,
                        right: 0,
                        child: Visibility(
                            visible: !controller.expandedGirl,
                            child: const UserInfoBar(showPop: true)),
                      ),
                    ],
                  ),
                );
              })),
      floatWidgets: [
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BeautyList(),
        ),
        Positioned(
          bottom: 165.h,
          left: 16.w,
          right: 16.w,
          child: const BeautyProgress(),
        )
      ],
    ));
  }
}
