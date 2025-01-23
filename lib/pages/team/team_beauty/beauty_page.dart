/*
 * @Description: 换人换装页面
 * @Author: lihonghao
 * @Date: 2024-10-12 17:33:59
 * @LastEditTime: 2025-01-21 10:24:00
 */

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back/horizontal_drag_back_container.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/out_line_text.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/beauty_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/widget/beauty_list.dart';
import 'package:arm_chair_quaterback/pages/team/team_beauty/widget/beauty_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BeautyPage extends GetView<BeautyController> {
  const BeautyPage({super.key});

  Widget _leftButton(
      {required double bottom,
      required double width,
      required String icon,
      bool? visible,
      required Function onTap}) {
    return Positioned(
      bottom: bottom + 192.h,
      left: 16.w,
      child: MtInkWell(
        splashColor: Colors.transparent,
        onTap: () => onTap(),
        child: Visibility(
          visible: visible ?? !controller.expandedGirl,
          child: Container(
            width: 41.h,
            height: 41.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.c000000,
              borderRadius: BorderRadius.circular(9.w),
            ),
            child: Image.asset(
              icon,
              width: 25.h,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }

  Widget _clothList() {
    List<String> list = [
      Assets.cheerleadersUiCheerleadersIconClothing01,
      Assets.cheerleadersUiCheerleadersIconClothing02,
      Assets.cheerleadersUiCheerleadersIconClothing03,
      Assets.cheerleadersUiCheerleadersIconClothing04,
      Assets.cheerleadersUiCheerleadersIconClothing05
    ];
    return Positioned(
      bottom: 192.h + 60.h,
      right: 16.w - 3.5.h,
      child: SizedBox(
        width: 41.h + 3.5.h,
        child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              bool isCur = controller.clothingIndex == index;
              return MtInkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    controller.clothingIndex = index;
                    controller.update();
                  },
                  child: Visibility(
                    visible: !controller.expandedGirl,
                    child: SizedBox(
                      width: 41.h + 3.5.h,
                      height: 41.h + 3.5.h,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              width: 41.h,
                              height: 41.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isCur ? Colors.white : Colors.black,
                                borderRadius: BorderRadius.circular(9.w),
                              ),
                              child: Image.asset(
                                list[index],
                                height: 29.h,
                                color: !isCur ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          if (isCur)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 16.h,
                                height: 16.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.c10A86A,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(9.w),
                                ),
                                child: IconWidget(
                                  iconWidth: 9.h,
                                  icon: Assets.commonUiCommonStatusBarMission02,
                                  iconColor: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ));
            },
            separatorBuilder: (context, index) => SizedBox(height: 18.h),
            itemCount: list.length),
      ),
    );
  }

  Widget _grade() {
    double top = controller.expandedGirl ? 0 : 48.w;
    return Positioned(
      // top: top + 123.w,
      bottom: 192.h + 370.h,
      left: 15.w,
      child: Visibility(
        visible: !controller.expandedGirl,
        child: OutlinedText(
          text: controller.currentGirl.grade,
          textStyle: TextStyle(
              fontFamily: FontFamily.fRobotoBlack,
              height: 1,
              fontSize: 40.spMin),
        ),
      ),
    );
  }

  Widget _expandedBt() {
    double top = controller.expandedGirl ? 0 : 48.w;
    return Positioned(
      // top: top + 107.h,
      bottom: 192.h + 381.h,
      right: 16.w,
      child: MtInkWell(
        onTap: () {
          controller.expandedGirl = !controller.expandedGirl;
          controller.update();
        },
        child: Container(
            width: 41.h,
            height: 41.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(9.h),
            ),
            child: Image.asset(
              controller.expandedGirl
                  ? Assets.cheerleadersUiCheerleadersIconFullscreen02
                  : Assets.cheerleadersUiCheerleadersIconFullscreen01,
              width: 25.h,
              fit: BoxFit.fitWidth,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackContainer(
        child: BlackAppWidget(
      // const UserInfoBar(showPop: true),
      Container(
        decoration: BoxDecoration(
          color: AppColors.c000000,
          border: Border.all(width: 0),
        ),
      ),

      floatWidgets: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: GetBuilder<BeautyController>(
              init: BeautyController(),
              builder: (_) {
                var top = controller.expandedGirl ? 0 : 48.w;
                var colors = controller.currentGirl.backGroundColor
                    .map((e) => Color(e))
                    .toList();
                return Container(
                  decoration: BoxDecoration(
                      // color: Color(controller.currentGirl.),
                      border: Border.all(width: 0),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: colors)),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 169.h,
                        bottom: controller.expandedGirl ? 0 : 150.h,
                        child: InkWell(
                          onTap: () {
                            controller.expandedGirl = !controller.expandedGirl;
                            controller.update();
                          },
                          child: Image.asset(
                            Assets.cheerleadersUiCheerleadersBgLight,
                            width: 375.w,
                            fit: BoxFit.fitWidth,
                            color: Color(controller.currentGirl.lightColor),
                            // color: Colors.white,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      //文字
                      Positioned(
                        top: controller.expandedGirl ? 0 : 48.w + 5.w,
                        left: -25.w,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: controller
                                        .currentGirl.backGroundColor
                                        .map((e) => Color(e))
                                        .toList())
                                .createShader(bounds);
                          },
                          child: Text(
                            "cheerle".toUpperCase(),
                            style: TextStyle(
                                fontSize: 121.sp,
                                letterSpacing: 0,
                                // color: AppColors.c262626,
                                color: Colors.white,

                                // color: Color(controller.backgroundColor[
                                //     controller.beautyIndex.value]),
                                height: 0.95,
                                fontFamily: FontFamily.fOswaldBold),
                          ),
                        ),
                      ),
                      //美女
                      Positioned(
                        top: 48.w + 31.5.h,
                        bottom: controller.expandedGirl ? 0 : 192.h,
                        // right: 0,
                        child: InkWell(
                          onTap: () {
                            controller.expandedGirl = !controller.expandedGirl;
                            controller.update();
                          },
                          child: Image.asset(
                            controller.currentGirl.girlImg,
                            // height: ,
                            // width: 361.w,
                            // fit: BoxFit.fitWidth,
                            // alignment: Alignment.topRight,
                            // height: 534.h,
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.bottomCenter,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                      _grade(),

                      _leftButton(
                        bottom: 178.h,
                        width: 22.h,
                        icon: Assets.cheerleadersUiCheerleadersIconShow,
                        onTap: () {},
                      ),
                      _leftButton(
                        bottom: 118.h,
                        width: 22.h,
                        icon: Assets.cheerleadersUiCheerleadersIconChat,
                        onTap: () {},
                      ),
                      _leftButton(
                        bottom: 60.h,
                        width: 22.h,
                        icon: Assets.cheerleadersUiCheerleadersIconPhoto,
                        onTap: () {},
                      ),

                      _expandedBt(),
                      _clothList(),
                      Positioned(
                        top: -1,
                        left: 0,
                        right: 0,
                        child: Visibility(
                          visible: !controller.expandedGirl,
                          child: Container(
                            color: AppColors.c000000,
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top + 0.w),
                            child: const UserInfoBar(showPop: true),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
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
