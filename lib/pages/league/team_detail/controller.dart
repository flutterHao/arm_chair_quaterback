/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-31 14:30:33
 * @LastEditTime: 2024-12-31 15:03:24
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
    "FTM--FTA"
  ];

  var currentIndex = 0.obs;
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
    currentIndex.value = index;
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
