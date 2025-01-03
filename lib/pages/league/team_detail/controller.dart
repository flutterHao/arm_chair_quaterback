/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 14:30:33
 * @LastEditTime: 2025-01-03 14:55:31
 */
import 'package:get/get.dart';

class TeamDetailController extends GetxController {
  TeamDetailController();
  List<String> tabs = ["OVERVIEW", "ROSTER", "STATS", "LOG"];
  List<String> types = [
    "PTS",
    "REB",
    "AST",
    "BLK",
    "STL",
    "TO",
    "FOUL",
  ];

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
  _initData() {
    update(["team_detail"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  String getSeasonAvgWithTab() {
    return "Season Avg";
  }

  onTabTap(int index) {
    currentTabIndex.value = index;
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
