import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/assets.dart';
import 'package:get/get.dart';

class TeamBattleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamBattleController();

  /// step :
  ///   0 初始状态
  ///   1 扫描
  ///   2 匹配成功
  ///   3 队伍百分比数据
  ///   4 各位置球员 & 突发新闻
  ///   5 比赛开始倒计时
  ///   6 战斗
  ///   7 结算
  ///
  var step = 0.obs;

  _initData() {
    update(["team_battle"]);
  }

  void onTap() {}

  List<String> totalAvatars = [
    Assets.uiHead_01Png,
    Assets.uiHead_02Png,
    Assets.uiHead_03Png,
    Assets.uiHead_04Png,
    Assets.uiHead_05Png,
    Assets.uiHead_06Png,
    Assets.uiHead_07Png,
    Assets.uiHead_08Png,
    Assets.uiHead_09Png,
    Assets.uiHead_10Png,
    Assets.uiHead_11Png,
    Assets.uiHead_12Png,
  ];

  late String meAvatar;
  late String opponentAvatar;

  @override
  void onInit() {
    super.onInit();
    step.value = 1;
    meAvatar = totalAvatars[Random().nextInt(totalAvatars.length-1)];
    totalAvatars.remove(meAvatar);
    opponentAvatar = totalAvatars[Random().nextInt(totalAvatars.length-1)];
    ///todo 模拟匹配的网络请求
    Future.delayed(const Duration(seconds: 3), () {
      nextStep();
    });
  }

  void nextStep() {
    print('nextStep-------');
    step.value = step.value + 1;
  }

}
