/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-09 14:22:13
 * @LastEditTime: 2024-09-19 09:55:54
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/nba_team_rank.dart';
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
    getTeamRank();
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

  void unLikeNews(int id) {
    NewsApi.newsUnLike(id).then((value) {
      update(['newsList']);
    });
  }

  ///获取球队信息
  void getTeamRank() {
    state.teamRankMap.clear();
    NewsApi.teamRank().then((value) {
      state.teamRankList = value.nbaTeamRanks ?? [];
      update(['teamRank']);
    });
  }

  //计算排名
  List<NbaTeamRank> getRankList(String type) {
    switch (type) {
      case 'pts':
        state.teamRankList.sort((a, b) => b.pts!.compareTo(a.pts!));
        return [];
      default:
        return [];
    }
  }
}
