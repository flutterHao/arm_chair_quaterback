/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-21 17:26:07
 * @LastEditTime: 2024-11-04 16:14:16
 */

import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/half_slide_right_to_left_transition.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_v2.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class PicksIndex extends StatelessWidget {
  const PicksIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: GlobalNestedKey.PicksTabGlobalKey,
      initialRoute: RouteNames.picksPicksIndex,
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case RouteNames.picksPicksIndex:
            return GetPageRoute(
              opaque: false,
              settings: setting,
              customTransition: HalfSlideRightToLeftTransition(),
              page: () => const PicksIndexPageV2(),
            );
          case RouteNames.picksReciveRward:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const ReceiveRewardPage(),
                binding: ReciveRwardBinding());
          case RouteNames.picksPickRank:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                page: () => const PickRankPage(),
                binding: PickRankBinding());
          case RouteNames.picksPlayerDetail:
            return GetPageRoute(
                opaque: false,
                settings: setting,
                customTransition: HalfSlideRightToLeftTransition(),
                barrierColor: Colors.transparent,
                page: () =>
                    PlayerDetailPage(
                      arguments: setting.arguments as PlayerDetailPageArguments,
                    ));
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
        }
      },
    );
  }
}

class PicksIndexPageV2 extends StatefulWidget {
  const PicksIndexPageV2({super.key});

  @override
  State<PicksIndexPageV2> createState() => _PicksIndexPageV2State();
}

class _PicksIndexPageV2State extends State<PicksIndexPageV2>
    with AutomaticKeepAliveClientMixin {
  late PicksIndexController picksIndexController;

  double lastScrollPixels = 0;
  var top = 0.0.obs;
  var topOverScrollPixels = 0.0;
  var floatTitleBarHeight = 75.w;

  Widget _buildView(BuildContext context) {
    if (picksIndexController.guessGamePlayers.isEmpty &&
        picksIndexController.rankInfo.ranks.isEmpty) {
      return Expanded(
        child: SmartRefresher(
          controller: picksIndexController.refreshController,
          onRefresh: () => picksIndexController.loading(),
          child: Obx(() {
            return Center(
                child: LoadStatusWidget(
                  loadDataStatus: picksIndexController.loadStatusRx.value,
                ));
          }),
        ),
      );
    }
    return Expanded(
        child: Stack(
          children: [
            NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                // print('notification-----: ${notification.metrics.pixels}');
                if (notification.metrics.pixels >=
                    notification.metrics.minScrollExtent &&
                    notification.metrics.pixels <=
                        notification.metrics.maxScrollExtent &&
                    notification.metrics.axisDirection == AxisDirection.down) {
                  topOverScrollPixels = 0;
                  if (lastScrollPixels < notification.metrics.pixels) {
                    //向上滑
                    var result =
                        lastScrollPixels - notification.metrics.pixels +
                            top.value;
                    // print('result-111:$result,${top.value},$floatTitleBarHeight');
                    if (result < -floatTitleBarHeight) {
                      if (top.value != -floatTitleBarHeight && top.value != 0) {
                        top.value = -floatTitleBarHeight;
                      }
                    } else {
                      top.value = result;
                    }
                  }
                  if (lastScrollPixels > notification.metrics.pixels) {
                    //向下滑
                    var result =
                        lastScrollPixels - notification.metrics.pixels +
                            top.value;
                    // print('result-222:$result,${top.value},${floatTitleBarHeight}');
                    if (result > 0) {
                      if (top.value != 0 && top.value != -floatTitleBarHeight) {
                        top.value = 0;
                      }
                    } else {
                      top.value = result;
                    }
                  }
                  lastScrollPixels = notification.metrics.pixels;
                } else {
                  if (notification.metrics.pixels <
                      notification.metrics.minScrollExtent) {
                    top.value = topOverScrollPixels =
                    -notification.metrics.pixels;
                  }
                }
                return true;
              },
              child: TabBarView(
                  controller: picksIndexController.tabController,
                  children: picksIndexController.guessGamePlayers.keys.map((e) {
                    var list = picksIndexController.guessGamePlayers[e]!;
                    return GetBuilder<PicksIndexController>(
                        id: PicksIndexController.idGuessList,
                        builder: (logic) {
                          return CustomScrollView(
                            physics: const BouncingScrollPhysics(),
                            key: PageStorageKey<String>(e),
                            slivers: [
                              SliverPadding(
                                  padding: EdgeInsets.only(top: 119.w)),
                              SliverList.separated(
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  var item = list[index];
                                  return GuessItemV2(
                                    index: index,
                                    playerV2: item,
                                  );
                                },
                                separatorBuilder: (BuildContext context,
                                    int index) {
                                  return 9.vGap;
                                },
                              ),
                              SliverPadding(
                                  padding: EdgeInsets.only(bottom: 20.w))
                            ],
                          );
                        });
                  }).toList()),
            ),
            Obx(() {
              return Positioned(
                  top: top.value - topOverScrollPixels,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: AppColors.c262626,
                    child: Column(
                      children: [
                        Container(
                          height: floatTitleBarHeight,
                          color: AppColors.c262626,
                          padding: EdgeInsets.only(
                              bottom: 10.w, right: 6.w, left: 16.w, top: 3.w),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 204,
                                child: InkWell(
                                  onTap: () =>
                                      Get.toNamed(RouteNames.picksPickRank,
                                          id: GlobalNestedKey.PICKS),
                                  child: Container(
                                    height: 51.w,
                                    padding: EdgeInsets.only(
                                        left: 14.w, right: 24.w, bottom: 6.w),
                                    margin: EdgeInsets.only(top: 4.w),
                                    decoration: BoxDecoration(
                                        color: AppColors.c3B3B3B,
                                        borderRadius: BorderRadius.circular(
                                            9.w)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            IconWidget(
                                                iconWidth: 23.w,
                                                icon: Assets
                                                    .picksUiPicksStatusBarRank),
                                            16.hGap,
                                            Text(
                                              "RANK",
                                              style: 19.w5(
                                                  color: AppColors.cFFFFFF,
                                                  height: 1,
                                                  fontFamily:
                                                  FontFamily.fOswaldMedium),
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${picksIndexController.rankInfo
                                                  .myRank.rank ?? "--"}",
                                              style: 19.w4(
                                                  color: AppColors.cFFFFFF,
                                                  height: 1),
                                            ),
                                            7.vGap,
                                            Text(
                                              "ME",
                                              style: 10.w4(
                                                  color: AppColors.cFF7954,
                                                  height: 1,
                                                  fontFamily:
                                                  FontFamily.fRobotoRegular),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              9.hGap,
                              Expanded(
                                  flex: 130,
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        onTap: () =>
                                            Get.toNamed(
                                                RouteNames.picksPersonalCenter,
                                                arguments: {
                                                  "teamId": Get
                                                      .find<HomeController>()
                                                      .userEntiry
                                                      .teamLoginInfo
                                                      ?.team
                                                      ?.teamId ??
                                                      0,
                                                  "initTab": 0
                                                }),
                                        child: Container(
                                          height: 51.w,
                                          margin:
                                          EdgeInsets.only(right: 7.w, top: 4.w),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.c666666,
                                                  width: 1),
                                              borderRadius:
                                              BorderRadius.circular(9.w)),
                                          child: Row(
                                            children: [
                                              11.hGap,
                                              IconWidget(
                                                  iconWidth: 24.w,
                                                  icon: Assets
                                                      .picksUiPicksStatusBarPicks),
                                              Expanded(
                                                  child: Center(
                                                      child: Text(
                                                        "PICKS",
                                                        style: 19.w4(
                                                            color: AppColors
                                                                .cFFFFFF,
                                                            height: 1,
                                                            fontFamily:
                                                            FontFamily
                                                                .fOswaldMedium),
                                                      )))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: 0,
                                          child: Obx(() {
                                            var value = picksIndexController
                                                .choiceSize.value;
                                            if(value<=0){
                                              return const SizedBox.shrink();
                                            }
                                            return Container(
                                              height: 16.w,
                                              width: 16.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(8.w),
                                                  color: AppColors.c000000),
                                              child: Center(
                                                child: Text(
                                                  "$value",
                                                  style: 12.w5(
                                                      color: AppColors
                                                          .cF37350,
                                                      height: 1,
                                                      fontFamily:
                                                      FontFamily
                                                          .fRobotoMedium),
                                                ),
                                              ),
                                            );
                                          }))
                                    ],
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          color: AppColors.c262626,
                          child: TabBar(
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              labelColor: AppColors.cFFFFFF,
                              labelPadding: EdgeInsets.symmetric(
                                  vertical: 5.w, horizontal: 20.w),
                              indicatorPadding: EdgeInsets.only(top: 5.w),
                              labelStyle: 16.w5(
                                  color: AppColors.cFFFFFF,
                                  fontFamily: FontFamily.fOswaldMedium),
                              unselectedLabelColor: AppColors.c666666,
                              dividerHeight: 0,
                              indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                      color: AppColors.cFF7954, width: 3.w),
                                  insets: EdgeInsets.symmetric(
                                      horizontal: -20.w)),
                              indicatorWeight: 4,
                              controller: picksIndexController.tabController,
                              tabs: picksIndexController.guessGamePlayers.keys
                                  .map((e) {
                                return Text(e.replaceAll(",", "+"));
                              }).toList()),
                        )
                      ],
                    ),
                  ));
            }),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    picksIndexController = Get.find();
    return GetBuilder<PicksIndexController>(
        id: PicksIndexController.idMain,
        builder: (logic) {
          return BlackAppWidget(
            const UserInfoBar(
              title: "PICKS",
              routeId: GlobalNestedKey.PICKS,
            ),
            bodyWidget: _buildView(context),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
