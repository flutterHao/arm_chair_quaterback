/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-21 17:26:07
 * @LastEditTime: 2024-11-04 16:14:16
 */

import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/delegate/fixed_height_sliver_header_delegate.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_v2.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PicksIndex extends StatelessWidget {
  const PicksIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return const PicksIndexPageV2();
  }
}

class PicksIndexPageV2 extends StatefulWidget {
  const PicksIndexPageV2({super.key});

  @override
  State<PicksIndexPageV2> createState() => _PicksIndexPageV2State();
}

class _PicksIndexPageV2State extends State<PicksIndexPageV2>
    with AutomaticKeepAliveClientMixin {
  late PicksIndexController controller;

  double lastScrollPixels = 0;
  var top = 0.0.obs;
  var topOverScrollPixels = 0.0;
  var floatTitleBarHeight = 75.w;

  Widget _buildView(BuildContext context) {
    return NestedScrollView(
        controller: controller.scrollController,
        // floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              floating: true,
              delegate: FixedHeightSliverHeaderDelegate(
                  child: Container(
                    color: AppColors.c262626,
                    padding: EdgeInsets.only(
                        bottom: 10.w, right: 6.w, left: 16.w, top: 3.w),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 204,
                          child: InkWell(
                            onTap: () => Get.toNamed(RouteNames.picksPickRank),
                            child: Container(
                              height: 51.w,
                              padding: EdgeInsets.only(
                                  left: 14.w, right: 24.w, bottom: 6.w),
                              margin: EdgeInsets.only(top: 4.w),
                              decoration: BoxDecoration(
                                  color: AppColors.c3B3B3B,
                                  borderRadius: BorderRadius.circular(9.w)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconWidget(
                                          iconWidth: 23.w,
                                          icon:
                                              Assets.picksUiPicksStatusBarRank),
                                      16.hGap,
                                      Text(
                                        LangKey.newsTabRank.tr,
                                        style: 19.w5(
                                            color: AppColors.cFFFFFF,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fOswaldMedium),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${(controller.rankInfo?.myRank.rank ?? 0) > 0 ? controller.rankInfo?.myRank.rank : "--"}",
                                        style: 19.w4(
                                            color: AppColors.cFFFFFF,
                                            height: 1),
                                      ),
                                      7.vGap,
                                      Text(
                                        LangKey.gameTabMe.tr,
                                        maxLines: 1,
                                        style: 10.w4(
                                            color: AppColors.cFF7954,
                                            height: 1,
                                            fontFamily:
                                                FontFamily.fRobotoRegular),
                                      )
                                    ],
                                  ))
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
                                  onTap: () => Get.toNamed(
                                    RouteNames.picksPicksHistory,
                                  ),
                                  child: Container(
                                    height: 51.w,
                                    margin:
                                        EdgeInsets.only(right: 7.w, top: 4.w),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.c666666, width: 1),
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
                                          LangKey.pickTabHistory.tr,
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
                                    child: Obx(() {
                                      var value = controller.choiceSize.value;
                                      if (value <= 0) {
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
                                                color: AppColors.cF37350,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoMedium),
                                          ),
                                        ),
                                      );
                                    }))
                              ],
                            ))
                      ],
                    ),
                  ),
                  height: floatTitleBarHeight),
            ),
            if (controller.guessGamePlayers.isNotEmpty)
              SliverPersistentHeader(
                  pinned: true,
                  delegate: FixedHeightSliverHeaderDelegate(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        color: AppColors.c262626,
                        child: TabBar(
                            isScrollable: true,
                            tabAlignment: TabAlignment.start,
                            labelColor: AppColors.cFFFFFF,
                            labelPadding: EdgeInsets.symmetric(
                                vertical: 5.w, horizontal: 20.w),
                            // indicatorPadding: EdgeInsets.only(top: 5.w),
                            labelStyle: 16.w5(
                                color: AppColors.cFFFFFF,
                                fontFamily: FontFamily.fOswaldMedium),
                            unselectedLabelColor: AppColors.c666666,
                            dividerHeight: 0,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                    color: AppColors.cFF7954, width: 3.w)),
                            indicatorWeight: 4,
                            controller: controller.tabController,
                            tabs: controller.guessGamePlayers.keys.map((e) {
                              return Text(
                                  Utils.getPicksTabKey(e.replaceAll(",", "+"))
                                      .tr);
                            }).toList()),
                      ),
                      height: 34.w)),
          ];
        },
        body: Builder(builder: (context) {
          if (controller.guessGamePlayers.isEmpty) {
            return SmartRefresher(
              controller: controller.refreshController,
              onRefresh: controller.loading,
              child: Obx(() {
                return Center(
                    child: LoadStatusWidget(
                  loadDataStatus: controller.loadStatusRx.value,
                ));
              }),
            );
          }
          return ExtendedTabBarView(
              cacheExtent: controller.guessGamePlayers.keys.length - 1,
              controller: controller.tabController,
              children: controller.guessGamePlayers.keys.map((e) {
                var list = controller.guessGamePlayers[e]!;
                return _TabViewItemPage(list: list, keyStr: e);
              }).toList());
        }));
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    return GetBuilder<PicksIndexController>(
        id: PicksIndexController.idMain,
        builder: (logic) {
          return _buildView(context);
        });
  }

  @override
  bool get wantKeepAlive => true;
}

class _TabViewItemPage extends StatefulWidget {
  const _TabViewItemPage({super.key, required this.list, required this.keyStr});

  final List<PicksPlayerV2> list;
  final String keyStr;

  @override
  State<_TabViewItemPage> createState() => _TabViewItemPageState();
}

class _TabViewItemPageState extends State<_TabViewItemPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController refreshController = RefreshController();

  late StreamSubscription<LoadDataStatus> subscription;

  SmartRefresher _buildTabViewItemPage(List<PicksPlayerV2> list) {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: () => Get.find<PicksIndexController>().loading(),
      physics: const BouncingScrollPhysics(),
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var item = list[index];
          bool lastIndex = list.length - 1 == index;
          return Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      top: index == 0 ? 9.w : 0, bottom: lastIndex ? 15.w : 0),
                  child: GuessItemV2(
                    index: index,
                    playerV2: item,
                  )),
              if (lastIndex)
                Obx(() {
                  var picksIndexController = Get.find<PicksIndexController>();
                  var leagueController = Get.find<LeagueController>();
                  var value = picksIndexController.choiceSize.value;
                  value += leagueController.choiceSize.value;
                  return AnimatedContainer(
                    margin: EdgeInsets.only(bottom: value > 0 ? 94.w : 0),
                    duration: const Duration(milliseconds: 300),
                  );
                })
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return 9.vGap;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    subscription = Get.find<PicksIndexController>().loadStatusRx.listen((v) {
      if (v != LoadDataStatus.loading) {
        refreshController.refreshCompleted();
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PicksIndexController>(
        id: PicksIndexController.idGuessList,
        builder: (logic) {
          return _buildTabViewItemPage(widget.list);
        });
  }

  @override
  bool get wantKeepAlive => true;
}
