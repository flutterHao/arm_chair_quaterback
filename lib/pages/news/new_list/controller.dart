/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:22:13
 * @LastEditTime: 2024-09-25 20:43:36
 */
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/store/store.dart';
import 'package:arm_chair_quaterback/common/utils/loading.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class NewListController extends GetxController {
  NewListController();

  final state = NewListState();
  RefreshController refreshCtrl = RefreshController();

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    refreshData();
  }

  void refreshData() async {
    Future.wait([
      getNewsBanner(),
      getNewsList(),
      getStatsRank(),
      getStarTeamList(),
    ]).then((v) {
      // refreshCtrl.refreshCompleted();
    }).whenComplete(() {
      refreshCtrl.refreshCompleted();
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
      state.newsList = value;
      update(['newsList']);
    }).catchError((v) async {
      Log.e("getNewsList error");
      state.newsList = await NewsApi.getNewsList();
      update(['newsList']);
    });
  }

  void likeNews(NewsDetail item) {
    if (item.isLike?.value == true) return;
    NewsApi.newsLike(item.id!).then((value) {
      item.isLike!.value = true;
      item.likes = (item.likes ?? 0) + 1;
      update(['newsList']);
    });
  }

  void unLikeNews(NewsDetail item) {
    if (item.isLike?.value == false) return;
    NewsApi.newsUnLike(item.id!).then((value) {
      item.isLike!.value = false;
      item.likes = (item.likes ?? 0) - 1;
      update(['newsList']);
    });
  }

  ///获取球员信息 //TODO 防止一次性加载过多
  Future getStatsRank() async {
    // for (var element in state.statsRankMap.entries) {
    //   await NewsApi.startRank(season: "2023-24", statType: "PTS").then((value) {
    //     state.statsRankMap[element.key] = value.nbaPlayerStats ?? [];
    //   });
    // }
    //  update(['teamRank']);
    await NewsApi.startRank(season: "2023-24", statType: "PTS").then((value) {
      state.statsList = value;
      setTeamMap();
      update(['statsRank']);
    });
  }

  ///TODO 优化
  Future getStarTeamList() async {
    await Future.wait([
      CacheApi.getNBATeamDefine(getList: true),
      NewsApi.starTeamList(page: 0, pageSize: 30),
      NewsApi.getTeamList()
    ]).then((v) {
      state.teamConfigList = v[0] as List<NbaTeamEntity>;
      state.starTeamList = v[1] as List<StarsTeamRank>;
      state.teamList = v[2] as List<TeamRankEntity>;
      state.teamMap = {
        1: state.teamList.where((e) => hasContain(2, e)).toList(),
        2: state.teamList.where((e) => hasContain(1, e)).toList(),
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
}
