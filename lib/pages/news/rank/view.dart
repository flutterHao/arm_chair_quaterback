import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/TLBuilderWidget.dart';
import 'package:arm_chair_quaterback/common/widgets/app_bar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/news/rank/controller.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/pages/news/rank/index.dart';
import 'package:arm_chair_quaterback/pages/news/rank/team_view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/border_container.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/search_bottom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NBARankPage extends GetView<RankController> {
  const NBARankPage({super.key});

  // 主视图
  Widget _buildView(context) {
    int length = Get.find<LeagueController>().scoreList.length;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 139.5.w,
          color: AppColors.c266AB4,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 19.w,
                child: IconWidget(
                  iconWidth: 23.5.w,
                  iconHeight: 53.5.w,
                  icon: Assets.common100,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                top: 15.w,
                right: 15.w,
                child: IconWidget(
                  iconWidth: 19.w,
                  icon: Assets.commonUiCommonStatusBarStar,
                  iconColor: AppColors.cFFFFFF,
                ),
              ),
              Positioned(
                top: 88.w,
                child: Text(
                  "NAtional basketball association".toUpperCase(),
                  style: 21.w4(
                    height: 0.8,
                    color: AppColors.cFFFFFF,
                    fontFamily: FontFamily.fOswaldMedium,
                  ),
                ),
              ),
              Positioned(
                  top: 114.5.w,
                  child: Text(
                    "$length games today".toUpperCase(),
                    style: 10.w4(
                      color: AppColors.cFFFFFF,
                      fontFamily: FontFamily.fRobotoRegular,
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          child: DefaultTabController(
            length: controller.tabs.length,
            child: Column(
              children: [
                Container(
                  height: 43.w,
                  alignment: Alignment.bottomCenter,
                  color: AppColors.cFFFFFF,
                  width: double.infinity,
                  child: TabBar(
                      controller: controller.tabController,
                      isScrollable: false,
                      labelColor: AppColors.c000000,
                      labelPadding: EdgeInsets.zero,
                      // indicatorPadding: EdgeInsets.only(top: 5.w),
                      labelStyle: 16.w4(fontFamily: FontFamily.fOswaldMedium),
                      unselectedLabelStyle:
                          16.w4(fontFamily: FontFamily.fOswaldRegular),
                      unselectedLabelColor: AppColors.cB3B3B3,
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(color: AppColors.cFF7954, width: 3.w)),
                      indicatorWeight: 3.w,
                      tabs: [
                        for (int i = 0; i < controller.tabs.length; i++)
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  child: Text(
                                    i == 0
                                        ? controller.teamRankType[
                                            controller.teamTypeIndex]
                                        : "STARS",
                                    textAlign: TextAlign.center,
                                  )),
                              if (i == 0)
                                Positioned(
                                  right: 18.w,
                                  child: IconWidget(
                                    iconWidth: 11.5.w,
                                    icon: Assets.iconUiIconArrows04,
                                    iconColor:
                                        controller.tabController.index == 0
                                            ? AppColors.c000000
                                            : AppColors.cB3B3B3,
                                  ),
                                )
                            ],
                          )
                      ]),
                ),
                Expanded(
                    child: TabBarView(
                  // physics: const NeverScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: const [
                    TeamRankPage(),
                    StatsRankPage(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<RankController>(
        builder: (_) {
          return BlackAppWidget(
              const UserInfoBar(
                title: "Stars",
                showPop: true,
              ),
              bodyWidget: Expanded(
                child: _buildView(context),
              ));
        },
      ),
    );
  }
}
