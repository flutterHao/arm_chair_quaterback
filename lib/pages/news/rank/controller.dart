/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:27:52
 * @LastEditTime: 2024-09-21 19:04:22
 */
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/stats_list_view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/team_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RankController();

  late TabController tabController;
  RxInt current = 0.obs;
  List<String> tabs = ["Player", "Team"];
  List<String> tabs2 = ["Eastean", "Westen"];

  RxDouble progress = 0.0.obs;
  List statsPages = const [
    PlayListView(),
    TeamListView(),
  ];

  List teamPages = const [
    EasTeamListView(type: 1),
    EasTeamListView(type: 2),
  ];

  // RxString divisionIndex = "PTS".obs;
  // RxString seasonIndex = "2023-24".obs;

  String statType = "PTS";
  String season = "2023-24";
  List<NbaPlayerStat> statList = [];
  List<String> seasonList = ["2023-24"];

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.animation?.addListener(() {
      progress.value = tabController.animation!.value;
    });
    tabController.addListener(() {
      int newIndex = tabController.index;
      if (current.value != newIndex) {
        current.value = newIndex;
      }
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    getStatRank();
  }

  void onTap(v) {
    current.value = v;
    tabController.animateTo(v);
  }

  void getStatRank() {
    // NewsApi.startRank(season: season, statType: statType).then((value) {
    //   statList = value.nbaPlayerStats ?? [];
    //   update(["stars"]);
    // });
    NewListController ctrl = Get.find();
    statList = ctrl.state.statsRankMap[statType] ?? [];
    update(["stars"]);
  }

  void getTeamRank() {
    NewsApi.teamRank(page: 0, pageSize: 30).then((value) {});
  }

  dynamic getStartData(NbaPlayerStat item) {
    switch (statType) {
      case "PTS":
        return item.pts ?? 0;
      case "AST":
        return item.ast ?? 0;
      case "REB":
        return item.reb ?? 0;
      case "FG":
        return item.fgPct ?? 0;
      case "BLK":
        return item.blk ?? 0;
      case "STL":
        return item.stl ?? 0;
      case "FTP":
        return item.ftPct ?? 0;
      case "3PA":
        return item.fg3A ?? 0;
      case "3PP":
        return item.fg3Pct ?? 0;
      case "TO":
        return item.tov ?? 0;
      default:
        return 0;
    }
  }
}
