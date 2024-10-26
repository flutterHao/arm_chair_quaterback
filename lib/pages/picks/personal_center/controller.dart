import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_rule_config_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/enums/rank_type.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/net/apis/team_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/entities/team_player_list_entity.dart';

class TeamInfo {
  final TeamPlayerInfoEntity teamPlayerEntity;
  final NbaPlayerInfosPlayerBaseInfoList baseInfo;

  TeamInfo(this.teamPlayerEntity, this.baseInfo);
}

class PersonalCenterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PersonalCenterController({this.teamId});

  final int? teamId;

  List<String> titles = [
    "Game",
    "Picks", /*"Comments"*/
  ];

  late TabController tabController;

  TeamSimpleEntity? teamSimpleEntity;
  var loadStatus = LoadDataStatus.loading.obs;
  TeamInfoEntity? teamInfoEntity;
  String? nextLevelTotalExp = "0";
  String? salaryCap = "0";

  List<TeamInfo> teamPlayers = [];

  int rank = 0;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController =
        TabController(length: titles.length, vsync: this, initialIndex: 0);
    getData();
    _initGameData();
  }

  _initGameData() {
    teamPlayers.clear();
    Future.wait([
      TeamPlayerApi.getTeamPlayerList(teamId ?? 0),
      CacheApi.getNBAPlayerInfo(),
      PicksApi.getRedisRankInfo(type: RankType.newsGuess),
      PicksApi.getTeamInfo(),
      CacheApi.getTeamRuleConfig(),
    ]).then((result) {
      TeamPlayerListEntity teamPlayerEntity = result[0] as TeamPlayerListEntity;
      NbaPlayerInfosEntity nbaPlayerInfosEntity =
          result[1] as NbaPlayerInfosEntity;
      var rankInfo = result[2] as RankListEntity;
      teamInfoEntity = result[3] as TeamInfoEntity;
      List<TeamRuleConfigEntity> teamRuleConfigList =
          result[4] as List<TeamRuleConfigEntity>;
      var firstWhereOrNull = teamRuleConfigList.firstWhereOrNull(
          (e) => e.grade.toString() == teamInfoEntity?.teamGrade.toString());
      nextLevelTotalExp = firstWhereOrNull?.totalTeamExp;
      salaryCap = firstWhereOrNull?.salaryCap;

      rank = rankInfo.myRank.rank ?? 0;
      for (int i = 0; i < teamPlayerEntity.teamPlayers.length; i++) {
        var playerEntity = teamPlayerEntity.teamPlayers[i];
        var item = nbaPlayerInfosEntity.playerBaseInfoList
            .firstWhere((e) => e.playerId == playerEntity.playerId);
        TeamInfo teamInfo = TeamInfo(playerEntity, item);
        teamPlayers.add(teamInfo);
      }
      update([idPersonalCenterGameMain]);
    });
  }

  getData() {
    loadStatus.value = LoadDataStatus.loading;
    PicksApi.getTeamSimple(teamId ?? 0).then((result) {
      loadStatus.value = LoadDataStatus.success;
      teamSimpleEntity = result;
      update([idPersonalCenterMain]);
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
    });
  }

  static String get idPersonalCenterMain => "id_personal_center";

  static String get idPersonalCenterGameMain => "id_personal_center_game_main";

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
