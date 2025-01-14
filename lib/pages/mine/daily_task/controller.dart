import 'package:arm_chair_quaterback/pages/mine/daily_task/widgets/wheel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DailyTaskController extends GetxController {
  DailyTaskController();

  late WheelController wheelController;

  var scrollController = ScrollController();
  PageController pageController = PageController();
  PageController centerPageController = PageController();
  PageController girlPageController = PageController(initialPage: 1,viewportFraction: 0.75);

  @override
  void onInit() {
    super.onInit();
    wheelController = WheelController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    centerPageController.dispose();
    girlPageController.dispose();
    super.dispose();
  }
}
