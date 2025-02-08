/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2025-02-06 16:50:53
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
  static const String getTeamProp = "$API_BASE_PATH/team/getTeamProp";
  static const String getSeasonRankInfo =
      '$API_BASE_PATH/team/getSeasonRankInfo';
  static const String getSeasonRankAward =
      '$API_BASE_PATH/team/getSeasonRankAward';

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
  static const String getRelevantNews =
      "$API_BASE_PATH/NBANews/getRelevantNews";
  static const String getGuessRankByCycle =
      "$API_BASE_PATH/NBANews/getGuessRankByCycle";
  static const String shareGuess = "$API_BASE_PATH/NBANews/shareGuess";
  static const String shareNews = "$API_BASE_PATH/NBANews/shareNews";

  ///NBAData
  static const String statTeamRank =
      "$API_BASE_PATH/NBAData/getNBATeamPerGameAndTotalInfo";
  static const String teamRank = "$API_BASE_PATH/NBAData/queryNBATeamRank";

  static const String playerStats =
      "$API_BASE_PATH/NBAData/getNBAPlayerPerGameAndTotalsInfo";
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
  static const String getNBATeamInfo = "$API_BASE_PATH/NBAData/getNBATeamInfo";
  static const String scheduleChoose = "$API_BASE_PATH/NBAData/scheduleChoose";
  static const String getNBAPlayerOverAllPerGameData =
      "$API_BASE_PATH/NBAData/getNBAPlayerOverAllPerGameData";
  static const String getNBAGameLogByTeamId =
      "$API_BASE_PATH/NBAData/getNBAGameLogByTeamId";

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
  static const String cGradeInStamina = "$CONFIG_BASE_PATH/GradeInStamina.json";
  static const String cCupDefine = "$CONFIG_BASE_PATH/CupDefine.json";
  static const String cDanMaKu = "$CONFIG_BASE_PATH/DanMaKu.json";
  static const String cCardPackDefine = "$CONFIG_BASE_PATH/CardPackDefine.json";
  static const String cSourceTranslate =
      "$CONFIG_BASE_PATH/SourceTranslate.json";
  static const String cInboxMessage = "$CONFIG_BASE_PATH/InboxMessage.json";
  static const String cPlayerBookRule = "$CONFIG_BASE_PATH/PlayerBookRule.json";
  static const String cPlayerBookExpRule =
      "$CONFIG_BASE_PATH/PlayerBookExpRule.json";
  static const String cGameConstant = "$CONFIG_BASE_PATH/GameConstant.json";
  static const String cPlayerPowerRateDefine =
      "$CONFIG_BASE_PATH/PlayerPowerRateDefine.json";
  static const String cHelp = "$CONFIG_BASE_PATH/Help.json";
  static const String cDailyTaskWheel = "$CONFIG_BASE_PATH/DailyTaskWheel.json";
  static const String cWheelRewardType =
      "$CONFIG_BASE_PATH/WheelRewardType.json";
  static const String cMissionDefine = "$CONFIG_BASE_PATH/MissionDefine.json";
  static const String cWheelRandomReward =
      "$CONFIG_BASE_PATH/WheelRandomReward.json";

  /// TeamPlayer
  static const String getTeamPlayerByUUID =
      "$API_BASE_PATH/TeamPlayer/getTeamPlayerByUUID";
  static const String getTrainingInfo =
      "$API_BASE_PATH/TeamPlayer/getTrainingInfo";
  static const String playerTraining =
      "$API_BASE_PATH/TeamPlayer/playerTraining";
  static const cancelTactic = "$API_BASE_PATH/TeamPlayer/cancelTactic";
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
  static const String getTeamPlayerUpStarVO =
      "/p/TeamPlayer/getTeamPlayerUpStarVO";
  static const String continueStarUp = "/p/TeamPlayer/continueStarUp";
  static const String starUpDone = "/p/TeamPlayer/starUpDone";

  static const String getCardPackInfo = "$API_BASE_PATH/match/getCardPackInfo";
  static const String activeBox = "$API_BASE_PATH/match/activeBox";
  static const String getFreeGift = "$API_BASE_PATH/match/getFreeGift";
  static const String openCardPack = "$API_BASE_PATH/match/openCardPack";
  static const String speedOpenCardPack =
      "$API_BASE_PATH/match/speedOpenCardPack";
  static const String dismissPlayer =
      "$API_BASE_PATH/TeamPlayer/dismissTeamPlayerPack";
  static const String getTeamPlayerCollect =
      "$API_BASE_PATH/TeamPlayer/getTeamPlayerCollect";
  static const String composeTeamPlayer =
      "$API_BASE_PATH/TeamPlayer/composeTeamPlayer";
  static const String destroyTeamPlayer =
      "$API_BASE_PATH/TeamPlayer/destroyTeamPlayer";

  ///trade
  static const String getTradeInfo = "$API_BASE_PATH/Trade/getTradeInfo";
  static const String buyPlayer = "$API_BASE_PATH/Trade/buyPlayer";
  static const String sellPlayer = "$API_BASE_PATH/Trade/sellPlayer";

  ///match
  static const String teamMatch = "$API_BASE_PATH/match/teamMatch";
  static const String getGameSchedules =
      "$API_BASE_PATH/match/getGameSchedules";
  static const String getGameResultInfo =
      "$API_BASE_PATH/match/getGameResultInfo";
  static const String getNowSeason = "$API_BASE_PATH/match/getSeason";
  static const String closeCard = "$API_BASE_PATH/match/closeCard";

  ///league
  static const String getNBAGameSchedules =
      "$API_BASE_PATH/NBAData/getNBAGameSchedules";

  ///turntable
  static const String getTurntableInfo =
      "$API_BASE_PATH/turntable/getTurntableInfo";
  static const String turntable = "$API_BASE_PATH/turntable/turntable";
  static const String reLife = "$API_BASE_PATH/turntable/reLife";
  static const String claimRewards = "$API_BASE_PATH/turntable/claimRewards";
  static const String giveUp = "$API_BASE_PATH/turntable/giveUp";

  ///mission
  static const String getTeamMissionList =
      "$API_BASE_PATH/mission/getTeamMissionList";
  static const String getTeamMissionAward =
      "$API_BASE_PATH/mission/getTeamMissionAward";

  ///WebSocket
  static const String wsJazminError = "jazmin.error"; //接口错误
  static const String wsHeartBeat = "TeamService.heartBeat";
  static const String wsAuthAccount = "TeamService.authAccount";

  static const String wsPkStartUpdated = "PushService.pkStartUpdated";//战斗开始
  static const String wsPkEventUpdated = "PushService.pkEventUpdated";//战中事件
  static const String wsPkResultUpdated = "PushService.pkResultUpdated";//战斗结果
  static const String wsPkStopUpdated = "PushService.pkStopUpdated";//战斗结束
  static const String wsPkPlayerUpdated = "PushService.pkPlayerUpdated"; //战斗换人
  static const String wsTeamPropUpdated = "PushService.teamPropUpdated"; //物品更新事件
  static const String wsTeamPlayerUpdated = "PushService.teamPlayerUpdated"; //球员更新
  static const String wsTeamPlayerBatchUpdated = "PushService.teamPlayerBatchUpdated"; //球员批量更新
  static const String wsMissionUpdate = "PushService.missionUpdate"; //任务更新

  static const String wsTeamMatch = "PKService.teamMatch";
}
