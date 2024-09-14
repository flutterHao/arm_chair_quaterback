import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_bar.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/border_container.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/search_bottom_dialog.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guss_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatsRankPage extends GetView<RankController> {
  const StatsRankPage({super.key});

  // 主视图
  Widget _buildView(context) {
    return Column(
      children: [
        16.vGap,
        Expanded(
          child: Column(
            children: [
              Container(
                width: 349.w,
                height: 32.w,
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
                          Container(
                            width: 169.w,
                            height: 26.w,
                            margin:
                                EdgeInsets.only(left: totalProgress * 169.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColors.c262626,
                                borderRadius: BorderRadius.circular(13.w)),
                          ),
                          Row(
                              children: controller.tabs.map((e) {
                            int index = controller.tabs.indexOf(e);
                            return InkWell(
                              onTap: () => controller.onTap(index),
                              child: Container(
                                alignment: Alignment.center,
                                width: 169.w,
                                height: 26.w,
                                child: Text(
                                  e,
                                  style: 13.w4(
                                      color: current == index
                                          ? Color.lerp(
                                              AppColors.cF2F2F2,
                                              AppColors.c262626,
                                              progress)!
                                          : next == index
                                              ? Color.lerp(
                                                  AppColors.c262626,
                                                  AppColors.cF2F2F2,
                                                  progress)!
                                              : AppColors.c262626),
                                ),
                              ),
                            );
                          }).toList()),
                        ],
                      );
                    }),
              ),
              20.vGap,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Expanded(child: Text("Rank", style: 19.w7())),
                    BorderContainer(
                      width: 70.w,
                      height: 18.w,
                      child: Text(
                        "PPG",
                        style: 10.w7(),
                      ),
                    ),
                    4.hGap,
                    BorderContainer(
                      width: 140.w,
                      height: 18.w,
                      child: Text(
                        "2024 Regular Season",
                        style: 10.w7(),
                      ),
                    ),
                    10.hGap,
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SearchBottomDialog();
                            });
                      },
                      child: IconWidget(
                        iconWidth: 15.w,
                        iconHeight: 9.w,
                        icon: Assets.uiIconExpansionPng,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: controller.tabController,
                children:
                    controller.statsPages.map((e) => Center(child: e)).toList(),
              ))
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RankController>(
      builder: (_) {
        return BlackAppWidget(
            const AppBarWidget(
              title: "STATS",
              id: GlobalNestedKey.NEWS,
            ),
            bodyWidget: Expanded(
              child: _buildView(context),
            ));
      },
    );
  }
}
