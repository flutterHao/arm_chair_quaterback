/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 16:18:58
 * @LastEditTime: 2024-09-28 12:09:23
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/border_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/widgets/team_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamTrainingPage extends StatelessWidget {
  const TeamTrainingPage({super.key});

  Widget _head() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 97.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w),
              topRight: Radius.circular(16.w),
            ),
            image: const DecorationImage(
              // scale: 0.5,
              opacity: 0.05,
              repeat: ImageRepeat.repeat,
              image: AssetImage(
                Assets.uiBgDiagonalPng,
              ),
            ),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.c1A1A1A,
                  Color.fromARGB(255, 51, 51, 51),
                ])),
        child: Text(
          "MY TEAM",
          style: 50.w7(color: AppColors.c838383.withOpacity(0.25)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TeamTrainingController());
    final TeamIndexController indexCtrl = Get.find();
    double turns = 0;
    return GetBuilder<TeamTrainingController>(
      builder: (_) {
        return BorderWidget(
          offset: Offset(0, 3.h),
          width: 375.w,
          height: 616.h,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.w),
            topRight: Radius.circular(16.w),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _head(),
              Positioned(
                top: 5.w,
                child: InkWell(
                  onTap: () {
                    Get.find<TeamIndexController>().pageOnTap();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Obx(() {
                      bool isOpne = indexCtrl.isShow.value;
                      turns = isOpne ? turns + 1 / 2 : turns - 1 / 2;
                      return AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: turns,
                        child: Stack(
                          children: [
                            IconWidget(
                              iconWidth: 21.w,
                              icon: Assets.uiIconArrows_04Png,
                              iconColor: AppColors.cB3B3B3.withOpacity(0.7),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 9.w),
                              child: IconWidget(
                                iconWidth: 21.w,
                                icon: Assets.uiIconArrows_04Png,
                                iconColor: AppColors.cB3B3B3,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),

              ///Tabar容器
              Positioned(
                top: 66.w,
                left: 0,
                right: 0,
                child: Container(
                    height: 630.w,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.w),
                          topRight: Radius.circular(16.w),
                        ),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.c1A1A1A,
                              AppColors.c262626,
                            ])),
                    child: Column(
                      children: [
                        TeamTabbar(),
                        Expanded(
                          child: TabBarView(
                            // physics: const NeverScrollableScrollPhysics(),
                            controller: controller.tabController,
                            children: controller.pages
                                .map((e) => Center(child: e))
                                .toList(),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
