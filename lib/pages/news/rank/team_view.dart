/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-14 16:54:10
 * @LastEditTime: 2024-09-19 13:23:06
 */
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guss_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';

class TeamRankPage extends GetView<RankController> {
  const TeamRankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlackAppWidget(
      const AppBarWidget(
        title: "TEAM",
        id: GlobalNestedKey.NEWS,
      ),
      bodyWidget: Expanded(
        child: Column(
          children: [
            10.vGap,
            Container(
              // width: 349.w,
              height: 32.w,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
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
                          double left = (constraints.maxWidth /
                              controller.tabController.length);
                          return Container(
                            width: constraints.maxWidth /
                                controller.tabController.length,
                            height: 26.w,
                            margin: EdgeInsets.only(left: totalProgress * left),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.c262626,
                                borderRadius: BorderRadius.circular(13.w)),
                          );
                        }),
                        Row(
                            children: controller.tabs2.map((e) {
                          int index = controller.tabs2.indexOf(e);
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
                                              ? Color.lerp(AppColors.c262626,
                                                  AppColors.cF2F2F2, progress)!
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
            20.vGap,
            Expanded(
                child: TabBarView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: controller.tabController,
              children:
                  controller.teamPages.map((e) => Center(child: e)).toList(),
            ))
          ],
        ),
      ),
    );
  }
}
