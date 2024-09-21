/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-09-21 12:10:47
 */
class Api {
  // static const String authAccount = '/p/account/authAccount';
  // static const String login = "/p/team/teamLogin";
  // static const String visitorLogin = "/p/team/visitorLogin";
  // static const String getNewsBanner = "/config/HightlightNews.json";
  // static const String getNewsList = "/p/NBANews/getNBANews";
  // static const String getNewsDetail = "/p/NBANews/viewNews";
  // static const String newsLike = "/p/NBANews/like";
  // static const String newsUnLike = "/p/NBANews/unLike";
  // static const String teamRank = "/p/NBAData/queryNBATeamRank";
  // static const String playerStats = "/p/NBAData/getNBAPlayerRankJSONInfo";
  // static const String sendReviews = "/p/NBANews/sendReviews";
  // static const String deleteReviews = "/p/NBANews/deleteReviews";
  // static const String likeReviews = "/p/NBANews/likeReviews";

  /// base
  static const String API_BASE_PATH = "/p";
  static const String CONFIG_BASE_PATH = "/config";

  /// api
  static const String authAccount = '$API_BASE_PATH/account/authAccount';
  //team
  static const String login = "$API_BASE_PATH/team/teamLogin";
  static const String visitorLogin = "$API_BASE_PATH/team/visitorLogin";
  //NBANews
  static const String getNewsList = "$API_BASE_PATH/NBANews/getNBANews";
  static const String getNewsDetail = "$API_BASE_PATH/NBANews/viewNews";
  static const String newsLike = "$API_BASE_PATH/NBANews/like";
  static const String newsUnLike = "$API_BASE_PATH/NBANews/unLike";
  static const String sendReviews = "$API_BASE_PATH/NBANews/sendReviews";
  static const String deleteReviews = "$API_BASE_PATH/NBANews/deleteReviews";
  static const String likeReviews = "$API_BASE_PATH/NBANews/likeReviews";
  static const String getGuessInfos =
      "$API_BASE_PATH/NBANews/getGuessInfos"; //历史竞猜记录
  static const String getGuessGamesInfo =
      "$API_BASE_PATH/NBANews/getGuessGamesInfo"; //picks首页竞猜列表
  static const String guess = "$API_BASE_PATH/NBANews/guess";
  static const String getRedisRankInfo = "$API_BASE_PATH/NBANews/getRedisRankInfo";

  static const String getAward = "$API_BASE_PATH/NBANews/getTodayAward";
  //NBAData
  static const String teamRank = "$API_BASE_PATH/NBAData/queryNBATeamRank";
  static const String playerStats =
      "$API_BASE_PATH/NBAData/getNBAPlayerRankJSONInfo";
  static const String getNBAPlayerInfo =
      "$API_BASE_PATH/NBAData/getNBAPlayerInfo";
  static const String getRecentAvg = "$API_BASE_PATH/NBAData/getRecentAvg";

  /// config
  static const String cNewsBanner = "$CONFIG_BASE_PATH/HightlightNews.json";
  static const String cNewsDefine = "$CONFIG_BASE_PATH/NewsDefine.json";
  static const String cNBATeamDefine = "$CONFIG_BASE_PATH/NBATeamDefine.json";
}
