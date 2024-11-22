import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LeagueDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  LeagueDetailController(this.item);
  final ScoresEntity item;
  List<String> tabTitles = ["PICKS","PLAY","SCORES"];
  late TabController tabController;

  Timer? timer;
  var gameStartTimeStr = "".obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabTitles.length, vsync: this,initialIndex: 1);
    _buildGameStartTimeWidget();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }


  _buildGameStartTimeWidget() {
    if (item.status != 1) {
      var nowDateMs = MyDateUtils.getNowDateMs();
      var gameStart = MyDateUtils.getDateTimeByMs(item.gameStartTime);
      var lastTimeMs = gameStart.millisecondsSinceEpoch - nowDateMs;
      if (lastTimeMs <= 15 * 60 * 1000 && lastTimeMs > 0) {
        //距离比赛开始时间小于15分钟开始倒计时
        timer?.cancel();
        gameStartTimeStr.value =
        "Coming ${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(lastTimeMs), format: DateFormats.M_S)}";
        timer = Timer.periodic(const Duration(seconds: 1), (t) {
          var nowDateMs = MyDateUtils.getNowDateMs();
          var gameStart = MyDateUtils.getDateTimeByMs(item.gameStartTime);
          var lastTimeMs = gameStart.millisecondsSinceEpoch - nowDateMs;
          if (lastTimeMs == 0) {
            t.cancel();
            gameStartTimeStr.value =
            "Today ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
          }
          gameStartTimeStr.value =
          "Coming ${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(lastTimeMs), format: DateFormats.M_S)}";
        });
      } else if (MyDateUtils.isToday(item.gameStartTime)) {
        gameStartTimeStr.value =
        "Today ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
      } else if (MyDateUtils.isTomorrow(item.gameStartTime)) {
        gameStartTimeStr.value =
        "Tomorrow ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
      } else {
        gameStartTimeStr.value =
        "${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(item.gameStartTime), format: DateFormats.PARAM_M_D)} ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
      }
    } else {
      gameStartTimeStr.value =
      "In the game ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(item.gameStartTime))}";
    }
  }

  bool get isGameStart => item.gameStartTime<DateTime.now().millisecondsSinceEpoch;
}
