import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/9/14:11

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic>
    with AutomaticKeepAliveClientMixin {
  late TeamBattleController controller;

  LineChartBarData getLineBarsData(
      {required List<FlSpot> spots, required Color color}) {
    return LineChartBarData(
      isStrokeCapRound: true,
      gradient: LinearGradient(colors: [color, color]),
      spots: spots,
      isCurved: true,
      barWidth: 2,
      color: color,
      belowBarData: BarAreaData(
        show: true,
        // color: belowLineColor,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [color.withOpacity(.5), AppColors.cF2F2F2.withOpacity(.1)]),
        // cutOffY: 0,
        applyCutOffY: false,
      ),
      dotData: FlDotData(
        show: true,
        checkToShowDot: (FlSpot spot, LineChartBarData barData) {
          return spot.x == 5;
        },
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 2,
            color: AppColors.cF2F2F2,
            strokeColor: color,
            strokeWidth: 3,
          );
        },
      ),
    );
  }

  List<BarChartGroupData> get barGroups => getBarData();



  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 1,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: AppColors.c3B93FF,
          width: 4.w,
        ),
        BarChartRodData(
          toY: y2,
          color: AppColors.cFF7954,
          width: 4.w,
        ),
      ],
    );
  }

  List<FlSpot> getSpots(bool left) {
    List<FlSpot> spots = [];
    var scoreBoard = left
        ? controller.battleEntity.gameData.homeScoreBoard
        : controller.battleEntity.gameData.awayScoreBoard;
    spots.add(const FlSpot(0, 0));
    spots.add(FlSpot(1, scoreBoard.quarter1.toDouble()));
    spots.add(FlSpot(2, (scoreBoard.quarter1+scoreBoard.quarter2).toDouble()));
    spots.add(FlSpot(3, (scoreBoard.quarter1+scoreBoard.quarter2+scoreBoard.quarter3).toDouble()));
    spots.add(FlSpot(4, (scoreBoard.quarter1+scoreBoard.quarter2+scoreBoard.quarter3+scoreBoard.quarter4).toDouble()));
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.find();
    var lineBarsData = [
      getLineBarsData(
        spots: getSpots(true),
        color: AppColors.c3B93FF,
      ),
      getLineBarsData(
        spots: getSpots(false),
        color: AppColors.cFF7954,
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 174.h,
            padding:
                EdgeInsets.only(left: 8.w, right: 16.w, bottom: 8.h, top: 8.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.circular(16.w)),
            child: Center(
              child: LineChart(LineChartData(
                  maxY: 200,
                  showingTooltipIndicators: [
                    ShowingTooltipIndicators([
                      LineBarSpot(
                        lineBarsData[0],
                        lineBarsData.indexOf(lineBarsData[0]),
                        lineBarsData[0].spots[4],
                      ),
                    ]),
                    ShowingTooltipIndicators([
                      LineBarSpot(
                        lineBarsData[1],
                        lineBarsData.indexOf(lineBarsData[1]),
                        lineBarsData[1].spots[4],
                      ),
                    ])
                  ],
                  lineTouchData: LineTouchData(
                    enabled: false,
                    handleBuiltInTouches: false,
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (LineBarSpot touchedSpot) {
                        return touchedSpot.bar.color!;
                      },
                      tooltipRoundedRadius: 15.h,
                      // fitInsideVertically: true,
                      // fitInsideHorizontally: true,
                      tooltipMargin: -9.h,
                      tooltipHorizontalOffset: -40.w,
                      tooltipPadding:
                          EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
                      getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                        return lineBarsSpot.map((lineBarSpot) {
                          return LineTooltipItem(
                            "PTS ${lineBarSpot.y.toStringAsFixed(0)}",
                            11.w7(color: AppColors.cFFFFFF, height: 1),
                          );
                        }).toList();
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          interval: 30,
                          getTitlesWidget: getLineLeftTitlesWidget),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: getLineBottomTitlesWidget),
                    ),
                  ),
                  backgroundColor: AppColors.cF2F2F2,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 50,
                    verticalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(
                        color: AppColors.cEBEBEB,
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return const FlLine(
                        color: AppColors.cEBEBEB,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        left: BorderSide(color: AppColors.cEBEBEB, width: 1),
                        bottom: BorderSide(color: AppColors.cEBEBEB, width: 1),
                      )),
                  lineBarsData: lineBarsData)),
            ),
          ),
          9.vGap,
          Container(
            height: 174.h,
            // width: 325.w,
            padding:
                EdgeInsets.only(left: 8.w, right: 16.w, bottom: 8.h, top: 8.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                color: AppColors.cF2F2F2,
                borderRadius: BorderRadius.circular(16.w)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 500.w,
                height: 174.h,
                child: BarChart(BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (BarChartGroupData group) {
                        return Colors.transparent;
                      },
                      tooltipRoundedRadius: 10.h,
                      // fitInsideVertically: true,
                      // fitInsideHorizontally: true,
                      tooltipMargin: -9.h,
                      // tooltipPadding:
                      // EdgeInsets.symmetric(horizontal: 9.w, vertical: 1.h),
                      getTooltipItem: (
                        BarChartGroupData group,
                        int groupIndex,
                        BarChartRodData rod,
                        int rodIndex,
                      ) {
                        return BarTooltipItem(
                          rod.toY.toStringAsFixed(0),
                          11.w7(color: rod.color!, height: 1),
                        );
                      },
                    ),
                  ),
                  barGroups: barGroups,
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          interval: 30,
                          getTitlesWidget: getBarLeftTitlesWidget),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: getBarBottomTitlesWidget),
                    ),
                  ),
                  backgroundColor: AppColors.cF2F2F2,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 30,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(
                        color: AppColors.cEBEBEB,
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return const FlLine(
                        color: AppColors.cEBEBEB,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  maxY: 130,
                  borderData: FlBorderData(
                      show: true,
                      border: const Border(
                        // left: BorderSide(color: AppColors.cEBEBEB, width: 1),
                        bottom: BorderSide(color: AppColors.cEBEBEB, width: 1),
                      )),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getLineLeftTitlesWidget(double value, TitleMeta meta) {
    var text = value.toStringAsFixed(0);
    if (value == 200) {
      text = "";
    }
    return Container(
        width: 20.w,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 4.w),
        child: Text(text, style: 9.w4(color: AppColors.c8A8A8A)));
  }

  Widget getLineBottomTitlesWidget(double value, TitleMeta meta) {
    String text = '';
    switch (value.toInt()) {
      case 1:
        text = "1ST";
        break;
      case 2:
        text = "2ND";
        break;
      case 3:
        text = "3RD";
        break;
      case 4:
        text = "4TH";
        break;
    }
    return Container(
        margin: EdgeInsets.only(top: 5.h),
        child: Text(text, style: 9.w4(color: AppColors.c8A8A8A)));
  }

  Widget getBarLeftTitlesWidget(double value, TitleMeta meta) {
    var text = value.toStringAsFixed(0);
    if (value == 130) {
      text = "";
    }
    return Container(
        width: 20.w,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 4.w),
        child: Text(text, style: 9.w4(color: AppColors.c8A8A8A)));
  }
  List<String> keys = ['fga','ast','reb','fgm','fta','ftm','blk','stl','pts','threePa','pf','threePm','to'];

  List<BarChartGroupData> getBarData(){
    List<BarChartGroupData> res = [];
    var homeScoreBoardDetails = controller.battleEntity.gameData.homeScoreBoardDetails;
    var awayScoreBoardDetails = controller.battleEntity.gameData.awayScoreBoardDetails;
    for (int i = 0; i < keys.length; i++) {
      String key = keys[i];
      var homeValue = homeScoreBoardDetails.fold(0.0, (p,e){
        p = p + (e.toJson()[key]??0);
        return p;
      });
      var awayValue = awayScoreBoardDetails.fold(0.0, (p,e){
        p = p + (e.toJson()[key]??0);
        return p;
      });
      var gd = makeGroupData(i, homeValue.toDouble(), awayValue.toDouble());
      print('$i:$gd');
      res.add(gd);
    }
    return res;
  }

  Widget getBarBottomTitlesWidget(double value, TitleMeta meta) {
    String text = '';
    text = keys[value.toInt()];
    if(text.contains("three")){
      text = text.replaceAll("three", "3");
    }
    text = text.toUpperCase();
    return Container(
        margin: EdgeInsets.only(top: 5.h),
        child: Text(text, style: 9.w4(color: AppColors.c8A8A8A)));
  }

  @override
  bool get wantKeepAlive => true;
}
