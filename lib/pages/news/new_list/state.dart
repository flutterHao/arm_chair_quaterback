import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
import 'package:arm_chair_quaterback/common/entities/stats_rank/nba_player_stat.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/nba_team_rank.dart';

class NewListState {
  // // title
  // final _title = "".obs;
  // set title(value) => _title.value = value;
  // get title => _title.value;

  List<NewsDetail> newsList = [];
  List<NewsBanner> banners = [];
  NewsDetail newsDetail = NewsDetail();
  List<NbaTeamRank> teamRankList = [];
  List<NbaPlayerStat> statsList = [];

  Map<String, List<NbaPlayerStat>> statsRankMap = {
    "PTS": [],
    "AST": [],
    "REB": [],
    "FG": [],
    "BLK": [],
    "STL": [],
    "FTP": [],
    "3TA": [],
    "3TP": [],
    "TO": [],
  };

  NewListState() {
    ///Initialize variables
  }
}
