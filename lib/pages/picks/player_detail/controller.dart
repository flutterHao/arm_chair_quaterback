import 'dart:math';

import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PlayerDetailController extends GetxController {
  PlayerDetailController();

  final state = PlayerDetailState();


  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  BarTouchData get barTouchData =>
      BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (BarChartGroupData group,
              int groupIndex,
              BarChartRodData rod,
              int rodIndex,) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: AppColors.c262626,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text("${value.toInt()}", style: 10.w4(color: AppColors.cB3B3B3)),
    );
  }

  FlTitlesData get titlesData =>
      FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35.w,
              getTitlesWidget: (value, titleMate) {
                print('v:---: $value');
                // if (value % 5 != 0) {
                //   return const SizedBox.shrink();
                // }
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${value.toInt()}00K",
                    style: 10.w4(color: AppColors.cB3B3B3),
                  ),
                );
              }),
        ),
      );

  FlGridData get gridData =>
      FlGridData(
        show: true,
        // horizontalInterval: 3,
        checkToShowHorizontalLine: (value) => true,
        getDrawingHorizontalLine: (value) => FlLine(
            color: AppColors.cB3B3B3.withOpacity(.3), strokeWidth: 1.w, dashArray: [3, 3]),
        drawVerticalLine: false,
      );

  FlBorderData get borderData =>
      FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups =>
      List.generate(
          11,
              (index) =>
              BarChartGroupData(
                x: index + 16,
                barRods: [
                  BarChartRodData(
                      fromY: Random().nextInt(5).toDouble(),
                      toY: Random().nextInt(9).toDouble(),
                      borderRadius: BorderRadius.all(Radius.circular(5.w)),
                      width: 10.w,
                      color: index % 2 == 0 ? AppColors.c10A86A : AppColors
                          .cE72646
                    // gradient: _barsGradient,
                  )
                ],
                // showingTooltipIndicators: [0],
              ));
}
