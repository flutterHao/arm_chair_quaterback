import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/game_result_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/league/team_detail/widgets/log_tab.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/widgets/player_status/controllr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamHistortyController extends GetxController
    with GetTickerProviderStateMixin {
  TeamHistortyController();

  ///赛后比赛详情
  late GameResultInfoEntity gameResultInfoEntity;
  Rx<LoadDataStatus> loadingStatus = LoadDataStatus.loading.obs;

  var isExpanded = false.obs;
  var expandedTurns = 0.0.obs;

  List<String> tabTitles = ["POINTS", "REBOUNDS", "ASSISTS"];
  late TabController tabController;

  late GameSchedule gameSchedule;
  late List<ScoreBoardDetailList> homePlayers;
  late List<ScoreBoardDetailList> awayPlayers;
  _initData() async {
    gameResultInfoEntity =
        await PicksApi.getGameResultInfo(gameSchedule.gameId);
    homePlayers = gameResultInfoEntity.gameScoreBoardDetail
        .where((element) => element.teamId == gameSchedule.homeTeamId)
        .toList();
    awayPlayers = gameResultInfoEntity.gameScoreBoardDetail
        .where((element) => element.teamId == gameSchedule.awayTeamId)
        .toList();
    loadingStatus.value = LoadDataStatus.success;
  }

  @override
  void onInit() {
    super.onInit();
    gameSchedule = Get.arguments;
    tabController = TabController(length: tabTitles.length, vsync: this);
    _initData();
  }

  List<PlayerStatus> getPlayerStatusData() {
    var list = gameResultInfoEntity.homeTeamResult.teamPlayers;
    List<ScoreBoardDetailList> scoreList =
        gameResultInfoEntity.gameScoreBoardDetail;
    List<PlayerStatus> playerStatusList = list.map((e) {
      var score = scoreList
              .firstWhereOrNull(
                  (f) => f.playerId == e.playerId && f.teamId == e.teamId)
              ?.score ??
          0;
      return PlayerStatus(e.playerId, e.power, e.playerStatus, score, e.teamId,
          Utils.getPlayBaseInfo(e.playerId));
    }).toList();
    playerStatusList.sort((a, b) {
      return b.score.compareTo(a.score);
    });
    // playerStatusList[0].isMvp = resultUpdatedEntity.homeTeamResult.win;
    return playerStatusList;
  }

  /// tab取值范围：["pts","reb","ast"]
  List<HistoryGameLeader> getTwoMaxByTab(String tab) {
    homePlayers.sort((a, b) => b.toJson()[tab]!.compareTo(a.toJson()[tab]));
    awayPlayers.sort((a, b) => b.toJson()[tab]!.compareTo(a.toJson()[tab]));
    List<HistoryGameLeader> concatList;
    concatList = [
      HistoryGameLeader(
          gameSchedule.homeTeamId, homePlayers[0], AppColors.c1F8FE5),
      HistoryGameLeader(
          gameSchedule.awayTeamId, awayPlayers[0], AppColors.cD60D20),
    ];
    return concatList;
  }

  GameResultInfoHomeTeamResult getBattleTeam(int teamId) {
    if (teamId == gameSchedule.homeTeamId) {
      return gameResultInfoEntity.homeTeamResult;
    }
    return gameResultInfoEntity.awayTeamResult;
  }

  /// 获取球员的星级
  int getMvpBreakThroughGrade(int teamId, int playerId) {
    List<GameResultInfoHomeTeamResultTeamPlayers> list = [];
    if (teamId == gameResultInfoEntity.homeTeamResult.teamId) {
      list = gameResultInfoEntity.homeTeamResult.teamPlayers;
    } else {
      list = gameResultInfoEntity.awayTeamResult.teamPlayers;
    }
    var firstWhereOrNull = list.firstWhereOrNull((e) => e.playerId == playerId);
    return max(1, firstWhereOrNull?.breakThroughGrade ?? 1);
  }
}

class HistoryGameLeader {
  final int teamId;
  final ScoreBoardDetailList playerInfo;
  final Color color;

  HistoryGameLeader(this.teamId, this.playerInfo, this.color);
}
