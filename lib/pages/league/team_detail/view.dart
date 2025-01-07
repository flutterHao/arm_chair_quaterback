/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 14:30:33
 * @LastEditTime: 2025-01-07 16:27:03
 */
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/widgets/log_tab.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/widgets/overview_tab.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/widgets/roster_tab.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/widgets/stats_tab.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/widgets/team_head_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamDetailPage extends StatelessWidget {
  const TeamDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Get.put(TeamDetailController(), tag: Get.arguments.toString());
    return GetBuilder<TeamDetailController>(
      tag: Get.arguments.toString(),
      id: "team_detail",
      builder: (_) {
        return HorizontalDragBackWidget(
          child: BlackAppWidget(
            UserInfoBar(showPop: true),
            bodyWidget: Expanded(
              child: DefaultTabController(
                length: controller.tabs.length,
                child: Column(
                  children: [
                    TeamHeadCard(teamId: controller.teamId),
                    Container(
                      height: 43.w,
                      alignment: Alignment.bottomCenter,
                      color: AppColors.cFFFFFF,
                      width: double.infinity,
                      child: TabBar(
                          isScrollable: false,
                          labelColor: AppColors.c000000,
                          labelPadding: EdgeInsets.zero,
                          // indicatorPadding: EdgeInsets.only(top: 5.w),
                          labelStyle:
                              16.w4(fontFamily: FontFamily.fOswaldMedium),
                          unselectedLabelStyle:
                              16.w4(fontFamily: FontFamily.fOswaldRegular),
                          unselectedLabelColor: AppColors.cB3B3B3,
                          dividerHeight: 0,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  color: AppColors.cFF7954, width: 3.w)),
                          indicatorWeight: 3.w,
                          tabs: controller.tabs
                              .map((e) => Tab(text: e))
                              .toList()),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          const TabBarView(
                            // physics: const NeverScrollableScrollPhysics(),
                            children: [
                              OverviewTab(),
                              RosterTab(),
                              StatsTab(),
                              LogTab(),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: double.infinity,
                              height: 9.w,
                              color: AppColors.cDEDEDE.withOpacity(0.1),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
