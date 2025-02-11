/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 14:30:33
 * @LastEditTime: 2025-02-07 16:13:22
 */
import 'package:arm_chair_quaterback/common/entities/last5_avg_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_stats_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team.dart';
import 'package:arm_chair_quaterback/common/langs/lang_key.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TeamDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamDetailController();
  int teamId = 100;
  List<String> tabs = [
    LangKey.nbaTeamMeanOverview.tr,
    LangKey.nbaTeamMeanRoster.tr,
    LangKey.nbaTeamMeanStats.tr,
    LangKey.nbaTeamMeanLog.tr
  ];
  List<String> types = ["PTS", "REB", "AST", "BLK", "STL", "TO", "FOUL"];
  var currentTypeIndex = 0.obs;

  // int typeIndex = 0;

  List<String> positionList = [
    LangKey.nbaTeamMeanCenter,
    LangKey.nbaTeamMeanGuard,
    LangKey.nbaTeamMeanForward
  ];

  List<String> yearList = [];
  Map<String, List<Last5AvgEntity>> logMap = {};
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

  ScrollController scrollController = ScrollController();
  TeamDetailEntity teamDetailEntity = TeamDetailEntity();
  late TabController teamTabCtrl;
  List<StatsEntity> statTeamList = [];
  List<StatsEntity> statPlayerList = [];
  List<TeamRankEntity> confRankList = [];
  List<bool> openList = [];

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    teamId = Get.arguments;
    teamTabCtrl = TabController(length: 2, vsync: this);
    int year = MyDateUtils.getNowDateTime().year;
    yearList = List.generate(year - 2018,
        (index) => "${(year - index - 1)}-${(year - index) % 2000}");
    logMap = {for (var year in yearList) year: []};
    openList =
        List.generate(yearList.length, (index) => index == 0 ? true : false);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    Log.e("onClose");
  }

  _initData() {
    getTeamInfo();
    getStatsInfo();
    getSeasonLog(logMap.entries.first.key);
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
      teamDetailEntity.gameSchedules
          .sort((a, b) => a.gameStartTime.compareTo(b.gameStartTime));
      update(["overview_tab"]);
      Future.delayed(const Duration(milliseconds: 50)).then((v) {
        for (int i = 0; i < teamDetailEntity.gameSchedules.length; i++) {
          var item = teamDetailEntity.gameSchedules[i];
          if (item.status != 2 &&
              item.gameStartTime >= DateTime.now().millisecondsSinceEpoch) {
            double offsetx = (193.5.w + 9.w) * (i > 0 ? i - 1 : 0);
            scrollController.jumpTo(offsetx);
            break;
          }
        }
      });
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
      teamDetailEntity.last5GameSchedule.schedule
          .sort((a, b) => a.gameStartTime.compareTo(b.gameStartTime));
      teamDetailEntity.last5GameSchedule.scoreAvg
          .sort((a, b) => a.parseCustomDate().compareTo(b.parseCustomDate()));
      update(["stats", "overview_tab"]);
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

  double getOppg() {
    for (var element in confRankList) {
      if (teamId == element.teamID) {
        return element.oppPointsPG;
      }
    }
    return 0;
  }

  int getOppgRank() {
    confRankList.sort((a, b) => a.oppPointsPG.compareTo(b.oppPointsPG));
    for (int i = 0; i < confRankList.length; i++) {
      if (teamId == confRankList[i].teamID) {
        return i + 1;
      }
    }
    return 1;
  }

  void getSeasonLog(String season) async {
    if (logMap[season]!.isEmpty) {
      await TeamApi.getNBAGameLogByTeamId(teamId, season).then((v) {
        logMap[season] = v;
        update(["logTab"]);
      });
    }
  }

  num getColumnMaxYValue() {
    List<Last5AvgEntity> list =
        List.from(teamDetailEntity.last5GameSchedule.scoreAvg);
    list.sort((a, b) =>
        a.getValue(getCurrentType()).compareTo(b.getValue(getCurrentType())));
    var v = list.last.getValue(getCurrentType());
    return v;
  }
}
