import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_history/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/31/17:40

class GuessHistoryItemController extends GetxController
    with WidgetsBindingObserver {
  GuessHistoryItemController(this.guessInfo);

  final ReciveAwardV2GuessInfo guessInfo;
  GlobalKey globalKey = GlobalKey();

  late PicksDefineEntity picksDefineEntity;

  Timer? timer;

  var openTime = "".obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    picksDefineEntity = CacheApi.pickDefine!;
    if (guessInfo.status == 1) {
      startCountDown();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      startCountDown();
    }
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void startCountDown() {
    timer?.cancel();
    int ms = getLastTime();
    var dateTimeByMs = MyDateUtils.getDateTimeByMs(ms);
    var formatDate =
        MyDateUtils.formatDate(dateTimeByMs, format: DateFormats.H_M_S);
    openTime.value = formatDate;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      int ms = getLastTime();
      var dateTimeByMs = MyDateUtils.getDateTimeByMs(ms);
      var formatDate =
          MyDateUtils.formatDate(dateTimeByMs, format: DateFormats.H_M_S);
      if (ms <= 0) {
        /// 倒计时结算刷新数据
        Get.find<PicksHistoryController>().initData();
        t.cancel();
      }

      openTime.value = formatDate;
    });
  }

  /// 获取开奖剩余时间，第二天的零点开奖
  int getLastTime() {
    var nextDay = MyDateUtils.nextDay(MyDateUtils.getNowDateTime());
    var nextDayStartTimeMS = MyDateUtils.getDayStartTimeMS(nextDay);
    var ms = nextDayStartTimeMS - MyDateUtils.getNowDateMs();
    return ms;
  }

  /// 获取竞猜模式
  String getTypeString() {
    return guessInfo.type == 1
        ? "Flex"
        : guessInfo.type == 2
            ? "Power"
            : "";
  }

  /// 获取总赔率
  double getBetCount() {
    List<double> bets = guessInfo.type == 1
        ? CacheApi.pickDefine!.toJson()["flexBet${guessInfo.guessData.length}"]
        : guessInfo.type == 2
            ? CacheApi.pickDefine!.powerBetWin
            : [];
    if (guessInfo.status == 1) {
      // 未开奖
      if (guessInfo.type == 1) {
        return bets.last;
      } else {
        var index = guessInfo.guessData.length - 1;
        return bets[index];
      }
    } else {
      // 已开奖
      if (guessInfo.type == 1) {
        //flex
        var winCount = getWinCount();
        List<double> betList =
            List.generate(guessInfo.guessData.length, (_) => 0);
        for (int i = 0; i < betList.length; i++) {
          betList[i] = i < bets.length ? bets[i] : 0;
        }
        betList = betList.reversed.toList();
        return betList[winCount];
      } else {
        //power
        var index = guessInfo.guessData.length - 1;
        return bets[index];
      }
    }
    return 0;
  }

  /// 获取flex赢的场数
  int getWinCount() {
    return guessInfo.guessData.where((e) => e.success).toList().length;
  }

  /// 获取赢的筹码数量
  double getWinCoin() {
    return getBetCount() * double.parse(picksDefineEntity.betCost);
  }

  /// 0 未开始 1 进行中 2 已结束
  /// 超过比赛开始时间三小时就算结束
  int getGameStatus(int gameStartMilliseconds) {
    var nowMs = DateTime.now().millisecondsSinceEpoch;
    if (gameStartMilliseconds > nowMs) {
      return 0;
    } else if ((gameStartMilliseconds + (3 * 60 * 60 * 1000)) < nowMs) {
      return 1;
    } else {
      return 2;
    }
  }

  String formatGameStartTime(int gameStartMilliseconds) {
    bool isFinal = false;
    if (getGameStatus(gameStartMilliseconds) == 2) {
      isFinal = true;
    }
    return "${MyDateUtils.formatDateMilliseconds(gameStartMilliseconds, format: DateFormats.PARAM_Y_M_D)} ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(gameStartMilliseconds))}   ${isFinal ? "FINAL" : ""}";
  }
}
