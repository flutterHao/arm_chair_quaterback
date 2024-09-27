/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 16:18:58
 * @LastEditTime: 2024-09-27 19:03:04
 */
/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-27 16:18:58
 * @LastEditTime: 2024-09-27 17:34:14
 */
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/view.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/border_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class TeamTrainingPage extends GetView<TeamTrainingController> {
  const TeamTrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Positioned(
                top: 20.h,
                child: IconWidget(
                  iconWidth: 22.w,
                  icon: Assets.uiIconArrowsPng,
                  iconColor: AppColors.cB3B3B3,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 97.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.w),
                        topRight: Radius.circular(16.w),
                      ),
                      image: const DecorationImage(
                        opacity: 0.2,
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
                    style: 50.w7(color: AppColors.c838383),
                  ),
                ),
              ),
              Positioned(
                top: 66.h,
                left: 0,
                right: 0,
                child: Container(
                  height: 34.w,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.all(4.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                    border: Border.all(width: 0.5, color: AppColors.cEFEFEF),
                  ),
                  child: TLBuildWidget(
                      controller: controller.tabController,
                      builder: (current, next, progress, totalProgress) {
                        return Stack(
                          children: [
                            LayoutBuilder(builder: (context, constraints) {
                              double left = (constraints.maxWidth /
                                  controller.tabController.length);
                              return Container(
                                width: constraints.maxWidth /
                                    controller.tabController.length,
                                height: 26.w,
                                margin:
                                    EdgeInsets.only(left: totalProgress * left),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.cEFEFEF,
                                    borderRadius: BorderRadius.circular(13.w)),
                              );
                            }),
                            Row(
                                children: controller.tabs.map((e) {
                              int index = controller.tabs.indexOf(e);
                              return Expanded(
                                child: InkWell(
                                  onTap: () => controller.onTap(index),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 26.w,
                                    child: Text(
                                      e,
                                      style: 13.w4(
                                          color: current == index
                                              ? Color.lerp(AppColors.cF2F2F2,
                                                  AppColors.c262626, progress)!
                                              : next == index
                                                  ? Color.lerp(
                                                      AppColors.c262626,
                                                      AppColors.cF2F2F2,
                                                      progress)!
                                                  : AppColors.c262626),
                                    ),
                                  ),
                                ),
                              );
                            }).toList()),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
