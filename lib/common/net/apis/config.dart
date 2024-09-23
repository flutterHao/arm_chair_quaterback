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

import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';

class ConfigApi {
  ///获取所有球队
  static Map<int, NbaTeamEntity>? teamDefineMap;
  static List<NbaTeamEntity> teamList = [];

  ///获取所有球队信息
  static NbaPlayerInfosEntity? playerInfo;

  ///新闻定义
  static NbaPlayerInfosEntity? newsDefine;

  ///道具定义
  static List<PropDefineEntity>? propDefineList;

  static Future<void> init() async {
    await Future.wait([
      getNBATeamDefine(),
      getNBAPlayerInfo(),
      getNewsDefine(),
      getPropDefine(),
      getGameRankAwardRule(),
    ]).then((v) {
      Log.d("获取配置数据成功");
    });
  }

  ///获取球队列表
  static Future<Map<int, NbaTeamEntity>> getNBATeamDefine() async {
    if (teamDefineMap != null) {
      return teamDefineMap!;
    }
    List data = await httpUtil.get(Api.cNBATeamDefine);
    teamList = data.map((e) => NbaTeamEntity.fromJson(e)).toList();
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
  static Future<NewsDefineEntity> getNewsDefine() async {
    List json = await httpUtil.get(Api.cNewsDefine);
    return NewsDefineEntity.fromJson(json[0]);
  }

  ///排行奖励规则
  static Future<List<RankAwardEntity>> getGameRankAwardRule() async {
    List json = await httpUtil.get(Api.cGameRankAwardRule);
    return json.map((e) => RankAwardEntity.fromJson(e)).toList();
  }

  ///道具定义
  static Future<List<PropDefineEntity>> getPropDefine() async {
    List list = await httpUtil.get(Api.cGetPropDefine);
    propDefineList = list.map((e) => PropDefineEntity.fromJson(e)).toList();
    return propDefineList!;
  }
}
