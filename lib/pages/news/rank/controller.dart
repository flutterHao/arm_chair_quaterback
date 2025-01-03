/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:27:52
 * @LastEditTime: 2025-01-02 19:52:39
 */
import 'package:arm_chair_quaterback/common/entities/palyer_stats_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/team_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RankController();

  late TabController tabController;
  RefreshController refreshCtrl = RefreshController();
  int todayScoresCount = 0;
  RxInt tabIndex = 0.obs;
  List<String> tabs = ["CONFERENCE", "PRESEAON"];
  var teamTypeIndex = 0.obs;
  List<String> teamRankType = ["CONFERENCE", "DIVISION"];
  List<String> tabs2 = ["Eastean", "Westen"];

  RxDouble progress = 0.0.obs;

  List teamPages = const [
    EasTeamListView(type: 1),
    EasTeamListView(type: 2),
  ];

  RxString pointType = "PTS".obs;
  RxString season = "2024-25".obs;
  String seasonType = "Regular Season";
  List<StatsEntity> statPlayerList = [];
  List<String> seasonList = ["2023-24", "2024-25"];
  List<StatsEntity> statTeamRankList = [];
  // List<TeamRankEntity> teamRankList = [];
  List<TeamRankEntity> confRankList = [];
  List<TeamRankEntity> divRankList = [];

  // Map<String, Map<String, List<NbaPlayerStat>>> statsRankMap = {};
  Map<String, Map<String, dynamic>> statsRankMap = {
    "SCORING": {
      "current": 1,
      "list": ["GP_MIN", "PPG_PTS", "FGM_FGA", "3PM_3PA", "FTM_FTA"]
    },
    "FIELD GOAL": {
      "current": 1,
      "list": ["GP_MIN", "FGM_FG%", "3PM_3P%", "FTM_FT%"]
    },
    "AST": {
      "current": 1,
      "list": ["GP_MIN", "APG_AST", "TPG_TO"]
    },
    "REB": {
      "current": 1,
      "list": ["GP_MIN", "RPG_REB", "BPG_BLK"]
    },
  };

  Map<String, String> statsTeamTypeMap = {
    "POINTS": "PPG_PTS",
    "REBOUND": "RPG_REB",
    "ASSIST": "APG_AST",
    "FIELD GOLD": "FG%_FGM",
    "THREE POINTS": "3P%_3PM",
    "FREE THROW": "FT%_FTM",
    "TURNOVER": "TPG_TO"
  };

//西部1，东部2

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    // pointType.value = Get.find<NewListController>().pointType;
    int currentYear = DateTime.now().year;
    season.value = "$currentYear-${(currentYear + 1) % 100}";
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.animation?.addListener(() {
      progress.value = tabController.animation!.value;
    });
    tabController.addListener(() {
      int newIndex = tabController.index;
      if (tabIndex.value != newIndex) {
        tabIndex.value = newIndex;
      }
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    getStartRank();
  }

  void onTap(v) {
    tabIndex.value = v;
    tabController.animateTo(v);
  }

  // Future getTeamRank() async {
  //   teamRankList = await NewsApi.getTeamList(seasonId: season.value);
  // }

  Future getStartRank() async {
    await Future.wait([
      NewsApi.startRank(
          season: season.value,
          statType: pointType.value,
          seasonType: seasonType),
      NewsApi.statTeamList(seasonId: season.value),
      NewsApi.getTeamListNew(1),
      NewsApi.getTeamListNew(2),
      CacheApi.getNBATeamDefine()
    ]).then((v) {
      statPlayerList = v[0] as List<StatsEntity>;
      statTeamRankList = v[1] as List<StatsEntity>;
      confRankList = v[2] as List<TeamRankEntity>;
      divRankList = v[3] as List<TeamRankEntity>;

      for (var element in confRankList) {
        element.force = CacheApi.teamDefineMap?[element.teamID]?.force ?? 0;
      }
      for (var element in divRankList) {
        int div = CacheApi.teamDefineMap?[element.teamID]?.teamDivision ?? 0;
        element.teamDivision = div;
      }
      // onTypeChange();

      update(["teamRank", "starsRank"]);
    }).catchError((e) {
      Log.e(e.toString());
    });
  }

  List<StatsEntity> getStatRankList(String type, bool isTeam) {
    List<StatsEntity> list =
        List.from(isTeam ? statTeamRankList : statPlayerList);
    switch (type) {
      case "PPG": //场均PTS
        list.sort((a, b) => b.pTS.compareTo(a.pTS));
      case "PTS":
        list.sort((a, b) => b.totalPts.compareTo(a.totalPts));
      case "FGM":
        list.sort((a, b) => b.fGM.compareTo(a.fGM));
      case "FGA":
        list.sort((a, b) => b.fGA.compareTo(a.fGA));
      case "3PM":
        list.sort((a, b) => b.threePM.compareTo(a.threePM));
      case "3PA":
        list.sort((a, b) => b.threePA.compareTo(a.threePA));
      case "FTM":
        list.sort((a, b) => b.fTM.compareTo(a.fTM));
      case "FTA":
        list.sort((a, b) => b.fTA.compareTo(a.fTA));
      case "FG%":
        list.sort((a, b) => b.fgPct.compareTo(a.fgPct));
      case "3P%":
        list.sort((a, b) => b.fg3Pct.compareTo(a.fg3Pct));
      case "FT%":
        list.sort((a, b) => b.ftPct.compareTo(a.ftPct));
      case "APG": //场均AST
        list.sort((a, b) => b.aST.compareTo(a.aST));
      case "AST":
        list.sort((a, b) => b.totalAst.compareTo(a.totalAst));
      case "TPG": //场均TO
        list.sort((a, b) => b.tOV.compareTo(a.tOV));
      case "TO":
        list.sort((a, b) => b.totalTov.compareTo(a.totalTov));
      case "RPG":
        list.sort((a, b) => b.totalReb.compareTo(a.totalReb));
      case "REB": //场均RPG
        list.sort((a, b) => b.rEB.compareTo(a.rEB));
      case "BPG": //场均blk
        list.sort((a, b) => b.bLK.compareTo(a.bLK));
      case "BLK":
        list.sort((a, b) => b.totalBlk.compareTo(a.totalBlk));
      case "GP":
        list.sort((a, b) => b.gp.compareTo(a.gp));
      default:
    }
    return list;
  }

  String getRankValue(String type, StatsEntity item) {
    double value = 0;
    switch (type) {
      case "PPG": //场均PTS
        value = item.pTS;
      case "PTS":
        value = item.totalPts;
      case "FGM":
        value = item.fGM;
      case "FGA":
        value = item.fGA;
      case "3PM":
        value = item.threePM;
      case "3PA":
        value = item.fGA;
      case "FTM":
        value = item.fTM;
      case "FTA":
        value = item.fTA;
      case "FG%":
        value = item.fgPct * 100;
      case "3P%":
        value = item.fg3Pct * 100;
      case "FT%":
        value = item.ftPct * 100;
      case "APG": //场均AST
        value = item.aST;
      case "AST":
        value = item.totalAst;
      case "TPG": //场均TO
        value = item.tOV;
      case "TO":
        value = item.totalTov;
      case "RPG":
        value = item.rEB;
      case "REB": //场均RPG
        value = item.totalReb;
      case "BPG": //场均blk
        value = item.bLK;
      case "BLK":
        value = item.totalBlk;
      case "GP":
        value = item.gp;
      case "MIN":
        value = item.min;
      default:
        value = 0.0;
    }
    return Utils.formatToThreeSignificantDigits(value);
  }

  String getTeamRankTitle() {
    return "$season NBA ${teamTypeIndex.value == 0 ? "Conference" : "Division"}  Standings"
        .toUpperCase();
  }

  String getTypeName(int type) {
    switch (type) {
      case 1:
        return "Atlantic ";
      case 2:
        return "Central ";
      case 3:
        return "Southeast ";
      case 4:
        return "Northwest ";
      case 5:
        return "Pacific ";
      case 6:
        return "Southwest ";
      default:
        return "";
    }
  }
}
