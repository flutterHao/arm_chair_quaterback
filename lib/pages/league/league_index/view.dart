import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/half_slide_right_to_left_transition.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/widgets/score_page.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/news/rank/stats_view.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalNestedKey.LEAGUESTabGlobalKey,
      initialRoute: RouteNames.league,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case RouteNames.league:
            return GetPageRoute(
              opaque: false,
              settings: setting,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const LeagueIndexPage(),
            );
          case RouteNames.mineMineInfo:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineInfoPage(),
                binding: MineInfoBinding());
          case RouteNames.mineMineSetting:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineSettingPage(),
                binding: MineSettingBinding());
          case RouteNames.mineMineAccount:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const MineAccountPage(),
                binding: MineAccountBinding());
          case RouteNames.statsRank:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const StatsRankPage(),
                binding: RankBinding());
        }
      },
    );
  }
}

class LeagueIndexPage extends StatefulWidget {
  const LeagueIndexPage({super.key});

  @override
  State<LeagueIndexPage> createState() => _LeagueIndexPageState();
}

class _LeagueIndexPageState extends State<LeagueIndexPage>
    with AutomaticKeepAliveClientMixin {
  late LeagueController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
  }

  // 主视图
  Widget _buildView() {
    return Expanded(
      child: Obx(() {
        if (controller.loadStatus.value != LoadDataStatus.success) {
          return Expanded(
              child: SmartRefresher(
            controller: controller.refreshController,
            child: Center(
              child: LoadStatusWidget(
                loadDataStatus: controller.loadStatus.value,
              ),
            ),
          ));
        }
        return PageStorage(
          bucket: PageStorageBucket(),
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                buildHeader(),
              ];
            },
            body: ExtendedTabBarView(
                cacheExtent: 1,
                controller: controller.tabController,
                children: controller.getDataTimes().map((e) {
                  return ScorePage(e);
                }).toList()),
          ),
        );
      }),
    );
  }

  SliverPersistentHeader buildHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: FixedHeightSliverHeaderDelegate(
          child: Container(
            height: 58.w,
            width: double.infinity,
            color: AppColors.c262626,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                16.hGap,
                Expanded(
                    child: Container(
                  height: 44.w,
                  decoration: BoxDecoration(
                    color: AppColors.c000000,
                    borderRadius: BorderRadius.circular(9.w),
                  ),
                  child: TabBar(
                    isScrollable: true,
                    dividerHeight: 0,
                    tabAlignment: TabAlignment.start,
                    labelStyle: 12.w4(
                        color: AppColors.cFFFFFF,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                    unselectedLabelStyle: 12.w4(
                        color: AppColors.c808080,
                        height: 1,
                        fontFamily: FontFamily.fRobotoRegular),
                    controller: controller.tabController,
                    indicator: BoxDecoration(
                        color: AppColors.c262626,
                        borderRadius: BorderRadius.circular(7.w)),
                    indicatorPadding: EdgeInsets.symmetric(vertical: 3.w),
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap: controller.onPageChanged,
                    tabs: controller.getDataTimes().map((e) {
                      var today = MyDateUtils.isToday(e.millisecondsSinceEpoch);
                      int index = controller.getDataTimes().indexOf(e);
                      return Obx(() {
                        var currentIndex = controller.currentPageIndex.value;
                        var select = currentIndex == index;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (today
                                      ? "TODAY"
                                      : MyDateUtils.getWeekday(e, short: true))
                                  .toUpperCase(),
                              style: 12.w4(
                                  color: today
                                      ? AppColors.cFF7954
                                      : select
                                          ? AppColors.cFFFFFF
                                          : AppColors.c808080,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            2.vGap,
                            Text(
                              e.day.toString(),
                              style: 16.w5(
                                  color: select
                                      ? AppColors.cFFFFFF
                                      : AppColors.c808080,
                                  fontFamily: FontFamily.fOswaldMedium,
                                  height: 1),
                            )
                          ],
                        );
                      });
                    }).toList(),
                  ),
                )),
                21.hGap,
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.c666666, width: 1),
                      borderRadius: BorderRadius.circular(9.w)),
                  child: MtInkwell(
                      onTap: () => Get.toNamed(
                            RouteNames.statsRank,
                            id: GlobalNestedKey.LEAGUES,
                          ),
                      child: IconWidget(
                          iconWidth: 21.w,
                          icon: Assets.scoresUiScoresIconSystemRank)),
                ),
                10.hGap,
              ],
            ),
          ),
          height: 58.w),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeagueController>(builder: (_) {
      return BlackAppWidget(
        const UserInfoBar(
          title: "COMMUNITIES",
          routeId: GlobalNestedKey.LEAGUES,
        ),
        bodyWidget: _buildView(),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
