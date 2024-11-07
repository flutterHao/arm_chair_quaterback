import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/10/19/16:44

class GuessItemControllerV2 extends GetxController {
  final PicksPlayerV2 playerV2;

  RxInt currentIndex = RxInt(-1);

  GuessItemControllerV2(this.playerV2);

  var gameStartTimeStr = "".obs;
  Timer? timer;

  guessItemTap(int i) {
    print('guessItemTap----:$i');
    // 0 more 1 less
    if (currentIndex.value == i) {
      currentIndex.value = playerV2.status = -1;
    } else {
      currentIndex.value = playerV2.status = i;
    }
    Get.find<PicksIndexController>().choiceOne(player: playerV2);
  }

  formatGameStartTime() {
    var nowDateMs = MyDateUtils.getNowDateMs();
    var gameStart =
        MyDateUtils.getDateTimeByMs(playerV2.guessInfo.gameStartTime);
    var lastTimeMs = gameStart.millisecondsSinceEpoch - nowDateMs;
    if (lastTimeMs <= 15 * 60 * 1000 && lastTimeMs > 0) {
      //距离比赛开始时间小于15分钟开始倒计时
      timer?.cancel();
      gameStartTimeStr.value = MyDateUtils.formatDate(
          MyDateUtils.getDateTimeByMs(lastTimeMs),
          format: DateFormats.M_S);
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        var nowDateMs = MyDateUtils.getNowDateMs();
        var gameStart =
            MyDateUtils.getDateTimeByMs(playerV2.guessInfo.gameStartTime);
        var lastTimeMs = gameStart.millisecondsSinceEpoch - nowDateMs;
        if (lastTimeMs == 0) {
          t.cancel();
        }
        gameStartTimeStr.value = MyDateUtils.formatDate(
            MyDateUtils.getDateTimeByMs(lastTimeMs),
            format: DateFormats.M_S);
      });
    } else {
      gameStartTimeStr.value =
          MyDateUtils.formatDate(gameStart, format: DateFormats.PARAM_M_D_H);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
