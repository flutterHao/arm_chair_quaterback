import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/10/15:14

class GameOverController extends GetxController {
  var startObs = false.obs;
  var cup = RxInt(-1);
  var giftScaleObs = false.obs;
  var giftObs = false.obs;
  var opacityObs = false.obs;
  var moneyOpacityObs = false.obs;
  var moneyIncomeObs = false.obs;
  var mvpObs = false.obs;
  var onMvpAnimationEndObs = false.obs;

  var cupNum = 0;

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

  void initCup() {
    var beforeCup = Get.find<TeamBattleController>().teamInfoEntity.cup;
    var currentCup = Get.find<TeamBattleV2Controller>()
            .pkResultUpdatedEntity
            ?.homeTeamResult
            .cup ??
        0;
    var result = (currentCup - beforeCup).abs();
    if (result > 0) {
      cupNum = result;
      cup.value = 1;
    } else {
      giftScaleObs.value = true;
    }
  }

  bool isFull() {
    return Get.find<TeamBattleV2Controller>()
            .pkResultUpdatedEntity
            ?.homeTeamResult
            .cardBoxIsFull ??
        false;
  }

  int getMoneyCount() {
    return Get.find<TeamBattleV2Controller>()
            .pkResultUpdatedEntity
            ?.homeTeamResult
            .dropAwardData
            .firstWhereOrNull((e) => e.id == 102)
            ?.num ??
        0;
  }
}
