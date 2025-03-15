/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2025-03-14 19:57:43
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
  static const String useTeamProp = "/p/TeamProp/useTeamProp";
  static const String getSeasonRankInfo =
      '$API_BASE_PATH/team/getSeasonRankInfo';
  static const String getSeasonRankAward =
      '$API_BASE_PATH/team/getSeasonRankAward';
  static const String likePlayer = '$API_BASE_PATH/team/likePlayer';
  static const String cancelLikingPlayer =
      '$API_BASE_PATH/team/cancelLikingPlayer';
  static const String randomOtherPlayers =
      '$API_BASE_PATH/team/randomOtherPlayers';
  static const String getTeamByAccountId =
      '$API_BASE_PATH/team/getTeamByAccountId';

  ///NBANews
  static const String getNewsList = "$API_BASE_PATH/NBANews/getNBANews";
  static const String getNewsDetail = "$API_BASE_PATH/NBANews/viewNews";
  static const String newsLike = "$API_BASE_PATH/NBANews/like";
  static const String newsUnLike = "$API_BASE_PATH/NBANews/unLike";
  static const String sendReviews = "$API_BASE_PATH/NBANews/sendReviews";
  static const String deleteReviews = "$API_BASE_PATH/NBANews/deleteReviews";
  static const String likeReviews = "$API_BASE_PATH/NBANews/likeReviews";
  static const String newsFlow = "$API_BASE_PATH/NBANews/newsFlow";
  static const String getReviewsByNewsId =
      "$API_BASE_PATH//NBANews/getReviewsByNewsId";
  static const String getSonReviews = "$API_BASE_PATH//NBANews/getSonReviews";

  static const String getRedisRankInfo =
      "$API_BASE_PATH/NBANews/getRedisRankInfo";

  static const String getRankRewards = "$API_BASE_PATH/NBANews/getRankRewards";
  static const String getAward = "$API_BASE_PATH/NBANews/getTodayAward";

  static const String getRelevantNews =
      "$API_BASE_PATH/NBANews/getRelevantNews";

  static const String shareNews = "$API_BASE_PATH/NBANews/shareNews";
  static const String getPlayerNews = "$API_BASE_PATH/NBANews/getPlayerNews";
  static const String sendEmoji = "$API_BASE_PATH/NBANews/sendEmoji";

  //Guess
  static const String newsGuess = "$API_BASE_PATH//Guess/getNewsGuess";
  static const String getNewsGuessInfo = "/p/Guess/getNewsGuessInfo";
  static const String getGuessInfos =
      "$API_BASE_PATH/Guess/getGuessInfos"; //历史竞猜记录
  static const String getGuessGamesInfo =
      "$API_BASE_PATH/Guess/getGuessGamesInfo"; //picks首页竞猜列表
  static const String getGuessTopReviews =
      "$API_BASE_PATH/Guess/getGuessTopReviews";
  static const String getGuessComment = "$API_BASE_PATH/Guess/getGuessComment";
  static const String sendGuessComment =
      "$API_BASE_PATH/Guess/sendGuessComment";
  static const String guess = "$API_BASE_PATH/Guess/guess";
  static const String getGuessAllAward =
      "$API_BASE_PATH/Guess/getGuessAllAward";
  static const String getGuessAward = "$API_BASE_PATH/Guess/getGuessAward";
  static const String shareGuess = "$API_BASE_PATH/Guess/shareGuess";
  static const String getGuessRankByCycle =
      "$API_BASE_PATH/Guess/getGuessRankByCycle";

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
  static const String getPlayerTrends =
      "$API_BASE_PATH/NBAData/getPlayerTrends";
  static const String getOVRRankPlayerInfo =
      "$API_BASE_PATH/NBAData/getOVRRankPlayerInfo";
  static const String getNBAGameSchedules =
      "$API_BASE_PATH/NBAData/getNBAGameSchedules";
  static const String getNBAPlayerOverAllPerGameData =
      "$API_BASE_PATH/NBAData/getNBAPlayerOverAllPerGameData";
  static const String getNBAGameLogByTeamId =
      "$API_BASE_PATH/NBAData/getNBAGameLogByTeamId";
  static const String queryPlayerGameYear =
      "$API_BASE_PATH/NBAData/queryPlayerGameYear";

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
  static const String cAppImageVersion =
      "$CONFIG_BASE_PATH/AppImageVersion.json";
  static const String cJumpDefine = "$CONFIG_BASE_PATH/JumpDefine.json";
  static const String cLanguages = "$CONFIG_BASE_PATH/Languages.json";
  static const String cGirlsDefine = "$CONFIG_BASE_PATH/GirlDefine.json";
  static const String cGirlChat = "$CONFIG_BASE_PATH/GirlDialogueDefine.json";
  static const String cGirlGiftDefine = "$CONFIG_BASE_PATH/GirlGiftDefine.json";
  static const String cStarUpNumDefine =
      "$CONFIG_BASE_PATH/StarUpNumDefine.json";
  static const String cGirlDefine = "$CONFIG_BASE_PATH/GirlDefine.json";
  static const String cBattlePassReward =
      "$CONFIG_BASE_PATH/BattlePassReward.json";
  static const String cBattlePassUdfReward =
      "$CONFIG_BASE_PATH/BattlePassUdfReward.json";

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
  static const String buySlotCount = "$API_BASE_PATH/TeamPlayer/buySlotCount";
  static const String getCardPackInfo = "$API_BASE_PATH/match/getCardPackInfo";
  static const String activeBox = "$API_BASE_PATH/match/activeBox";
  static const String getFreeGift = "$API_BASE_PATH/match/getFreeGift";
  static const String openCardPack = "$API_BASE_PATH/match/openCardPack";
  static const String getLastTimeStarUpList =
      "/p/TeamPlayer/getLastTimeStarUpList";
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
  static const String getPlayerStrengthRank =
      "$API_BASE_PATH/TeamPlayer/getPlayerStrengthRank";
  static const String getSlotStarUpEventVO =
      "/p/TeamPlayer/getSlotStarUpEventVO";

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
  static const String buyCardPack = "$API_BASE_PATH/match/buyCardPack";

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

  static const String wsPkStartUpdated = "PushService.pkStartUpdated"; //战斗开始
  static const String wsPkEventUpdated = "PushService.pkEventUpdated"; //战中事件
  static const String wsPkResultUpdated = "PushService.pkResultUpdated"; //战斗结果
  static const String wsPkStopUpdated = "PushService.pkStopUpdated"; //战斗结束
  static const String wsPkPlayerUpdated = "PushService.pkPlayerUpdated"; //战斗换人
  static const String wsTeamPropUpdated =
      "PushService.teamPropUpdated"; //物品更新事件
  static const String wsTeamPlayerUpdated =
      "PushService.teamPlayerUpdated"; //球员更新
  static const String wsTeamPlayerBatchUpdated =
      "PushService.teamPlayerBatchUpdated"; //球员批量更新
  static const String wsMissionUpdate = "PushService.missionUpdate"; //任务更新
  static const String wsTeamMatch = "PKService.teamMatch"; //战斗匹配
  static const String wsExitRoom = "ChatService.exitRoom"; //退出聊天室
  static const String wsEnterRoom = "ChatService.enterRoom"; //进入聊天室
  static const String wsGuessChatRoomUpdated =
      "PushService.guessChatRoomUpdated"; //竞猜消息推送
  static const String wsEnterOVRRoom = "ChatService.enterOVRRoom"; //进入OVR聊天室
  static const String wsExitOVRRoom = "ChatService.exitOVRRoom"; //退出OVR聊天室
  static const String wsOVRChatRoomUpdated =
      "PushService.OVRChatRoomUpdated"; //OVR消息推送
  static const String wsSimpleMessagePush =
      "PushService.simpleMessagePush"; //OVR消息推送

  ///InboxMail
  static const String getMailVOList = "$API_BASE_PATH/Mail/getMailVOList";
  static const String receiveMailAward = "$API_BASE_PATH/Mail/receiveMailAward";
  static const String readMail = "$API_BASE_PATH/Mail/readMail";
  static const String deleteMail = "$API_BASE_PATH/Mail/deleteMail";

  ///ChatMessage
  static const String getOVRRankChatMessages =
      "$API_BASE_PATH/ChatMessage/getOVRRankChatMessages";
  static const String sendOVRRankMessage =
      "$API_BASE_PATH/ChatMessage/sendOVRRankMessage";
  static const String getChatRoomList =
      "$API_BASE_PATH/ChatMessage/getChatRoomList";
  static const String setPinned = "$API_BASE_PATH/ChatMessage/setPinned";
  static const String delChatRoom = "$API_BASE_PATH/ChatMessage/delChatRoom";

  ///Girl
  static const String getSlotChatEventVO =
      "$API_BASE_PATH/Girl/getSlotChatEventVO";
  static const String nextMessage = "$API_BASE_PATH/Girl/nextMessage";

  ///Girl
  static const String getGivingGifts = "$API_BASE_PATH/Girl/givingGifts";
  static const String getQueryGirls = "$API_BASE_PATH/Girl/queryGirls";

  ///通行证模块
  static const String getBattlePassInfo = "$API_BASE_PATH/BattlePass/get";
  static const String chooseHomeTeam =
      "$API_BASE_PATH/BattlePass/chooseHomeTeam";
  static const String claimLevelReward =
      "$API_BASE_PATH/BattlePass/claimLevelReward";

  ///偷球员
  static const String getStealTeam = "$API_BASE_PATH/StealPlayer/getStealTeam";
  static const String steal = "$API_BASE_PATH/StealPlayer/steal";
}
