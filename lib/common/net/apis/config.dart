import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

class ConfigApi {
  static Map<int, NbaTeamEntity> teamMap = {};
  static NbaPlayerInfosEntity playerInfo = NbaPlayerInfosEntity();
  static List<PropDefineEntity> propDefineList = [];

  ///获取球队列表
  static Future<List<NbaTeamEntity>> getNBATeamDefine() async {
    List data = await httpUtil.get(Api.cNBATeamDefine);
    List<NbaTeamEntity> teamList =
        data.map((e) => NbaTeamEntity.fromJson(e)).toList();
    teamMap = teamList.fold({}, (previousValue, element) {
      previousValue[element.id] = element;
      return previousValue;
    });
    return teamList;
  }

  ///获取球员数据
  static Future<NbaPlayerInfosEntity> getNBAPlayerInfo() async {
    var json = await httpUtil.post(Api.getNBAPlayerInfo);
    playerInfo = NbaPlayerInfosEntity.fromJson(json);
    return playerInfo;
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
    return propDefineList;
  }
}
