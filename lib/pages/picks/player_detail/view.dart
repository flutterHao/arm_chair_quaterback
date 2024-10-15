import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/common/widgets/arc_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/black_app_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/btn_background.dart';
import 'package:arm_chair_quaterback/common/widgets/horizontal_drag_back_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/icon_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/image_widget.dart';
import 'package:arm_chair_quaterback/common/widgets/load_status_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'index.dart';

class PlayerDetailPageArguments {
  final int? teamId;
  final int playerId;
  final bool rootNavigator;
  final int getId;

  PlayerDetailPageArguments(this.playerId,
      {this.teamId,
      this.rootNavigator = false,
      this.getId = GlobalNestedKey.PICKS});
}

class PlayerDetailPage extends GetView<PlayerDetailController> {
  const PlayerDetailPage({super.key, this.arguments});

  final PlayerDetailPageArguments? arguments;

  SfCircularChart _buildSmartLabelPieChart() {
    return SfCircularChart(
      // title: ChartTitle(
      //     text: isCardView ? '' : 'Gold medals count in Rio Olympics'),
      series: _getSmartLabelPieSeries(),
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  SfCircularChart _buildBackgroundSmartLabelPieChart() {
    return SfCircularChart(
      // title: ChartTitle(
      //     text: isCardView ? '' : 'Gold medals count in Rio Olympics'),
      series: <PieSeries<ChartSampleData, String>>[
        PieSeries<ChartSampleData, String>(
            animationDuration: 0,
            dataSource: controller.dataSource,
            xValueMapper: (ChartSampleData data, _) => data.x as String,
            yValueMapper: (ChartSampleData data, _) => data.yValue,
            pointColorMapper: (data, _) => AppColors.ce5e5e5,
            pointRadiusMapper: (data, _) => data.y.toString(),
            explodeAll: true,
            explodeOffset: '3%',
            explode: true,
            dataLabelSettings: DataLabelSettings(
                margin: EdgeInsets.zero,
                isVisible: true,
                builder:
                    (data, point, series, int pointIndex, int seriesIndex) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    decoration: BoxDecoration(
                        color: AppColors.cE6E6E6,
                        borderRadius: BorderRadius.circular(15.h)),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "${(data as ChartSampleData).x}:  ",
                          style: 10.w4(color: AppColors.cB3B3B3, height: 1)),
                      TextSpan(
                          text: (data).yValue!.toStringAsFixed(0),
                          style: 14.w7(color: AppColors.c262626, height: 1))
                    ])),
                  );
                },
                labelPosition: ChartDataLabelPosition.outside,
                connectorLineSettings: const ConnectorLineSettings(
                    color: AppColors.cB3B3B3,
                    type: ConnectorType.curve,
                    length: '20%'),
                labelIntersectAction: LabelIntersectAction.shift))
      ],
      // tooltipBehavior: _tooltipBehavior,
    );
  }

  List<PieSeries<ChartSampleData, String>> _getSmartLabelPieSeries() {
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
        animationDuration: 0,
        dataSource: controller.dataSource,
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.yValue,
        pointColorMapper: (data, _) => AppColors.c3B93FF,
        pointRadiusMapper: (data, _) => data.yValue.toString(),
        explodeAll: true,
        explodeOffset: '3%',
        explode: true,
      )
    ];
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.uuidPlayerInfo != null )
                Column(
                  children: [
                    _leverWidget(context),
                    9.vGap,
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.cF2F2F2,
                          borderRadius: BorderRadius.circular(16.w)),
                      padding: EdgeInsets.all(14.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ability",
                            style: 19.w7(color: AppColors.c262626, height: 1),
                          ),
                          if(controller.baseInfo != null)
                          LayoutBuilder(builder: (context, constraints) {
                            return SizedBox(
                              height: 190.h,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  _buildBackgroundSmartLabelPieChart(),
                                  _buildSmartLabelPieChart()
                                ],
                              ),
                            );
                          }),
                          Text(
                            "Potential",
                            style: 19.w7(color: AppColors.c262626, height: 1),
                          ),
                          13.vGap,
                          LayoutBuilder(builder: (context, constraints) {
                            return Container(
                              height: 130.h,
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  left: 14.w, right: 18.w, top: 5.w),
                              child: AspectRatio(
                                aspectRatio: 1.4,
                                child: BarChart(BarChartData(
                                    maxY: controller.uuidPlayerInfo!.potential!
                                        .getMax()
                                        .toDouble(),
                                    borderData: FlBorderData(
                                        show: true,
                                        border: const Border(
                                            bottom: BorderSide(
                                                color: AppColors.cD9D9D9,
                                                width: 1))),
                                    gridData: FlGridData(
                                        show: true,
                                        drawHorizontalLine: true,
                                        drawVerticalLine: false,
                                        horizontalInterval: controller
                                            .uuidPlayerInfo!.potential!
                                            .getStep()
                                            .toDouble(),
                                        getDrawingHorizontalLine: (value) {
                                          return const FlLine(
                                              color: AppColors.cD9D9D9,
                                              strokeWidth: 1,
                                              dashArray: [3]);
                                        }),
                                    titlesData: FlTitlesData(
                                        show: true,
                                        leftTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                                showTitles: true,
                                                interval: 10,
                                                getTitlesWidget: (value, meta) {
                                                  var text = value % 200 != 0
                                                      ? ""
                                                      : value
                                                          .toStringAsFixed(0);
                                                  return Text(
                                                    text,
                                                    style: 9.w4(
                                                        color:
                                                            AppColors.cB2B2B2),
                                                  );
                                                })),
                                        bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                                showTitles: true,
                                                getTitlesWidget: (value, meta) {
                                                  var text = "PTS";
                                                  switch (value.toInt()) {
                                                    case 1:
                                                      text = "PTS";
                                                      break;
                                                    case 2:
                                                      text = "3PT";
                                                      break;
                                                    case 3:
                                                      text = "AST";
                                                      break;
                                                    case 4:
                                                      text = "REB";
                                                      break;
                                                    case 5:
                                                      text = "BLK";
                                                      break;
                                                    case 6:
                                                      text = "STL";
                                                      break;
                                                  }
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                        top: 2.h),
                                                    child: Text(
                                                      text,
                                                      style: 9.w4(
                                                          color: AppColors
                                                              .cB2B2B2),
                                                    ),
                                                  );
                                                })),
                                        rightTitles: const AxisTitles(),
                                        topTitles: const AxisTitles()),
                                    barTouchData: BarTouchData(
                                        enabled: true,
                                        handleBuiltInTouches: false,
                                        touchTooltipData: BarTouchTooltipData(
                                          tooltipMargin: 0,
                                          tooltipPadding:
                                              const EdgeInsets.all(0),
                                          getTooltipColor: (_) =>
                                              AppColors.cTransparent,
                                          getTooltipItem:
                                              (BarChartGroupData group,
                                                  int groupIndex,
                                                  BarChartRodData rod,
                                                  int rodIndex) {
                                            return BarTooltipItem(
                                              rod.toY.toStringAsFixed(0),
                                              11.w7(
                                                  color: rod.color!, height: 1),
                                            );
                                          },
                                        )),
                                    barGroups: [
                                      BarChartGroupData(
                                          showingTooltipIndicators: [0],
                                          x: 1,
                                          barRods: [
                                            BarChartRodData(
                                                width: 10.w,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            5.w)),
                                                toY: controller.uuidPlayerInfo!
                                                        .potential?.pts
                                                        ?.toDouble() ??
                                                    0,
                                                color: AppColors.cE72646)
                                          ]),
                                      BarChartGroupData(
                                          showingTooltipIndicators: [0],
                                          x: 2,
                                          barRods: [
                                            BarChartRodData(
                                                width: 10.w,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            5.w)),
                                                toY: controller.uuidPlayerInfo!
                                                        .potential?.threePt
                                                        ?.toDouble() ??
                                                    0,
                                                color: AppColors.cE8B94C)
                                          ]),
                                      BarChartGroupData(
                                          showingTooltipIndicators: [0],
                                          x: 3,
                                          barRods: [
                                            BarChartRodData(
                                                width: 10.w,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            5.w)),
                                                toY: controller.uuidPlayerInfo!
                                                        .potential?.ast
                                                        ?.toDouble() ??
                                                    0,
                                                color: AppColors.c10A86A)
                                          ]),
                                      BarChartGroupData(
                                          showingTooltipIndicators: [0],
                                          x: 4,
                                          barRods: [
                                            BarChartRodData(
                                                width: 10.w,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            5.w)),
                                                toY: controller.uuidPlayerInfo!
                                                        .potential?.reb
                                                        ?.toDouble() ??
                                                    0,
                                                color: AppColors.cE8B94C)
                                          ]),
                                      BarChartGroupData(
                                          showingTooltipIndicators: [0],
                                          x: 5,
                                          barRods: [
                                            BarChartRodData(
                                                width: 10.w,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            5.w)),
                                                toY: controller.uuidPlayerInfo!
                                                        .potential?.blk
                                                        ?.toDouble() ??
                                                    0,
                                                color: AppColors.c10A86A)
                                          ]),
                                      BarChartGroupData(
                                          showingTooltipIndicators: [0],
                                          x: 6,
                                          barRods: [
                                            BarChartRodData(
                                                width: 10.w,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            5.w)),
                                                toY: controller.uuidPlayerInfo!
                                                        .potential?.stl
                                                        ?.toDouble() ??
                                                    0,
                                                color: AppColors.c10A86A)
                                          ]),
                                    ])),
                              ),
                            );
                          }),
                          18.vGap,
                          Center(
                            child: InkWell(
                              onTap: () {
                                _upgradeDialog(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.cFF7954, width: 2.w),
                                    borderRadius: BorderRadius.circular(18.h)),
                                height: 36.h,
                                width: 303.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox.shrink(),
                                    Text(
                                      "UPGRADE",
                                      style: 18.w7(color: AppColors.cFF7954),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(right: 11.w),
                                        child: IconWidget(
                                          iconHeight: 14.w,
                                          iconWidth: 14.w,
                                          icon: Assets.uiIconArrowsPng,
                                          iconColor: AppColors.cFF7954,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              13.vGap,
              Text(
                "Price Fluctuation",
                style: 19.w7(color: AppColors.c262626, height: 1),
              ),
              13.vGap,
              Container(
                height: 76.w,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.cF2F2F2,
                    borderRadius: BorderRadius.circular(16.w)),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      MyDateUtils.getEnMMDDYYYY(MyDateUtils.getDateTimeByMs(
                          controller.baseInfo?.beforeMarketPriceUpdateTime ??
                              0)),
                      style: 10.w4(color: AppColors.cFF7954),
                    ),
                    Row(
                      children: [
                        Text(
                          "${controller.baseInfo?.marketPrice ?? 0}",
                          style: 36.w7(color: AppColors.c262626, height: 1),
                        ),
                        44.hGap,
                        if ((controller.baseInfo?.basicMarketPrice ?? 0) > 0)
                          Text(
                            "${((((controller.uuidPlayerInfo != null ? controller.uuidPlayerInfo!.buyPrice ?? 0 : (controller.baseInfo?.marketPrice ?? 0)) - (controller.baseInfo?.basicMarketPrice ?? 0)) / (controller.baseInfo?.basicMarketPrice ?? 0)) * 100).toStringAsFixed(2)}%",
                            style: 36.w7(color: AppColors.cE72646, height: 1),
                          )
                      ],
                    ),
                  ],
                ),
              ),
              9.vGap,
              if (controller.barGroups.isNotEmpty)
                Container(
                  height: 165.w,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.w),
                  decoration: BoxDecoration(
                      color: AppColors.cF2F2F2,
                      borderRadius: BorderRadius.circular(16.w)),
                  child: Center(
                    child: BarChart(
                      BarChartData(
                          barTouchData: controller.barTouchData,
                          titlesData: controller.titlesData,
                          borderData: controller.borderData,
                          barGroups: controller.barGroups,
                          gridData: controller.gridData,
                          alignment: BarChartAlignment.spaceAround,
                          maxY: controller.maxPriceValue,
                          minY: controller.minPriceValue),
                    ),
                  ),
                ),
              _buildStats(),
              24.vGap,
              Text(
                "News",
                style: 19.w7(color: AppColors.c262626, height: 1),
              ),
              13.vGap,
              20.vGap
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      24.vGap,
      Text(
        "Stats",
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
                      child:
                          Text("TEAM", style: 10.w4(color: AppColors.cB3B3B3))),
                  if (controller.nbaPlayerBaseInfoEntity != null &&
                      controller.nbaPlayerBaseInfoEntity!.playerRegularMap
                          .isNotEmpty())
                    Container(
                        height: 30.w,
                        width: 77.w,
                        alignment: Alignment.center,
                        child: Text("REG",
                            style: 12.w4(color: AppColors.c818181))),
                  if (controller.nbaPlayerBaseInfoEntity != null &&
                      controller.nbaPlayerBaseInfoEntity!.playerPlayoffsMap
                          .isNotEmpty())
                    Container(
                        height: 30.w,
                        width: 77.w,
                        alignment: Alignment.center,
                        child:
                            Text("POS", style: 12.w4(color: AppColors.c818181)))
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
                              .isNotEmpty() ||
                          controller.nbaPlayerBaseInfoEntity!.playerRegularMap
                              .isNotEmpty()))
                    SingleChildScrollView(
                      // physics: const BouncingScrollPhysics(),
                      controller: controller.statsScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7.w),
                        padding: EdgeInsets.only(left: 10.w),
                        child: Column(
                          children: [
                            Table(
                              columnWidths: List.generate(
                                  8, (index) => FixedColumnWidth(40.w)).asMap(),
                              children: List.generate(1, (index) {
                                List<String> keys = controller
                                        .nbaPlayerBaseInfoEntity!
                                        .playerPlayoffsMap
                                        .isNotEmpty()
                                    ? controller.nbaPlayerBaseInfoEntity!
                                        .playerPlayoffsMap
                                        .toJson()
                                        .keys
                                        .toList()
                                    : controller.nbaPlayerBaseInfoEntity!
                                        .playerRegularMap
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
                                              style: 10
                                                  .w4(color: AppColors.cB3B3B3),
                                            ))));
                              }),
                            ),
                            if (controller
                                .nbaPlayerBaseInfoEntity!.playerPlayoffsMap
                                .isNotEmpty())
                              Table(
                                columnWidths: List.generate(
                                        8, (index) => FixedColumnWidth(40.w))
                                    .asMap(),
                                children: List.generate(
                                    1,
                                    (index) => TableRow(
                                        children: List.generate(
                                            controller.nbaPlayerBaseInfoEntity!
                                                .playerPlayoffsMap
                                                .toJson()
                                                .keys
                                                .length,
                                            (index) => Container(
                                                height: 30.w,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  controller
                                                      .nbaPlayerBaseInfoEntity!
                                                      .playerPlayoffsMap
                                                      .getValue(controller
                                                          .nbaPlayerBaseInfoEntity!
                                                          .playerPlayoffsMap
                                                          .toJson()
                                                          .keys
                                                          .toList()[index])
                                                      .toString(),
                                                  style: 12.w4(
                                                      color: AppColors.c545454),
                                                ))))),
                              ),
                            if (controller
                                .nbaPlayerBaseInfoEntity!.playerRegularMap
                                .isNotEmpty())
                              Table(
                                columnWidths: List.generate(
                                        8, (index) => FixedColumnWidth(40.w))
                                    .asMap(),
                                children: List.generate(
                                    1,
                                    (index) => TableRow(
                                        children: List.generate(
                                            controller.nbaPlayerBaseInfoEntity!
                                                .playerRegularMap
                                                .toJson()
                                                .keys
                                                .length,
                                            (index) => Container(
                                                height: 30.w,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  controller
                                                      .nbaPlayerBaseInfoEntity!
                                                      .playerRegularMap
                                                      .getValue(controller
                                                          .nbaPlayerBaseInfoEntity!
                                                          .playerRegularMap
                                                          .toJson()
                                                          .keys
                                                          .toList()[index])
                                                      .toString(),
                                                  style: 12.w4(
                                                      color: AppColors.c545454),
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
    ]);
  }

  Widget _leverWidget(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      controller.validScreenWidth.value = constraints.maxWidth;
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.w),
        child: SizedBox(
          height: 119.w,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ///背景色块
              Container(
                height: 87.w,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.c262626,
                    borderRadius: BorderRadius.circular(16.w)),
              ),

              /// 左边星级评分
              Obx(() {
                return AnimatedPositioned(
                  left: controller.other.value * -100.w,
                  top: 14.w,
                  duration: const Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      9.vGap,
                      SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: IconWidget(
                            iconWidth: 32.w,
                            icon: Assets.uiIconPingjiPng,
                            iconHeight: 32.w,
                          )),
                      6.vGap,
                      Container(
                        height: 26.w,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(13.w))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Score",
                              style: TextStyle(
                                  color: AppColors.cB3B3B3, fontSize: 12.sp),
                            ),
                            10.hGap,
                            Text(
                              "${controller.baseInfo?.playerScore}",
                              style: TextStyle(
                                  color: AppColors.cF1F1F1, fontSize: 12.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),

              /// 右边sal
              Obx(() {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  right: controller.other.value * -100,
                  top: 14.w,
                  child: Column(
                    children: [
                      9.vGap,
                      SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: IconWidget(
                            iconWidth: 32.w,
                            icon: Assets.uiStateBestPng,
                            iconHeight: 32.w,
                          )),
                      6.vGap,
                      Container(
                        height: 26.w,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: AppColors.c000000,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(13.w))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "SAL",
                              style: TextStyle(
                                  color: AppColors.cB3B3B3, fontSize: 12.sp),
                            ),
                            10.hGap,
                            Text(
                              "${controller.baseInfo?.salary}",
                              style: TextStyle(
                                  color: AppColors.cF1F1F1, fontSize: 12.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),

              /// 背后橙色的渐变光
              Obx(() {
                return Positioned(
                  left: controller.startLeft.value == -1111
                      ? (constraints.maxWidth - 119.w - 16.w) / 2
                      : controller.startLeft.value,
                  child: SizedBox(
                    width: 119.w,
                    height: 87.w,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(16.w)),
                      child: Image.asset(
                        alignment: Alignment.center,
                        Assets.uiLight_01Png,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),

              /// 升级成功的概率
              Obx(() {
                return Positioned(
                    right: 32.w,
                    child: Opacity(
                      opacity: controller.rateBoxOpacity.value,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                  height: 42.w,
                                  width: 84.w,
                                  child: ArcWidget(
                                    42.w,
                                    progressColor: AppColors.cFF7954,
                                    progressWidth: 8.w,
                                    borderColor: AppColors.cB3B3B3,
                                    borderWidth: 3.w,
                                    progressSweepAngle:
                                        controller.rateProgress.value,
                                    borderSweepAngle:
                                        controller.progressBorder.value,
                                  )),
                              Positioned(
                                  bottom: 0.w,
                                  child: Text(
                                    "${((controller.rateProgress.value / 180 * 100) > 100 ? 100 : (controller.rateProgress.value / 180 * 100)).toStringAsFixed(0)}%",
                                    style: 24.w7(
                                        color: AppColors.cFF7954, height: 1),
                                  ))
                            ],
                          ),
                          3.vGap,
                          Text(
                            "Success Rate",
                            style: 12.w4(color: AppColors.cFF7954),
                          )
                        ],
                      ),
                    ));
              }),

              /// 升级后的属性值
              Obx(() {
                return Positioned(
                  left: controller.propertyLeft.value,
                  child: Container(
                    height: 64.w,
                    width: 151.w,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          AppColors.c666666.withOpacity(0),
                          AppColors.c666666
                        ]),
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(32.w))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50.w,
                              height: 8.w,
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Positioned(
                                    right: 17.w,
                                    child: IconWidget(
                                        iconWidth: 8.w,
                                        icon: Assets.uiIconArrows_01Png,iconColor: AppColors.cF2F2F2.withOpacity(.2),),
                                  ),
                                  Positioned(
                                    right: 11.w,
                                    child: IconWidget(
                                        iconWidth: 8.w,
                                        icon: Assets.uiIconArrows_01Png,iconColor: AppColors.cF2F2F2.withOpacity(.5),),
                                  ),
                                  Positioned(
                                    right: 5.w,
                                    child: IconWidget(
                                        iconWidth: 8.w,
                                        icon: Assets.uiIconArrows_01Png,iconColor: AppColors.cF2F2F2,),
                                  )
                                ],
                              ),
                            ),
                            10.hGap,
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                IconWidget(
                                  iconWidth: 35.w,
                                  icon: Assets.uiIconStar_01Png,
                                  iconColor: AppColors.cFF7954,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5.w),
                                  child: Text(
                                    "6",
                                    style: 21.w7(color: AppColors.c262626),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        3.vGap,
                        Container(
                          height: 16.w,
                          width: 110.w,
                          decoration: BoxDecoration(
                              color: AppColors.c262626,
                              borderRadius: BorderRadius.circular(8.w)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Potential",
                                style: 10.w4(color: AppColors.cB3B3B3),
                              ),
                              6.hGap,
                              Text(
                                "+4~8%",
                                style: 12.w4(color: AppColors.cF2F2F2),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),

              /// 居中重叠的五角星
              Obx(() {
                return Positioned(
                  left: controller.startLeft.value == -1111
                      ? (constraints.maxWidth - 119.w - 16.w) / 2
                      : controller.startLeft.value,
                  child: Transform.rotate(
                    angle: controller.starRotate.value * 2 * 3.14159,
                    child: SizedBox(
                      width: 119.w,
                      height: 119.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            Assets.uiIconStar_02Png,
                            height: controller.starSize.value,
                            fit: BoxFit.fitHeight,
                          ),
                          IconWidget(
                            iconWidth: 68.w,
                            icon: Assets.uiIconStar_01Png,
                            iconColor: AppColors.cFF7954,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.w),
                            child: Text(
                              "${controller.uuidPlayerInfo?.breakThroughGrade}",
                              style: 34.w7(color: AppColors.c262626),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      );
    });
  }

  Future<void> _upgradeDialog(BuildContext context) async {
    controller.upgradeTap();
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.cD8D8D8,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.w))),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 11.w,
                    right: 14.w,
                    left: 16.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 24.w,
                        width: 92.w,
                        decoration: BoxDecoration(
                            color: AppColors.c262626,
                            borderRadius: BorderRadius.circular(12.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox.shrink(),
                            Text("Grade",
                                style: 13.w4(color: AppColors.cF2F2F2)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.uiIconShrinkPng,
                                  iconColor: AppColors.cF2F2F2,
                                ),
                                3.vGap,
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.uiIconUnfoldPng,
                                  iconColor: AppColors.cB3B3B3,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 24.w,
                        width: 92.w,
                        decoration: BoxDecoration(
                            color: AppColors.cE6E6E6,
                            borderRadius: BorderRadius.circular(12.w)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox.shrink(),
                            Text("Level",
                                style: 13.w4(color: AppColors.c262626)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.uiIconShrinkPng,
                                  iconColor: AppColors.cB3B3B3,
                                ),
                                3.vGap,
                                IconWidget(
                                  iconWidth: 8.w,
                                  icon: Assets.uiIconUnfoldPng,
                                  iconColor: AppColors.cB3B3B3,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Selected: ",
                            style: 13.w4(color: AppColors.cB3B3B3),
                          ),
                          7.hGap,
                          Text(
                            "2",
                            style: 13.w4(color: AppColors.c10A86A),
                          ),
                          Text(
                            "/5",
                            style: 13.w4(color: AppColors.c262626),
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () => Get.back(),
                          child: IconWidget(
                            iconWidth: 18.w,
                            icon: Assets.iconClosePng,
                            iconColor: AppColors.c262626,
                          ))
                    ],
                  ),
                ),
                19.vGap,
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        bool item = controller.dialogListDatas[index];
                        return InkWell(
                          onTap: () => controller.dialogListItemTap(index),
                          child: Container(
                            height: 84.w,
                            margin: EdgeInsets.only(
                                left: 16.w, right: 16.w, bottom: 9.w),
                            decoration: BoxDecoration(
                                color: AppColors.cF2F2F2,
                                borderRadius: BorderRadius.circular(16.w),
                                border: Border.all(
                                    color: item
                                        ? AppColors.c10A86A
                                        : Colors.transparent,
                                    width: 1)),
                            child: Row(
                              children: [
                                13.hGap,
                                Container(
                                  width: 64.w,
                                  height: 64.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.cE1E1E1,
                                      borderRadius:
                                          BorderRadius.circular(32.w)),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      IconWidget(
                                          iconWidth: 64.w,
                                          icon: Assets.testTeamLogoPng),
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Text(
                                            "SS",
                                            style:
                                                16.w7(color: AppColors.c262626),
                                          ))
                                    ],
                                  ),
                                ),
                                9.hGap,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Player Name",
                                        style: 16.w4(color: AppColors.c262626),
                                      ),
                                      8.vGap,
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            decoration: BoxDecoration(
                                              color: AppColors.c666666,
                                              borderRadius:
                                                  BorderRadius.circular(2.w),
                                            ),
                                            child: Text(
                                              "SG",
                                              style: 10
                                                  .w4(color: AppColors.cF2F2F2),
                                            ),
                                          ),
                                          3.hGap,
                                          SizedBox(
                                            width: 14.w,
                                            height: 14.w,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                IconWidget(
                                                  iconWidth: 14.w,
                                                  icon: Assets.uiIconStar_01Png,
                                                  iconColor: AppColors.cFF7954,
                                                ),
                                                Text(
                                                  "5",
                                                  style: 9.w4(
                                                      color: AppColors.cFFFFFF),
                                                ),
                                              ],
                                            ),
                                          ),
                                          3.hGap,
                                          IconWidget(
                                              iconWidth: 12.w,
                                              icon: Assets.uiStateBestPng)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                20.hGap,
                                Container(
                                  width: 81.w,
                                  height: 56.w,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.ce5e5e5, width: 1),
                                      borderRadius:
                                          BorderRadius.circular(12.w)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("+25%",
                                          style: 21.w7(
                                              color: AppColors.cFF7954,
                                              height: 1)),
                                      2.vGap,
                                      Text(
                                        "SR",
                                        style: 12.w4(color: AppColors.cFF7954),
                                      )
                                    ],
                                  ),
                                ),
                                15.hGap,
                                Container(
                                  width: 32.w,
                                  height: 32.w,
                                  decoration: BoxDecoration(
                                      color: item
                                          ? AppColors.c10A86A
                                          : AppColors.cB3B3B3,
                                      borderRadius:
                                          BorderRadius.circular(16.w)),
                                  child: IconWidget(
                                      iconWidth: 16.w,
                                      icon: Assets.uiIconRuidgtPng),
                                ),
                                12.hGap
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: controller.dialogListDatas.length,
                    );
                  }),
                ),
              ],
            ),
          );
        });
    controller.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return HorizontalDragBackWidget(
      child: GetBuilder<PlayerDetailController>(
        init: PlayerDetailController(arguments ?? Get.arguments),
        id: PlayerDetailController.idMain,
        builder: (_) {
          return BlackAppWidget(
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      SizedBox(
                        width: 19.w,
                        height: 19.w,
                        child: InkWell(
                          onTap: () {
                            if (controller.arguments.rootNavigator) {
                              Get.back();
                              return;
                            }
                            Get.back(id: controller.arguments.getId);
                          },
                          child: IconWidget(
                            iconWidth: 19.w,
                            iconHeight: 19.w,
                            icon: Assets.iconBackPng,
                            iconColor: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "PLAYER",
                          style: 19.w7(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                11.vGap,
                Stack(
                  children: [
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 130.w,
                          height: 100.w,
                          alignment: Alignment.bottomRight,
                          child: Opacity(
                            opacity: .3,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(32.w)),
                                child: ImageWidget(
                                  url:
                                      Utils.getTeamUrl(controller.teamInfo?.id),
                                  width: 84.w,
                                )),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 29.w, bottom: 12.w),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 13.w),
                              child: ImageWidget(
                                url: Utils.getPlayUrl(
                                    controller.baseInfo?.playerId),
                                width: 84.w,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.teamInfo?.shortEname ?? ""} ",
                                style: TextStyle(
                                  color: AppColors.cB3B3B3,
                                  fontSize: 10.sp,
                                ),
                              ),
                              3.vGap,
                              Text(
                                controller.baseInfo?.ename ?? "",
                                style: TextStyle(
                                  color: AppColors.cF2F2F2,
                                  fontSize: 16.sp,
                                ),
                              ),
                              3.vGap,
                              if (controller.baseInfo != null)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 0.w),
                                  decoration: BoxDecoration(
                                      color: AppColors.cFFFFFF,
                                      borderRadius: BorderRadius.circular(2.w)),
                                  child: Text(
                                      "${controller.baseInfo?.position}",
                                      style: 10.w7(color: AppColors.c262626)),
                                )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            bodyWidget: _buildView(context),
          );
        },
      ),
    );
  }
}
