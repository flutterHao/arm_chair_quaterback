import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail/widgets/league_detail_play/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/22/16:20

class PlayNotStartController extends GetxController with GetTickerProviderStateMixin{

  final ScoresEntity item;

  PlayNotStartController(this.item);

  ScoresNotStartGameEntity? scoresNotStartGameEntity;

  var loadStatus = LoadDataStatus.loading.obs;

  List<String> tabPropertyTitles = ["DATA","HISTORY"];
  late TabController teamPropertyTabController;

  late TabController teamL5GameTabController;

  late TabController teamPlayersTabController;


  @override
  void onInit() {
    super.onInit();
    initData();
    teamPropertyTabController = TabController(length: tabPropertyTitles.length, vsync: this);
    teamL5GameTabController = TabController(length: 2, vsync: this);
    teamPlayersTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    teamPropertyTabController.dispose();
    teamL5GameTabController.dispose();
    teamPlayersTabController.dispose();
    super.dispose();
  }

  initData(){
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      LeagueApi.getNotStartGameData(item.gameId),
      CacheApi.getNBATeamDefine(),
      CacheApi.getNBAPlayerInfo(),
    ]).then((result){
      scoresNotStartGameEntity = result[0];
      loadStatus.value = LoadDataStatus.success;
      update();
    },onError: (e){
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  List<TeamStats> getTeamStatsData() {
    List<TeamStats> list = [];
    if (scoresNotStartGameEntity?.nbaTeamStatRankList.isEmpty == true) {
      return [];
    }
    var homeDetail = scoresNotStartGameEntity?.nbaTeamStatRankList.firstWhereOrNull(
            (e) => e.teamId == item.homeTeamId);
    var awayDetail = scoresNotStartGameEntity?.nbaTeamStatRankList.firstWhereOrNull(
            (e) => e.teamId == item.awayTeamId);

    list.add(TeamStats("Points", homeDetail?.pts ?? 0, awayDetail?.pts ?? 0));
    list.add(TeamStats(
        "3 Points Make", homeDetail?.fg3M ?? 0, awayDetail?.fg3M ?? 0));
    list.add(TeamStats("Rebound", homeDetail?.reb ?? 0, awayDetail?.reb ?? 0));
    list.add(TeamStats("Assist", homeDetail?.ast ?? 0, awayDetail?.ast ?? 0));
    list.add(TeamStats("Steals", homeDetail?.stl ?? 0, awayDetail?.stl ?? 0));
    list.add(
        TeamStats("Block Shot ", homeDetail?.blk ?? 0, awayDetail?.blk ?? 0));
    list.add(TeamStats(
        "Free Throw Make", homeDetail?.ftm ?? 0, awayDetail?.ftm ?? 0));
    list.add(TeamStats("Turn over", homeDetail?.tov ?? 0, awayDetail?.tov ?? 0));
    list.add(TeamStats("Foul", homeDetail?.pf ?? 0, awayDetail?.pf ?? 0));

    list.add(TeamStats(
        "Field Goal",
        ((homeDetail?.fgm ?? 0) / (homeDetail?.fga ?? 0)).handlerNaNInfinity(),
        ((awayDetail?.fgm ?? 0) / (awayDetail?.fga ?? 0)).handlerNaNInfinity(),
        valueIsPercent: true));
    list.add(TeamStats(
        "Free Throw %",
        ((homeDetail?.ftm ?? 0) / (homeDetail?.fta ?? 0)).handlerNaNInfinity(),
        ((awayDetail?.ftm ?? 0) / (awayDetail?.fta ?? 0)).handlerNaNInfinity(),
        valueIsPercent: true));
    list.add(TeamStats(
        "3 Point %",
        ((homeDetail?.fg3M ?? 0) / (homeDetail?.fg3A ?? 0))
            .handlerNaNInfinity(),
        ((awayDetail?.fg3M ?? 0) / (awayDetail?.fg3A ?? 0))
            .handlerNaNInfinity(),
        valueIsPercent: true));
    return list;
  }
}