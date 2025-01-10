/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-09 15:57:09
 * @LastEditTime: 2025-01-10 16:22:05
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/team/team_upgrade/controller.dart';
import 'package:get/get.dart';

class IllustratiionsController extends GetxController {
  IllustratiionsController();

  _initData() {
    update(["illustratiions"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  List<UpgradeOffensive> getOffensive(int playerId) {
    var playBaseInfo = Utils.getPlayBaseInfo(playerId);
    List<UpgradeOffensive> data = [
      UpgradeOffensive("LAYUP", playBaseInfo.layupWeight),
      UpgradeOffensive("MID-RANGE", playBaseInfo.perimeterShotWeight),
      UpgradeOffensive("3-POINT", playBaseInfo.threePointWeight),
    ];
    return data;
  }

  List<UpgradeAdditional> getAdditional() {
    Random randow = Random();
    List<UpgradeAdditional> data = [
      UpgradeAdditional("Layup", randow.nextInt(10) * 1000 + 500),
      UpgradeAdditional("Three shot", randow.nextInt(10) * 1000 + 500),
      UpgradeAdditional("Midline defense", randow.nextInt(10) * 1000 + 500),
      UpgradeAdditional("Jump shot", randow.nextInt(10) * 1000 + 500),
      UpgradeAdditional("Inside defense", randow.nextInt(10) * 1000 + 500),
      UpgradeAdditional("Outside defense", randow.nextInt(10) * 1000 + 500),
    ];
    return data;
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
