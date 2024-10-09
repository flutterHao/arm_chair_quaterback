import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
///@auther gejiahui
///created at 2024/10/9/14:11

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> with AutomaticKeepAliveClientMixin {

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

  List<BarChartGroupData> get barGroups => [
        makeGroupData(0, 15, 25),
        makeGroupData(1, 55, 88),
        makeGroupData(2, 85, 59),
        makeGroupData(3, 55, 63),
        makeGroupData(4, 87, 115),
        makeGroupData(5, 85, 100),
        makeGroupData(6, 70, 59),
        makeGroupData(7, 85, 59),
        makeGroupData(8, 55, 63),
        makeGroupData(9, 87, 115),
        makeGroupData(10, 85, 100),
      ];

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

  @override
  Widget build(BuildContext context) {
    var lineBarsData = [
      getLineBarsData(
        spots: const [
          FlSpot(0, 0),
          FlSpot(1, 31),
          FlSpot(2, 92),
          FlSpot(3, 114),
          FlSpot(4, 120),
          FlSpot(5, 146),
        ],
        color: AppColors.c3B93FF,
      ),
      getLineBarsData(
        spots: const [
          FlSpot(0, 0),
          FlSpot(1, 42),
          FlSpot(2, 62),
          FlSpot(3, 79),
          FlSpot(4, 100),
          FlSpot(5, 110),
        ],
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
                        lineBarsData[0].spots[5],
                      ),
                    ]),
                    ShowingTooltipIndicators([
                      LineBarSpot(
                        lineBarsData[1],
                        lineBarsData.indexOf(lineBarsData[1]),
                        lineBarsData[1].spots[5],
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

  Widget getBarBottomTitlesWidget(double value, TitleMeta meta) {
    String text = '';
    switch (value.toInt()) {
      case 0:
        text = "REB";
        break;
      case 1:
        text = "FGM";
        break;
      case 2:
        text = "FGA";
        break;
      case 3:
        text = "3PM";
        break;
      case 4:
        text = "3PA";
        break;
      case 5:
        text = "FTM";
        break;
      case 6:
        text = "FTA";
        break;
      case 7:
        text = "AST";
        break;
      default:
        text = "AST";
    }
    return Container(
        margin: EdgeInsets.only(top: 5.h),
        child: Text(text, style: 9.w4(color: AppColors.c8A8A8A)));
  }

  @override
  bool get wantKeepAlive => true;
}
