/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:27:52
 * @LastEditTime: 2024-09-24 10:03:11
 */
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
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
  List<StarsTeamRank> starsTeamRankList = [];

  int page = 1;
  int size = 20;

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
    getAllTeamInfo();
  }

  void onTap(v) {
    current.value = v;
    tabController.animateTo(v);
  }

  void getStatRank({bool refresh = true}) async {
    // NewsApi.startRank(season: season, statType: statType).then((value) {
    //   statList = value.nbaPlayerStats ?? [];
    //   update(["stars"]);
    // });
    // 刷新或加载完成时停止动画
    await Future.delayed(const Duration(milliseconds: 100));
    page = refresh ? 1 : (page + 1);
    NewListController ctrl = Get.find();
    var list = ctrl.state.statsRankMap[statType] ?? [];
    int end = page * size > list.length ? list.length : page * size;
    statList = list.sublist(0, end);
    if (refresh) {
      refreshCtrl.refreshCompleted(); // 停止刷新动画
    } else {
      refreshCtrl.loadComplete();
    }
    update(["stars"]);
  }

  void getAllTeamInfo() {
    NewListController ctrl = Get.find();
    starsTeamRankList = List.from(ctrl.state.starTeamList);
  }

  void getTeamRank() {
    switch (statType) {
      case "PTS":
        starsTeamRankList.sort((a, b) => b.pts!.compareTo(a.pts!));
      case "AST":
        starsTeamRankList.sort((a, b) => b.ast!.compareTo(a.ast!));
      case "REB":
        starsTeamRankList.sort((a, b) => b.reb!.compareTo(a.reb!));
      case "FGP":
        starsTeamRankList.sort((a, b) => b.fgPct!.compareTo(a.fgPct!));
      case "BLK":
        starsTeamRankList.sort((a, b) => b.blk!.compareTo(a.blk!));
      case "STL":
        starsTeamRankList.sort((a, b) => b.stl!.compareTo(a.stl!));
      case "FTP":
        starsTeamRankList.sort((a, b) => b.ftPct!.compareTo(a.ftPct!));
      case "3PA":
        starsTeamRankList.sort((a, b) => b.fg3A!.compareTo(a.fg3A!));
      case "3PP":
        starsTeamRankList.sort((a, b) => b.fg3Pct!.compareTo(a.fg3Pct!));
      case "TO":
        starsTeamRankList.sort((a, b) => a.tov!.compareTo(b.tov!));
      default:
    }

    update(["starsTeam"]);
  }

  // void getTeamRank() {
  //   NewsApi.teamRank(page: 0, pageSize: 30).then((value) {});
  // }

  dynamic getRankValue(dynamic item) {
    switch (statType) {
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
