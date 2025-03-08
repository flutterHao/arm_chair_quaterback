import 'package:arm_chair_quaterback/common/entities/battle_pass_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/battle_pass.dart';
import 'package:get/get.dart';

class SeasonPassController extends GetxController {
  SeasonPassController();
  BattlePassInfoEntity battlePassInfo = BattlePassInfoEntity();
  initData() async {
    battlePassInfo = await BattlePassApi.getBattlePassInfo();
  }

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
