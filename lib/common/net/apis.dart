/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-10-17 18:45:08
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
  static const String getTeamSimple = "$API_BASE_PATH/team/getTeamSimple";

  //NBANews
  static const String getNewsList = "$API_BASE_PATH/NBANews/getNBANews";
  static const String getNewsDetail = "$API_BASE_PATH/NBANews/viewNews";
  static const String newsLike = "$API_BASE_PATH/NBANews/like";
  static const String newsUnLike = "$API_BASE_PATH/NBANews/unLike";
  static const String sendReviews = "$API_BASE_PATH/NBANews/sendReviews";
  static const String deleteReviews = "$API_BASE_PATH/NBANews/deleteReviews";
  static const String likeReviews = "$API_BASE_PATH/NBANews/likeReviews";
  static const String newsFlow = "$API_BASE_PATH/NBANews/newsFlow";
  static const String newsGuess = "$API_BASE_PATH//NBANews/getNewsGuess";
  static const String getReviewsByNewsId =
      "$API_BASE_PATH//NBANews/getReviewsByNewsId";
  static const String getGuessInfos =
      "$API_BASE_PATH/NBANews/getGuessInfos"; //历史竞猜记录
  static const String getGuessGamesInfo =
      "$API_BASE_PATH/NBANews/getGuessGamesInfo"; //picks首页竞猜列表
  static const String guess = "$API_BASE_PATH/NBANews/guess";
  static const String getRedisRankInfo =
      "$API_BASE_PATH/NBANews/getRedisRankInfo";
  static const String getGuessAward = "$API_BASE_PATH/NBANews/getGuessAward";
  static const String getGuessAllAward =
      "$API_BASE_PATH/NBANews/getGuessAllAward";
  static const String getRankRewards = "$API_BASE_PATH/NBANews/getRankRewards";

  static const String getAward = "$API_BASE_PATH/NBANews/getTodayAward";

  //NBAData
  static const String teamStatRank =
      "$API_BASE_PATH/NBAData/queryNBATeamStatRank";
  static const String teamRank = "$API_BASE_PATH/NBAData/queryNBATeamRank";

  static const String playerStats =
      "$API_BASE_PATH/NBAData/getNBAPlayerRankJSONInfo";
  static const String getNBAPlayerInfo =
      "$API_BASE_PATH/NBAData/getNBAPlayerInfo";
  static const String getRecentAvg = "$API_BASE_PATH/NBAData/getRecentAvg";
  static const String getNBAPlayerBaseInfo =
      "$API_BASE_PATH/NBAData/getNBAPlayerBaseInfo";

  /// config
  static const String cNewsBanner = "$CONFIG_BASE_PATH/HightlightNews.json";
  static const String cNewsDefine = "$CONFIG_BASE_PATH/NewsDefine.json";
  static const String cNBATeamDefine = "$CONFIG_BASE_PATH/NBATeamDefine.json";
  static const String cGameRankAwardRule =
      "$CONFIG_BASE_PATH/GameRankAwardRule.json";
  static const String cGetPropDefine = "$CONFIG_BASE_PATH/PropDefine.json";
  static const String cRewardGroup = "$CONFIG_BASE_PATH/RewardGroup.json";
  static const String cTrainTask = "$CONFIG_BASE_PATH/TrainTask.json";
  static const String cTrainDefine = "$CONFIG_BASE_PATH/TrainDefine.json";

  /// TeamPlayer
  static const String getTeamPlayerByUUID =
      "$API_BASE_PATH/TeamPlayer/getTeamPlayerByUUID";
  static const String getTrainingInfo =
      "$API_BASE_PATH/TeamPlayer/getTrainingInfo";
  static const String playerTraining =
      "$API_BASE_PATH/TeamPlayer/playerTraining";
  static const String getTeamPlayerList =
      "$API_BASE_PATH/TeamPlayer/getTeamPlayerList";

  ///trade
  static const String getTradeInfo = "$API_BASE_PATH/Trade/getTradeInfo";
  static const String buyPlayer = "$API_BASE_PATH/Trade/buyPlayer";
  static const String sellPlayer = "$API_BASE_PATH/Trade/sellPlayer";

}
