import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/player_day_data_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/9/21/10:42

class GuessItemController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GuessItemController(this.player);

  final PicksPlayer player;

  Map<String, Map<String, dynamic>> barGroups = {};
  late TabController tabController;

  FlTitlesData get titlesData => const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: player.betData.length, vsync: this);
    PicksApi.getRecentAvg(player.guessInfo.playerId).then((result) {
      List<PlayerDayDataEntity> fiveDayData = result;
      for (var i = 0; i < player.betData.length; i++) {
        String key = player.betData[i];
        double l5Avg = player.guessInfo.l5Avg
                .toJson()[ParamUtils.getProKey(key.toLowerCase())] ??
            0.0;
        double minValue = l5Avg <= 0 ? 1 : l5Avg / 2;
        double maxValue = l5Avg <= 0 ? 3 : l5Avg * 2;
        double maxY = maxValue;
        List<BarChartGroupData> barDatas = [];
        for (PlayerDayDataEntity p in fiveDayData) {
          double v = p.toJson()[
                  ParamUtils.getProKey(key.toLowerCase()).toLowerCase()] ??
              0.0;
          double toY = v < minValue ? minValue : v;
          maxY = max(toY, maxY);
          var chartGroupData = BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                  toY: toY,
                  width: 6.w,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(2)),
                  color: v > l5Avg
                      ? AppColors.cFF7954
                      : AppColors.c000000.withOpacity(.5))
            ],
          );
          barDatas.add(chartGroupData);
        }
        Map<String, dynamic> item = {"maxY": maxY, "list": barDatas};
        barGroups[key] = item;
      }
      update();
    });
  }

  static String get barchartData => "barChart";

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
