/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 19:00:39
 * @LastEditTime: 2024-10-26 18:05:14
 */
import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';

class NewListState {
  // // title
  // final _title = "".obs;
  // set title(value) => _title.value = value;
  // get title => _title.value;

  NewsEntity newsEntity = NewsEntity();
  List<NewsDetail> newsList = [];
  List<NewsBanner> banners = [];
  NewsDetail newsDetail = NewsDetail();
  List<StarsTeamRank> starTeamList = [];
  List<TeamRankEntity> teamList = [];
  List<NbaPlayerStat> statsList = [];
  List<NbaTeamEntity> teamConfigList = [];
  Map<int, List<TeamRankEntity>> teamMap = {};

  Map<String, List<NbaPlayerStat>> statsRankMap = {};

  PropDefineEntity propDefineEntity = PropDefineEntity();
  NewListState() {
    ///Initialize variables
  }

  List<NewsDetail> newsFlowList = [];
  int page = 0;
  int pageSize = 5;

  // Map<int,>
}
