import 'package:arm_chair_quaterback/common/entities/api_error_code_entity.dart';
import 'package:arm_chair_quaterback/common/entities/app_image_version_entity.dart';
import 'package:arm_chair_quaterback/common/entities/competition_venue_entity.dart';
import 'package:arm_chair_quaterback/common/entities/config/card_pack_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/config/game_constant_entity.dart';
import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/config/wheel_random_reward_entity.dart';
import 'package:arm_chair_quaterback/common/entities/cup_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/daily_task_wheel_entity.dart';
import 'package:arm_chair_quaterback/common/entities/dan_ma_ku_entity.dart';
import 'package:arm_chair_quaterback/common/entities/game_event_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_chat_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_dialogue_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girls_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_gift_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/grade_in_stamina_entity.dart';
import 'package:arm_chair_quaterback/common/entities/grade_in_star_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/help_entity.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';
import 'package:arm_chair_quaterback/common/entities/jump_defined_entity.dart';
import 'package:arm_chair_quaterback/common/entities/mission_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_source_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pick_type_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_book_exp_rule_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_collect_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_power_rate_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_status_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/reward_group_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_num_defined_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_rule_config_entity.dart';
import 'package:arm_chair_quaterback/common/entities/wheel_reward_type_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';

class CacheApi {
  ///获取所有球队
  static Map<int, NbaTeamEntity>? teamDefineMap;
  static List<NbaTeamEntity> teamList = [];

  ///获取所有球员信息
  static NbaPlayerInfosEntity? playerInfo;

  ///新闻定义
  static PicksDefineEntity? pickDefine;

  static List<PickTypeEntity>? pickType;
  static List<ApiErrorCodeEntity>? apiErrorCode;

  ///道具定义
  static List<PropDefineEntity>? propDefineList;
  static Map<int, PropDefineEntity> propDefineMap = {};

  static List<RankAwardEntity>? gameRankAwardRuleList;

  static List<TeamRuleConfigEntity>? teamRuleConfigList;

  static List<RewardGroupEntity>? rewardGroupList;

  static List<StarUpDefineEntity>? starUpDefines;
  static List<GradeInStarDefineEntity>? gradeInStars;
  static Map<int, PlayerStatusEntity> playerStatusMap = {};

  static List<GameEventEntity> gameEvents = [];

  static List<CompetitionVenueEntity> competitionVenues = [];
  static List<GradeInStaminaEntity> gradeInStaminaList = [];
  static List<CupDefineEntity> cupDefineList = [];
  static List<DanMaKuEntity> danMaKuList = [];
  static Map<int, CardPackDefineEntity> cardPackDefineMap = {};
  static List<NewsSourceEntity> newsSourceList = [];
  static List<InboxMessageEntity> inboxMessageList = [];
  static List<DailyTaskWheelEntity> dailyTaskWheelList = [];
  static List<WheelRewardTypeEntity> wheelRewardTypeList = [];
  static Map<int, PlayerCollectCollects> playerBookRuleMap = {};
  static List<PlayerCollectCollects> playerBookRuleList = [];
  static List<MissionDefineEntity> missionDefineList = [];
  static List<GameConstantEntity> gameConstantList = [];
  static List<WheelRandomRewardEntity> wheelRandomRewardList = [];
  static List<JumpDefinedEntity> jumpDefinedList = [];
  static List<StarUpNumDefinedEntity> starUpNumDefinedList = [];

  static List<PlayerBookExpRuleEntity> playerBookExpRuleList = [];
  static Map<String, PlayerPowerRateDefineEntity> playerPowerRateDefineMap = {};
  static Map<int, HelpEntity> helpMap = {};
  static List<GirlsDefineEntity> girlsDefineList = [];
  static List<GirlDialogueDefineEntity> girlChatList = [];
  static Map<int, GirlDialogueDefineEntity> girlDefineMap = {};

  static Future<void> init() async {
    await Future.wait([
      getErrorCode(),
      getNBATeamDefine(),
      getNBAPlayerInfo(),
      // getNewsDefine(),
      getPropDefine(),
      getGameRankAwardRule(),
    ]).then((v) {
      Log.d("获取配置数据成功");
    });
  }

  ///获取球队列表
  static Future<dynamic> getNBATeamDefine({bool getList = false}) async {
    if (teamList.isNotEmpty && getList) {
      return teamList;
    }
    if (teamDefineMap != null) {
      return teamDefineMap!;
    }
    List data = await httpUtil.get(Api.cNBATeamDefine);
    teamList = data.map((e) => NbaTeamEntity.fromJson(e)).toList();
    if (getList) return teamList;
    teamDefineMap = teamList.fold({}, (previousValue, element) {
      previousValue?[element.id] = element;
      return previousValue;
    });
    return teamDefineMap!;
  }

  ///获取球员数据
  static Future<NbaPlayerInfosEntity> getNBAPlayerInfo() async {
    if (playerInfo != null) {
      return playerInfo!;
    }
    var json = await httpUtil.post(Api.getNBAPlayerInfo);
    playerInfo = NbaPlayerInfosEntity.fromJson(json);
    return playerInfo!;
    // return playerInfo;
  }

  ///
  static Future<PicksDefineEntity> getPickDefine() async {
    if (pickDefine != null) {
      return pickDefine!;
    }
    List json = await httpUtil.get(Api.cPickDefine);
    pickDefine = PicksDefineEntity.fromJson(json[0]);
    return pickDefine!;
  }

  static Future<List<PickTypeEntity>> getPickType() async {
    if (pickType != null) {
      return pickType!;
    }
    List json = await httpUtil.get(Api.cPickType);
    pickType = json.map((e) => PickTypeEntity.fromJson(e)).toList();
    return pickType!;
  }

  ///排行奖励规则
  static Future<List<RankAwardEntity>> getGameRankAwardRule() async {
    if (gameRankAwardRuleList?.isNotEmpty == true) {
      return gameRankAwardRuleList!;
    }
    List json = await httpUtil.get(Api.cGameRankAwardRule);
    return gameRankAwardRuleList =
        json.map((e) => RankAwardEntity.fromJson(e)).toList();
  }

  ///道具定义
  static Future<List<PropDefineEntity>> getPropDefine() async {
    if (propDefineList?.isNotEmpty == true) return propDefineList!;
    List list = await httpUtil.get(Api.cGetPropDefine);
    propDefineList = list.map((e) => PropDefineEntity.fromJson(e)).toList();
    propDefineMap = {for (var e in propDefineList!) e.propId: e};
    return propDefineList!;
  }

  ///Slot奖励组
  static Future<List<RewardGroupEntity>> getRewardGroup() async {
    if (rewardGroupList?.isNotEmpty == true) return rewardGroupList!;
    List list = await httpUtil.get(Api.cRewardGroup);
    return rewardGroupList =
        list.map((e) => RewardGroupEntity.fromJson(e)).toList();
  }

  static Future<List<StarUpDefineEntity>> getStarUpDefine() async {
    if (starUpDefines == null) {
      List json = await httpUtil.post(Api.cStarUpDefine);
      starUpDefines = json.map((e) => StarUpDefineEntity.fromJson(e)).toList();
    }
    return starUpDefines!;
  }

  static Future<List<GradeInStarDefineEntity>> getGradeInStarDefine() async {
    if (gradeInStars == null) {
      List json = await httpUtil.post(Api.cGradeInStarDefine);
      gradeInStars =
          json.map((e) => GradeInStarDefineEntity.fromJson(e)).toList();
    }
    return gradeInStars!;
  }

  static Future<List<TeamRuleConfigEntity>> getTeamRuleConfig() async {
    if (teamRuleConfigList?.isNotEmpty == true) return teamRuleConfigList!;
    List list = await httpUtil.get(Api.cTeamRuleConfig);
    teamRuleConfigList =
        list.map((e) => TeamRuleConfigEntity.fromJson(e)).toList();
    return teamRuleConfigList!;
  }

  ///获取球员状态定义
  static Future<Map<int, PlayerStatusEntity>> getPlayerStatusConfig() async {
    if (playerStatusMap.isNotEmpty) return playerStatusMap;
    List data = await HttpUtil().post(Api.cPlayerStatsDefine);
    var statusList = data.map((e) => PlayerStatusEntity.fromJson(e)).toList();
    playerStatusMap = {for (var item in statusList) item.statsId: item};
    return playerStatusMap;
  }

  static Future<List<ApiErrorCodeEntity>> getErrorCode() async {
    if (apiErrorCode != null) {
      return apiErrorCode!;
    }
    List json = await httpUtil.get(Api.cErrorCode);
    apiErrorCode = json.map((e) => ApiErrorCodeEntity.fromJson(e)).toList();
    return apiErrorCode!;
  }

  /// 获取战斗文字直播配置
  static Future<List<GameEventEntity>> getGameEvent() async {
    if (gameEvents.isNotEmpty) {
      return gameEvents;
    }
    List json = await httpUtil.get(Api.cGameEvent);
    gameEvents = json.map((e) => GameEventEntity.fromJson(e)).toList();
    return gameEvents;
  }

  /// 获取战斗位置配置
  static Future<List<CompetitionVenueEntity>> getCompetitionVenue() async {
    if (competitionVenues.isNotEmpty) {
      return competitionVenues;
    }
    List json = await httpUtil.get(Api.cCompetitionVenue);
    competitionVenues =
        json.map((e) => CompetitionVenueEntity.fromJson(e)).toList();
    return competitionVenues;
  }

  ///球员耐力等级
  static Future<List<GradeInStaminaEntity>> getGradeInStamina() async {
    if (gradeInStaminaList.isNotEmpty) {
      return gradeInStaminaList;
    }
    List list = await HttpUtil().post(Api.cGradeInStamina);
    gradeInStaminaList =
        list.map((e) => GradeInStaminaEntity.fromJson(e)).toList();
    return gradeInStaminaList;
  }

  ///球员耐力等级
  static Future<List<CupDefineEntity>> getCupDefine() async {
    if (cupDefineList.isNotEmpty) {
      return cupDefineList;
    }
    List list = await HttpUtil().post(Api.cCupDefine);
    cupDefineList = list.map((e) => CupDefineEntity.fromJson(e)).toList();
    return cupDefineList;
  }

  ///战斗普通弹幕
  static Future<List<DanMaKuEntity>> getDanMaKu() async {
    if (danMaKuList.isNotEmpty) {
      return danMaKuList;
    }
    List list = await HttpUtil().post(Api.cDanMaKu);
    danMaKuList = list.map((e) => DanMaKuEntity.fromJson(e)).toList();
    return danMaKuList;
  }

  static Future<Map<int, CardPackDefineEntity>> getCardPackDefine() async {
    if (cardPackDefineMap.isNotEmpty) {
      return cardPackDefineMap;
    }
    List list = await HttpUtil().post(Api.cCardPackDefine);
    cardPackDefineMap = {
      for (var item in list)
        CardPackDefineEntity.fromJson(item).cardPackID:
            CardPackDefineEntity.fromJson(item)
    };
    return cardPackDefineMap;
  }

  static Future<List<NewsSourceEntity>> getNewsSourceList() async {
    if (newsSourceList.isNotEmpty) {
      return newsSourceList;
    }
    List list = await HttpUtil().post(Api.cSourceTranslate);
    newsSourceList =
        list.map((item) => NewsSourceEntity.fromJson(item)).toList();
    return newsSourceList;
  }

  static Future<List<InboxMessageEntity>> getInboxMessageList() async {
    if (inboxMessageList.isNotEmpty) {
      return inboxMessageList;
    }
    List list = await HttpUtil().post(Api.cInboxMessage);
    return inboxMessageList =
        list.map((item) => InboxMessageEntity.fromJson(item)).toList();
  }

  /// 每日任务转盘
  static Future<List<DailyTaskWheelEntity>> getDailyTaskWheel() async {
    if (dailyTaskWheelList.isNotEmpty) {
      return dailyTaskWheelList;
    }
    List list = await HttpUtil().post(Api.cDailyTaskWheel);
    return dailyTaskWheelList =
        list.map((item) => DailyTaskWheelEntity.fromJson(item)).toList();
  }

  /// 每日任务转盘奖励
  static Future<List<WheelRewardTypeEntity>> getWheelRewardType() async {
    if (wheelRewardTypeList.isNotEmpty) {
      return wheelRewardTypeList;
    }
    List list = await HttpUtil().post(Api.cWheelRewardType);
    return wheelRewardTypeList =
        list.map((item) => WheelRewardTypeEntity.fromJson(item)).toList();
  }

  static Future<Map<int, PlayerCollectCollects>> getPlayerBookRuleList() async {
    if (playerBookRuleMap.isNotEmpty) {
      return playerBookRuleMap;
    }
    List list = await HttpUtil().post(Api.cPlayerBookRule);
    playerBookRuleList =
        list.map((item) => PlayerCollectCollects.fromJson(item)).toList();
    playerBookRuleMap = {
      for (var item in playerBookRuleList) item.playerId: item
    };
    return playerBookRuleMap;
  }

  static Future<List<PlayerBookExpRuleEntity>>
      getPlayerBookExpRuleList() async {
    if (playerBookExpRuleList.isNotEmpty) {
      return playerBookExpRuleList;
    }
    List list = await HttpUtil().post(Api.cPlayerBookExpRule);
    return playerBookExpRuleList =
        list.map((item) => PlayerBookExpRuleEntity.fromJson(item)).toList();
  }

  static Future<Map<String, PlayerPowerRateDefineEntity>>
      playerPowerRateDefine() async {
    if (playerPowerRateDefineMap.isNotEmpty) {
      return playerPowerRateDefineMap;
    }
    List list = await HttpUtil().post(Api.cPlayerPowerRateDefine);
    var playerPowerRateDefineList =
        list.map((item) => PlayerPowerRateDefineEntity.fromJson(item)).toList();
    playerPowerRateDefineMap = {
      for (var item in playerPowerRateDefineList) item.backUp: item
    };
    return playerPowerRateDefineMap;
  }

  static Future<Map<int, HelpEntity>> getHelpConfig() async {
    if (helpMap.isNotEmpty) {
      return helpMap;
    }
    List list = await HttpUtil().post(Api.cHelp);
    List<HelpEntity> helps = list.map((e) => HelpEntity.fromJson(e)).toList();
    helpMap = {for (var item in helps) item.helpId: item};
    return helpMap;
  }

  /// 每日任务
  static Future<List<MissionDefineEntity>> getMissionDefine() async {
    if (missionDefineList.isNotEmpty) {
      return missionDefineList;
    }
    List list = await HttpUtil().post(Api.cMissionDefine);
    return missionDefineList =
        list.map((item) => MissionDefineEntity.fromJson(item)).toList();
  }

  /// 游戏常量表
  static Future<List<GameConstantEntity>> getGameConstant() async {
    if (gameConstantList.isNotEmpty) {
      return gameConstantList;
    }
    List list = await HttpUtil().post(Api.cGameConstant);
    return gameConstantList =
        list.map((item) => GameConstantEntity.fromJson(item)).toList();
  }

  /// 转盘随机奖励配置表
  static Future<List<WheelRandomRewardEntity>> getWheelRandomReward() async {
    if (wheelRandomRewardList.isNotEmpty) {
      return wheelRandomRewardList;
    }
    List list = await HttpUtil().post(Api.cWheelRandomReward);
    return wheelRandomRewardList =
        list.map((item) => WheelRandomRewardEntity.fromJson(item)).toList();
  }

  ///获取图片版本
  static Future<List<AppImageVersionEntity>> getAppImageVersion() async {
    List list = await HttpUtil().post(Api.cAppImageVersion);
    return list.map((item) => AppImageVersionEntity.fromJson(item)).toList();
  }

  /// 跳转表
  static Future<List<JumpDefinedEntity>> getJumpDefine() async {
    if (jumpDefinedList.isNotEmpty) {
      return jumpDefinedList;
    }
    List list = await HttpUtil().post(Api.cJumpDefine);
    return jumpDefinedList =
        list.map((item) => JumpDefinedEntity.fromJson(item)).toList();
  }

  ///获取翻译表
  static Future<List> getcLanguages() async {
    List res = await HttpUtil().post(Api.cLanguages);
    return res;
  }

  static Future<List<GirlsDefineEntity>> getGirlsDefine() async {
    if (girlsDefineList.isNotEmpty) {
      return girlsDefineList;
    }
    List list = await HttpUtil().post(Api.cGirlsDefine);
    return girlsDefineList =
        list.map((item) => GirlsDefineEntity.fromJson(item)).toList();
  }

  static Future<List<GirlDialogueDefineEntity>> getGirlsChat() async {
    if (girlChatList.isNotEmpty && girlDefineMap.isNotEmpty) {
      return girlChatList;
    }
    List list = await HttpUtil().post(Api.cGirlChat);
    var result = girlChatList =
        list.map((item) => GirlDialogueDefineEntity.fromJson(item)).toList();
    girlDefineMap = {for (var item in girlChatList) item.id: item};
    return result;
  }

  /// 获取礼物表
  static Future<List<GirlGiftDefineEntity>> getGirlGiftDefine() async {
    List list = await HttpUtil().post(Api.cGirlGiftDefine);
    return list.map((item) => GirlGiftDefineEntity.fromJson(item)).toList();
  }

  /// 球员升星数值
  static Future<List<StarUpNumDefinedEntity>> getStarUpNumDefine() async {
    if (starUpNumDefinedList.isNotEmpty) {
      return starUpNumDefinedList;
    }
    List list = await HttpUtil().post(Api.cStarUpNumDefine);
    return starUpNumDefinedList =
        list.map((item) => StarUpNumDefinedEntity.fromJson(item)).toList();
  }

  /// 获取人物信息表
  static Future<List<GirlDefineEntity>> getGirlDefine() async {
    List list = await HttpUtil().post(Api.cGirlDefine);
    return list.map((item) => GirlDefineEntity.fromJson(item)).toList();
  }
}
