/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 19:00:39
 * @LastEditTime: 2024-09-21 12:37:34
 */
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';

class NewListState {
  // // title
  // final _title = "".obs;
  // set title(value) => _title.value = value;
  // get title => _title.value;

  List<NewsDetail> newsList = [];
  List<NewsBanner> banners = [];
  NewsDetail newsDetail = NewsDetail();
  List<TeamRank> teamRankList = [];
  List<NbaPlayerStat> statsList = [];
  List<NbaTeamEntity> teamConfigList = [];
  Map<int, List<TeamRank>> teamMap = {};

  Map<String, List<NbaPlayerStat>> statsRankMap = {};

  NewListState() {
    ///Initialize variables
  }
}
