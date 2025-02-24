import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/2/24/11:15

class RewardDialogController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  var start = true.obs;

  var bottomShow = true.obs;

  var showMoney = false.obs;
  var showGift = false.obs;

  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween(begin: 1.0, end: 0.0).animate(animationController);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showMoney.value = true;
      }
    });
    animationController.forward();
  }

  getRewardMoney() {
    var cupRankId =
        Get.find<TeamBattleController>().battleEntity.homeTeamCup.cupRankId;
    var firstWhereOrNull =
        CacheApi.cupDefineList.firstWhereOrNull((e) => e.cupNumId == cupRankId);
    return (firstWhereOrNull?.cupInBattleMoney ?? 0) * 2;
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  onMoneyAnimationEnd() {
    showGift.value = true;
    Future.delayed(Duration(milliseconds: 1000),(){
      bottomShow.value = false;
    });
  }
}
