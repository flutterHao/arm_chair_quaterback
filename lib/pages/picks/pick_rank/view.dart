import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/style/style.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/widgets/rank_page.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/widgets/reward_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PickRankPage extends GetView<PickRankController> {
  const PickRankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickRankController>(
      builder: (_) {
        return BlackAppWidget(
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              AppBarWidget(
                id: GlobalNestedKey.PICKS,
                titleWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Text(
                        controller.tabIndex.value == 0
                            ? "PICK RANK"
                            : "PICK REWARD",
                        style: 19.w7(color: AppColors.cE6E6E6),
                      );
                    }),
                    Text(
                      "6d:08:02:20",
                      style:
                          TextStyle(color: AppColors.c666666, fontSize: 12.sp),
                    )
                  ],
                ),
              )
            ],
          ),
          totalScreenWidget:
              TabBarView(controller: controller.tabController, children: const [
            //rank
            RankPage(),
            //reward
            RewardPage(),
          ]),
          floatWidgets: [
            //悬浮tab
            Positioned(
              top: MediaQuery.of(context).padding.top +
                  AppBarContainer.APPBARCONTAINERHEIGHT +
                  6.w +
                  16.w,
              left: 12.w,
              right: 12.w,
              child: Container(
                height: 34.w,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 39.w),
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.w),
                    color: AppColors.c808080.withOpacity(.4),
                    border: Border.all(color: AppColors.c808080, width: 1.w)),
                child: Stack(
                  alignment: FractionalOffset.centerLeft,
                  children: [
                    LayoutBuilder(builder: (context, constraints) {
                      return TLBuildWidget(
                          controller: controller.tabController,
                          builder: (current, next, progress, totalProgress) {
                            return Container(
                              height: 28.w,
                              width: constraints.maxWidth /
                                  controller.tabController.length,
                              margin: EdgeInsets.only(
                                  left:
                                      totalProgress * constraints.maxWidth / 2),
                              decoration: BoxDecoration(
                                  color: AppColors.cF2F2F2,
                                  borderRadius: BorderRadius.circular(17.w)),
                            );
                          });
                    }),
                    Row(
                      children: controller.tabTitles.map((e) {
                        int index = controller.tabTitles.indexOf(e);
                        return Flexible(
                            child: TLBuildWidget(
                                controller: controller.tabController,
                                builder: (current, next, progress, _) {
                                  return InkWell(
                                    onTap: () => controller.tabController
                                        .animateTo(index),
                                    child: Center(
                                      child: Text(
                                        e,
                                        style: TextStyle(
                                            color: current == index
                                                ? Color.lerp(AppColors.c1A1A1A,
                                                    AppColors.cB3B3B3, progress)
                                                : next == index
                                                    ? Color.lerp(
                                                        AppColors.cB3B3B3,
                                                        AppColors.c1A1A1A,
                                                        progress)
                                                    : AppColors.cB3B3B3,
                                            fontSize: 13.sp),
                                      ),
                                    ),
                                  );
                                }));
                      }).toList(),
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
