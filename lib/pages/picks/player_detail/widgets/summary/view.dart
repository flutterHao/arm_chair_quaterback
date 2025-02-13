import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/widgets/bottom_guess_tip_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/mt_inkwell.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/physics/one_boundary_scroll_physics.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/widgets/guess_item_v2/guess_item_v2.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/widgets/summary/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SummaryPage extends GetView<SummaryController> {
  const SummaryPage(
      {required this.playerId,
      super.key,
      this.tabStr,
      required this.playerDetailController});

  final int playerId;
  final String? tabStr;
  final PlayerDetailController playerDetailController;

  @override
  String? get tag => getTag();

  String getTag() {
    return "$playerId";
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SummaryController>(
      init: SummaryController(
        playerId,
        playerDetailController,
        initTabStr: tabStr,
      ),
      tag: getTag(),
      id: SummaryController.idSummaryMain,
      builder: (_) {
        if (controller.loadStatus.value != LoadDataStatus.success) {
          return Obx(() {
            return Center(
              child: LoadStatusWidget(
                loadDataStatus: controller.loadStatus.value,
              ),
            );
          });
        } else {
          var scrollController = ScrollController();
          return Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    9.vGap,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          color: AppColors.cFFFFFF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70.w,
                            margin: EdgeInsets.only(left: 16.w),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${controller.formatSeasonDate()} ${LangKey.nbaTeamTabAvg.tr}",
                              style: 24.w7(
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            ),
                          ),
                          Divider(
                            color: AppColors.cE6E6E6,
                            height: 1.w,
                          ),
                          Builder(builder: (context) {
                            var seasonAverageData =
                                controller.getSeasonAverageData();
                            return SizedBox(
                              width: double.infinity,
                              height: 101.w,
                              child: MediaQuery.removePadding(
                                removeTop: true,
                                context: context,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: seasonAverageData.length,
                                    controller: scrollController,
                                    physics: OneBoundaryScrollPhysics(
                                        scrollController: scrollController),
                                    itemBuilder: (context, index) {
                                      PlayerRegular item =
                                          seasonAverageData[index];
                                      bool lastIndex =
                                          seasonAverageData.length - 1 == index;
                                      return SizedBox(
                                        height: 101.w,
                                        width: 93.w,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  item.value.toStringAsFixed(1),
                                                  style: 21.w5(
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium),
                                                ),
                                                6.vGap,
                                                Text(
                                                  item.key,
                                                  style: 10.w4(
                                                      color: AppColors.c666666,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fRobotoRegular),
                                                ),
                                                13.vGap,
                                                Opacity(
                                                    opacity: item.rank <= 100
                                                        ? 1
                                                        : 0,
                                                    child: Text(
                                                      Utils.getSortWithInt(
                                                          item.rank),
                                                      style: 12.w5(
                                                          color:
                                                              AppColors.cFF7954,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fRobotoMedium),
                                                    )),
                                                2.vGap
                                              ],
                                            ),
                                            if (!lastIndex)
                                              Positioned(
                                                right: 0,
                                                child: Container(
                                                  color: AppColors.cE6E6E6,
                                                  width: 1.w,
                                                  height: 54.w,
                                                ),
                                              )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    9.vGap,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.w),
                          color: AppColors.cFFFFFF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          25.vGap,
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              LangKey.nbaTeamTabOppg.tr,
                              style: 24.w7(
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            ),
                          ),
                          25.vGap,
                          GetBuilder<SummaryController>(
                              id: SummaryController.idTabContent,
                              tag: getTag(),
                              builder: (c) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 28.w,
                                      child: MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: ListView.builder(
                                            itemCount:
                                                controller.getTitles().length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              var key = controller
                                                  .getTitles()
                                                  .toList()[index];
                                              return Obx(() {
                                                bool isSelected = controller
                                                        .currentIndex.value ==
                                                    index;
                                                return InkWell(
                                                  onTap: () => controller
                                                      .onTabTap(index),
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 4.w,
                                                        left: index == 0
                                                            ? 16.w
                                                            : 0),
                                                    height: 28.w,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 21.w),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: AppColors
                                                                .c666666,
                                                            width: 1.w),
                                                        color: isSelected
                                                            ? AppColors.c262626
                                                            : AppColors.cFFFFFF,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    14.w)),
                                                    child: Text(
                                                      key.replaceAll(",", "+"),
                                                      style: 16.w5(
                                                        color: isSelected
                                                            ? AppColors.cF2F2F2
                                                            : AppColors.c262626,
                                                        height: 1,
                                                        fontFamily: isSelected
                                                            ? FontFamily
                                                                .fOswaldMedium
                                                            : FontFamily
                                                                .fOswaldRegular,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                            }),
                                      ),
                                    ),
                                    16.vGap,
                                    Divider(
                                      color: AppColors.cD1D1D1,
                                      height: 1.w,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16.w),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            height: 94.w,
                                            padding:
                                                EdgeInsets.only(left: 14.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  LangKey.gameTabSeasonAvg.tr,
                                                  style: 12.w4(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fRobotoRegular),
                                                ),
                                                9.vGap,
                                                Text(
                                                  controller
                                                      .getSeasonAvgWithTab(),
                                                  style: 27.w7(
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldBold),
                                                )
                                              ],
                                            ),
                                          )),
                                          Container(
                                            width: 1.w,
                                            color: AppColors.cE6E6E6,
                                            height: 42.w,
                                          ),
                                          Expanded(
                                              child: Container(
                                            height: 94.w,
                                            padding:
                                                EdgeInsets.only(left: 14.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  LangKey.gameTabL5Avg.tr,
                                                  style: 14.w4(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fRobotoRegular),
                                                ),
                                                9.vGap,
                                                Text(
                                                  "${controller.getLast5AvgWithTab().format()}",
                                                  style: 27.w7(
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldBold),
                                                )
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Builder(builder: (context) {
                                      if (controller.nbaPlayerBaseInfoEntity!
                                          .l5GameData.isEmpty) {
                                        return const SizedBox.shrink();
                                      }
                                      return Column(
                                        children: [
                                          9.vGap,
                                          Container(
                                            height: 162.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            padding: EdgeInsets.all(10.w),
                                            child: Stack(
                                              children: [
                                                _buildDefaultColumnChart(
                                                    context),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    Builder(builder: (context) {
                                      if (controller.getVsTeams().isEmpty) {
                                        return const SizedBox.shrink();
                                      }
                                      return Column(
                                        children: [
                                          34.vGap,
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 35.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "@${controller.getPickInfo()?.teamInfo.shortEname}",
                                                      style: 12.w5(
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoMedium,
                                                      ),
                                                    ),
                                                    7.hGap,
                                                    ImageWidget(
                                                      url: Utils.getTeamUrl(
                                                          controller
                                                              .getPickInfo()
                                                              ?.teamInfo
                                                              .id),
                                                      width: 21.w,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  controller
                                                      .getCurrentTabKey()
                                                      .replaceAll(",", "+"),
                                                  style: 12.w5(
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fRobotoMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          7.vGap,
                                          Divider(
                                            height: 1.w,
                                            color: AppColors.cD1D1D1,
                                          ),
                                          ...getVsAwayWidget(),
                                          Divider(
                                            height: 1.w,
                                            color: AppColors.cD1D1D1,
                                          ),
                                        ],
                                      );
                                    }),
                                    25.vGap,
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                    GetBuilder<SummaryController>(
                        id: SummaryController.idRecentPickTabContent,
                        tag: getTag(),
                        builder: (_) {
                          if (controller.getPickInfo() == null) {
                            return const SizedBox.shrink();
                          }
                          return Container(
                            margin: EdgeInsets.only(top: 9.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.w),
                                color: AppColors.cFFFFFF),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                25.vGap,
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Text(
                                    LangKey.nbaTeamTabOppg.tr,
                                    style: 24.w7(
                                        height: 1,
                                        fontFamily: FontFamily.fOswaldBold),
                                  ),
                                ),
                                25.vGap,
                                SizedBox(
                                  height: 28.w,
                                  child: MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    child: ListView.builder(
                                        itemCount:
                                            controller.getTitles().length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          var key = controller
                                              .getTitles()
                                              .toList()[index];
                                          return Obx(() {
                                            bool isSelected = controller
                                                    .currentRecentPickIndex
                                                    .value ==
                                                index;
                                            return InkWell(
                                              onTap: () => controller
                                                  .onRecentPickTabTap(index),
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    right: 4.w,
                                                    left:
                                                        index == 0 ? 16.w : 0),
                                                height: 28.w,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 21.w),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            AppColors.c666666,
                                                        width: 1.w),
                                                    color: isSelected
                                                        ? AppColors.c262626
                                                        : AppColors.cFFFFFF,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.w)),
                                                child: Text(
                                                  key.replaceAll(",", "+"),
                                                  style: 16.w5(
                                                    color: isSelected
                                                        ? AppColors.cF2F2F2
                                                        : AppColors.c262626,
                                                    height: 1,
                                                    fontFamily: isSelected
                                                        ? FontFamily
                                                            .fOswaldMedium
                                                        : FontFamily
                                                            .fOswaldRegular,
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                ),
                                16.vGap,
                                _buildPick(),
                              ],
                            ),
                          );
                        }),

                    /// trade
                    // Container(
                    //   padding: EdgeInsets.only(top: 19.w),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(12.w),
                    //       color: AppColors.cFFFFFF),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         margin: EdgeInsets.symmetric(horizontal: 16.w),
                    //         child: Text.rich(TextSpan(children: [
                    //           TextSpan(
                    //               text: "Trade",
                    //               style:
                    //                   16.w7(color: AppColors.c262626, height: 1)),
                    //           if (controller.getTradePlayer() != null &&
                    //               controller.getTradePlayer()?.isBuy == true)
                    //             TextSpan(
                    //                 text: " (You already have this player )",
                    //                 style:
                    //                     10.w4(color: AppColors.cB3B3B3, height: 1))
                    //         ])),
                    //       ),
                    //       13.vGap,
                    //       Container(
                    //         height: 185.w,
                    //         margin: EdgeInsets.symmetric(horizontal: 16.w),
                    //         padding: EdgeInsets.only(
                    //             top: 14.w, right: 21.w, bottom: 17.w, left: 13.w),
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               "Prize Change",
                    //               style: 14.w7(color: AppColors.c262626, height: 1),
                    //             ),
                    //             11.vGap,
                    //             Expanded(
                    //               child: LineChart(
                    //                 LineChartData(
                    //                   lineTouchData:
                    //                       const LineTouchData(enabled: false),
                    //                   titlesData: FlTitlesData(
                    //                       show: true,
                    //                       rightTitles: AxisTitles(
                    //                           sideTitles: SideTitles(
                    //                               reservedSize: 25.w,
                    //                               showTitles: true,
                    //                               getTitlesWidget: (value, _) {
                    //                                 return FittedBox(
                    //                                   fit: BoxFit.scaleDown,
                    //                                   child: Text(
                    //                                     Utils.formatMoney(value),
                    //                                     style: 9.w4(
                    //                                         color:
                    //                                             AppColors.cB3B3B3),
                    //                                   ),
                    //                                 );
                    //                               })),
                    //                       bottomTitles: const AxisTitles(),
                    //                       leftTitles: const AxisTitles(),
                    //                       topTitles: const AxisTitles()),
                    //                   borderData: FlBorderData(
                    //                     show: false,
                    //                   ),
                    //                   lineBarsData: [
                    //                     LineChartBarData(
                    //                         spots: controller.getTradeData(),
                    //                         color: AppColors.cFF7954,
                    //                         dotData: const FlDotData(show: false),
                    //                         barWidth: 2,
                    //                         belowBarData: BarAreaData(
                    //                             show: true,
                    //                             gradient: LinearGradient(colors: [
                    //                               AppColors.cFF7954
                    //                                   .withOpacity(0.3),
                    //                               AppColors.cFF7954.withOpacity(0.1)
                    //                             ])))
                    //                   ],
                    //                   gridData: FlGridData(
                    //                       show: true,
                    //                       drawVerticalLine: false,
                    //                       getDrawingHorizontalLine: (value) {
                    //                         return const FlLine(
                    //                             color: AppColors.cB3B3B3,
                    //                             dashArray: [2, 2],
                    //                             strokeWidth: 1);
                    //                       }),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    /// 交易行特价球员
                    // Builder(builder: (context) {
                    //   if (controller.getTradePlayer() == null) {
                    //     return const SizedBox.shrink();
                    //   }
                    //   var tradePlayer = controller.getTradePlayer()!;
                    //   bool isGood = (tradePlayer.basicMarketPrice ?? 0) <
                    //       (tradePlayer.marketPrice ?? 0);
                    //   double percent = ((tradePlayer.basicMarketPrice ?? 0) -
                    //               (tradePlayer.marketPrice ?? 0))
                    //           .abs() /
                    //       (tradePlayer.basicMarketPrice ?? 0) *
                    //       100;
                    //   if (percent.isNaN) {
                    //     percent = 0;
                    //   }
                    //   var baseInfo =
                    //       controller.nbaPlayerBaseInfoEntity!.playerBaseInfo;
                    //   bool isSpecial = tradePlayer.top ?? false;
                    //   var color = isGood ? AppColors.c10A86A : AppColors.cE72646;
                    //   return Container(
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(12.w),
                    //         color: AppColors.cFFFFFF),
                    //     child: Column(
                    //       children: [
                    //         9.vGap,
                    //         Stack(
                    //           children: [
                    //             Container(
                    //               height: 79.w,
                    //               margin: EdgeInsets.symmetric(horizontal: 16.w),
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(16.w),
                    //                   gradient: const LinearGradient(colors: [
                    //                     AppColors.cB6553B,
                    //                     AppColors.c262626
                    //                   ])),
                    //               alignment: Alignment.topCenter,
                    //               child: Container(
                    //                 height: 25.w,
                    //                 margin:
                    //                     EdgeInsets.only(left: 12.w, right: 22.w),
                    //                 alignment: Alignment.center,
                    //                 child: Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceBetween,
                    //                   children: [
                    //                     Text(
                    //                       "Discount in limited time",
                    //                       style: 14.w4(
                    //                           color: AppColors.cF2F2F2, height: 1),
                    //                     ),
                    //                     Row(
                    //                       children: [
                    //                         IconWidget(
                    //                             iconWidth: 13.w,
                    //                             icon: Assets.iconUiIconCountdown),
                    //                         3.hGap,
                    //                         Obx(() {
                    //                           return Text(
                    //                             controller.specialTime.value,
                    //                             style: 14.w4(
                    //                                 color: AppColors.cF2F2F2,
                    //                                 height: 1),
                    //                           );
                    //                         })
                    //                       ],
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Container(
                    //                 margin: EdgeInsets.only(top: 25.w),
                    //                 child: Container(
                    //                   margin:
                    //                       EdgeInsets.only(left: 16.w, right: 16.w),
                    //                   height: 79.w,
                    //                   padding:
                    //                       EdgeInsets.only(left: 17.w, right: 12.w),
                    //                   decoration: BoxDecoration(
                    //                       image: DecorationImage(
                    //                           alignment: Alignment.centerLeft,
                    //                           scale: 0.5,
                    //                           image: const AssetImage(
                    //                               Assets.playerUiIconTrade),
                    //                           colorFilter: ColorFilter.mode(
                    //                               AppColors.cFF7954.withOpacity(.1),
                    //                               BlendMode.srcIn)),
                    //                       color: AppColors.cF2F2F2,
                    //                       borderRadius:
                    //                           BorderRadius.circular(16.w)),
                    //                   child: Row(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.spaceBetween,
                    //                     children: [
                    //                       Column(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.center,
                    //                         children: [
                    //                           Text(
                    //                             "Game Quality",
                    //                             style:
                    //                                 14.w4(color: AppColors.c666666),
                    //                           ),
                    //                           Row(
                    //                             crossAxisAlignment:
                    //                                 CrossAxisAlignment.center,
                    //                             children: [
                    //                               Text(
                    //                                 Utils.formatGrade(
                    //                                     baseInfo.grade),
                    //                                 style: 40.w7(
                    //                                     color: AppColors.c262626,
                    //                                     height: 1),
                    //                               ),
                    //                               11.hGap,
                    //                               Stack(
                    //                                 alignment: Alignment.center,
                    //                                 children: [
                    //                                   IconWidget(
                    //                                     iconWidth: 37.w,
                    //                                     icon: Assets
                    //                                         .playerUiIconStar01,
                    //                                     iconColor:
                    //                                         AppColors.cFF7954,
                    //                                   ),
                    //                                   Positioned(
                    //                                       top: 10.w,
                    //                                       child: Text(
                    //                                         "1",
                    //                                         style: 23.w7(
                    //                                             color: AppColors
                    //                                                 .cF2F2F2,
                    //                                             height: 1),
                    //                                       ))
                    //                                 ],
                    //                               )
                    //                             ],
                    //                           )
                    //                         ],
                    //                       ),
                    //                       Column(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.center,
                    //                         crossAxisAlignment:
                    //                             CrossAxisAlignment.center,
                    //                         children: [
                    //                           SizedBox(
                    //                             width: 121.w,
                    //                             child: Row(
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment.end,
                    //                               mainAxisAlignment:
                    //                                   MainAxisAlignment
                    //                                       .spaceBetween,
                    //                               children: [
                    //                                 IconWidget(
                    //                                     iconWidth: 19.w,
                    //                                     icon: Assets.teamUiMoney02),
                    //                                 3.hGap,
                    //                                 Text(
                    //                                   Utils.formatMoney(tradePlayer
                    //                                           .marketPrice
                    //                                           ?.toDouble() ??
                    //                                       0),
                    //                                   style: 16.w7(
                    //                                       color: (tradePlayer
                    //                                                       .marketPrice
                    //                                                       ?.toDouble() ??
                    //                                                   0) ==
                    //                                               0
                    //                                           ? AppColors.cB3B3B3
                    //                                           : AppColors.cE72646,
                    //                                       height: 1),
                    //                                 ),
                    //                                 4.hGap,
                    //                                 Stack(
                    //                                   alignment:
                    //                                       Alignment.bottomLeft,
                    //                                   children: [
                    //                                     Positioned(
                    //                                         top: 0,
                    //                                         right: 0,
                    //                                         child: IconWidget(
                    //                                           iconWidth: 14.w,
                    //                                           icon: Assets
                    //                                               .iconUiIconDecreasingAmplitude,
                    //                                           iconColor:
                    //                                               percent == 0
                    //                                                   ? AppColors
                    //                                                       .cB3B3B3
                    //                                                   : AppColors
                    //                                                       .cE72646,
                    //                                         )),
                    //                                     Container(
                    //                                         height: 16.w,
                    //                                         width: 39.w,
                    //                                         margin: EdgeInsets.only(
                    //                                             top: 6.w,
                    //                                             right: 3.w),
                    //                                         decoration: BoxDecoration(
                    //                                             color: percent == 0
                    //                                                 ? AppColors
                    //                                                     .cB3B3B3
                    //                                                 : AppColors
                    //                                                     .cE72646,
                    //                                             borderRadius:
                    //                                                 BorderRadius
                    //                                                     .circular(
                    //                                                         5.w)),
                    //                                         alignment:
                    //                                             Alignment.center,
                    //                                         child: FittedBox(
                    //                                           child: Text(
                    //                                             "${isGood ? "+" : percent == 0 ? "" : "-"}${percent.toStringAsFixed(0)}%",
                    //                                             style: 12.w4(
                    //                                                 color: AppColors
                    //                                                     .cFFFFFF,
                    //                                                 height: 1),
                    //                                           ),
                    //                                         )),
                    //                                   ],
                    //                                 )
                    //                               ],
                    //                             ),
                    //                           ),
                    //                           12.vGap,
                    //                           InkWell(
                    //                             onTap: () {
                    //                               if (tradePlayer.isBuy ?? false) {
                    //                                 return;
                    //                               }
                    //                               controller.buyPlayer();
                    //                             },
                    //                             child: Container(
                    //                               height: 26.w,
                    //                               width: 121.w,
                    //                               decoration: BoxDecoration(
                    //                                   borderRadius:
                    //                                       BorderRadius.circular(
                    //                                           13.w),
                    //                                   border: Border.all(
                    //                                       color: AppColors.c262626
                    //                                           .withOpacity(0.4),
                    //                                       width: 1)),
                    //                               alignment: Alignment.center,
                    //                               child: Text(
                    //                                 (tradePlayer.isBuy ?? false)
                    //                                     ? "HAVE BOUGHT"
                    //                                     : "BUY",
                    //                                 style: 13.w7(
                    //                                     color: (tradePlayer.isBuy ??
                    //                                             false)
                    //                                         ? AppColors.cB3B3B3
                    //                                         : AppColors.c262626,
                    //                                     height: 1),
                    //                               ),
                    //                             ),
                    //                           )
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 )),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   );
                    // }),
                    Builder(builder: (_) {
                      if (controller.getOutComeWithTab().isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        margin: EdgeInsets.only(top: 9.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.circular(12.w)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            25.vGap,
                            Container(
                              margin: EdgeInsets.only(
                                left: 16.w,
                              ),
                              child: Text(
                                LangKey.nbaTeamTabOutcome.tr,
                                style:
                                    19.w7(color: AppColors.c262626, height: 1),
                              ),
                            ),
                            SizedBox(
                              height: 150.w,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      controller.getOutComeWithTab().length,
                                  controller: PageController(
                                    viewportFraction: 324 / 375,
                                  ),
                                  padEnds: false,
                                  itemBuilder: (context, index) {
                                    OutCome outCome =
                                        controller.getOutComeWithTab()[index];
                                    return Container(
                                      height: 96.w,
                                      width: 298.w,
                                      margin: EdgeInsets.only(
                                        top: 22.w,
                                        bottom: 22.w,
                                        // right: 10.w,
                                        left: 16.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.w),
                                        border: Border.all(
                                          color: AppColors.cD9D9D9,
                                          width: 1.w,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  if (outCome.guessData != null)
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            right: 8.w),
                                                        child: IconWidget(
                                                          iconWidth: 20.w,
                                                          icon: Assets
                                                              .picksUiPicksHistoryPick,
                                                          iconColor: outCome
                                                                  .guessData!
                                                                  .success
                                                              ? AppColors
                                                                  .cE71629
                                                              : AppColors
                                                                  .c0FA76C,
                                                        )),
                                                  Text(
                                                    "@${Utils.getTeamInfo(outCome.awayTeamId).shortEname}",
                                                    style: 14.w5(
                                                      color: AppColors.c000000,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              if (outCome.guessData != null)
                                                Builder(builder: (context) {
                                                  var text = "";
                                                  if (outCome.guessData!
                                                          .guessGameAttrValue ==
                                                      -1) {
                                                    text = "DNP";
                                                  } else {
                                                    text =
                                                        "Result: ${outCome.guessData!.guessGameAttrValue}";
                                                  }
                                                  return Text(
                                                    text,
                                                    style: 14.w5(
                                                      color: outCome.guessData!
                                                              .success
                                                          ? AppColors.cE71629
                                                          : AppColors.c0FA76C,
                                                      height: 1,
                                                      fontFamily: FontFamily
                                                          .fOswaldMedium,
                                                    ),
                                                  );
                                                })
                                              else
                                                Text(
                                                  "Result: ${outCome.gameAttrValue ?? 0}",
                                                  style: 14.w5(
                                                    color: AppColors.cB3B3B3,
                                                    height: 1,
                                                    fontFamily: FontFamily
                                                        .fOswaldMedium,
                                                  ),
                                                )
                                            ],
                                          ),
                                          9.vGap,
                                          Text.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                  text: Utils.getLongName(
                                                      outCome.key)),
                                              if (outCome.guessData != null)
                                                TextSpan(
                                                    text:
                                                        " ${outCome.guessData!.guessChoice == 1 ? "MORE" : "LESS"}"),
                                              if (outCome.guessData != null)
                                                TextSpan(
                                                    text:
                                                        " ${outCome.guessData!.guessReferenceValue}"),
                                            ]),
                                            style: 10.w4(
                                                color: AppColors.c000000,
                                                height: 1,
                                                fontFamily:
                                                    FontFamily.fRobotoRegular),
                                          ),
                                          16.vGap,
                                          Divider(
                                            height: 1.w,
                                            color: AppColors.cD4D4D4,
                                          ),
                                          13.vGap,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MtInkWell(
                                                onTap: () => Get.toNamed(
                                                    RouteNames
                                                        .leagueLeagueDetail,
                                                    arguments: {
                                                      "gameId": outCome.gameId
                                                    }),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      controller
                                                          .formatGameStartTime(
                                                              outCome
                                                                  .gameStartTime),
                                                      style: TextStyle(
                                                          color:
                                                              AppColors.c000000,
                                                          height: 1,
                                                          fontFamily: FontFamily
                                                              .fRobotoRegular,
                                                          fontSize: 10.w,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline),
                                                    ),
                                                    7.hGap,
                                                    IconWidget(
                                                      iconWidth: 4.w,
                                                      icon: Assets
                                                          .commonUiCommonIconSystemJumpto,
                                                      iconColor:
                                                          AppColors.c000000,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  IconWidget(
                                                    iconWidth: 17.w,
                                                    icon: Assets
                                                        .picksUiPicksHistoryComment,
                                                    iconColor:
                                                        AppColors.c000000,
                                                  ),
                                                  6.hGap,
                                                  Text(
                                                    "${outCome.reviewsCount}",
                                                    style: 10.w4(
                                                        color:
                                                            AppColors.c000000,
                                                        height: 1,
                                                        fontFamily: FontFamily
                                                            .fRobotoRegular),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      );
                    }),
                    _buildStats(context),
                    // _buildNews(),
                    Obx(() {
                      var picksIndexController =
                          Get.find<PicksIndexController>();
                      var leagueController = Get.find<LeagueController>();
                      var value = picksIndexController.choiceSize.value;
                      value += leagueController.choiceSize.value;
                      if (value > 0) {
                        return 94.vGap;
                      }
                      return 9.vGap;
                    })
                  ],
                ),
              ),
              // 竞猜选择确认弹框
              BottomGuessTipWidget(
                bottomValue: 9.w,
              ),
            ],
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
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            color: AppColors.cFFFFFF),
        margin: EdgeInsets.only(top: 9.w),
        child: Column(
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
                  print('playerNew:${playerNew.id}');
                  Get.find<NewListController>().pageToDetail(playerNew);
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
            }),
            9.vGap,
          ],
        ),
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

      return GuessItemV2(
        playerV2: pickInfo.playerV2,
        index: 0,
        isInScoreDetail: true,
        isInPlayerDetail: true,
      );
    });
  }

  Widget _buildStats(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w), color: AppColors.cFFFFFF),
      margin: EdgeInsets.only(top: 9.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        25.vGap,
        Container(
          margin: EdgeInsets.only(
            left: 16.w,
          ),
          child: Text(
            LangKey.nbaTeamMeanStats.tr,
            style: 19.w7(color: AppColors.c262626, height: 1),
          ),
        ),
        13.vGap,
        Divider(color: AppColors.cD1D1D1, height: 1.w),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                      height: 30.w,
                      width: 77.w,
                      child: Container(
                        padding: EdgeInsets.only(left: 16.w),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom:
                              BorderSide(color: AppColors.cD1D1D1, width: 1.w),
                          right:
                              BorderSide(color: AppColors.cE6E6E6, width: 1.w),
                        )),
                        alignment: Alignment.center,
                        child: Text(LangKey.nbaTeamMeanStats.tr,
                            style: 12.w4(
                                color: AppColors.c000000,
                                fontFamily: FontFamily.fRobotoMedium)),
                      )),
                  if (controller.nbaPlayerBaseInfoEntity != null &&
                      controller.nbaPlayerBaseInfoEntity!.playerRegularMap
                              ?.isNotEmpty() ==
                          true)
                    SizedBox(
                        height: 30.w,
                        width: 77.w,
                        child: Container(
                          margin: EdgeInsets.only(left: 16.w),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                color: AppColors.cE6E6E6, width: 1.w),
                            right: BorderSide(
                                color: AppColors.cE6E6E6, width: 1.w),
                          )),
                          alignment: Alignment.center,
                          child: Text(LangKey.gameMeanRegular.tr,
                              style: 12.w4(
                                  color: AppColors.c000000,
                                  fontFamily: FontFamily.fRobotoRegular)),
                        )),
                  if (controller.nbaPlayerBaseInfoEntity != null &&
                      controller.nbaPlayerBaseInfoEntity!.playerPlayoffsMap
                              ?.isNotEmpty() ==
                          true)
                    SizedBox(
                      height: 30.w,
                      width: 77.w,
                      child: Container(
                          margin: EdgeInsets.only(left: 16.w),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                                color: AppColors.cE6E6E6, width: 1.w),
                            right: BorderSide(
                                color: AppColors.cE6E6E6, width: 1.w),
                          )),
                          alignment: Alignment.center,
                          child: Text(LangKey.gameMeanPost.tr,
                              style: 12.w4(
                                  color: AppColors.c000000,
                                  fontFamily: FontFamily.fRobotoRegular))),
                    ),
                  // if (controller.nbaPlayerBaseInfoEntity != null &&
                  //     controller.nbaPlayerBaseInfoEntity!.playerDataAvg
                  //             .isNotEmpty() ==
                  //         true)
                  // Container(
                  //     height: 30.w,
                  //     width: 77.w,
                  //     padding: EdgeInsets.only(left: 16.w),
                  //     decoration: BoxDecoration(
                  //         border: Border(
                  //       right:
                  //           BorderSide(color: AppColors.cE6E6E6, width: 1.w),
                  //     )),
                  //     alignment: Alignment.center,
                  //     child: Text("CAREER",
                  //         style: 12.w4(
                  //             color: AppColors.c000000,
                  //             fontFamily: FontFamily.fRobotoRegular))),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    // Obx(() {
                    //   return Container(
                    //     height: 105.w,
                    //     width: 2.w,
                    //     decoration: BoxDecoration(
                    //         boxShadow: controller.statsIsScrolling.value
                    //             ? [
                    //                 BoxShadow(
                    //                   color: AppColors.c262626.withOpacity(.1),
                    //                   offset: const Offset(0, 2),
                    //                   blurRadius: 1,
                    //                   // spreadRadius: 1.0,
                    //                 )
                    //               ]
                    //             : []),
                    //   );
                    // }),
                    if (controller.nbaPlayerBaseInfoEntity != null &&
                        (controller.nbaPlayerBaseInfoEntity!.playerPlayoffsMap
                                    ?.isNotEmpty() ==
                                true ||
                            controller.nbaPlayerBaseInfoEntity!.playerRegularMap
                                    ?.isNotEmpty() ==
                                true))
                      Builder(builder: (context) {
                        var keys = controller.getStatsKeys();
                        var children = List.generate(3, (index) {
                          if (index == 0) {
                            return TableRow(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.cD1D1D1,
                                            width: 1.w))),
                                children: List.generate(
                                    keys.length,
                                    (index) => Container(
                                        height: 30.w,
                                        alignment: Alignment.center,
                                        child: Text(
                                          keys[index],
                                          style: 12.w4(
                                              color: AppColors.c000000,
                                              fontFamily:
                                                  FontFamily.fRobotoMedium),
                                        ))));
                          } else if (index == 1) {
                            return TableRow(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: AppColors.cE6E6E6,
                                            width: 1.w))),
                                children: List.generate(keys.length, (index) {
                                  var value = controller
                                      .nbaPlayerBaseInfoEntity!
                                      .playerRegularMap!
                                      .toJson()[keys[index]];
                                  return Container(
                                      height: 30.w,
                                      alignment: Alignment.center,
                                      child: Text(
                                        (value == null
                                            ? "-"
                                            : (value as num).formatToString()),
                                        style: 14.w4(
                                            color: AppColors.c4D4D4D,
                                            fontFamily:
                                                FontFamily.fRobotoRegular),
                                      ));
                                }));
                          } else {
                            return TableRow(
                                children: List.generate(keys.length, (index) {
                              var value = controller
                                  .nbaPlayerBaseInfoEntity!.playerPlayoffsMap!
                                  .toJson()[keys[index].toLowerCase()];

                              return Container(
                                  height: 30.w,
                                  alignment: Alignment.center,
                                  child: Text(
                                    (value == null
                                        ? "-"
                                        : (value as num).formatToString()),
                                    style: 14.w4(
                                        color: AppColors.c4D4D4D,
                                        fontFamily: FontFamily.fRobotoRegular),
                                  ));
                            }));
                          }
                          // else if (index == 2) {
                          //   return TableRow(
                          //       decoration: BoxDecoration(
                          //           border: Border(
                          //               bottom: BorderSide(
                          //                   color: AppColors.cE6E6E6,
                          //                   width: 1.w))),
                          //       children: List.generate(keys.length, (index) {
                          //         var value = controller
                          //             .nbaPlayerBaseInfoEntity!
                          //             .playerPlayoffsMap!
                          //             .toJson()[keys[index]];
                          //         return Container(
                          //             height: 30.w,
                          //             alignment: Alignment.center,
                          //             child: Text(
                          //               (value == null
                          //                   ? "-"
                          //                   : (value as num).formatToString()),
                          //               style: 14.w4(
                          //                   color: AppColors.c4D4D4D,
                          //                   fontFamily:
                          //                       FontFamily.fRobotoRegular),
                          //             ));
                          //       }));
                          // } else {
                          //   return TableRow(
                          //       children: List.generate(keys.length, (index) {
                          //     var value = controller
                          //         .nbaPlayerBaseInfoEntity!.playerDataAvg
                          //         .toJson()[keys[index].toLowerCase()];
                          //
                          //     return Container(
                          //         height: 30.w,
                          //         alignment: Alignment.center,
                          //         child: Text(
                          //           (value == null
                          //               ? "-"
                          //               : (value as num).formatToString()),
                          //           style: 14.w4(
                          //               color: AppColors.c4D4D4D,
                          //               fontFamily: FontFamily.fRobotoRegular),
                          //         ));
                          //   }));
                          // }
                        }).toList();
                        return SingleChildScrollView(
                          // physics: const BouncingScrollPhysics(),
                          controller: controller.statsScrollController,
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              Table(
                                columnWidths: List.generate((keys).length,
                                    (index) => FixedColumnWidth(40.w)).asMap(),
                                children: children,
                              ),
                            ],
                          ),
                        );
                      }),
                  ],
                ),
              ),
              13.hGap
            ],
          ),
        ),
        Divider(color: AppColors.cD1D1D1, height: 1.w),
        SizedBox(
          height: 50.w,
          child: InkWell(
            onTap: () {
              DefaultTabController.of(context).animateTo(1);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  LangKey.gameButtonSeeAll.tr,
                  style: 16.w7(
                      color: AppColors.c262626,
                      height: 1,
                      fontFamily: FontFamily.fOswaldBold),
                ),
                6.hGap,
                IconWidget(
                  iconWidth: 5.w,
                  icon: Assets.commonUiCommonIconSystemJumpto,
                  iconColor: AppColors.c000000,
                ),
                19.hGap,
              ],
            ),
          ),
        )
      ]),
    );
  }

  /// 对战记录
  List<Widget> getVsAwayWidget() {
    var vsTeams = controller.getVsTeams();
    if (vsTeams.isEmpty) {
      return [];
    }
    List<Widget> list = vsTeams.fold([], (p, e) {
      var key = controller.getCurrentTabKey();
      num value = 0.0;
      if (key.contains(",")) {
        value = key.split(",").fold(0.0, (p, element) {
          num v = e.toJson()[ParamUtils.getProKey(element.toLowerCase())] ?? 0;
          return p + v;
        });
      } else {
        value = e.toJson()[ParamUtils.getProKey(key.toLowerCase())];
      }
      var dateTimeByMs = MyDateUtils.getDateTimeByMs(e.updateTime);
      var enMMDDYYYY = MyDateUtils.getEnMMDDYYYY(dateTimeByMs, short: true);
      p.add(Container(
        height: 42.w,
        margin: EdgeInsets.symmetric(horizontal: 35.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              enMMDDYYYY,
              style: 12.w4(
                  color: AppColors.c000000,
                  height: 1,
                  fontFamily: FontFamily.fRobotoRegular),
            ),
            Text(
              "${value.format()}",
              style: 16.w5(
                color: AppColors.c000000,
                height: 1,
                fontFamily: FontFamily.fOswaldMedium,
              ),
            )
          ],
        ),
      ));
      p.add(Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Divider(
            height: 1.w,
            color: AppColors.cE6E6E6,
          )));
      return p;
    });
    list.removeLast();
    return list;
  }

  List<Widget> getVsWidget() {
    var vsTeams = controller.getVsTeams();
    List<Widget> list = vsTeams.fold([], (p, e) {
      var key = controller.getCurrentTabKey();
      num value = 0.0;
      if (key.contains(",")) {
        value = key.split(",").fold(0.0, (p, element) {
          num v = e.toJson()[ParamUtils.getProKey(element.toLowerCase())] ?? 0;
          return p + v;
        });
      } else {
        value = e.toJson()[ParamUtils.getProKey(key.toLowerCase())];
      }
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

  SfCartesianChart _buildDefaultColumnChart(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var value = controller.getLast5AvgWithTab();
    var plotBands = <PlotBand>[];
    if (value != 0) {
      var verticalTextPadding =
          controller.getColumnMaxYValue() / 2 > value ? "0" : "-20";
      plotBands = <PlotBand>[
        PlotBand(
          start: value,
          // 虚线的起始位置（y 值）
          end: value,
          // 虚线的终止位置（y 值），相同值表示一条线
          borderWidth: 1,
          text: 'AVG \n${value.format()}',
          verticalTextPadding: "14",
          horizontalTextAlignment: TextAnchor.end,
          verticalTextAlignment: TextAnchor.middle,
          textStyle: 10.w4(
              color: AppColors.cFF7954,
              height: 1,
              fontFamily: FontFamily.fOswaldMedium),
          // 虚线的宽度
          borderColor: AppColors.cFF7954,
          shouldRenderAboveSeries: true,
          // 虚线的颜色
          dashArray: const [3, 3], // 设置虚线样式：[线段长度, 间隔长度]
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
        labelStyle: 10.w4(
            color: AppColors.cB3B3B3,
            height: 1,
            fontFamily: FontFamily.fRobotoRegular),
      ),
      // 添加标注
      primaryYAxis: NumericAxis(
        labelStyle: 10.w4(
            color: AppColors.cB3B3B3,
            height: 1,
            fontFamily: FontFamily.fOswaldMedium),
        plotBands: plotBands,
        maximum: controller.getColumnMaxYValue() * 1.2,
        minimum: 0,
        axisLine: const AxisLine(width: 0),
        // maximum: controller.getColumnMaxYValue().toDouble(),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(
            width: 1, color: AppColors.cD9D9D9, dashArray: [3, 3]),
      ),
      series: controller.getDefaultColumnSeries(width),
      // tooltipBehavior: _tooltipBehavior,
    );
  }
}
