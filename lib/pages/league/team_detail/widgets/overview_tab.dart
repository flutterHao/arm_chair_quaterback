import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/font_family.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_detail_entity.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/bottom_guess_tip_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/widgets/score_page.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/widgets/score_page_controller.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({super.key});

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<TeamDetailController>(
        id: "overview_tab",
        tag: Get.arguments.toString(),
        builder: (controller) {
          return Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  margin: EdgeInsets.only(bottom: 9.w),
                  child: Column(
                    children: [
                      9.vGap,
                      _SeasonStats(
                          regular:
                              controller.teamDetailEntity.regularSeasonData),
                      9.vGap,
                      _Schedule(controller.teamDetailEntity.gameSchedules),
                      9.vGap,
                      _RecentMatch(controller
                          .teamDetailEntity.last5GameSchedule.schedule),
                      // 9.vGap,
                      _RecentPick(controller.teamDetailEntity.recentPick),
                      _OutCome(controller.teamDetailEntity.outcome),
                      9.vGap,
                      _Stats(),
                    ],
                  ),
                ),
              ),
              // 竞猜选择结果底部弹框
              const BottomGuessTipWidget(),
            ],
          );
        });
  }
}

class _SeasonStats extends StatelessWidget {
  const _SeasonStats({super.key, required this.regular});
  final TeamDetailSeasonData regular;

  @override
  Widget build(BuildContext context) {
    List<String> types = ["PPG", "RPG", "APG", "BPG"];
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
              "${Constant.seasonId} stats".toUpperCase(),
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
                          regular
                              .getRankValue(types[index], regular)
                              .toString(),
                          textAlign: TextAlign.center,
                          style: 21.w4(
                            fontFamily: FontFamily.fOswaldBold,
                            height: 0.9,
                          ),
                        ),
                        5.5.vGap,
                        Text(
                          types[index],
                          style: 10.w4(
                              fontFamily: FontFamily.fRobotoRegular,
                              height: 0.9,
                              color: AppColors.c666666),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        Text(
                          regular.getRank(types[index], regular),
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
                itemCount: types.length),
          )
        ],
      ),
    );
  }
}

class _Schedule extends StatelessWidget {
  const _Schedule(this.gameSchedules, {super.key});
  final List<TeamDetailGameSchedules> gameSchedules;

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
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (context, index) {
                  var item = gameSchedules[index];
                  var isFinal = DateTime.now()
                      .toUtc()
                      .isAfter(DateUtil.getDateTimeByMs(item.gameStartTime));
                  return Container(
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
                              DateUtil.formatDateMs(item.gameStartTime,
                                  format: DateFormats.mo_d_h_m),
                              style: 12.w4(
                                  color: AppColors.c000000,
                                  fontFamily: FontFamily.fRobotoRegular,
                                  height: 0.9),
                            ),
                            12.5.hGap,
                            if (isFinal)
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
                              int score = index == 0
                                  ? item.homeTeamScore
                                  : item.awayTeamScore;
                              int teamId = index == 0
                                  ? item.homeTeamId
                                  : item.awayTeamId;
                              return Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(RouteNames.teamDetailPage,
                                          preventDuplicates: false,
                                          arguments: teamId);
                                    },
                                    child: ImageWidget(
                                      url: Utils.getTeamUrl(teamId),
                                      width: 38.5.w,
                                      height: 38.5.w,
                                    ),
                                  ),
                                  Text(
                                    "SDF",
                                    style: 12.w4(
                                        fontFamily: FontFamily.fOswaldMedium),
                                  ),
                                  Expanded(
                                    child: Text(
                                      !isFinal ? "-" : "$score",
                                      textAlign: TextAlign.right,
                                      style: 16.w4(
                                          fontFamily: FontFamily.fOswaldMedium),
                                    ),
                                  ),
                                  6.hGap,
                                ],
                              );
                            })
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => 9.hGap,
                itemCount: gameSchedules.length),
          ),
          25.vGap,
        ],
      ),
    );
  }
}

class _RecentMatch extends StatelessWidget {
  const _RecentMatch(this.list, {super.key});
  final List<TeamDetailGameSchedules> list;

  MediaQuery _buildL5GamePageWidget(final BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: list.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = list[index];
              int homeId = Get.arguments;
              var isHome = homeId == item.homeTeamId;
              // int leftId = isHome ? item.homeTeamId : item.awayTeamId;
              // int rightId = isHome ? item.awayTeamId : item.homeTeamId;
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
                    Text(
                      isHome ? "HOME" : "AWAY",
                      style: 10.w4(
                          color: AppColors.c4D4D4D,
                          fontFamily: FontFamily.fRobotoRegular,
                          height: 1),
                    ),
                    Expanded(
                      child: Text(
                        leftScore.toString(),
                        textAlign: TextAlign.end,
                        style: 21.w5(
                            color: leftScore > rightScore
                                ? AppColors.c000000
                                : AppColors.cB3B3B3,
                            height: 0.9,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    18.hGap,
                    Text(
                      DateUtil.formatDateMs(item.gameStartTime,
                          format: "yyyy.MM.dd"),
                      style: 10.w4(
                          color: AppColors.c4D4D4D,
                          fontFamily: FontFamily.fRobotoRegular,
                          height: 0.9),
                    ),
                    18.hGap,
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.start,
                        rightScore.toString(),
                        style: 21.w5(
                            color: leftScore < rightScore
                                ? AppColors.c000000
                                : AppColors.cB3B3B3,
                            height: 0.9,
                            fontFamily: FontFamily.fOswaldMedium),
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.end,
                      isHome ? "AWAY" : "HOME",
                      style: 10.w4(
                        color: AppColors.c4D4D4D,
                        fontFamily: FontFamily.fRobotoRegular,
                        height: 0.9,
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    int teamId = Get.arguments;
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
          GetBuilder<TeamDetailController>(
              tag: Get.arguments.toString(),
              builder: (controller) {
                var regular = controller.teamDetailEntity.regularSeasonData;
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
                                    controller.currentTypeIndex.value == index;
                                return InkWell(
                                  onTap: () => controller.onTypeTap(index),
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: 4.w,
                                        left: index == 0 ? 16.w : 0),
                                    height: 28.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 21.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.c666666,
                                            width: 1.w),
                                        color: isSelected
                                            ? AppColors.c262626
                                            : AppColors.cFFFFFF,
                                        borderRadius:
                                            BorderRadius.circular(14.w)),
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
                    14.5.vGap,
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 14.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Season Avg",
                                  style: 12.w4(
                                      height: 0.9,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                                9.vGap,
                                Text(
                                  regular
                                      .getRankValue(
                                          controller.getCurrentType(), regular)
                                      .toString(),
                                  style: 27.w7(
                                      color: AppColors.c262626,
                                      height: 0.9,
                                      fontFamily: FontFamily.fOswaldBold),
                                )
                              ],
                            ),
                          )),
                          Container(
                            width: 1.w,
                            color: AppColors.cE6E6E,
                            height: 42.w,
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.only(left: 14.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Last 5 Avg",
                                  style: 12.w4(
                                      height: 0.9,
                                      fontFamily: FontFamily.fRobotoRegular),
                                ),
                                9.vGap,
                                Text(
                                  "${controller.last5Avg()}",
                                  style: 27.w7(
                                      color: AppColors.c262626,
                                      height: 0.9,
                                      fontFamily: FontFamily.fOswaldBold),
                                )
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    25.vGap,
                    Container(
                      height: 135.w,
                      margin: EdgeInsets.symmetric(horizontal: 26.w),
                      child: _buildDefaultColumnChart(context),
                    ),
                    31.vGap,
                    if (controller
                        .teamDetailEntity.guessL5GameList.schedule.isNotEmpty)
                      Container(
                        height: 273.w,
                        margin: EdgeInsets.only(top: 9.w),
                        decoration: BoxDecoration(
                            color: AppColors.cFFFFFF,
                            borderRadius: BorderRadius.circular(9.w)),
                        child: Column(
                          children: [
                            SizedBox(
                                height: 40.w,
                                child: Row(
                                  children: [
                                    30.hGap,
                                    Row(
                                      children: [
                                        Text(
                                          Utils.getTeamInfo(teamId).shortEname,
                                        ),
                                        7.hGap,
                                        ImageWidget(
                                          url: Utils.getTeamUrl(teamId),
                                          width: 28.w,
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                        child: Text(
                                      // controller.getCurrentType(),
                                      "VS",
                                      textAlign: TextAlign.center,
                                      style: 12.w4(
                                          fontFamily:
                                              FontFamily.fRobotoRegular),
                                    )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ImageWidget(
                                          url: Utils.getTeamUrl(
                                              controller.getAwayTeamId()),
                                          width: 28.w,
                                        ),
                                        7.hGap,
                                        Text(
                                          Utils.getTeamInfo(
                                                  controller.getAwayTeamId())
                                              .shortEname,
                                        ),
                                      ],
                                    ),
                                    30.hGap,
                                  ],
                                )),
                            Expanded(
                              child: _buildL5GamePageWidget(context),
                            ),
                          ],
                        ),
                      ),
                    18.vGap,
                  ],
                );
              }),
        ],
      ),
    );
  }

  SfCartesianChart _buildDefaultColumnChart(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final controller =
        Get.find<TeamDetailController>(tag: Get.arguments.toString());

    var plotBands = <PlotBand>[];
    plotBands = <PlotBand>[
      PlotBand(
        start: controller.last5Avg(),
        // 虚线的起始位置（y 值）
        end: controller.last5Avg(),
        // 虚线的终止位置（y 值），相同值表示一条线
        borderWidth: 1,
        text: 'AVG \n${controller.last5Avg()}',
        // verticalTextPadding: "20",
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
        dashArray: const [3, 2], // 设置虚线样式：[线段长度, 间隔长度]
      ),
    ];
    return SfCartesianChart(
      margin: const EdgeInsets.only(bottom: 0),
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(color: AppColors.cD9D9D9, width: 1),
        majorTickLines: const MajorTickLines(size: 0),
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        labelStyle: 10.w4(color: AppColors.cB3B3B3),
      ),
      // 添加标注
      primaryYAxis: NumericAxis(
        labelStyle: 10.w4(color: AppColors.cB3B3B3),
        plotBands: plotBands,
        axisLine: const AxisLine(width: 0),
        // maximum: controller.getColumnMaxYValue().toDouble(),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(
            width: 1, color: AppColors.cD9D9D9, dashArray: [2, 2]),
      ),
      series: getDefaultColumnSeries(width),
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, String>> getDefaultColumnSeries(
      double width) {
    final controller =
        Get.find<TeamDetailController>(tag: Get.arguments.toString());
    var list = controller.teamDetailEntity.last5GameSchedule.schedule.map((e) {
      int index =
          controller.teamDetailEntity.last5GameSchedule.schedule.indexOf(e);
      var item = controller.teamDetailEntity.last5GameSchedule.scoreAvg[index];

      var dateStr = item.gameDate.split(",").first;
      // var score =
      //     e.homeTeamId == controller.teamId ? e.homeTeamScore : e.awayTeamScore;
      var score =
          (item.getValue(controller.getCurrentType()) * 10).roundToDouble() /
              10;
      Color color = score > controller.seasonAvg()
          ? AppColors.c000000
          : AppColors.cD9D9D9;
      return ChartSampleData(
          x: '$dateStr\nVS ${Utils.getTeamInfo(e.awayTeamId).shortEname}',
          y: score,
          pointColor: color);
    }).toList();
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        spacing: list.length > 1 ? 0.5 : 0.9,
        width: 0.35,
        borderRadius: BorderRadius.vertical(top: Radius.circular(3.w)),
        dataSource: list,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, textStyle: 10.w7(color: AppColors.c262626)),
      )
    ];
  }
}

class _RecentPick extends StatelessWidget {
  const _RecentPick(this.pick, {super.key});
  final ScoresEntity pick;

  @override
  Widget build(BuildContext context) {
    DateTime time = DateUtil.getDateTimeByMs(pick.gameStartTime);
    var date = DateTime(time.year, time.month, time.day);
    Get.put(ScorePageController(date));
    if (pick.homeTeamId == 0) return const SizedBox();
    return Container(
      margin: EdgeInsets.only(top: 9.w),
      padding: EdgeInsets.symmetric(vertical: 25.w, horizontal: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: AppColors.cFFFFFF,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "recent Pick".toUpperCase(),
            style: 24.w4(fontFamily: FontFamily.fOswaldBold, height: 0.9),
          ),
          16.5.vGap,
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(color: AppColors.cD9D9D9),
              ),
              child: ScoreItemWidget(gameGuess: GameGuess(pick)))
        ],
      ),
    );
  }
}

class _OutCome extends StatelessWidget {
  const _OutCome(this.outcomeList, {super.key});
  final List<TeamDetailOutcome> outcomeList;

  // String _getWinTeamName(TeamDetailGameSchedules gameSchedule) {
  //   return;
  // }

  String _formatDate12Hours(int time) {
    return "${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(time), format: DateFormats.y_mo_d)}  ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(time))}";
  }

  @override
  Widget build(BuildContext context) {
    if (outcomeList.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      height: 183.5.w,
      width: double.infinity,
      margin: EdgeInsets.only(top: 9.w),
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
              itemCount: outcomeList.length,
              itemBuilder: (context, index) {
                var item = outcomeList[index];
                int myTeamId = Get.arguments;
                String homeName =
                    Utils.getTeamInfo(item.gameSchedule.homeTeamId).shortEname;
                String awayName =
                    Utils.getTeamInfo(item.gameSchedule.awayTeamId).shortEname;
                String winName = item.gameSchedule.awayTeamScore >
                        item.gameSchedule.homeTeamScore
                    ? awayName
                    : homeName;
                bool isFinal = item.gameSchedule.gameStartTime <
                    DateTime.now().millisecondsSinceEpoch;
                String vsName = myTeamId == item.gameSchedule.homeTeamId
                    ? awayName
                    : homeName;
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
                                "@$vsName",
                                style: 14.w4(
                                    fontFamily: FontFamily.fOswaldMedium,
                                    height: 0.9),
                              ),
                            ),
                            Text(
                              " Result: $winName WIN",
                              style: 14.w4(
                                  color: AppColors.c0FA76C,
                                  fontFamily: FontFamily.fOswaldMedium,
                                  height: 0.9),
                            )
                          ],
                        ),
                        7.vGap,
                        Text(
                          "$homeName ${item.gameSchedule.homeTeamScore}  @  ${item.gameSchedule.awayTeamScore} $awayName",
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
                              decoration: const BoxDecoration(
                                  border:
                                      Border(bottom: BorderSide(width: 0.5))),
                              child: Text(
                                "${_formatDate12Hours(item.gameSchedule.gameStartTime)} ${isFinal ? "Final" : ""}",
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
                              "${item.reviewsCount}",
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

class _Stats extends StatelessWidget {
  const _Stats({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<TeamDetailController>(tag: Get.arguments.toString());
    var map = controller.getSeasonRanks();
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
                ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item = map.entries.elementAt(index);
                      return Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 71.w,
                            child: Text(
                              item.key,
                              style:
                                  12.w4(fontFamily: FontFamily.fRobotoRegular),
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
                                item.value
                                    .getRankValue(e, item.value)
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: 12.w4(
                                  fontFamily: FontFamily.fRobotoRegular,
                                ),
                              ),
                            ),
                          ),
                          10.hGap,
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        width: double.infinity,
                        height: 1,
                        color: AppColors.cD1D1D1,
                      );
                    },
                    itemCount: map.entries.length)

                // Container(
                //   width: double.infinity,
                //   height: 1,
                //   color: AppColors.cD1D1D1,
                //   margin: EdgeInsets.symmetric(horizontal: 16.w),
                // ),
                // Row(
                //   children: [
                //     Container(
                //       alignment: Alignment.center,
                //       width: 71.w,
                //       child: Text(
                //         "POS",
                //         style: 12.w4(fontFamily: FontFamily.fRobotoRegular),
                //       ),
                //     ),
                //     Container(
                //       width: 1.w,
                //       height: 32.w,
                //       color: AppColors.cE6E6E,
                //     ),
                //     10.hGap,
                //     ...controller.types.map(
                //       (e) => Expanded(
                //         child: Text(
                //           "9.0",
                //           textAlign: TextAlign.center,
                //           style: 12.w4(
                //             fontFamily: FontFamily.fRobotoRegular,
                //           ),
                //         ),
                //       ),
                //     ),
                //     10.hGap,
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
