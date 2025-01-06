/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 14:30:33
 * @LastEditTime: 2025-01-06 21:01:10
 */
import 'package:arm_chair_quaterback/common/entities/team_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/data_formats.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
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

  Map<String, Map<String, dynamic>> statsRankMap = {
    "POINTS": {
      "current": 1,
      "list": ["GP_MIN", "PPG_PTS", "FG%_FGM", "3P%_3PM", "FT_FTM"]
    },
    "REBOUNDS": {
      "current": 1,
      "list": ["GP_MIN", "RPG_REB", "DREB_OREB"]
    },
    "ASSISTS": {
      "current": 1,
      "list": ["GP_MIN", "APG_AST", "TPG_TO", "FPG_FOUL"]
    },
  };

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

  String formatDate12Hours(int time) {
    return "${MyDateUtils.formatDate(MyDateUtils.getDateTimeByMs(time), format: DateFormats.PARAM_Y_M_D)}  ${MyDateUtils.formatHM_AM(MyDateUtils.getDateTimeByMs(time))}";
  }

  Map<String, TeamDetailRegularSeasonData> getSeasonRanks() {
    Map<String, TeamDetailRegularSeasonData> map = {};
    if (teamDetailEntity.preSeasonData != null) {
      map.addAll({"PRE": teamDetailEntity.preSeasonData!});
    }
    map.addAll({"REG": teamDetailEntity.regularSeasonData});

    if (teamDetailEntity.playoffsData != null) {
      map.addAll({"PLAYOFF": teamDetailEntity.playoffsData!});
    }
    return map;
  }
}
