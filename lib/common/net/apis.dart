/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-09-18 18:33:37
 */
class Api {

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
  static const String getGuessInfos = "$API_BASE_PATH/NBANews/getGuessInfos";
  //NBAData
  static const String teamRank = "$API_BASE_PATH/NBAData/queryNBATeamRank";
  static const String playerStats = "$API_BASE_PATH/NBAData/queryNBAPlayerStats";
  static const String getNBAPlayerInfo = "$API_BASE_PATH/NBAData/getNBAPlayerInfo";

  /// config
  static const String cNewsBanner = "$CONFIG_BASE_PATH/HightlightNews.json";
  static const String cNewsDefine = "$CONFIG_BASE_PATH/NewsDefine.json";
}
