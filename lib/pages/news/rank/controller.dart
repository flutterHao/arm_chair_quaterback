/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:27:52
 * @LastEditTime: 2024-11-19 10:21:22
 */
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/pages/news/new_list/controller.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/stats_list_view.dart';
import 'package:arm_chair_quaterback/pages/news/rank/widgets/team_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RankController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RankController();

  late TabController tabController;
  RefreshController refreshCtrl = RefreshController();
  RxInt tabIndex = 0.obs;
  List<String> tabs = ["Player", "Team"];
  List<String> tabs2 = ["Eastean", "Westen"];

  RxDouble progress = 0.0.obs;
  List statsPages = const [
    PlayerListView(),
    TeamListView(),
  ];

  List teamPages = const [
    EasTeamListView(type: 1),
    EasTeamListView(type: 2),
  ];

  RxString pointType = "PTS".obs;
  RxString season = "2024-25".obs;
  String seasonType = "Regular Season";
  List<NbaPlayerStat> statList = [];
  List<String> seasonList = ["2023-24", "2024-25"];
  List<StarsTeamRank> starsTeamRankList = [];
  Map<String, List<NbaPlayerStat>> statsRankMap = {};

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
    getRankData();
  }

  void onTap(v) {
    tabIndex.value = v;
    tabController.animateTo(v);
  }

  Future getRankData() async {
    await Future.wait([
      NewsApi.startRank(
          season: season.value,
          statType: pointType.value,
          seasonType: seasonType),
      NewsApi.starTeamList(seasonId: season.value, seasonType: seasonType)
    ]).then((v) {
      statList = v[0] as List<NbaPlayerStat>;
      starsTeamRankList = v[1] as List<StarsTeamRank>;
      onTypeChange();
    });
  }

  void onTypeChange() async {
    switch (pointType.value) {
      case "PTS":
        starsTeamRankList.sort((a, b) => b.pts!.compareTo(a.pts!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "AST":
        starsTeamRankList.sort((a, b) => b.ast!.compareTo(a.ast!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "REB":
        starsTeamRankList.sort((a, b) => b.reb!.compareTo(a.reb!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "FGP":
        starsTeamRankList.sort((a, b) => b.fgPct!.compareTo(a.fgPct!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "BLK":
        starsTeamRankList.sort((a, b) => b.blk!.compareTo(a.blk!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "STL":
        starsTeamRankList.sort((a, b) => b.stl!.compareTo(a.stl!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "FTP":
        starsTeamRankList.sort((a, b) => b.ftPct!.compareTo(a.ftPct!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "3PA":
        starsTeamRankList.sort((a, b) => b.fg3A!.compareTo(a.fg3A!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "3PP":
        starsTeamRankList.sort((a, b) => b.fg3Pct!.compareTo(a.fg3Pct!));
        statList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "TO":
        starsTeamRankList.sort((a, b) => b.tov!.compareTo(a.tov!));
        statList.sort((a, b) => b.tov!.compareTo(a.tov!));
      default:
    }

    update(["stars", "starsTeam"]);
  }

  dynamic getRankValue(dynamic item) {
    switch (pointType.value) {
      case "PTS":
        return item.pts ?? 0;
      case "AST":
        return item.ast ?? 0;
      case "REB":
        return item.reb ?? 0;
      case "FGP":
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
