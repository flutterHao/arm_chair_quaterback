/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 14:30:33
 * @LastEditTime: 2025-01-03 21:36:49
 */
import 'package:arm_chair_quaterback/common/entities/team_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/team.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamDetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamDetailController();
  int teamId = 100;
  List<String> tabs = ["OVERVIEW", "ROSTER", "STATS", "LOG"];
  List<String> types = ["PTS", "REB", "AST", "BLK", "STL", "TO", "FOUL"];

  List<String> positionList = ["CENTER", "GUARD", "FORWARD"];

  var currentTabIndex = 0.obs;

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
    currentTabIndex.value = index;
  }

  void getTeamInfo() async {
    await TeamApi.getNBATeamDetail(teamId).then((v) {
      teamDetailEntity = v;
      update(["overview_tab"]);
    });
  }
}
