import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/game_result_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_already_start/controller.dart';
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

  RxBool startObs = false.obs;
  var leftCup = RxInt(0);
  var rightCup = RxInt(0);
  var opacityObs = false.obs;
  var moneyOpacityObs = false.obs;
  var giftObs = false.obs;
  var giftScaleObs = false.obs;
  var moneyIncomeObs = false.obs;
  var moneyAnimationEnd = false.obs;
  var mvpObs = false.obs;
  var leftCupNum = -1;
  var rightCupNum = -1;
  @override
  void onInit() {
    super.onInit();
    gameSchedule = Get.arguments;
    tabController = TabController(length: tabTitles.length, vsync: this);
    _initData();
  }

  Future _initData() async {
    gameResultInfoEntity =
        await PicksApi.getGameResultInfo(gameSchedule.gameId);
    homePlayers = gameResultInfoEntity.gameScoreBoardDetail
        .where((element) => element.teamId == gameSchedule.homeTeamId)
        .toList();
    awayPlayers = gameResultInfoEntity.gameScoreBoardDetail
        .where((element) => element.teamId == gameSchedule.awayTeamId)
        .toList();
    loadingStatus.value = LoadDataStatus.success;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startObs.value = true;
    });
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
      return PlayerStatus(e.playerId, e.power.toDouble(), e.playerStatus, score,
          e.teamId, Utils.getPlayBaseInfo(e.playerId));
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
    List<TeamPlayerInfoEntity> list = [];
    if (teamId == gameResultInfoEntity.homeTeamResult.teamId) {
      list = gameResultInfoEntity.homeTeamResult.teamPlayers;
    } else {
      list = gameResultInfoEntity.awayTeamResult.teamPlayers;
    }
    var firstWhereOrNull = list.firstWhereOrNull((e) => e.playerId == playerId);
    return max(1, firstWhereOrNull?.breakThroughGrade ?? 1);
  }

  List<TeamStats> getTeamStatsData() {
    List<TeamStats> list = [];
    ScoreBoardDetailList homeDetail = gameResultInfoEntity.gameScoreBoardDetail
        .firstWhere((element) => element.teamId == gameSchedule.homeTeamId);
    ScoreBoardDetailList awayDetail = gameResultInfoEntity.gameScoreBoardDetail
        .firstWhere((element) => element.teamId == gameSchedule.awayTeamId);
    list.add(TeamStats("Points", homeDetail.pts, awayDetail.pts));
    list.add(TeamStats("Rebound", homeDetail.reb, awayDetail.reb));
    list.add(TeamStats("Assist", homeDetail.ast, awayDetail.ast));
    list.add(TeamStats("Steals", homeDetail.stl, awayDetail.stl));
    list.add(TeamStats("Block Shot ", homeDetail.blk, awayDetail.blk));
    list.add(TeamStats("Free Throw Make", homeDetail.fta, awayDetail.ftm));
    list.add(
        TeamStats("3 Points Make", homeDetail.threePm, awayDetail.threePm));
    list.add(TeamStats("Turn over", homeDetail.to, awayDetail.to));
    list.add(TeamStats("Foul", homeDetail.pf, awayDetail.pf));
    list.add(TeamStats(
        "3 Point %",
        ((homeDetail.threePm) / (homeDetail.threePa))
            .handlerNaNInfinity()
            .format(),
        ((awayDetail.threePm) / (awayDetail.threePa))
            .handlerNaNInfinity()
            .format(),
        valueIsPercent: true));
    list.add(TeamStats(
        "Field Goal %",
        ((homeDetail.fgm) / (homeDetail.fga)).handlerNaNInfinity().format(),
        ((awayDetail.fgm) / (awayDetail.fga)).handlerNaNInfinity().format(),
        valueIsPercent: true));
    list.add(TeamStats(
        "Free Throw %",
        ((homeDetail.ftm) / (homeDetail.fta)).handlerNaNInfinity().format(),
        ((awayDetail.ftm) / (awayDetail.fta)).handlerNaNInfinity().format(),
        valueIsPercent: true));
    return list;
  }

  bool isFull() {
    return gameResultInfoEntity.homeTeamResult.cardBoxIsFull;
  }

  int getCardBoxId() => gameResultInfoEntity.homeTeamResult.cardBoxId;
  int getMoneyCount() {
    return gameResultInfoEntity.homeTeamResult.dropAwardData
            .firstWhereOrNull((e) => e.id == 102)
            ?.num ??
        0;
  }

  void initCup() {
    ///输掉的奖杯数表里读取CupDefine
    var loseCup = 2;
    leftCupNum = gameResultInfoEntity.homeTeamResult.cupDiff != 0
        ? gameResultInfoEntity.homeTeamResult.cupDiff
        : 2;
    leftCup.value = leftCupNum > 0 ? 1 : 0;
    rightCupNum = gameResultInfoEntity.awayTeamResult.cupDiff != 0
        ? gameResultInfoEntity.awayTeamResult.cupDiff
        : 2;
    rightCup.value = rightCupNum > 0 ? 1 : 0;

    Timer.periodic(const Duration(milliseconds: 100), (t) {
      if (leftCup.value == leftCupNum && rightCup.value == rightCupNum) {
        t.cancel();
        Future.delayed(const Duration(milliseconds: 500), () {
          giftScaleObs.value = true;
        });
        return;
      }
      if (leftCup.value != leftCupNum) {
        leftCup.value = leftCup.value + 1;
      }
      if (rightCup.value != rightCupNum) {
        rightCup.value = rightCup.value + 1;
      }
    });
    print('leftCupNum:$leftCupNum,,,,$rightCupNum');
  }

  bool isLeftWin() {
    var win = gameResultInfoEntity.homeTeamResult.win;
    return win == true;
  }
}

class HistoryGameLeader {
  final int teamId;
  final ScoreBoardDetailList playerInfo;
  final Color color;

  HistoryGameLeader(this.teamId, this.playerInfo, this.color);
}
