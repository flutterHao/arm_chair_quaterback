/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2024-09-27 16:05:42
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/progress_paint.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/widgets/shadow_container.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/border_container.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/border_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/progress_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamIndexPage extends GetView<TeamIndexController> {
  const TeamIndexPage({super.key});

  // 主视图
  Widget _buildView(context) {
    return Expanded(
        child: Stack(
      children: [
        Positioned(
          top: 0.h,
          child: Image.asset(
            Assets.uiCommonGrainPng,
            fit: BoxFit.fitWidth,
            width: 375.h,
          ),
        ),
        Positioned(
          top: 27.h,
          bottom: 70.h,
          left: -15.h,
          child: Image.asset(Assets.uiBelle_01Png,
              fit: BoxFit.cover,
              // height: 567.w,
              width: 232.w,
              alignment: Alignment.topRight),
        ),

        ///刷新按钮
        Positioned(
          top: 40.h,
          left: 16.h,
          child: Container(
            width: 32.h,
            height: 32.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.h), color: Colors.white),
            child: IconWidget(
              iconWidth: 16.h,
              icon: Assets.uiIconSwitch_01Png,
              iconColor: AppColors.c262626,
            ),
          ),
        ),

        ///文字区
        Positioned(
          right: 10.h,
          top: 40.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200.h,
                child: Text(
                  "Hi,Manager ",
                  overflow: TextOverflow.ellipsis,
                  style: 24.w7(
                    color: AppColors.c262626,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30.h),
                    child: Text(
                      "It’s your game progress for the day",
                      style: 10.w4(color: AppColors.c262626),
                    ),
                  ),
                  10.vGap,
                  Row(
                    children: [
                      _numWidget("Battle", 24),
                      8.hGap,
                      _numWidget("Train", 52),
                    ],
                  )
                ],
              )
            ],
          ),
        ),

        Positioned(
          bottom: 137.h,
          // top: 350.h,
          right: 0,
          child: Container(
            width: 185.h,
            height: 283.h,
            alignment: Alignment.bottomRight,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Positioned(
                  top: 0,
                  right: 15.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///宝箱
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _blackBox(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 48.h,
                                height: 40.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Image.asset(
                                        Assets.uiTeamBox_01Png,
                                        width: 38.h,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Image.asset(
                                          Assets.uiTeamBox_02Png,
                                          width: 23.h,
                                          fit: BoxFit.fill,
                                        )),
                                  ],
                                ),
                              ),
                              8.vGap,
                              BorderContainer(
                                height: 16.h,
                                width: 44.h,
                                borderColor: AppColors.cFF7954,
                                child: Text(
                                  "OPEN",
                                  style: 10.w4(color: AppColors.cFF7954),
                                ),
                              ),
                            ],
                          )),
                          12.hGap,
                          _blackBox(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.uiTeamBox_01Png,
                                width: 43.h,
                                height: 37.h,
                                fit: BoxFit.fill,
                              ),
                              13.vGap,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PieChart(progress: 1),
                                  2.4.hGap,
                                  PieChart(progress: 0.8),
                                  2.4.hGap,
                                  PieChart(progress: 0),
                                  2.4.hGap,
                                  PieChart(progress: -1),
                                ],
                              )
                            ],
                          ))
                        ],
                      ),

                      ///百分比
                      10.vGap,
                      Text(
                        "38%",
                        style: 39.w7(color: AppColors.cFF7954),
                      ),
                    ],
                  ),
                ),

                ///背景
                Positioned(
                  bottom: 0,
                  right: 0.h,
                  child: Column(
                    children: [
                      Container(
                        width: 148.h,
                        height: 26.h,
                        padding: EdgeInsets.only(left: 13.h),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            color: AppColors.cFF7954,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.h))),
                        child: Text(
                          "Preparation Level",
                          style: 14.w4(color: AppColors.c262626),
                        ),
                      ),
                      Container(
                        width: 148.h,
                        height: 122.h,
                        decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.h))),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16.h,
                  bottom: 70.h,
                  child: CustomContainer(
                      width: 147.h,
                      height: 38.h,
                      backgroudColor: AppColors.c343434,
                      borderRadius: BorderRadius.circular(19.h),
                      padding: EdgeInsets.symmetric(horizontal: 4.h),
                      child: Row(
                        children: [
                          Image.asset(
                            width: 30.h,
                            height: 30.h,
                            Assets.uiStateGeneralPng,
                            fit: BoxFit.fill,
                          ),
                          10.hGap,
                          Expanded(
                              child: Text(
                            "x10",
                            style: 16.w4(color: AppColors.cF2F2F2),
                          )),
                          BorderContainer(
                            height: 30.h,
                            width: 30.h,
                            borderColor: AppColors.cB3B3B3,
                            child: Image.asset(
                              Assets.uiIconArrowsPng,
                              width: 14.h,
                            ),
                          ),
                        ],
                      )),
                ),
                Positioned(
                  right: 12.h,
                  bottom: 13.h,
                  child: Row(
                    children: [
                      CircleProgressView(
                          progress: 100, width: 49.h, height: 49.h),
                      5.hGap,
                      CircleProgressView(
                          progress: 80, width: 49.h, height: 49.h),
                      5.hGap,
                      CircleProgressView(
                          progress: 50, width: 49.h, height: 49.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Positioned(child: BorderContainer(width: 150.h, height: 375.h,child: Container(

        // )))

        ///训练按钮
        Positioned(
          bottom: 50.h,
          left: 0,
          child: BorderWidget(
            offset: Offset(0, -3.h),
            width: 152.h,
            height: 64.h,
            onTap: () {},
            margin: EdgeInsets.only(bottom: 2.h),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32.h),
              bottomRight: Radius.circular(32.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TRAINING",
                  style: 21.w7(color: AppColors.cFF7954),
                ),
                5.hGap,
                IconWidget(
                  iconWidth: 35.h,
                  icon: Assets.uiIconBasketballPng,
                  iconColor: AppColors.cFF7954,
                ),
              ],
            ),
          ),
        ),

        ///战斗按键
        Positioned(
          bottom: 50.h,
          right: 0,
          child: BorderWidget(
            offset: Offset(0, -3.h),
            width: 152.h,
            height: 64.h,
            onTap: () {},
            margin: EdgeInsets.only(bottom: 2.h),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.h),
              bottomLeft: Radius.circular(32.h),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconWidget(
                      iconWidth: 28.h,
                      icon: Assets.uiIconTrophy_01Png,
                    ),
                    SizedBox(height: 5.h),
                    CustomContainer(
                        // width:35.w ,
                        // height: 10.h,
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        borderRadius: BorderRadius.circular(5.h),
                        backgroudColor: AppColors.cFED141,
                        child: Text(
                          "15000",
                          style: 10.w7(color: AppColors.c262626, height: 1),
                        )),
                  ],
                ),
                Text(
                  "BATTLE",
                  style: 21.w7(color: AppColors.cFF7954),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _numWidget(String title, int num) {
    return BorderContainer(
        height: 42.h,
        width: 68.h,
        borderRadius: BorderRadius.circular(12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$num",
              style: 24.w4(color: AppColors.c262626, height: 1),
            ),
            Text(
              title,
              style: 10.w4(height: 1),
            )
          ],
        ));
  }

  Widget _blackBox({required Widget child}) {
    return Container(
      width: 56.h,
      height: 77.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.c262626,
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamIndexController>(
      init: TeamIndexController(),
      id: "team_index",
      builder: (ctrl) {
        return BlackAppWidget(
          const UserInfoBar(title: "TEAM"),
          bodyWidget: _buildView(context),
          floatWidgets: [],
        );
      },
    );
  }
}
