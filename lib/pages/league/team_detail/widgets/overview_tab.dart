import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/widgets/score_page.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/widgets/score_page_controller.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(bottom: 9.w),
        child: Column(
          children: [
            9.vGap,
            _SeasonStats(),
            9.vGap,
            _Schedule(),
            9.vGap,
            _RecentMatch(),
            9.vGap,
            // _RecentPick(),
            9.vGap,
            _OutCome(),
            9.vGap,
            _Stats(),
          ],
        ),
      ),
    );
  }
}

class _SeasonStats extends StatelessWidget {
  const _SeasonStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // padding: EdgeInsets.symmetric(vertical: 20.w),
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.vGap,
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "24-25 stats",
              style: 24.w4(fontFamily: FontFamily.fOswaldBold, height: 0.9),
            ),
          ),
          15.5.vGap,
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.cE6E6E,
          ),
          Container(
            // color: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 24.w),
            height: 103.w,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      width: 93.w,
                      child: Column(children: [
                        Text(
                          "24.1",
                          textAlign: TextAlign.center,
                          style: 21.w4(
                            fontFamily: FontFamily.fOswaldBold,
                            height: 0.9,
                          ),
                        ),
                        5.5.vGap,
                        Text(
                          "PPG",
                          style: 10.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.9,
                              color: AppColors.c666666),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        Text(
                          "6th",
                          style: 12.w4(
                            color: AppColors.cFF7954,
                            height: 0.9,
                          ),
                        )
                      ]));
                },
                separatorBuilder: (context, index) => Container(
                      width: 1,
                      height: 53.5.w,
                      color: AppColors.cE6E6E,
                    ),
                itemCount: 4),
          )
        ],
      ),
    );
  }
}

class _Schedule extends StatelessWidget {
  const _Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cFFFFFF,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.vGap,
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Text(
              "SCHEDULE",
              style: 24.w4(
                fontFamily: FontFamily.fOswaldBold,
                height: 0.9,
              ),
            ),
          ),
          16.vGap,
          SizedBox(
            height: 123.5.w,
            // child: PageView.builder(
            //     physics: const BouncingScrollPhysics(),
            //     padEnds: false,
            //     itemCount: 4,
            //     controller: PageController(
            //       initialPage: 0,
            //       viewportFraction: 123.5 / 193.5,
            //     ),
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: EdgeInsets.only(left: 9.w),
            //         child: Container(
            //           width: 193.5.w,
            //           height: 123.5.w,
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(12.r),
            //             border: Border.all(color: AppColors.cB3B3B3),
            //           ),
            //         ),
            //       );
            //     }),
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (context, index) => Container(
                      width: 193.5.w,
                      height: 123.5.w,
                      padding:
                          EdgeInsets.only(left: 14.w, right: 14.w, top: 14.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColors.cB3B3B3),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "11/9  8:00 AM",
                                style: 12.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 0.9),
                              ),
                              12.5.hGap,
                              Text(
                                "Final",
                                style: 12.w4(
                                    color: AppColors.c000000,
                                    fontFamily: FontFamily.fRobotoRegular,
                                    height: 0.9),
                              ),
                              const Expanded(child: SizedBox.shrink()),
                              IconWidget(
                                iconWidth: 10.w,
                                iconColor: AppColors.c000000,
                                icon: Assets.iconUiIconArrows04,
                                rotateAngle: -90,
                              ),
                              9.hGap,
                            ],
                          ),
                          9.5.vGap,
                          Container(
                            width: double.infinity,
                            height: 1,
                            color: AppColors.cE6E6E,
                          ),
                          5.5.vGap,
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    ImageWidget(
                                      url: Utils.getTeamUrl(101),
                                      width: 38.5.w,
                                      height: 38.5.w,
                                    ),
                                    Text(
                                      "SDF",
                                      style: 12.w4(
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                    78.hGap,
                                    Text(
                                      "SDF",
                                      style: 16.w4(
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                  ],
                                );
                              })
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => 9.hGap,
                itemCount: 4),
          ),
          25.vGap,
        ],
      ),
    );
  }
}

class _RecentMatch extends StatelessWidget {
  const _RecentMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.w), color: AppColors.cFFFFFF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          25.vGap,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "RECENT",
              style: 30.w7(
                  color: AppColors.c262626,
                  height: 1,
                  fontFamily: FontFamily.fOswaldBold),
            ),
          ),
          25.vGap,
          GetBuilder<TeamDetailController>(builder: (controller) {
            return Column(
              children: [
                SizedBox(
                  height: 28.w,
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        itemCount: controller.types.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var type = controller.types[index];
                          return Obx(() {
                            bool isSelected =
                                controller.currentTabIndex.value == index;
                            return InkWell(
                              onTap: () => controller.onTabTap(index),
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 4.w, left: index == 0 ? 16.w : 0),
                                height: 28.w,
                                padding: EdgeInsets.symmetric(horizontal: 21.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.c666666, width: 1.w),
                                    color: isSelected
                                        ? AppColors.c262626
                                        : AppColors.cFFFFFF,
                                    borderRadius: BorderRadius.circular(14.w)),
                                child: Text(
                                  type.replaceAll(",", "+"),
                                  style: 13.w5(
                                      color: isSelected
                                          ? AppColors.cF2F2F2
                                          : AppColors.c262626,
                                      height: 1,
                                      fontFamily: FontFamily.fOswaldMedium),
                                ),
                              ),
                            );
                          });
                        }),
                  ),
                ),
                16.vGap,
                Divider(
                  color: AppColors.cE6E6E,
                  height: 1.w,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 94.w,
                        padding: EdgeInsets.only(left: 14.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Season Avg",
                              style: 12.w4(
                                  color: AppColors.c666666,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            15.vGap,
                            Text(
                              "30.0",
                              style: 27.w7(
                                  color: AppColors.c262626,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            )
                          ],
                        ),
                      )),
                      Container(
                        width: 1.w,
                        color: AppColors.cE6E6E,
                        height: 67.w,
                      ),
                      Expanded(
                          child: Container(
                        height: 94.w,
                        padding: EdgeInsets.only(left: 14.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Last 5 Avg",
                              style: 14.w4(
                                  color: AppColors.c666666,
                                  height: 1,
                                  fontFamily: FontFamily.fRobotoRegular),
                            ),
                            15.vGap,
                            Text(
                              "30.0",
                              style: 27.w7(
                                  color: AppColors.c262626,
                                  height: 1,
                                  fontFamily: FontFamily.fOswaldBold),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                // Builder(builder: (context) {
                //   if (controller.nbaPlayerBaseInfoEntity!
                //       .l5GameData.isEmpty) {
                //     return const SizedBox.shrink();
                //   }
                //   return Column(
                //     children: [
                //       9.vGap,
                //       Container(
                //         height: 162.w,
                //         margin: EdgeInsets.symmetric(
                //             horizontal: 16.w),
                //         padding: EdgeInsets.all(10.w),
                //         child: Stack(
                //           children: [
                //             _buildDefaultColumnChart(context),
                //           ],
                //         ),
                //       ),
                //     ],
                //   );
                // }),
                31.vGap,
                // GetBuilder<PlayNotStartController>(builder: (ctrl) {
                //   return Column(
                //     children: [
                //       SizedBox(
                //         height: 40.w,
                //         child: TabBar(
                //             controller: ctrl.teamL5GameTabController,
                //             indicatorColor: AppColors.cFF7954,
                //             indicatorSize: TabBarIndicatorSize.tab,
                //             dividerColor: AppColors.cD1D1D1,
                //             overlayColor: null,
                //             labelStyle: 16.w5(
                //                 height: 1,
                //                 fontFamily: FontFamily.fOswaldMedium),
                //             labelColor: AppColors.c000000,
                //             unselectedLabelStyle: 16.w5(
                //                 height: 1,
                //                 fontFamily: FontFamily.fOswaldMedium),
                //             unselectedLabelColor: AppColors.cB2B2B2,
                //             tabs: [
                //               Row(
                //                 children: [
                //                   ImageWidget(
                //                     url: Utils.getTeamUrl(
                //                         ctrl.item.homeTeamId),
                //                     width: 28.w,
                //                   ),
                //                   7.hGap,
                //                   Text(
                //                     Utils.getTeamInfo(
                //                             ctrl.item.homeTeamId)
                //                         .shortEname,
                //                   )
                //                 ],
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 children: [
                //                   Text(
                //                     Utils.getTeamInfo(
                //                             ctrl.item.awayTeamId)
                //                         .shortEname,
                //                   ),
                //                   7.hGap,
                //                   ImageWidget(
                //                     url: Utils.getTeamUrl(
                //                         ctrl.item.awayTeamId),
                //                     width: 28.w,
                //                   ),
                //                 ],
                //               )
                //             ]),
                //       ),
                //       Expanded(
                //         child: ExtendedTabBarView(
                //             controller: ctrl.teamL5GameTabController,
                //             children: [
                //               _buildL5GamePageWidget(
                //                   context,
                //                   ctrl.scoresNotStartGameEntity!
                //                           .teamHistoryMap[
                //                       ctrl.item.homeTeamId.toString()],
                //                   ctrl.item.homeTeamId),
                //               _buildL5GamePageWidget(
                //                   context,
                //                   ctrl.scoresNotStartGameEntity!
                //                           .teamHistoryMap[
                //                       ctrl.item.awayTeamId.toString()],
                //                   ctrl.item.awayTeamId),
                //             ]),
                //       ),
                //     ],
                //   );
                // }),
                // 18.vGap,
              ],
            );
          }),
        ],
      ),
    );
  }

  MediaQuery _buildL5GamePageWidget(
      BuildContext context, List<GameSchedulesInfo>? historyMap, int homeId) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: (historyMap ?? []).length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = historyMap![index];
              var isHome = homeId == item.homeTeamId;
              int leftId = isHome ? item.homeTeamId : item.awayTeamId;
              int rightId = isHome ? item.awayTeamId : item.homeTeamId;
              int leftScore = isHome ? item.homeTeamScore : item.awayTeamScore;
              int rightScore = isHome ? item.awayTeamScore : item.homeTeamScore;
              return Container(
                height: 46.w,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColors.cE6E6E, width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        isHome ? "HOME" : "AWAY",
                        style: 10.w4(
                            color: AppColors.c4D4D4D,
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ImageWidget(
                          url: Utils.getTeamUrl(leftId),
                          width: 25.w,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        leftScore.toString(),
                        style: 21.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          MyDateUtils.formatDate(
                              MyDateUtils.getDateTimeByMs(item.gameStartTime),
                              format: DateFormats.DOT_Y_M_D),
                          style: 10.w4(
                              color: AppColors.c4D4D4D,
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ImageWidget(
                        url: Utils.getTeamUrl(rightId),
                        width: 25.w,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        rightScore.toString(),
                        style: 21.w5(
                            color: AppColors.c000000,
                            height: 1,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.end,
                        isHome ? "AWAY" : "HOME",
                        style: 10.w4(
                            color: AppColors.c4D4D4D,
                            fontFamily: FontFamily.fRobotoRegular,
                            height: 1),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  // SfCartesianChart _buildDefaultColumnChart(BuildContext context) {
  //   var width = MediaQuery.of(context).size.width;
  //   // var pickInfo = controller.getPickInfo();
  //   var plotBands = <PlotBand>[];
  //   if (pickInfo != null) {
  //     var verticalTextPadding =
  //         controller.getColumnMaxYValue() / 2 > pickInfo.value ? "0" : "-20";
  //     plotBands = <PlotBand>[
  //       PlotBand(
  //         start: 1,
  //         // 虚线的起始位置（y 值）
  //         end: 1,
  //         // 虚线的终止位置（y 值），相同值表示一条线
  //         borderWidth: 1,
  //         text: 'AVG \n${1}',
  //         verticalTextPadding: verticalTextPadding,
  //         horizontalTextAlignment: TextAnchor.end,
  //         verticalTextAlignment: TextAnchor.middle,
  //         textStyle: 9.w4(color: AppColors.c262626, height: 1),
  //         // 虚线的宽度
  //         borderColor: AppColors.cFF7954.withOpacity(0.5),
  //         shouldRenderAboveSeries: true,
  //         // 虚线的颜色
  //         dashArray: const [3, 2], // 设置虚线样式：[线段长度, 间隔长度]
  //       ),
  //     ];
  //   }
  //   return SfCartesianChart(
  //     margin: const EdgeInsets.only(bottom: 0),
  //     plotAreaBorderWidth: 0,
  //     primaryXAxis: CategoryAxis(
  //       majorGridLines: const MajorGridLines(width: 0),
  //       axisLine: const AxisLine(color: AppColors.cD9D9D9, width: 1),
  //       majorTickLines: const MajorTickLines(size: 0),
  //       labelIntersectAction: AxisLabelIntersectAction.wrap,
  //       labelStyle: 10.w4(color: AppColors.cB3B3B3),
  //     ),
  //     // 添加标注
  //     primaryYAxis: NumericAxis(
  //       labelStyle: 10.w4(color: AppColors.cB3B3B3),
  //       plotBands: plotBands,
  //       axisLine: const AxisLine(width: 0),
  //       // maximum: controller.getColumnMaxYValue().toDouble(),
  //       majorTickLines: const MajorTickLines(size: 0),
  //       majorGridLines: const MajorGridLines(
  //           width: 1, color: AppColors.cD9D9D9, dashArray: [2, 2]),
  //     ),
  //     series: controller.getDefaultColumnSeries(width),
  //     // tooltipBehavior: _tooltipBehavior,
  //   );
  // }
}

class _RecentPick extends StatelessWidget {
  const _RecentPick({super.key});

  @override
  Widget build(BuildContext context) {
    ScorePageController controller = Get.find();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.w, horizontal: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.cFFFFFF,
      ),
      child: Column(
        children: [
          Text(
            "recent Pick",
            style: 24.w4(
              fontFamily: FontFamily.fOswaldBold,
            ),
          ),
          16.5.vGap,
          ScoreItemWidget(gameGuess: controller.scoreList.first)
        ],
      ),
    );
  }
}

class _OutCome extends StatelessWidget {
  const _OutCome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 183.5.w,
      width: double.infinity,
      padding: EdgeInsets.only(top: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.cFFFFFF,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.w),
            child: Text(
              "OUTCOME",
              style: 24.w4(fontFamily: FontFamily.fOswaldBold, height: 0.9),
            ),
          ),
          17.vGap,
          SizedBox(
            height: 100.5.w,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 298.w,
                    height: 96.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      // vertical: 10.5.w,
                    ),
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12.w),
                      border: Border.all(color: AppColors.cD9D9D9),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.5.vGap,
                        Row(
                          children: [
                            IconWidget(
                              iconWidth: 20.w,
                              icon: Assets.picksUiPicksHistoryPick,
                              iconColor: AppColors.c0FA76C,
                            ),
                            7.5.hGap,
                            Expanded(
                              child: Text(
                                "@HOU",
                                style: 14.w4(
                                    fontFamily: FontFamily.fOswaldMedium,
                                    height: 0.9),
                              ),
                            ),
                            Text(
                              " Result: CHI WIN",
                              style: 14.w4(
                                  color: AppColors.c0FA76C,
                                  fontFamily: FontFamily.fOswaldMedium,
                                  height: 0.9),
                            )
                          ],
                        ),
                        7.vGap,
                        Text(
                          "DAS 128  @ 129 chi",
                          style: 7.w4(
                              fontFamily: FontFamily.fRobotoMedium,
                              height: 0.9),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: AppColors.cD4D4D4,
                          margin: EdgeInsets.only(top: 13.5.w, bottom: 10.w),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border(bottom: BorderSide(width: 0.5))),
                              child: Text(
                                "11/08/01  8:00 am  final",
                                style: 10.w4(
                                    fontFamily: FontFamily.fRobotoRegular,
                                    color: AppColors.c000000,
                                    height: 0.9),
                              ),
                            ),
                            6.5.hGap,
                            IconWidget(
                              iconWidth: 7.5.w,
                              icon: Assets.iconUiIconArrows04,
                              rotateAngle: -90,
                              iconColor: AppColors.c000000,
                            ),
                            Expanded(child: Container()),
                            IconWidget(
                              iconWidth: 16.5.w,
                              iconHeight: 13.5.w,
                              icon: Assets.picksUiPicksHistoryComment,
                              iconColor: AppColors.c000000,
                            ),
                            6.hGap,
                            Text(
                              "100K",
                              style: 10.w4(
                                  fontFamily: FontFamily.fRobotoRegular,
                                  height: 0.9),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => 10.hGap,
            ),
          )
        ],
      ),
    );
  }
}

class _Stats extends GetView<TeamDetailController> {
  const _Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 208.w,
      padding: EdgeInsets.only(top: 25.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.cFFFFFF,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.5.w),
            child: Text(
              "STATS",
              style: 24.w4(
                fontFamily: FontFamily.fOswaldBold,
              ),
            ),
          ),
          12.5.vGap,
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: AppColors.cD1D1D1,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 71.w,
                      child: Text(
                        "TYPE",
                        style: 12.w4(fontFamily: FontFamily.fRobotoMedium),
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 32.w,
                      color: AppColors.cE6E6E,
                    ),
                    10.hGap,
                    ...controller.types.map(
                      (e) => Expanded(
                        child: Text(
                          e,
                          textAlign: TextAlign.center,
                          style: 12.w4(
                            fontFamily: FontFamily.fRobotoMedium,
                          ),
                        ),
                      ),
                    ),
                    10.hGap,
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.cD1D1D1,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 71.w,
                      child: Text(
                        "REG",
                        style: 12.w4(fontFamily: FontFamily.fRobotoRegular),
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 32.w,
                      color: AppColors.cE6E6E,
                    ),
                    10.hGap,
                    ...controller.types.map(
                      (e) => Expanded(
                        child: Text(
                          "10",
                          textAlign: TextAlign.center,
                          style: 12.w4(
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                      ),
                    ),
                    10.hGap,
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.cD1D1D1,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 71.w,
                      child: Text(
                        "POS",
                        style: 12.w4(fontFamily: FontFamily.fRobotoRegular),
                      ),
                    ),
                    Container(
                      width: 1.w,
                      height: 32.w,
                      color: AppColors.cE6E6E,
                    ),
                    10.hGap,
                    ...controller.types.map(
                      (e) => Expanded(
                        child: Text(
                          "9.0",
                          textAlign: TextAlign.center,
                          style: 12.w4(
                            fontFamily: FontFamily.fRobotoRegular,
                          ),
                        ),
                      ),
                    ),
                    10.hGap,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
