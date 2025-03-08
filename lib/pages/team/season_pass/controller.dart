import 'dart:ui';

import 'package:arm_chair_quaterback/common/entities/battle_pass_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/battle_pass.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
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

  /// 使用队伍id 获取队伍的颜色
  Color getTeamColor(int teamId) {
    if (CacheApi.teamDefineMap != null) {
      String colorStr = "0xFF${CacheApi.teamDefineMap![teamId]!.teamColors}";
      int? color = int.tryParse(colorStr);
      if (color != null) {
        return Color(color);
      }
    }
    return AppColors.c404040;
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
