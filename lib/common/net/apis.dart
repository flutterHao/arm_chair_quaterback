/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-12-04 15:53:54
 */
class Api {
  /// base
  static const String API_BASE_PATH = "/p";
  static const String CONFIG_BASE_PATH = "/config";

  /// api
  static const String authAccount = '$API_BASE_PATH/account/authAccount';

  ///team
  static const String login = "$API_BASE_PATH/team/teamLogin";
  static const String visitorLogin = "$API_BASE_PATH/team/visitorLogin";
  static const String getTeamSimple = "$API_BASE_PATH/team/getTeamSimple";
  static const String getTeamLoginInfo = "$API_BASE_PATH/team/getTeamLoginInfo";
  static const String getTeamInfo = "$API_BASE_PATH/team/getTeamInfo";
  static const String updateTeamInfo = "$API_BASE_PATH/team/updateTeamInfo";

  ///NBANews
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
  static const String getSonReviews = "$API_BASE_PATH//NBANews/getSonReviews";
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
  static const String getGuessTopReviews =
      "$API_BASE_PATH/NBANews/getGuessTopReviews";

  ///NBAData
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
  static const String getNBAPlayerSeasonGameData =
      "$API_BASE_PATH/NBAData/getNBAPlayerSeasonGameData";
  static const String getNBAGameData = "$API_BASE_PATH/NBAData/getNBAGameData";
  static const String getNotStartGameData =
      "$API_BASE_PATH/NBAData/getNotStartGameData";
  static const String getNBAGameHeaderData =
      "$API_BASE_PATH/NBAData/getNBAGameHeaderData";
  static const String getNBAGamePicks =
      "$API_BASE_PATH/NBAData/getNBAGamePicks";
  static const String queryNBAGameSchedulesInfo =
      "$API_BASE_PATH/NBAData/queryNBAGameSchedulesInfo";

  /// config
  static const String cNewsBanner = "$CONFIG_BASE_PATH/HightlightNews.json";
  static const String cPickDefine = "$CONFIG_BASE_PATH/PickDefine.json";
  static const String cNBATeamDefine = "$CONFIG_BASE_PATH/NBATeamDefine.json";
  static const String cGameRankAwardRule =
      "$CONFIG_BASE_PATH/GameRankAwardRule.json";
  static const String cGetPropDefine = "$CONFIG_BASE_PATH/PropDefine.json";
  static const String cRewardGroup = "$CONFIG_BASE_PATH/RewardGroup.json";
  static const String cTrainTask = "$CONFIG_BASE_PATH/TrainTask.json";
  static const String cTrainDefine = "$CONFIG_BASE_PATH/TrainDefine.json";
  static const String cStarUpDefine = "$CONFIG_BASE_PATH/StarUpDefine.json";
  static const String cGradeInStarDefine =
      "$CONFIG_BASE_PATH/GradeInStarDefine.json";
  static const String cTeamRuleConfig = "$CONFIG_BASE_PATH/TeamRuleConfig.json";
  static const String cPlayerStatsDefine =
      "$CONFIG_BASE_PATH/PlayerStatsDefine.json";
  static const String cPickType = "$CONFIG_BASE_PATH/PickType.json";
  static const String cErrorCode = "$CONFIG_BASE_PATH/ErrorCode.json";
  static const String cTacticsDefine = "$CONFIG_BASE_PATH/TacticsDefine.json";
  static const String cGameEvent = "$CONFIG_BASE_PATH/GameEvent.json";
  static const String cCompetitionVenue =
      "$CONFIG_BASE_PATH/CompetitionVenue.json";
  static const String cTaticsCombine = "$CONFIG_BASE_PATH/TaticsCombine.json";

  /// TeamPlayer
  static const String getTeamPlayerByUUID =
      "$API_BASE_PATH/TeamPlayer/getTeamPlayerByUUID";
  static const String getTrainingInfo =
      "$API_BASE_PATH/TeamPlayer/getTrainingInfo";
  static const String playerTraining =
      "$API_BASE_PATH/TeamPlayer/playerTraining";
  static const String getTeamPlayerList =
      "$API_BASE_PATH/TeamPlayer/getTeamPlayerList";
  static const String upStarTeamPlayer =
      "$API_BASE_PATH/TeamPlayer/upStarTeamPlayer";
  static const String getAllTeamPlayersByUpStar =
      "$API_BASE_PATH/TeamPlayer/getAllTeamPlayersByUpStar";
  static const String getAllTeamPlayerByTrend =
      "$API_BASE_PATH/TeamPlayer/getAllTeamPlayerByTrend";
  static const String replyPower = "$API_BASE_PATH/TeamPlayer/replyPower";
  static const String getTeamPlayers =
      "$API_BASE_PATH/TeamPlayer/getTeamPlayers";
  static const changeTeamPlayer = "$API_BASE_PATH/TeamPlayer/changeTeamPlayer";
  static const getPlayerUpGradeInfo =
      "$API_BASE_PATH/TeamPlayer/getPlayerUpGradeInfo";
  static const String buyTrainingBall =
      "$API_BASE_PATH/TeamPlayer/buyTrainingBall";
  static const String chooseTactic = "/p/TeamPlayer/chooseTactic";

  static const String getCardPackInfo = "$API_BASE_PATH/match/getCardPackInfo";
  static const String activeBox = "$API_BASE_PATH/match/activeBox";
  static const String getFreeGift = "$API_BASE_PATH/match/getFreeGift";
  static const String openCardPack = "$API_BASE_PATH/match/openCardPack";
  static const String speedOpenCardPack =
      "$API_BASE_PATH/match/speedOpenCardPack";

  ///trade
  static const String getTradeInfo = "$API_BASE_PATH/Trade/getTradeInfo";
  static const String buyPlayer = "$API_BASE_PATH/Trade/buyPlayer";
  static const String sellPlayer = "$API_BASE_PATH/Trade/sellPlayer";

  ///match
  static const String teamMatch = "$API_BASE_PATH/match/teamMatch";

  ///league
  static const String getNBAGameSchedules =
      "$API_BASE_PATH/NBAData/getNBAGameSchedules";

  ///WebSocket
  static const String wsJazminError = "jazmin.error"; //接口错误
  static const String wsHeartBeat = "TeamService.heartBeat";
  static const String wsAuthAccount = "TeamService.authAccount";

  static const String wsPkStartUpdated = "PushService.pkStartUpdated";
  static const String wsPkEventUpdated = "PushService.pkEventUpdated";
  static const String wsPkResultUpdated = "PushService.pkResultUpdated";
  static const String wsPkStopUpdated = "PushService.pkStopUpdated";
  static const String wsPkPlayerUpdated = "PushService.pkPlayerUpdated";//换人

  static const String wsTeamMatch = "PKService.teamMatch";
}
