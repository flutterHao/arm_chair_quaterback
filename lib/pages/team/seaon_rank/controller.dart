import 'dart:async';

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

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    timeCountDown();
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
}
