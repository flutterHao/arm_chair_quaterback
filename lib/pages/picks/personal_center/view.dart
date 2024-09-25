import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/widgets/recive_award_pick_page/recive_award_picks_page.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/widgets/recive_award_item/recive_award_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class PersonalCenterPage extends GetView<PersonalCenterController> {
  const PersonalCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var teamId = (ModalRoute.of(context)?.settings.arguments as Map)["teamId"];
    return GetBuilder<PersonalCenterController>(
      id: PersonalCenterController.idPersonalCenterMain,
      builder: (_) {
        return BlackAppWidget(
          AppBarWidget(
            id: GlobalNestedKey.PICKS,
            title: "PERSONAL CENTER",
            right: InkWell(
              onTap: () {
                print('点击了分享');
              },
              child: IconWidget(
                iconWidth: 19.w,
                iconHeight: 19.w,
                icon: Assets.iconSharePng,
              ),
            ),
          ),
          floatWidgets: [
            if (controller.teamSimpleEntity != null)
              Positioned(
                  left: 13.w,
                  right: 13.w,
                  top: MediaQuery.of(context).padding.top +
                      63.w +
                      88.w +
                      6.w +
                      14.w,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400.w),
                    height: 34.w,
                    decoration: BoxDecoration(
                        color: AppColors.cEFEFEF,
                        borderRadius: BorderRadius.circular(17.w),
                        border: Border.all(width: 1, color: AppColors.cB3B3B3)),
                    child: LayoutBuilder(builder: (context, constraints) {
                      var itemWidth = (constraints.maxWidth - 8.w) / 3;

                      return TLBuildWidget(
                          controller: controller.tabController,
                          builder: (current, next, progress, totalProgress) {
                            return Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Positioned(
                                  left: totalProgress * itemWidth,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 4.w),
                                    height: 26.w,
                                    width: itemWidth,
                                    decoration: BoxDecoration(
                                        color: AppColors.c262626,
                                        borderRadius:
                                            BorderRadius.circular(26.w)),
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                      controller.titles.length,
                                      (index) => Expanded(
                                            child: InkWell(
                                                onTap: () => controller
                                                    .tabController
                                                    .animateTo(index),
                                                child: Center(
                                                    child: Text(
                                                        controller
                                                            .titles[index],
                                                        style: 13.w4(
                                                          color: current ==
                                                                  index
                                                              ? Color.lerp(
                                                                  AppColors
                                                                      .cF2F2F2,
                                                                  AppColors
                                                                      .c666666,
                                                                  progress)!
                                                              : next == index
                                                                  ? Color.lerp(
                                                                      AppColors
                                                                          .c666666,
                                                                      AppColors
                                                                          .cF2F2F2,
                                                                      progress)!
                                                                  : AppColors
                                                                      .c666666,
                                                        )))),
                                          )),
                                )
                              ],
                            );
                          });
                    }),
                  ))
          ],
          totalScreenWidget: controller.teamSimpleEntity == null
              ? Center(
                  child: Obx(() {
                    return LoadStatusWidget(
                        text: controller.loadStatus.value.desc,
                        onRefreshTap: controller.getData());
                  }),
                )
              : Stack(
                  children: [
                    Container(
                      height: 88.w + 63.w,
                      decoration: BoxDecoration(
                        color: AppColors.c262626,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.w),
                            bottomRight: Radius.circular(16.w)),
                      ),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 6.w),
                      padding: EdgeInsets.only(
                          top: 24.w + 63.w,
                          bottom: 16.w,
                          right: 23.w,
                          left: 23.w),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.cF2F2F2,
                                  borderRadius: BorderRadius.circular(8.w)),
                              child: IconWidget(
                                  iconWidth: 48.w,
                                  icon: Assets.testTeamLogoPng)),

                          ///todo 换网络图
                          10.hGap,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // future
                                // Container(
                                //   height: 12.w,
                                //   width: 30.w,
                                //   alignment: Alignment.center,
                                //   decoration: BoxDecoration(
                                //       color: AppColors.cE7B6DF,
                                //       borderRadius: BorderRadius.circular(6.w)),
                                //   child: Text(
                                //     "KOI",
                                //     style: 10.w4(color: AppColors.cFFFFFF, height: 1),
                                //   ),
                                // ),
                                // 8.vGap,
                                Text(
                                  controller.teamSimpleEntity!.teamName,
                                  style: 16
                                      .w4(color: AppColors.cE6E6E6, height: 1),
                                )
                              ],
                            ),
                          ),
                          // Container(
                          //   width: 29.w,
                          //   height: 29.w,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(15.w),
                          //       border: Border.all(color: AppColors.cE6E6E6,
                          //           width: 1)),
                          //   child: IconWidget(
                          //       iconWidth: 16.w, icon: Assets.testTeamLogoPng),
                          //
                          //
                          // ),
                          // 9.hGap,
                          // Container(
                          //   width: 29.w,
                          //   height: 29.w,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15.w),
                          //     color: AppColors.cD4D4D4,
                          //   ),
                          //   child: IconWidget(
                          //       iconWidth: 16.w, icon: Assets.testTeamLogoPng),
                          //
                          //
                          // )
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            const Center(child: LoadStatusWidget()),
                            ReciveAwardPicksPage(
                                teamId, controller.teamSimpleEntity!),
                            const Center(child: LoadStatusWidget()),
                          ]),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
