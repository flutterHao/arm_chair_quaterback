import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/summary/controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({required this.playerId, super.key, this.tabStr});

  final int playerId;
  final String? tabStr;

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage>
    with AutomaticKeepAliveClientMixin {
  late PlayerDetailController playerDetailController;
  late SummaryController controller;

  @override
  Widget build(BuildContext context) {
    playerDetailController = Get.find();
    return GetBuilder<SummaryController>(
      init: controller =
          SummaryController(widget.playerId, initTabStr: widget.tabStr),
      id: SummaryController.idSummaryMain,
      builder: (_) {
        var scrollController1 = ScrollController();
        var scrollController = ScrollController();
        if (controller.nbaPlayerBaseInfoEntity == null) {
          return Obx(() {
            return Center(
              child: LoadStatusWidget(
                loadDataStatus: controller.loadStatus.value,
              ),
            );
          });
        } else {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                18.vGap,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "Season Average",
                    style: 16.w7(color: AppColors.c262626, height: 1),
                  ),
                ),
                Builder(builder: (context) {
                  var seasonAverageData = controller.getSeasonAverageData();
                  return SizedBox(
                    height: 90.w,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController1,
                        physics: OneBoundaryScrollPhysics(
                            scrollController: scrollController1),
                        itemCount: seasonAverageData.length,
                        itemBuilder: (context, index) {
                          PlayerRegular item = seasonAverageData[index];
                          return Container(
                            height: 62.w,
                            width: 62.w,
                            margin: EdgeInsets.only(
                                right: 4.w,
                                top: 14.w,
                                bottom: 14.w,
                                left: index == 0 ? 16.w : 0),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  item.value.toStringAsFixed(1),
                                  style: 19
                                      .w7(color: AppColors.c262626, height: 1),
                                ),
                                6.vGap,
                                Text(
                                  item.key,
                                  style: 10
                                      .w4(color: AppColors.c666666, height: 1),
                                ),
                                2.vGap,
                                Opacity(
                                    opacity: item.rank <= 100 ? 1 : 0,
                                    child: Text(
                                      Utils.getSortWithInt(item.rank),
                                      style: 12.w7(
                                          color: AppColors.cFF7954, height: 1),
                                    )),
                                2.vGap
                              ],
                            ),
                          );
                        }),
                  );
                }),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "Recent Performance",
                    style: 16.w7(color: AppColors.c262626, height: 1),
                  ),
                ),
                GetBuilder<SummaryController>(
                    id: SummaryController.idTabContent,
                    builder: (c) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 48.w,
                            child: ListView.builder(
                                itemCount: Constant.guessTypeList.length,
                                controller: scrollController,
                                physics: OneBoundaryScrollPhysics(
                                    scrollController: scrollController),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var key = Constant.guessTypeList[index];
                                  return Obx(() {
                                    bool isSelected =
                                        controller.currentIndex.value == index;
                                    return InkWell(
                                      onTap: () => controller.onTabTap(index),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            right: 4.w,
                                            top: 14.w,
                                            bottom: 14.w,
                                            left: index == 0 ? 16.w : 0),
                                        height: 20.w,
                                        width: 61.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: isSelected
                                                ? AppColors.c262626
                                                : AppColors.cD9D9D9,
                                            borderRadius:
                                                BorderRadius.circular(10.w)),
                                        child: Text(
                                          key,
                                          style: 13.w4(
                                              color: isSelected
                                                  ? AppColors.cF2F2F2
                                                  : AppColors.c262626,
                                              height: 1),
                                        ),
                                      ),
                                    );
                                  });
                                }),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  height: 70.w,
                                  padding: EdgeInsets.only(left: 14.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cF2F2F2,
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Season Avg",
                                        style: 14.w4(
                                            color: AppColors.c666666,
                                            height: 1),
                                      ),
                                      10.vGap,
                                      Text(
                                        controller.getSeasonAvgWithTab(),
                                        style: 27.w7(
                                            color: AppColors.c262626,
                                            height: 1),
                                      )
                                    ],
                                  ),
                                )),
                                9.hGap,
                                Expanded(
                                    child: Container(
                                  height: 70.w,
                                  padding: EdgeInsets.only(left: 14.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cF2F2F2,
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Last 5 Avg",
                                        style: 14.w4(
                                            color: AppColors.c666666,
                                            height: 1),
                                      ),
                                      10.vGap,
                                      Text(
                                        controller.getLast5AvgWithTab(),
                                        style: 27.w7(
                                            color: AppColors.c262626,
                                            height: 1),
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                          9.vGap,
                          Container(
                            height: 162.w,
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w)),
                            child: Stack(
                              children: [
                                _buildDefaultColumnChart(context),
                              ],
                            ),
                          ),
                          _buildPick(),
                          _buildCommunityPick(),
                          Builder(builder: (context) {
                            if (controller.getVsTeams().isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return Column(
                              children: [
                                9.vGap,
                                Container(
                                  height: 87.w,
                                  width: double.infinity,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cF2F2F2,
                                      image: const DecorationImage(
                                          image: AssetImage(
                                            Assets.testTeamLogoPng,
                                          ),
                                          alignment: Alignment.topRight,
                                          opacity: 0.1),
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "vs ${controller.getPickInfo()?.teamInfo.shortEname}",
                                        style: 14.w7(
                                            color: AppColors.c262626,
                                            height: 1),
                                      ),
                                      10.vGap,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: getVsWidget(),
                                      ),
                                      9.vGap
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      );
                    }),
                18.vGap,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Trade",
                        style: 16.w7(color: AppColors.c262626, height: 1)),
                    if (controller.getTradePlayer() != null &&
                        controller.getTradePlayer()?.isBuy == true)
                      TextSpan(
                          text: " (You already have this player )",
                          style: 10.w4(color: AppColors.cB3B3B3, height: 1))
                  ])),
                ),
                13.vGap,
                Container(
                  height: 185.w,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  padding: EdgeInsets.only(
                      top: 14.w, right: 21.w, bottom: 17.w, left: 13.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.w),
                      color: AppColors.cF2F2F2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Prize Change",
                        style: 14.w7(color: AppColors.c262626, height: 1),
                      ),
                      11.vGap,
                      Expanded(
                        child: LineChart(
                          LineChartData(
                            lineTouchData: const LineTouchData(enabled: false),
                            titlesData: FlTitlesData(
                                show: true,
                                rightTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                        reservedSize: 25.w,
                                        showTitles: true,
                                        getTitlesWidget: (value, _) {
                                          return Text(
                                            Utils.formatMoney(value),
                                            style:
                                                9.w4(color: AppColors.cB3B3B3),
                                          );
                                        })),
                                bottomTitles: const AxisTitles(),
                                leftTitles: const AxisTitles(),
                                topTitles: const AxisTitles()),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                  spots: controller.getTradeData(),
                                  color: AppColors.cFF7954,
                                  dotData: const FlDotData(show: false),
                                  barWidth: 2,
                                  belowBarData: BarAreaData(
                                      show: true,
                                      gradient: LinearGradient(colors: [
                                        AppColors.cFF7954.withOpacity(0.3),
                                        AppColors.cFF7954.withOpacity(0.1)
                                      ])))
                            ],
                            gridData: FlGridData(
                                show: true,
                                drawVerticalLine: false,
                                getDrawingHorizontalLine: (value) {
                                  return const FlLine(
                                      color: AppColors.cB3B3B3,
                                      dashArray: [2, 2],
                                      strokeWidth: 1);
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Builder(builder: (context) {
                  if (controller.getTradePlayer() == null) {
                    return const SizedBox.shrink();
                  }
                  var tradePlayer = controller.getTradePlayer()!;
                  bool isGood = (tradePlayer.basicMarketPrice ?? 0) <
                      (tradePlayer.marketPrice ?? 0);
                  double percent = ((tradePlayer.basicMarketPrice ?? 0) -
                              (tradePlayer.marketPrice ?? 0))
                          .abs() /
                      (tradePlayer.basicMarketPrice ?? 0) *
                      100;
                  if (percent.isNaN) {
                    percent = 0;
                  }
                  var baseInfo =
                      controller.nbaPlayerBaseInfoEntity!.playerBaseInfo;
                  return Column(
                    children: [
                      9.vGap,
                      Stack(
                        children: [
                          Container(
                            height: 79.w,
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w),
                                gradient: const LinearGradient(colors: [
                                  AppColors.cB6553B,
                                  AppColors.c262626
                                ])),
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 25.w,
                              margin: EdgeInsets.only(left: 12.w, right: 22.w),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount in limited time",
                                    style: 14.w4(
                                        color: AppColors.cF2F2F2, height: 1),
                                  ),
                                  Row(
                                    children: [
                                      IconWidget(
                                          iconWidth: 13.w,
                                          icon: Assets.uiIconCountdownPng),
                                      3.hGap,
                                      Obx(() {
                                        return Text(
                                          controller.specialTime.value,
                                          style: 14.w4(
                                              color: AppColors.cF2F2F2,
                                              height: 1),
                                        );
                                      })
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 25.w),
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 16.w, right: 16.w),
                                height: 79.w,
                                padding:
                                    EdgeInsets.only(left: 17.w, right: 12.w),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        alignment: Alignment.centerLeft,
                                        scale: 0.5,
                                        image: const AssetImage(
                                            Assets.uiIconTradePng),
                                        colorFilter: ColorFilter.mode(
                                            AppColors.cFF7954.withOpacity(.1),
                                            BlendMode.srcIn)),
                                    color: AppColors.cF2F2F2,
                                    borderRadius: BorderRadius.circular(16.w)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Game Quality",
                                          style:
                                              14.w4(color: AppColors.c666666),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              Utils.formatGrade(baseInfo.grade),
                                              style: 40.w7(
                                                  color: AppColors.c262626,
                                                  height: 1),
                                            ),
                                            11.hGap,
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                IconWidget(
                                                  iconWidth: 37.w,
                                                  icon: Assets.uiIconStar_01Png,
                                                  iconColor: AppColors.cFF7954,
                                                ),
                                                Positioned(
                                                    top: 10.w,
                                                    child: Text(
                                                      "1",
                                                      style: 23.w7(
                                                          color:
                                                              AppColors.cF2F2F2,
                                                          height: 1),
                                                    ))
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 121.w,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconWidget(
                                                  iconWidth: 19.w,
                                                  icon: Assets.uiMoney_02Png),
                                              3.hGap,
                                              Text(
                                                Utils.formatMoney(tradePlayer
                                                        .marketPrice
                                                        ?.toDouble() ??
                                                    0),
                                                style: 16.w7(
                                                    color: (tradePlayer
                                                                    .marketPrice
                                                                    ?.toDouble() ??
                                                                0) ==
                                                            0
                                                        ? AppColors.cB3B3B3
                                                        : AppColors.cE72646,
                                                    height: 1),
                                              ),
                                              4.hGap,
                                              Stack(
                                                alignment: Alignment.bottomLeft,
                                                children: [
                                                  Positioned(
                                                      top: 0,
                                                      right: 0,
                                                      child: IconWidget(
                                                        iconWidth: 14.w,
                                                        icon: Assets
                                                            .uiIconDecreasingAmplitudePng,
                                                        iconColor: percent == 0
                                                            ? AppColors.cB3B3B3
                                                            : AppColors.cE72646,
                                                      )),
                                                  Container(
                                                      height: 16.w,
                                                      width: 39.w,
                                                      margin: EdgeInsets.only(
                                                          top: 6.w, right: 3.w),
                                                      decoration: BoxDecoration(
                                                          color: percent == 0
                                                              ? AppColors
                                                                  .cB3B3B3
                                                              : AppColors
                                                                  .cE72646,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.w)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${isGood ? "+" : percent == 0 ? "" : "-"}${percent.toStringAsFixed(0)}%",
                                                        style: 12.w4(
                                                            color: AppColors
                                                                .cFFFFFF,
                                                            height: 1),
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        12.vGap,
                                        InkWell(
                                          onTap: () {
                                            if (tradePlayer.isBuy ?? false) {
                                              return;
                                            }
                                            controller.buyPlayer();
                                          },
                                          child: Container(
                                            height: 26.w,
                                            width: 121.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13.w),
                                                border: Border.all(
                                                    color: AppColors.c262626
                                                        .withOpacity(0.4),
                                                    width: 1)),
                                            alignment: Alignment.center,
                                            child: Text(
                                              (tradePlayer.isBuy ?? false)
                                                  ? "HAVE BOUGHT"
                                                  : "BUY",
                                              style: 13.w7(
                                                  color: (tradePlayer.isBuy ??
                                                          false)
                                                      ? AppColors.cB3B3B3
                                                      : AppColors.c262626,
                                                  height: 1),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  );
                }),
                _buildStats(),
                _buildNews(),
                20.vGap
              ],
            ),
          );
        }
      },
    );
  }

  Builder _buildNews() {
    return Builder(builder: (context) {
      if (controller.nbaPlayerBaseInfoEntity?.playerNews.isEmpty == true) {
        return const SizedBox.shrink();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          19.vGap,
          Container(
            margin: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Text(
              "News",
              style: 19.w7(color: AppColors.c262626, height: 1),
            ),
          ),
          ...List.generate(
              controller.nbaPlayerBaseInfoEntity!.playerNews.length, (index) {
            var playerNew =
                controller.nbaPlayerBaseInfoEntity!.playerNews[index];
            return InkWell(
              onTap: () {
                Get.find<NewListController>().getNewsFlow(playerNew.id);
                Get.toNamed(RouteNames.newsDetail, arguments: playerNew.id);
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 13.w),
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)),
                padding: EdgeInsets.only(
                    top: 14.w, right: 30.w, left: 14.w, bottom: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playerNew.title.isEmpty
                          ? playerNew.content
                          : playerNew.title,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 12.sp,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // style: 12.w4(
                      //     color: AppColors.c262626,
                      //     height: 1,
                      //     overflow: TextOverflow.ellipsis),
                    ),
                    10.vGap,
                    Text(
                      "${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(playerNew.createTime), format: DateFormats.PARAM_Y_M_D_H_M)} -${playerNew.source}",
                      style: 10.w4(color: AppColors.cB3B3B3, height: 1),
                    )
                  ],
                ),
              ),
            );
          })
        ],
      );
    });
  }

  Builder _buildCommunityPick() {
    return Builder(builder: (context) {
      if (controller.getCommunityPick() == null) {
        return const SizedBox.shrink();
      }
      NbaPlayerBaseInfoGuessInfosPtsCommunityPick communityPick =
          controller.getCommunityPick()!;
      return Column(
        children: [
          9.vGap,
          Container(
            height: 77.w,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.circular(16.w)),
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Community Pick",
                  style: 14.w7(color: AppColors.c262626, height: 1),
                ),
                8.vGap,
                Builder(builder: (context) {
                  double morePercent = 0;
                  if (communityPick.moreCount == 0 &&
                      communityPick.lessCount == 0) {
                    morePercent = 50;
                  } else if (communityPick.moreCount == 0) {
                    morePercent = 0;
                  } else if (communityPick.lessCount == 0) {
                    morePercent = 100;
                  } else {
                    morePercent = communityPick.moreCount /
                        (communityPick.moreCount + communityPick.lessCount);
                  }
                  int moreFlex = int.parse((morePercent).toStringAsFixed(0));
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "More(${communityPick.moreCount})",
                              style: 10.w4(color: AppColors.c262626),
                            ),
                            Text(
                              "${controller.getCurrentTabKey()} ${controller.getPickInfo()?.value}",
                              style: 12.w4(color: AppColors.c262626),
                            ),
                            Text(
                              "Less(${communityPick.lessCount})",
                              style: 10.w4(color: AppColors.c262626),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: max(moreFlex, 3),
                            child: SizedBox(
                              height: 8.w,
                              child: LinearProgressIndicator(
                                value: 1,
                                color: AppColors.c10A86A,
                                borderRadius: BorderRadius.circular(4.w),
                              ),
                            ),
                          ),
                          2.hGap,
                          Expanded(
                            flex: max(100 - moreFlex, 3),
                            child: SizedBox(
                              height: 8.w,
                              child: LinearProgressIndicator(
                                value: 1,
                                color: AppColors.cE72646,
                                borderRadius: BorderRadius.circular(4.w),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ],
      );
    });
  }

  Builder _buildPick() {
    return Builder(builder: (context) {
      var pickInfo = controller.getPickInfo();
      if (pickInfo == null) {
        return const SizedBox.shrink();
      }
      return Column(
        children: [
          9.vGap,
          Container(
            height: 63.w,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                image: DecorationImage(
                    image: const AssetImage(Assets.uiIconPickPng),
                    alignment: Alignment.bottomLeft,
                    scale: 0.5,
                    colorFilter: ColorFilter.mode(
                        AppColors.cFF7954.withOpacity(.1), BlendMode.srcIn)),
                borderRadius: BorderRadius.circular(16.w)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PICKS",
                      style: 19.w7(color: AppColors.cFF7954, height: 1),
                    ),
                    5.vGap,
                    Text(
                        "${pickInfo.month} ${pickInfo.day} vs ${pickInfo.teamInfo.shortEname}",
                        style: 9.w4(color: AppColors.c666666, height: 1))
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 39.w,
                      width: 62.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.w),
                          border:
                              Border.all(color: AppColors.cE6E6E6, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${pickInfo.value}",
                            style: 18.w7(color: AppColors.c262626, height: 1),
                          ),
                          Text(
                            pickInfo.key,
                            style: 10.w7(color: AppColors.cB3B3B3),
                          )
                        ],
                      ),
                    ),
                    9.hGap,
                    Obx(() {
                      if (pickInfo.picks.guessData.isNotEmpty) {
                        var choiceMore = pickInfo
                                .playerV2.guessInfo.guessData[0].guessChoice ==
                            1;
                        return Container(
                          height: 39.w,
                          width: 110.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.cB3B3B3, width: 1),
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconWidget(
                                    iconWidth: 11.w,
                                    icon: Assets.uiIconUpPng,
                                    iconColor: AppColors.cFF7954,
                                    rotateAngle: choiceMore ? 0 : 180,
                                  ),
                                  5.hGap,
                                  Text(
                                    pickInfo.playerV2.guessInfo.guessData[0]
                                                .guessChoice ==
                                            1
                                        ? "MORE"
                                        : "LESS",
                                    style: 12.w7(
                                        color:
                                            controller.currentIndex.value == 0
                                                ? AppColors.cF2F2F2
                                                : AppColors.cFF7954,
                                        height: 1),
                                  )
                                ],
                              ),
                              Text(
                                "Be settling",
                                style: 10.w4(color: AppColors.cB3B3B3),
                              )
                            ],
                          ),
                        );
                      }
                      return Container(
                        height: 39.w,
                        width: 110.w,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.cFF7954, width: 1),
                            borderRadius: BorderRadius.circular(8.w)),
                        child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () => controller.pickTap(0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: controller.pickIndex.value == 0
                                        ? AppColors.cFF7954
                                        : AppColors.cF2F2F2,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(8.w))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                      iconWidth: 14.w,
                                      icon: Assets.uiIconUpPng,
                                      iconColor: controller.pickIndex.value == 0
                                          ? AppColors.cF2F2F2
                                          : AppColors.cFF7954,
                                    ),
                                    Text(
                                      "MORE",
                                      style: 10.w7(
                                          color: controller.pickIndex.value == 0
                                              ? AppColors.cF2F2F2
                                              : AppColors.cFF7954),
                                    )
                                  ],
                                ),
                              ),
                            )),
                            Container(
                              width: 1,
                              height: double.infinity,
                              color: AppColors.cFF7954,
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () => controller.pickTap(1),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: controller.pickIndex.value == 1
                                        ? AppColors.cFF7954
                                        : AppColors.cF2F2F2,
                                    borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(8.w))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconWidget(
                                      iconWidth: 14.w,
                                      icon: Assets.uiIconUpPng,
                                      iconColor: controller.pickIndex.value == 1
                                          ? AppColors.cF2F2F2
                                          : AppColors.cFF7954,
                                      rotateAngle: 180,
                                    ),
                                    Text(
                                      "LESS",
                                      style: 10.w7(
                                          color: controller.pickIndex.value == 1
                                              ? AppColors.cF2F2F2
                                              : AppColors.cFF7954),
                                    )
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildStats() {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        19.vGap,
        Text(
          "Stars",
          style: 19.w7(color: AppColors.c262626, height: 1),
        ),
        13.vGap,
        Container(
          height: 105.w,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.cF2F2F2,
              borderRadius: BorderRadius.circular(16.w)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 7.w),
                child: Column(
                  children: [
                    Container(
                        height: 30.w,
                        width: 77.w,
                        alignment: Alignment.center,
                        child: Text("TEAM",
                            style: 10.w4(color: AppColors.cB3B3B3))),
                    if (controller.nbaPlayerBaseInfoEntity != null &&
                        controller.nbaPlayerBaseInfoEntity!.playerRegularMap
                                ?.isNotEmpty() ==
                            true)
                      Container(
                          height: 30.w,
                          width: 77.w,
                          alignment: Alignment.center,
                          child: Text("REG",
                              style: 12.w4(color: AppColors.c818181))),
                    if (controller.nbaPlayerBaseInfoEntity != null &&
                        controller.nbaPlayerBaseInfoEntity!.playerPlayoffsMap
                                ?.isNotEmpty() ==
                            true)
                      Container(
                          height: 30.w,
                          width: 77.w,
                          alignment: Alignment.center,
                          child: Text("POS",
                              style: 12.w4(color: AppColors.c818181)))
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Obx(() {
                      return Container(
                        height: 105.w,
                        width: 2.w,
                        decoration: BoxDecoration(
                            boxShadow: controller.statsIsScrolling.value
                                ? [
                                    BoxShadow(
                                      color: AppColors.c262626.withOpacity(.1),
                                      offset: const Offset(0, 2),
                                      blurRadius: 1,
                                      // spreadRadius: 1.0,
                                    )
                                  ]
                                : []),
                      );
                    }),
                    if (controller.nbaPlayerBaseInfoEntity != null &&
                        (controller.nbaPlayerBaseInfoEntity!.playerPlayoffsMap
                                    ?.isNotEmpty() ==
                                true ||
                            controller.nbaPlayerBaseInfoEntity!.playerRegularMap
                                    ?.isNotEmpty() ==
                                true))
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        controller: controller.statsScrollController,
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 7.w),
                          padding: EdgeInsets.only(left: 10.w),
                          child: Column(
                            children: [
                              Table(
                                columnWidths: List.generate(
                                        8, (index) => FixedColumnWidth(40.w))
                                    .asMap(),
                                children: List.generate(1, (index) {
                                  List<String> keys = controller
                                          .nbaPlayerBaseInfoEntity!
                                          .playerPlayoffsMap!
                                          .isNotEmpty()
                                      ? controller.nbaPlayerBaseInfoEntity!
                                          .playerPlayoffsMap!
                                          .toJson()
                                          .keys
                                          .toList()
                                      : controller.nbaPlayerBaseInfoEntity!
                                          .playerRegularMap!
                                          .toJson()
                                          .keys
                                          .toList();
                                  return TableRow(
                                      children: List.generate(
                                          keys.length,
                                          (index) => Container(
                                              height: 30.w,
                                              alignment: Alignment.center,
                                              child: Text(
                                                keys[index].split("_")[0],
                                                style: 10.w4(
                                                    color: AppColors.cB3B3B3),
                                              ))));
                                }),
                              ),
                              //常规赛
                              if (controller
                                      .nbaPlayerBaseInfoEntity!.playerRegularMap
                                      ?.isNotEmpty() ==
                                  true)
                                Table(
                                  columnWidths: List.generate(
                                          8, (index) => FixedColumnWidth(40.w))
                                      .asMap(),
                                  children: List.generate(
                                      1,
                                      (index) => TableRow(
                                          children: List.generate(
                                              controller
                                                  .nbaPlayerBaseInfoEntity!
                                                  .playerRegularMap!
                                                  .toJson()
                                                  .keys
                                                  .length,
                                              (index) => Container(
                                                  height: 30.w,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    controller
                                                        .nbaPlayerBaseInfoEntity!
                                                        .playerRegularMap!
                                                        .getValue(controller
                                                            .nbaPlayerBaseInfoEntity!
                                                            .playerRegularMap!
                                                            .toJson()
                                                            .keys
                                                            .toList()[index])
                                                        .toString(),
                                                    style: 12.w4(
                                                        color:
                                                            AppColors.c545454),
                                                  ))))),
                                ),
                              //季后赛
                              if (controller.nbaPlayerBaseInfoEntity!
                                      .playerPlayoffsMap
                                      ?.isNotEmpty() ==
                                  true)
                                Table(
                                  columnWidths: List.generate(
                                          8, (index) => FixedColumnWidth(40.w))
                                      .asMap(),
                                  children: List.generate(
                                      1,
                                      (index) => TableRow(
                                          children: List.generate(
                                              controller
                                                  .nbaPlayerBaseInfoEntity!
                                                  .playerPlayoffsMap!
                                                  .toJson()
                                                  .keys
                                                  .length,
                                              (index) => Container(
                                                  height: 30.w,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    controller
                                                        .nbaPlayerBaseInfoEntity!
                                                        .playerPlayoffsMap!
                                                        .getValue(controller
                                                            .nbaPlayerBaseInfoEntity!
                                                            .playerPlayoffsMap!
                                                            .toJson()
                                                            .keys
                                                            .toList()[index])
                                                        .toString(),
                                                    style: 12.w4(
                                                        color:
                                                            AppColors.c545454),
                                                  ))))),
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              13.hGap
            ],
          ),
        )
      ]),
    );
  }

  List<Widget> getVsWidget() {
    var vsTeams = controller.getVsTeams();
    List<Widget> list = vsTeams.fold([], (p, e) {
      var key = controller.getCurrentTabKey();
      var value = e.toJson()[ParamUtils.getProKey(key.toLowerCase())];
      var dateTimeByMs = MyDateUtils.getDateTimeByMs(e.updateTime);
      var month = MyDateUtils.getMonthEnName(dateTimeByMs, short: true);
      var day = dateTimeByMs.day;
      p.add(Column(
        children: [
          Text(
            "$value",
            style: 21.w7(color: AppColors.c262626, height: 1),
          ),
          2.vGap,
          Text(
            "$month $day",
            style: 10.w4(color: AppColors.c666666, height: 1),
          )
        ],
      ));
      p.add(Container(
        height: 40.w,
        width: 1,
        color: AppColors.cD9D9D9,
      ));
      return p;
    });
    return list;
  }

  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      margin: const EdgeInsets.all(0),
      plotAreaBorderWidth: 0,
      primaryXAxis: const NumericAxis(
          isVisible: false,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          opposedPosition: true,
          plotBands: <PlotBand>[
            PlotBand(
              start: 40,
              // 虚线的起始位置（y 值）
              end: 40,
              // 虚线的终止位置（y 值），相同值表示一条线
              borderWidth: 1,
              // 虚线的宽度
              borderColor: AppColors.cB3B3B3.withOpacity(0.5),
              // 虚线的颜色
              dashArray: const [3, 2],
              // 设置虚线样式：[线段长度, 间隔长度]
              horizontalTextAlignment: TextAnchor.end,
              verticalTextAlignment: TextAnchor.end,
            ),
          ],
          isVisible: true,
          // labelStyle: 1.w4(color: AppColors.cTransparent),
          axisLine: AxisLine(width: 0),
          majorGridLines:
              MajorGridLines(width: 1, color: Colors.red, dashArray: [2, 2]),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: controller.getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  SfCartesianChart _buildDefaultColumnChart(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var pickInfo = controller.getPickInfo();
    var annotations = <CartesianChartAnnotation>[];
    var plotBands = <PlotBand>[];
    if (pickInfo != null) {
      annotations = <CartesianChartAnnotation>[
        CartesianChartAnnotation(
          horizontalAlignment: ChartAlignment.far,
          widget: Text(
            '${playerDetailController.baseInfo?.ename}\n${pickInfo.value}',
            textAlign: TextAlign.end,
            style: 9.w4(color: AppColors.c262626, height: 1),
          ),
          coordinateUnit: CoordinateUnit.logicalPixel,
          // 设置标注的位置，使其位于虚线的右上方
          x: width - 52.w,
          // X 轴逻辑像素值
          y: 58, // Y 轴逻辑像素值
        ),
      ];
      plotBands = <PlotBand>[
        PlotBand(
          start: pickInfo.value,
          // 虚线的起始位置（y 值）
          end: pickInfo.value,
          // 虚线的终止位置（y 值），相同值表示一条线
          borderWidth: 1,
          // 虚线的宽度
          borderColor: AppColors.cFF7954.withOpacity(0.5),
          // 虚线的颜色
          dashArray: const [3, 2], // 设置虚线样式：[线段长度, 间隔长度]
        ),
      ];
    }
    return SfCartesianChart(
      margin: const EdgeInsets.only(bottom: 0),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(color: AppColors.cD9D9D9, width: 1),
        majorTickLines: const MajorTickLines(size: 0),
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        labelStyle: 9.w4(color: AppColors.cB3B3B3),
      ),
      // 添加标注
      annotations: annotations,
      primaryYAxis: NumericAxis(
        labelStyle: 9.w4(color: AppColors.cB3B3B3),
        plotBands: plotBands,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(
            width: 1, color: AppColors.cD9D9D9, dashArray: [2, 2]),
      ),
      series: controller.getDefaultColumnSeries(),
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
