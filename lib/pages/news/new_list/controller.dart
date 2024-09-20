/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:22:13
 * @LastEditTime: 2024-09-20 12:22:07
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/net/apis/news.dart';

import 'package:get/get.dart';

import 'index.dart';

class NewListController extends GetxController {
  NewListController();

  final state = NewListState();

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    // getNewsBanner();
    // getNewsList();
    getStatsRank();
  }

  void getNewsBanner() {
    NewsApi.getNewsBanner().then((value) {
      state.banners = value;
      update(['newsBanner']);
    });
  }

  void getNewsList() {
    NewsApi.getNewsList().then((value) {
      state.newsList = value.nbaNewsList ?? [];
      update(['newsList']);
    });
  }

  void likeNews(NewsDetail item) {
    if (item.isLike == 1) return;
    NewsApi.newsLike(item.id!).then((value) {
      item.isLike = 1;
      item.likes = (item.likes ?? 0) + 1;
      update(['newsList']);
    });
  }

  void unLikeNews(NewsDetail item) {
    if (item.isLike == 0) return;
    NewsApi.newsUnLike(item.id!).then((value) {
      item.isLike = 0;
      item.likes = (item.likes ?? 0) - 1;
      update(['newsList']);
    });
  }

  ///获取球员信息 //TODO 防止一次性加载过多
  void getStatsRank() async{
    for (var element in state.statsRankMap.entries) {
   await   NewsApi.startRank(season: "2023-24", statType: "PTS").then((value) {
        state.statsRankMap[element.key] = value.nbaPlayerStats ?? [];
      });
    }
    update(['statsRank']);
  }

  dynamic getStartData(String type, NbaPlayerStat item) {
    switch (type) {
      case "PTS":
        return item.pts ?? 0;
      case "AST":
        return item.ast ?? 0;
      case "REB":
        return item.reb ?? 0;
      case "FG%":
        return item.fgPct ?? 0;
      case "BLK":
        return item.blk ?? 0;
      case "STL":
        return item.stl ?? 0;
      case "FTP":
        return item.ftPct ?? 0;
      case "3PA":
        return item.fg3A ?? 0;
      case "3P%":
        return item.fg3Pct ?? 0;
      case "TO":
        return item.tov ?? 0;
      default:
        return 0;
    }
  }

  //计算排名,放入map中/
  // void setTeamMap() {
  //   state.statsRankMap.clear();
  //   List<NbaPlayerStat> pts = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.pts!.compareTo(a.pts!));
  //   List<NbaPlayerStat> ast = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.ast!.compareTo(a.ast!));
  //   List<NbaPlayerStat> reb = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.reb!.compareTo(a.reb!));
  //   List<NbaPlayerStat> fg = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.fgP!.compareTo(a.fgP!));
  //   List<NbaPlayerStat> blk = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.blk!.compareTo(a.blk!));
  //   List<NbaPlayerStat> stl = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.stl!.compareTo(a.stl!));
  //   List<NbaPlayerStat> ftp = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.ftP!.compareTo(a.ftP!));
  //   List<NbaPlayerStat> threePa = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.threePa!.compareTo(a.threePa!));
  //   List<NbaPlayerStat> threePp = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => b.threePp!.compareTo(a.threePp!));
  //   List<NbaPlayerStat> to = List<NbaPlayerStat>.from(state.statsList)
  //     ..sort((a, b) => a.to!.compareTo(b.to!)); // 注意失误可能是从小到大

  //   // 将所有的排行数据批量放入 Map 中
  //   state.statsRankMap.addAll({
  //     "PTS": pts,
  //     "AST": ast,
  //     "REB": reb,
  //     "FG": fg,
  //     "BLK": blk,
  //     "STL": stl,
  //     "FTP": ftp,
  //     "3TA": threePa,
  //     "3TP": threePp,
  //     "TO": to,
  //   });
  // }
}
