/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-09-18 18:33:37
 */
class Api {
  static const String authAccount = '/p/account/authAccount';
  static const String login = "/p/team/teamLogin";
  static const String visitorLogin = "/p/team/visitorLogin";
  static const String getNewsBanner = "/config/HightlightNews.json";
  static const String getNewsList = "/p/NBANews/getNBANews";
  static const String getNewsDetail = "/p/NBANews/viewNews";
  static const String newsLike = "/p/NBANews/like";
  static const String newsUnLike = "/pNBANews/unLike";
  static const String teamRank = "/p/NBAData/queryNBATeamRank";
  static const String playerStats = "/p/NBAData/queryNBAPlayerStats";
  static const String sendReviews = "/p/NBANews/sendReviews";
  static const String deleteReviews = "/p/NBANews/deleteReviews";
  static const String likeReviews = "/p/NBANews/likeReviews";
}
