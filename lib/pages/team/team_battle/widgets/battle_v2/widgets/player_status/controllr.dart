import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/16/10:32

class PlayerStatusController extends GetxController {
  PlayerStatusController(this.teamBattleV2Controller);

  final TeamBattleV2Controller teamBattleV2Controller;

  var isExpanded = false.obs;
  var expandedTurns = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  List<PlayerStatus> getData() {
    var resultUpdatedEntity = teamBattleV2Controller.pkResultUpdatedEntity;
    if (resultUpdatedEntity == null) {
      return [];
    }
    var mvpPlayer =
        resultUpdatedEntity.playerResults.firstWhere((e) => e.type == 1);
    var list = [
      ...resultUpdatedEntity.homeTeamResult.teamPlayers,
      // ...resultUpdatedEntity.awayTeamResult.teamPlayers
    ];
    var scoreList = [
      ...resultUpdatedEntity.homeTeamResult.scoreBoardDetailList,
      // ...resultUpdatedEntity.awayTeamResult.scoreBoardDetailList
    ];
    var playerStatusList = list.map((e) {
      var score = scoreList
              .firstWhereOrNull(
                  (f) => f.playerId == e.playerId && f.teamId == e.teamId)
              ?.score ??
          0;
      return PlayerStatus(
          e.playerId,
          e.playerId == mvpPlayer.playerId && e.teamId == mvpPlayer.teamId,
          e.power / 120 * 100,
          e.playerStatus,
          score,
          e.teamId,
          Utils.getPlayBaseInfo(e.playerId));
    }).toList();
    playerStatusList.sort((a, b) {
      return b.score.compareTo(a.score);
    });
    return playerStatusList;
  }
}

class PlayerStatus {
  final int playerId;
  final bool isMvp;
  final double morale;
  final int status;
  final double score;
  final int teamId;
  final NbaPlayerInfosPlayerBaseInfoList playerInfo;

  PlayerStatus(this.playerId, this.isMvp, this.morale, this.status, this.score,
      this.teamId, this.playerInfo);
}
