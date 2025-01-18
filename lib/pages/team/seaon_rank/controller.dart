import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/cup_define_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/match_level_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/season_rank_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/seaon_rank/dialog/season_reward_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeaonRankController extends GetxController {
  SeaonRankController();
  Timer? _timer;
  var gameStartTimeMs =
      DateTime.now().add(const Duration(days: 3)).millisecondsSinceEpoch;
  RxInt gameStartTimesCountDown = 0.obs;

  int day = 0;
  int hh = 0;
  int minute = 0;
  int second = 0;

  final PageController seaDialogPageController = PageController();
  RxInt pageviewIndex = 0.obs;
  RxList<CupDefineEntity> cupDefineList = RxList<CupDefineEntity>();
  RxList<List> seasonRankList = [
    [
      'assets/images/team/season_rank/1.png',
    ],
    [
      'assets/images/team/season_rank/2.png',
    ],
    [
      'assets/images/team/season_rank/3.png',
    ]
  ].obs;

  @override
  void onInit() {
    super.onInit();

    timeCountDown();
    initData();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future initData() async {
    cupDefineList.value = await CacheApi.getCupDefine();
  }

  void timeCountDown() {
    _timer?.cancel();
    var nowMs = DateTime.now().millisecondsSinceEpoch;
    var diff = gameStartTimeMs - nowMs;

    if (diff <= 0) {
      return;
    }
    gameStartTimesCountDown.value = diff;
    day = gameStartTimesCountDown.value ~/ 1000 ~/ 86400;
    hh = gameStartTimesCountDown.value ~/ 1000 % 86400 ~/ 3600;
    minute = gameStartTimesCountDown.value ~/ 1000 % 3600 ~/ 60;
    second = gameStartTimesCountDown.value ~/ 1000 % 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      var temp = gameStartTimesCountDown.value - 1000;
      if (temp <= 0) {
        t.cancel();
      } else {
        gameStartTimesCountDown.value = temp;
        day = gameStartTimesCountDown.value ~/ 1000 ~/ 86400;
        hh = gameStartTimesCountDown.value ~/ 1000 % 86400 ~/ 3600;
        minute = gameStartTimesCountDown.value ~/ 1000 % 3600 ~/ 60;
        second = gameStartTimesCountDown.value ~/ 1000 % 60;
      }
    });
  }

  /// 格式化为两位数
  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  /// 格式化为Kd单位
  String formatToK(num value) {
    if (value >= 1000) {
      // Divide by 1000 and round to one decimal place, then directly return the string.
      return '${(value / 1000).toStringAsFixed(0)}k';
    } else {
      // If the value is less than 1000, return it as a string without 'k'.
      return value.toString();
    }
  }

  void goSeasonRankDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        // barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const SeasonRankDialog();
        });
  }

  void goSeasonRewardDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        // barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const SeasonRewardDialog();
        });
  }

  void goMatchLevelDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        // barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const MatchLevelDialog();
        });
  }
}
