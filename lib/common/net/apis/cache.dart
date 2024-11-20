// import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
// import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
// import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
// import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
// import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
// import 'package:arm_chair_quaterback/common/entities/team_rank.dart';
// import 'package:arm_chair_quaterback/common/entities/team_rank/nba_team_rank.dart';
// import 'package:arm_chair_quaterback/common/net/apis.dart';
// import 'package:arm_chair_quaterback/common/net/http.dart';
// import 'package:arm_chair_quaterback/common/utils/logger.dart';

// class ConfigApi {
//   ///获取所有球队
//   static Map<int, >? teamDefineMap;
//   static List<Team> teamList = [];

//   ///获取所有球队信息
//   static NbaPlayerInfosEntity? playerInfo;

//   ///新闻定义
//   static NewsDefineEntity? newsDefine;

//   ///道具定义
//   static List<PropDefineEntity>? propDefineList;

//   ///排行奖励
//   static List<RankAwardEntity>? rankAwardEntity;

//   static Future<void> init() async {
//     await Future.wait([
//       getNBATeamDefine(),
//       getNBAPlayerInfo(),
//       getNewsDefine(),
//       getPropDefine(),
//       getGameRankAwardRule(),
//     ]).then((v) {
//       Log.d("获取配置数据成功");
//     }).catchError((e) {
//       Log.d("获取配置数据重新加载");
//       init();
//     });
//   }

//   ///获取球队列表
//   static Future<Map<int, TeamRank>> getNBATeamDefine() async {
//     if (teamDefineMap != null) {
//       return teamDefineMap!;
//     }
//     List data = await httpUtil.get(Api.cNBATeamDefine);
//     teamList = data.map((e) => TeamRank.fromJson(e)).toList();
//     teamDefineMap = teamList.fold({}, (previousValue, element) {
//       previousValue?[element.teamId!] = element;
//       return previousValue;
//     });
//     return teamDefineMap!;
//   }

//   ///获取球员数据
//   static Future<NbaPlayerInfosEntity> getNBAPlayerInfo() async {
//     if (playerInfo != null) {
//       return playerInfo!;
//     }
//     var json = await httpUtil.post(Api.getNBAPlayerInfo);
//     playerInfo = NbaPlayerInfosEntity.fromJson(json);
//     return playerInfo!;
//     // return playerInfo;
//   }

//   ///获取新闻定义
//   static Future<NewsDefineEntity> getNewsDefine() async {
//     if (newsDefine != null) {
//       return newsDefine!;
//     }
//     List json = await httpUtil.get(Api.cNewsDefine);
//     newsDefine = NewsDefineEntity.fromJson(json[0]);
//     return newsDefine!;
//   }

//   ///道具定义
//   static Future<List<PropDefineEntity>> getPropDefine() async {
//     List list = await httpUtil.get(Api.cGetPropDefine);
//     propDefineList = list.map((e) => PropDefineEntity.fromJson(e)).toList();
//     return propDefineList!;
//   }

//   ///排行奖励规则
//   static Future<List<RankAwardEntity>> getGameRankAwardRule() async {
//     if (propDefineList != null) {
//       return rankAwardEntity!;
//     }
//     List json = await httpUtil.get(Api.cGameRankAwardRule);
//     rankAwardEntity = json.map((e) => RankAwardEntity.fromJson(e)).toList();
//     return rankAwardEntity!;
//   }
// }

import 'package:arm_chair_quaterback/common/entities/api_error_code_entity.dart';
import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/grade_in_star_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pick_type_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_status_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/reward_group_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_rule_config_entity.dart';
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
  static PicksDefineEntity? _pickDefine;

  static List<PickTypeEntity>? pickType;
  static List<ApiErrorCodeEntity>? apiErrorCode;

  ///道具定义
  static List<PropDefineEntity>? propDefineList;

  static List<RankAwardEntity>? gameRankAwardRuleList;

  static List<TeamRuleConfigEntity>? teamRuleConfigList;

  static List<RewardGroupEntity>? rewardGroupList;

  static List<StarUpDefineEntity>? _starUpDefines;
  static List<GradeInStarDefineEntity>? _gradeInStars;
  static Map<int, PlayerStatusEntity> playerStatusMap = {};

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
    if (_pickDefine != null) {
      return _pickDefine!;
    }
    List json = await httpUtil.get(Api.cPickDefine);
    _pickDefine = PicksDefineEntity.fromJson(json[0]);
    return _pickDefine!;
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
    if (_starUpDefines == null) {
      List json = await httpUtil.post(Api.cStarUpDefine);
      _starUpDefines = json.map((e) => StarUpDefineEntity.fromJson(e)).toList();
    }
    return _starUpDefines!;
  }

  static Future<List<GradeInStarDefineEntity>> getGradeInStarDefine() async {
    if (_gradeInStars == null) {
      List json = await httpUtil.post(Api.cGradeInStarDefine);
      _gradeInStars =
          json.map((e) => GradeInStarDefineEntity.fromJson(e)).toList();
    }
    return _gradeInStars!;
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
    apiErrorCode = json.map((e)=> ApiErrorCodeEntity.fromJson(e)).toList();
    return apiErrorCode!;
  }
}
