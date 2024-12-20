import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_event_updated_entity.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/pages/team/team_battle/widgets/battle_v2/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/12/6/16:00

class GameLeaderController extends GetxController
    with GetTickerProviderStateMixin {
  List<String> tabTitles = ["POINTS", "REBOUNGS", "ASSISTS"];
  late TabController tabController;

  GameEvent? event;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabTitles.length, vsync: this);
  }

  setEvent(GameEvent e) {
    event = e;
    update();
  }

  /// tab取值范围：["pts","reb","ast"]
  List<GameLeader> getTwoMaxByTab(String tab) {
    if (event == null) {
      return [];
    }
    var homePlayers = List.from(event!.pkEventUpdatedEntity.homePlayerInfos);
    var awayPlayers = List.from(event!.pkEventUpdatedEntity.awayPlayerInfos);
    homePlayers.sort((a, b) => b.toJson()[tab]!.compareTo(a.toJson()[tab]));
    awayPlayers.sort((a, b) => b.toJson()[tab]!.compareTo(a.toJson()[tab]));
    List<GameLeader> concatList = [
      GameLeader(event!.pkEventUpdatedEntity.homeInfo, homePlayers[0],AppColors.c1F8FE5),
      GameLeader(event!.pkEventUpdatedEntity.awayInfo, awayPlayers[0],AppColors.cD60D20),
    ];
    concatList.sort((a, b) =>
        b.playerInfo.toJson()[tab]!.compareTo(a.playerInfo.toJson()[tab]));
    return concatList;
  }

  BattleTeam getBattleTeam(int teamId) {
    TeamBattleV2Controller teamBattleV2Controller = Get.find();
    if (teamId == teamBattleV2Controller.battleEntity.homeTeam.teamId) {
      return teamBattleV2Controller.battleEntity.homeTeam;
    }
    return teamBattleV2Controller.battleEntity.awayTeam;
  }

  /// 获取球员的星级
  int getMvpBreakThroughGrade(int teamId,int playerId) {
    TeamBattleV2Controller teamBattleV2Controller = Get.find();
    var battleEntity = teamBattleV2Controller.battleEntity;
    List<TeamPlayerList> list = [];
    if(teamId == battleEntity.homeTeam.teamId){
      list = battleEntity.homeTeamPlayerList;
    }else{
      list = battleEntity.awayTeamPlayerList;
    }
    var firstWhereOrNull = list.firstWhereOrNull((e) => e.playerId == playerId);
    return max(1, firstWhereOrNull?.breakThroughGrade ?? 1);
  }
}

class GameLeader {
  final PkEventUpdatedTeamInfo teamInfo;
  final PkEventUpdatedPlayerInfos playerInfo;
  final Color color;

  GameLeader(this.teamInfo, this.playerInfo, this.color);
}
