/*
 * @Description: 我的球队的训练和比赛
 * @Author: lihonghao
 * @Date: 2024-09-27 19:21:36
 * @LastEditTime: 2024-10-08 16:41:42
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamTabbar extends GetView<TeamController> {
  const TeamTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.w,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 2.w),
      padding: EdgeInsets.all(4.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        border: Border.all(width: 0.5, color: AppColors.cB3B3B3),
      ),
      child: TLBuildWidget(
          controller: controller.tabController,
          builder: (current, next, progress, totalProgress) {
            return Stack(
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  double left =
                      (constraints.maxWidth / controller.tabController.length);
                  return Container(
                    width:
                        constraints.maxWidth / controller.tabController.length,
                    height: 26.w,
                    margin: EdgeInsets.only(left: totalProgress * left),
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
                      onTap: () => controller.onTabChange(index),
                      child: Container(
                        alignment: Alignment.center,
                        height: 26.w,
                        child: Text(
                          e,
                          style: 13.w4(
                              color: current == index
                                  ? Color.lerp(AppColors.c262626,
                                      AppColors.cF2F2F2, progress)!
                                  : next == index
                                      ? Color.lerp(AppColors.cF2F2F2,
                                          AppColors.c262626, progress)!
                                      : AppColors.cF2F2F2),
                        ),
                      ),
                    ),
                  );
                }).toList()),
              ],
            );
          }),
    );
  }
}
