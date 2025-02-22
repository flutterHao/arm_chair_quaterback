import 'dart:async';

import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/20/11:52

class WeekPrizeController extends GetxController {
  Timer? timer;
  var lastDuration = Duration.zero.obs;

  @override
  void onInit() {
    super.onInit();
    lastDuration.value = getRemainingTimeToSundayMidnight();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      lastDuration.value = lastDuration.value - const Duration(seconds: 1);
      if (lastDuration.value <= Duration.zero) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Duration getRemainingTimeToSundayMidnight() {
    // 获取当前日期和时间
    DateTime now = DateTime.now().subtract(Utils.getTimeZoneOffset());

    // 计算本周日的日期
    int daysUntilSunday = DateTime.sunday - now.weekday;
    if (daysUntilSunday < 0) {
      daysUntilSunday += 7; // 如果今天是周日，则目标时间为当天的23:59:59.999
    }
    DateTime nextSunday = now.add(Duration(days: daysUntilSunday));

    // 设置目标时间为本周日的23:59:59.999
    DateTime targetTime = DateTime(
      nextSunday.year,
      nextSunday.month,
      nextSunday.day,
      23,
      59,
      59,
      999,
    );

    // 计算当前时间与目标时间之间的差值
    Duration difference = targetTime.difference(now);

    return difference;
  }

  // 格式化剩余时间
  String formatDuration(Duration difference) {
    var hour = difference.inHours % 24;
    var minute = difference.inMinutes % 60;
    var seconds = difference.inSeconds % 60;
    String remainingTime =
        '${difference.inDays}D ${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}';

    return remainingTime;
  }
}
