/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 14:30:33
 * @LastEditTime: 2025-01-07 18:21:14
 */
import 'package:arm_chair_quaterback/common/entities/palyer_stats_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamDetailController();
  int teamId = 100;
  List<String> tabs = ["OVERVIEW", "ROSTER", "STATS", "LOG"];
  List<String> types = ["PTS", "REB", "AST", "BLK", "STL", "TO", "FOUL"];
  var currentTypeIndex = 0.obs;

  // int typeIndex = 0;

  List<String> positionList = ["CENTER", "GUARD", "FORWARD"];

  final List<String> yearList = List.generate(
      MyDateUtils.getNowDateTime().year - 2016,
      (index) => "${MyDateUtils.getNowDateTime().year - index}");
  List<String> columns = [
    "PTS",
    "AST",
    "REB",
    "BLK",
    "TO",
    "FTM",
    "FOUL",
    "FG%",
    "FT%",
    "3P%"
  ];

  TeamDetailEntity teamDetailEntity = TeamDetailEntity();
  late TabController teamTabCtrl;
  List<StatsEntity> statTeamList = [];
  List<StatsEntity> statPlayerList = [];
  List<TeamRankEntity> confRankList = [];

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    teamId = Get.arguments;
    teamTabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  _initData() {
    getTeamInfo();
    getStatsInfo();
  }

  String getSeasonAvgWithTab() {
    return "Season Avg";
  }

  onTabTap(int index) {
    currentTypeIndex.value = index;
  }

  void getTeamInfo() async {
    await TeamApi.getNBATeamDetail(teamId).then((v) {
      teamDetailEntity = v;
      update(["overview_tab"]);
    });
  }

  //   Future getStartRank() async {
  //   await Future.wait([
  //     NewsApi.startRank(
  //         season: season.value,
  //         statType: pointType.value,
  //         seasonType: seasonType),
  //     NewsApi.statTeamList(seasonId: season.value),
  //     NewsApi.getTeamListNew(1),
  //     NewsApi.getTeamListNew(2),
  //     CacheApi.getNBATeamDefine()
  //   ]).then((v) {
  //     statPlayerList = v[0] as List<StatsEntity>;
  //     statTeamRankList = v[1] as List<StatsEntity>;
  //     confRankList = v[2] as List<TeamRankEntity>;
  //     divRankList = v[3] as List<TeamRankEntity>;

  //     for (var element in confRankList) {
  //       element.force = CacheApi.teamDefineMap?[element.teamID]?.force ?? 0;
  //     }
  //     for (var element in divRankList) {
  //       int div = CacheApi.teamDefineMap?[element.teamID]?.teamDivision ?? 0;
  //       element.teamDivision = div;
  //     }
  //     // onTypeChange();

  //     update(["teamRank", "starsRank"]);
  //   }).catchError((e) {
  //     Log.e(e.toString());
  //   });
  // }

  void getStatsInfo() async {
    await Future.wait([
      NewsApi.startRank(),
      NewsApi.statTeamList(),
      NewsApi.getTeamListNew(1),
      CacheApi.getNBATeamDefine()
    ]).then((v) {
      statPlayerList = (v[0] as List<StatsEntity>)
          .where((e) => Utils.getPlayBaseInfo(e.playerId).teamId == teamId)
          .toList();
      statTeamList = v[1] as List<StatsEntity>;
      confRankList = v[2];
      for (var element in confRankList) {
        element.force = CacheApi.teamDefineMap?[element.teamID]?.force ?? 0;
      }
      update(["stats"]);
    });
  }

  String getCurrentType() {
    return types[currentTypeIndex.value];
  }

  void onTypeTap(int index) {
    currentTypeIndex.value = index;
    update(["overview_tab"]);
  }

  double seasonAvg() {
    double value = teamDetailEntity.regularSeasonData
        .getRankValue(getCurrentType(), teamDetailEntity.regularSeasonData);
    return value;
  }

  double last5Avg() {
    double total = 0;
    for (var element in teamDetailEntity.last5GameSchedule.scoreAvg) {
      total += element.getValue(getCurrentType());
    }
    return (total / 5 * 10).roundToDouble() / 10;
  }

  int getAwayTeamId() {
    for (var e in teamDetailEntity.guessL5GameList.schedule) {
      if (e.homeTeamId == teamId) {
        return e.awayTeamId;
      } else {
        return e.homeTeamId;
      }
    }
    return 0;
  }

  Map<String, TeamDetailSeasonData> getSeasonRanks() {
    Map<String, TeamDetailSeasonData> map = {};
    if (teamDetailEntity.preSeasonData != null) {
      map.addAll({"PRE": teamDetailEntity.preSeasonData!});
    }
    map.addAll({"REG": teamDetailEntity.regularSeasonData});

    if (teamDetailEntity.playoffsData != null) {
      map.addAll({"PLAYOFF": teamDetailEntity.playoffsData!});
    }
    return map;
  }

  List<StatsEntity> getPlayerList(String type) {
    switch (type) {
      case "CENTER":
        return statPlayerList
            .where(
                (e) => Utils.getPlayBaseInfo(e.playerId).position.contains("C"))
            .toList();
      case "GUARD":
        return statPlayerList
            .where(
                (e) => Utils.getPlayBaseInfo(e.playerId).position.contains("G"))
            .toList();
      case "FORWARD":
        return statPlayerList
            .where(
                (e) => Utils.getPlayBaseInfo(e.playerId).position.contains("F"))
            .toList();
      default:
        return statPlayerList;
    }
  }
}
