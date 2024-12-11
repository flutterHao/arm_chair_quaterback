import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/10/15:14

class GameOverController extends GetxController {
  var startObs = false.obs;
  var giftObs = false.obs;
  var opacityObs = false.obs;
  var mvpObs = false.obs;
  var onMvpAnimationEndObs = false.obs;

  @override
  void onReady() {
    super.onReady();
    startObs.value = true;
  }

  PkResultUpdatedPlayerResults? getMvpInfo() {
    var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
    return teamBattleV2Controller.pkResultUpdatedEntity?.playerResults
        .firstWhereOrNull((e) => e.type == 1);
  }

  bool isLeftWin() {
    var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
    var win = teamBattleV2Controller.pkResultUpdatedEntity?.homeTeamResult.win;
    return win == true;
  }

  PkResultUpdatedTeamResult? getWinnerInfo() {
    var teamBattleV2Controller = Get.find<TeamBattleV2Controller>();
    return isLeftWin()
        ? teamBattleV2Controller.pkResultUpdatedEntity?.homeTeamResult
        : teamBattleV2Controller.pkResultUpdatedEntity?.awayTeamResult;
  }
}
