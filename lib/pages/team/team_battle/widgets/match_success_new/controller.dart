import 'dart:ui';

import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/widgets/easy_animation_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/19/20:04

class MatchSuccessNewController extends GetxController
    with GetSingleTickerProviderStateMixin {
  MatchSuccessNewController(this.onEnd);

  final Function? onEnd;
  late PageController pageController = PageController();

  late EasyAnimationController<double> moneyFlyAnimationController;

  var moneyCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    moneyFlyAnimationController = EasyAnimationController(
        vsync: this,
        begin: 0,
        end: 1.0,
        // begin: Offset(42.w, 111.h),
        // end: Offset(128.w, 196.h),
        duration: Duration(milliseconds: 1000));
    moneyFlyAnimationController.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        moneyCount.value = getCostMoney() * 2;
        Future.delayed(Duration(milliseconds: 2000), () {
          onEnd?.call();
        });
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(milliseconds: 1000), () {
      pageController
          .animateToPage(1,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut)
          .then((_) {
        Future.delayed(Duration(milliseconds: 200), () {
          moneyFlyAnimationController.forward();
        });
      });
    });
  }

  Offset mathFlyOffset(Offset start, Offset end, double t) {
    var dx = start.dx + (end.dx - start.dx) * t;
    var dy = start.dy + (end.dy - start.dy) * t;
    return Offset(dx, dy);
  }

  getCostMoney() {
    var cupRankId =
        Get.find<TeamBattleController>().battleEntity.homeTeamCup.cupRankId;
    var firstWhereOrNull =
        CacheApi.cupDefineList.firstWhereOrNull((e) => e.cupNumId == cupRankId);
    return firstWhereOrNull?.cupInBattleMoney ?? 0;
  }

  @override
  void onClose() {
    moneyFlyAnimationController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
