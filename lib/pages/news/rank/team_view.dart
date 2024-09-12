import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
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
      const AppBarWidget(title: "TEAM"),
      bodyWidget: Expanded(
        child: Column(
          children: [
            Container(
              width: 349.w,
              height: 32.w,
              margin: EdgeInsets.only(top: 16.w),
              padding: EdgeInsets.all(4.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.w),
                border: Border.all(width: 0.5, color: AppColors.cB3B3B3),
              ),
              child: Obx(() {
                return Stack(
                  children: [
                    Container(
                      width: 169.w,
                      height: 26.w,
                      margin: EdgeInsets.only(
                          left: controller.progress.value * 169.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.c262626,
                          borderRadius: BorderRadius.circular(13.w)),
                    ),
                    Row(
                        children: controller.tabs.map((e) {
                      int index = controller.tabs.indexOf(e);
                      bool selected = index == controller.current.value;
                      return InkWell(
                        onTap: () => controller.onTap(index),
                        child: Container(
                          alignment: Alignment.center,
                          width: 169.w,
                          height: 26.w,
                          child: Text(
                            e,
                            style: 13.w4(
                              color: selected
                                  ? AppColors.cF2F2F2
                                  : AppColors.c262626,
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
