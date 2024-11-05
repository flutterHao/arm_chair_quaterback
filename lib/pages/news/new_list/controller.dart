/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:22:13
 * @LastEditTime: 2024-11-05 12:12:10
 */
import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class NewListController extends GetxController {
  NewListController();

  final state = NewListState();
  late RefreshController refreshCtrl = RefreshController();
  late RefreshController flowRefreshCtrl = RefreshController();
  ScrollController scrollController = ScrollController();
  bool isLoading = true;
  String season = "";
  String seasonType = "Regular%20Season";
  String pointType = "";

  // @override
  // void onInit() {
  //   super.onInit();
  //   refreshCtrl = RefreshController();
  //   flowRefreshCtrl = RefreshController();
  // }

  @override
  void onInit() {
    super.onInit();
    int currentYear = DateTime.now().year;
    season = "$currentYear-${(currentYear + 1) % 100}";
    refreshData();
    // scrollController.addListener(_onScroll);
  }

  // 滚动时调用此函数
  // void _onScroll() {
  //   print(
  //       "zzzzz${scrollController.position.pixels}/${scrollController.position.maxScrollExtent}}");
  // }

  void refreshData() async {
    Future.wait([
      CacheApi.getNBATeamDefine(),
      CacheApi.getNBAPlayerInfo(),
      getNewsBanner(),
      getNewsList(),
      getStatsRank(),
      getStarTeamList(),
    ]).then((v) {
      // refreshCtrl.refreshCompleted();
    }).whenComplete(() {
      refreshCtrl.refreshCompleted();
    }).catchError((e) {
      // Log.e("getNewsList error,开始重试");
      // refreshData();
    });
  }

  Future getNewsBanner() async {
    await NewsApi.getNewsBanner().then((value) {
      state.banners = value;
      update(['newsBanner']);
    });
  }

  Future getNewsList() async {
    await NewsApi.getNewsList().then((value) {
      state.newsEntity = value;
      update(['newsList']);
    });
  }

  void likeNews(NewsDetail item) {
    // if (item.isLike?.value == 1) return;
    NewsApi.newsLike(item.id!).then((value) {
      if ((item.isLike?.value != 1)) {
        item.likes = (item.likes ?? 0) + 1;
        item.isLike!.value = 1;
      } else {
        item.likes = (item.likes ?? 0) - 1;
        item.isLike!.value = 0;
      }
      update(['newsList']);
    });
  }

  // void unLikeNews(NewsDetail item) {
  //   if (item.isLike?.value == -1) return;
  //   NewsApi.newsUnLike(item.id!).then((value) {
  //     item.isLike!.value = -1;
  //     item.likes = (item.likes ?? 0) - 1;
  //     update(['newsList']);
  //   });
  // }

  ///获取球员信息
  Future getStatsRank() async {
    String type = Constant.statTypeList[0];
    await NewsApi.startRank(season: season, statType: type).then((value) {
      state.statsList = value;
      setTeamMap();
      update(['statsRank']);
    });
  }

  ///获取球队信息
  Future getStarTeamList() async {
    await Future.wait([
      CacheApi.getNBATeamDefine(getList: true),
      NewsApi.starTeamList(seasonId: season, seasonType: seasonType),
      NewsApi.getTeamList()
    ]).then((v) {
      state.teamConfigList = v[0] as List<NbaTeamEntity>;
      state.starTeamList = v[1] as List<StarsTeamRank>;
      state.teamRankList = v[2] as List<TeamRankEntity>;
      state.teamMap = {
        1: state.teamRankList.where((e) => hasContain(1, e)).toList(),
        2: state.teamRankList.where((e) => hasContain(2, e)).toList(),
      };
      update(['teamRank']);
    });
  }

  // void getTeamList() async {
  //   state.teamList = await NewsApi.getTeamList();
  //   update(['teamRanks']);
  // }

  bool hasContain(int type, TeamRankEntity item) {
    for (var element in state.teamConfigList) {
      if (item.teamID == element.id && element.force == type) {
        item.shortEname = element.shortEname;
        return true;
      }
    }
    return false;
  }

  dynamic getStartData(String type, NbaPlayerStat item) {
    switch (type) {
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

  //计算排名,放入map中
  void setTeamMap() {
    state.statsRankMap.clear();
    List<NbaPlayerStat> pts = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.pts!.compareTo(a.pts!));
    List<NbaPlayerStat> ast = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.ast!.compareTo(a.ast!));
    List<NbaPlayerStat> reb = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.reb!.compareTo(a.reb!));
    List<NbaPlayerStat> fgp = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.fgPct!.compareTo(a.fgPct!));
    List<NbaPlayerStat> blk = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.blk!.compareTo(a.blk!));
    List<NbaPlayerStat> stl = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.stl!.compareTo(a.stl!));
    List<NbaPlayerStat> ftp = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.ftPct!.compareTo(a.ftPct!));
    List<NbaPlayerStat> threePa = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.fg3A!.compareTo(a.fg3A!));
    List<NbaPlayerStat> threePp = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => b.fg3Pct!.compareTo(a.fg3Pct!));
    List<NbaPlayerStat> to = List<NbaPlayerStat>.from(state.statsList)
      ..sort((a, b) => a.tov!.compareTo(b.tov!)); // 注意失误可能是从小到大

    // 将所有的排行数据批量放入 Map 中
    state.statsRankMap = {
      "PTS": pts,
      "AST": ast,
      "REB": reb,
      "FGP": fgp,
      "BLK": blk,
      "STL": stl,
      "FTP": ftp,
      "3PA": threePa,
      "3PP": threePp,
      "TO": to,
    };
  }

  void getAward() {
    NewsApi.getAward().then((value) {
      if (value != null) {
        state.propDefineEntity =
            CacheApi.propDefineList!.where((e) => e.propId == value.id).first;
        EasyLoading.showToast(
            "${state.propDefineEntity.propName} +${value.num}");
      } else {
        EasyLoading.showToast("Already received");
      }
    });
  }

  Future getNewsFlow(newsId, {bool isRefresh = false}) async {
    if (isRefresh) {
      state.newsFlowList.clear();
      state.page = 0;
    } else {
      state.page++;
    }

    await NewsApi.newsFlow(newsId, state.page, 10).then((value) {
      state.newsFlowList.addAll(value);
      state.newsList = value;
      update(['newsFlow']);
    }).whenComplete(() {
      isRefresh
          ? flowRefreshCtrl.refreshCompleted()
          : flowRefreshCtrl.loadComplete();
    });
  }

  void pageToDetail(NewsListDetail item, {Function? callBack}) async {
    getNewsFlow(item.id, isRefresh: true);
    await Get.toNamed(RouteNames.newsDetail,
        arguments: item.id, id: GlobalNestedKey.NEWS);
    if (callBack != null) {
      callBack();
    }
    if (state.newsFlowList.isNotEmpty) {
      item.likes = state.newsFlowList.first.likes!;
      item.unLikes = state.newsFlowList.first.unLikes!;
      update(["newsList"]);
    }
  }

  ///遍历获取球队id
  List<int> getNBATeams(String labels, {String tag = "getNBATeams"}) {
    List<int> teamList = [];
    List labelsList = labels.split(",");
    for (var label in labelsList) {
      label = label.trim();
      if (ObjectUtil.isNotEmpty(label)) {
        for (var team in CacheApi.teamList) {
          if (team.longEname.contains(label) || team.name.contains(label)) {
            teamList.add(team.id);
          }
        }
      }
    }
    // Log.d("获取新闻中的球队labels：$labels 球队: $teamList", tag: tag);
    return teamList;
  }

  ///遍历获取球队id
  List<int> getNBAPlayers(String labels, {String tag = "getNBAPlayers"}) {
    List<int> playerList = [];
    List<String> labelsList = labels.split(",");
    for (var label in labelsList) {
      label = label.trim();
      if (ObjectUtil.isNotEmpty(label) && CacheApi.playerInfo != null) {
        for (var player in CacheApi.playerInfo!.playerBaseInfoList) {
          if (player.elname.contains(label) || player.ename.contains(label)) {
            playerList.add(player.playerId);
          }
        }
      }
    }
    // Log.d("获取新闻中的球员labels：$labels 球员: $playerList", tag: tag);
    return playerList;
  }

  Color getTeamColor(int teamId) {
    if (state.teamColorMap[teamId] != null) {
      return state.teamColorMap[teamId]!["light"]!;
    } else {
      return AppColors.c404040;
    }
  }
}
