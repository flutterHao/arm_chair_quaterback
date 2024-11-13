/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-21 17:26:07
 * @LastEditTime: 2024-11-04 16:14:16
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/common/widgets/my_water_drop_header.dart';
import 'package:arm_chair_quaterback/common/widgets/player_avatar_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/transitions/half_slide_right_to_left_transition.dart';
import 'package:arm_chair_quaterback/common/widgets/user_info_bar.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_account/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_info/view.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/bindings.dart';
import 'package:arm_chair_quaterback/pages/mine/mine_setting/view.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/personal_center/view.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/bindings.dart';
import 'package:arm_chair_quaterback/pages/picks/pick_rank/view.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_v2.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guss_player_item.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/picks_guess_confirm_dialog_v2.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/picks_swiper_pagination_builder.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/rank_start_button.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/index.dart';
import 'package:arm_chair_quaterback/pages/picks/recive_rward/view.dart';
import 'package:card_swiper/card_swiper.dart';
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
                page: () => PlayerDetailPage(
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
            if (notification.metrics.axisDirection == AxisDirection.down &&
                !picksIndexController.refreshController.isRefresh) {
              if (lastScrollPixels < notification.metrics.pixels) {
                //向上滑
                var result =
                    lastScrollPixels - notification.metrics.pixels + top.value;
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
                    lastScrollPixels - notification.metrics.pixels + top.value;
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
            }
            return true;
          },
          child: TabBarView(
              controller: picksIndexController.tabController,
              children: picksIndexController.guessGamePlayers.keys.map((e) {
                var list = picksIndexController.guessGamePlayers[e]!;
                return Builder(builder: (context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(e),
                    slivers: [
                      Obx(() {
                        return SliverPadding(
                            padding: EdgeInsets.only(top: 119.w + top.value));
                      }),
                      SliverList.separated(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          var item = list[index];
                          return GuessItemV2(
                            index: index,
                            playerV2: item,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return 9.vGap;
                        },
                      ),
                      SliverPadding(padding: EdgeInsets.only(bottom: 20.w))
                    ],
                  );
                });
              }).toList()),
        ),
        Obx(() {
          return Positioned(
              top: top.value,
              left: 0,
              right: 0,
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
                            onTap: ()=>   Get.toNamed(RouteNames.picksPickRank,
                                id: GlobalNestedKey.PICKS),
                            child: Container(
                              height: 51.w,
                              padding: EdgeInsets.only(
                                  left: 14.w, right: 24.w, bottom: 6.w),
                              margin: EdgeInsets.only(top: 4.w),
                              decoration: BoxDecoration(
                                  color: AppColors.c3B3B3B,
                                  borderRadius: BorderRadius.circular(9.w)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconWidget(
                                          iconWidth: 23.w,
                                          icon: Assets.testTeamLogoPng),
                                      16.hGap,
                                      Text(
                                        "RANK",
                                        style: 19.w5(
                                            color: AppColors.cFFFFFF,
                                            height: 1,
                                            fontFamily: FontFamily.fOswaldMedium),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${picksIndexController.rankInfo.myRank.rank ?? "--"}",
                                        style: 19.w4(
                                            color: AppColors.cFFFFFF, height: 1),
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
                                  onTap: ()=> Get.toNamed(RouteNames.picksPersonalCenter,
                                      arguments: {
                                        "teamId": Get.find<HomeController>()
                                            .userEntiry
                                            .teamLoginInfo
                                            ?.team
                                            ?.teamId ??
                                            0,
                                        "initTab": 0
                                      }),
                                  child: Container(
                                    height: 51.w,
                                    margin: EdgeInsets.only(right: 7.w, top: 4.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.c666666, width: 1),
                                        borderRadius: BorderRadius.circular(9.w)),
                                    child: Row(
                                      children: [
                                        11.hGap,
                                        IconWidget(
                                            iconWidth: 24.w,
                                            icon: Assets.testTeamLogoPng),
                                        Expanded(
                                            child: Center(
                                                child: Text(
                                          "PICKS",
                                          style: 19.w4(
                                              color: AppColors.cFFFFFF,
                                              height: 1,
                                              fontFamily:
                                                  FontFamily.fOswaldMedium),
                                        )))
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: Container(
                                      height: 16.w,
                                      width: 16.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.w),
                                          color: AppColors.c000000),
                                      child: Center(
                                        child: Obx(() {
                                          return Text(
                                            "${picksIndexController.choiceSize.value}",
                                            style: 12.w5(
                                                color: AppColors.cF37350,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoMedium),
                                          );
                                        }),
                                      ),
                                    ))
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
                            insets: EdgeInsets.symmetric(horizontal: -20.w)),
                        indicatorWeight: 4,
                        controller: picksIndexController.tabController,
                        tabs:
                            picksIndexController.guessGamePlayers.keys.map((e) {
                          return Text(Utils.getLongName(ParamUtils.getProKey(e))
                              .toUpperCase());
                        }).toList()),
                  )
                ],
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
            floatWidgets: [
              //下注
              Obx(() {
                var value = picksIndexController.choiceSize.value;
                return AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    left: 0,
                    right: 0,
                    bottom: value <= 0 ? -70.w : 20.w,
                    child: Center(
                      child: MtInkwell(
                        onTap: () async {
                          await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: AppColors.cTransparent,
                              context: Get.context!,
                              builder: (context) {
                                return const PicksGuessConfirmDialogV2();
                              });
                          Get.find<PicksIndexController>()
                              .batchDeleteOpen
                              .value = false;
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.c000000,
                                borderRadius: BorderRadius.circular(16.w),
                                border: Border.all(
                                    color: AppColors.cFF7954, width: 2.w)),
                            width: 360.w,
                            height: 66.w,
                            padding: EdgeInsets.only(left: 17.w, right: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "CREATE A COMBO",
                                  style: 16.w5(
                                      color: AppColors.cFFFFFF,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                                9.vGap,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: List.generate(6, (index) {
                                        Color color = AppColors.c4D4D4D;
                                        if (index + 1 <=
                                            picksIndexController
                                                .choiceSize.value) {
                                          color = AppColors.cFF7954;
                                        }
                                        return IconWidget(
                                          iconWidth: 19.w,
                                          icon: Assets.testTeamLogoPng,
                                          iconColor: color,
                                        );
                                      }),
                                    ),
                                    Container(
                                      height: 24.w,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 13.w),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColors.cFF7954,
                                          borderRadius:
                                              BorderRadius.circular(12.w)),
                                      child: Text(
                                        "${picksIndexController.choiceSize.value > 0 ? picksIndexController.newsDefine.powerBetWin[picksIndexController.choiceSize.value - 1] : "0"}x",
                                        style: 16.w5(
                                            color: AppColors.c000000,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldMedium),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ));
              })
            ],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class PicksIndexPage extends StatefulWidget {
  const PicksIndexPage({super.key});

  @override
  State<PicksIndexPage> createState() => _PicksIndexPageState();
}

class _PicksIndexPageState extends State<PicksIndexPage>
    with AutomaticKeepAliveClientMixin {
  late PicksIndexController picksIndexController;

  // 主视图
  Widget _buildView(BuildContext context, double appBarHeight) {
    print('appBarHeight:$appBarHeight');
    return Container(
      padding: EdgeInsets.only(top: appBarHeight - 16.w),
      child: SmartRefresher(
        controller: picksIndexController.refreshController,
        onRefresh: () => picksIndexController.loading(),
        header: MyWaterDropHeader(
          topPadding: 16.w * 2,
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: picksIndexController.scrollController,
          slivers: [
            SliverPadding(padding: EdgeInsets.only(top: 16.w)),
            //banner
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 315 / 137,
                child: Container(
                  margin: EdgeInsets.only(top: 16.w),
                  child: Center(
                    child: Swiper(
                      itemCount: 3,
                      // autoplay: true,
                      // loop: false,
                      index: 2,
                      viewportFraction: .8,
                      indicatorLayout: PageIndicatorLayout.COLOR,
                      scale: .9,
                      pagination: PicksSwiperPaginationBuilder(),
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            Get.toNamed(RouteNames.picksReciveRward,
                                id: GlobalNestedKey.PICKS);
                            break;
                          case 1:
                            Get.toNamed(RouteNames.picksPersonalCenter,
                                arguments: {
                                  "teamId": Get.find<HomeController>()
                                          .userEntiry
                                          .teamLoginInfo
                                          ?.team
                                          ?.teamId ??
                                      0,
                                  "initTab": 0
                                });
                            break;
                          case 2:
                            Get.toNamed(RouteNames.picksPickRank,
                                id: GlobalNestedKey.PICKS);
                            break;
                        }
                      },
                      itemBuilder: (_, index) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 315 / 137,
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.w)),
                                    child: Image.asset(
                                      index == 0
                                          ? Assets.uiBannerAwardPng
                                          : index == 1
                                              ? Assets.uiBannerHistoryPng
                                              : Assets.uiBannerRankPng,
                                      height: 137.w,
                                      fit: BoxFit.fitWidth,
                                    )),
                              ),
                              Positioned(
                                  bottom: 8.w,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                      child: Text(
                                    index == 0
                                        ? "RECEIVE AWARD"
                                        : index == 1
                                            ? "HISTORICAL"
                                            : "BOUNS POOL",
                                    style: 19.w7(
                                        color: AppColors.cE6E6E6, height: 1),
                                  )))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            ...oldWidget(),
          ],
        ),
      ),
    );
  }

  /// 旧版的代码
  List<Widget> oldWidget() {
    return [
      if (picksIndexController.guessGamePlayers.isEmpty &&
          picksIndexController.rankInfo.ranks.isEmpty)
        SliverToBoxAdapter(child: Obx(() {
          return Container(
              height: 300.w,
              alignment: Alignment.center,
              child: LoadStatusWidget(
                loadDataStatus: picksIndexController.loadStatusRx.value,
              ));
        }))
      else ...[
        if (picksIndexController.guessGamePlayers.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 16.w, right: 37.w, top: 20.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pick M&L",
                    style: 19.w7(color: AppColors.c000000),
                  ),
                  // Text(
                  //   "07/28 Wed",
                  //   style: TextStyle(fontSize: 13.sp, color: AppColors.c666666),
                  // )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 44.w,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: picksIndexController.guessGamePlayers.keys.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool currentIndex =
                          index == picksIndexController.currentIndex.value;
                      var keys = picksIndexController.guessGamePlayers.keys;
                      bool lastIndex = index == keys.length - 1;
                      return Center(
                        child: InkWell(
                          onTap: () {
                            picksIndexController.changeTab(index);
                          },
                          child: Container(
                            width: 61.w,
                            height: 20.w,
                            margin: EdgeInsets.only(
                                left: index == 0 ? 16.w : 0,
                                right: lastIndex ? 16.w : 4.w),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: currentIndex
                                    ? AppColors.c262626
                                    : AppColors.cD9D9D9,
                                borderRadius: BorderRadius.circular(10.w)),
                            child: Text(
                              Utils.getName(keys.toList()[index]),
                              style: 13.w4(
                                  color: currentIndex
                                      ? AppColors.cF2F2F2
                                      : AppColors.c262626),
                            ),
                          ),
                        ),
                      );
                    });
                  }),
            ),
          ),
          //竞猜球员列表
          GetBuilder<PicksIndexController>(
              id: PicksIndexController.idGuessList,
              builder: (_) {
                return SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          childCount: picksIndexController
                              .guessGamePlayers[picksIndexController
                                      .guessGamePlayers.keys
                                      .toList()[
                                  picksIndexController.currentIndex.value]]!
                              .length, (_, index) {
                        var list = picksIndexController.guessGamePlayers[
                            picksIndexController.guessGamePlayers.keys.toList()[
                                picksIndexController.currentIndex.value]]!;
                        var item = list[index];
                        return GuessItemV2(
                          index: index,
                          playerV2: item,
                        );
                      }),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 167 / 164,
                          mainAxisExtent: 167.w,
                          mainAxisSpacing: 9.w,
                          crossAxisSpacing: 9.w,
                          crossAxisCount: 2)),
                );
              }),
        ],
        //竞猜榜单
        ...[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                  left: 16.w, right: 37.w, top: 20.w, bottom: 13.w),
              child: Text(
                "Pick M&L",
                style: 19.w7(color: AppColors.c000000),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 36.w,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 24.w, right: 26.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.w),
                      topRight: Radius.circular(16.w))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 90.w,
                    child: Text(
                      "LIST",
                      style:
                          TextStyle(fontSize: 10.sp, color: AppColors.c666666),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "NAME",
                      style:
                          TextStyle(fontSize: 10.sp, color: AppColors.c666666),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 55.w,
                    child: Text(
                      "JETTON",
                      style:
                          TextStyle(fontSize: 10.sp, color: AppColors.c666666),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(childCount: 10, (_, index) {
                if (index > (picksIndexController.rankInfo.ranks.length - 1)) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color:
                            index % 2 != 0 ? Colors.white : AppColors.cEDEDED,
                        borderRadius: index == 9
                            ? BorderRadius.only(
                                bottomRight: Radius.circular(16.w),
                                bottomLeft: Radius.circular(16.w))
                            : null),
                    padding: EdgeInsets.only(left: 24.w, right: 26.w),
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${index + 1}",
                                      style: 18.w7(color: AppColors.c262626)),
                                  SizedBox(
                                    height: 5.w,
                                    width: 26.w,
                                  )
                                ],
                              ),
                              Container(
                                width: 40.w,
                                height: 40.w,
                                margin: EdgeInsets.only(left: 7.w),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "NO data",
                          style:
                              18.w7(color: AppColors.cB3B3B3.withOpacity(0.5)),
                        )
                      ],
                    ),
                  );
                }
                RankInfoEntity item =
                    picksIndexController.rankInfo.ranks[index];
                int selfIndex = picksIndexController.rankInfo.ranks.indexWhere(
                    (e) =>
                        e.teamId ==
                        picksIndexController.rankInfo.myRank.teamId);
                var len = picksIndexController.rankInfo.ranks.length;
                return InkWell(
                  onTap: () => Get.toNamed(RouteNames.picksPersonalCenter,
                      arguments: {"teamId": item.teamId}),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color:
                              index % 2 != 0 ? Colors.white : AppColors.cEDEDED,
                          borderRadius: index == 9
                              ? BorderRadius.only(
                                  bottomRight: Radius.circular(16.w),
                                  bottomLeft: Radius.circular(16.w))
                              : null),
                      padding: EdgeInsets.only(left: 24.w, right: 26.w),
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: GussPlayerItem(
                        index, item, selfIndex,
                        //滑动到榜单的第3个列表项时显示个人榜单信息
                        key: selfIndex != -1
                            ? null
                            : len > 5
                                ? index == 5
                                    ? picksIndexController.targetKey
                                    : null
                                : index == len - 1
                                    ? picksIndexController.targetKey
                                    : null,
                        // ? picksIndexController.targetKey
                        // : null,
                      )),
                );
              }),
              itemExtent: 70.w),
        ],

        SliverToBoxAdapter(
          child: SizedBox(
            height: 20.w,
          ),
        )
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    picksIndexController = Get.find();
    return GetBuilder<PicksIndexController>(
      id: PicksIndexController.idMain,
      builder: (_) {
        return BlackAppWidget(
          const UserInfoBar(
            title: "PICKS",
            routeId: GlobalNestedKey.PICKS,
          ),
          totalScreenBuilder: _buildView,
          floatWidgets: [
            //个人榜单信息浮窗
            Obx(() {
              return AnimatedPositioned(
                  left: 6.w,
                  right: 6.w,
                  bottom: picksIndexController.isSelfInfoFloatShow.value
                      ? 9.w
                      : -68.w,
                  duration: const Duration(milliseconds: 300),
                  child: InkWell(
                    onTap: () => Get.toNamed(RouteNames.picksPersonalCenter,
                        arguments: {
                          "teamId": Get.find<HomeController>()
                              .userEntiry
                              .teamLoginInfo
                              ?.team
                              ?.teamId
                        }),
                    child: Container(
                      padding: EdgeInsets.only(left: 43.w, right: 33.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: AppColors.c333333),
                      height: 68.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${picksIndexController.rankInfo.myRank.rank == 0 ? '--' : picksIndexController.rankInfo.myRank.rank}",
                                style: 18.w7(color: AppColors.cFF7954),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              ImageWidget(
                                imageFailedPath: Assets.uiHead_01Png,
                                borderRadius: BorderRadius.circular(24.w),
                                url: Utils.getTeamUrl(picksIndexController
                                    .rankInfo.myRank.teamLogo),
                                width: 48.w,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 12.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamName}",
                                      style: 12.w7(
                                          color: AppColors.cFF7954,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                    SizedBox(
                                      height: 3.w,
                                    ),
                                    Text(
                                      "WIN  ${picksIndexController.rankInfo.myRank.win ?? 0}",
                                      style: TextStyle(
                                          color: AppColors.cB3B3B3,
                                          fontSize: 10.sp),
                                    ),
                                    Text(
                                      "SUCCESS  ${picksIndexController.rankInfo.myRank.getSuccess}%",
                                      style: TextStyle(
                                          color: AppColors.cB3B3B3,
                                          fontSize: 10.sp),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            (picksIndexController.rankInfo.myRank.chip ?? 0)
                                .toDouble()
                                .toStringAsFixed(0),
                            style: 18.w7(color: AppColors.cFFFFFF),
                          )
                        ],
                      ),
                    ),
                  ));
            }),
            //下注
            Obx(() {
              print('choiceSize-obx----');
              var value = picksIndexController.choiceSize.value;
              // if (value <= 0) {
              //   return const SizedBox.shrink();
              // }
              return AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: 0,
                  right: 0,
                  bottom: value <= 0 ? -60.w : 20.w,
                  child: Center(
                    child: Container(
                        constraints: BoxConstraints(
                          maxWidth: 263.w,
                        ),
                        child: RankStartButton(
                          value,
                        )),
                  ));
            })
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
