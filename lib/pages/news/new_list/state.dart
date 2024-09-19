import 'package:arm_chair_quaterback/common/entities/news_banner.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';
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
  Map<String, dynamic> teamRankMap = {};

  NewListState() {
    ///Initialize variables
  }
}
