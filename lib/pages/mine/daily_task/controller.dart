import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/wheel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class DailyTaskController extends GetxController {
  DailyTaskController();

  late WheelController wheelController;

  var scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    wheelController = WheelController();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
