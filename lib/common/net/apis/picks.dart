import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_day_data_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

///
///@auther gejiahui
///created at 2024/9/20/10:42

class PicksApi {

  static Future<GuessInfosEntity> getGuessGamesInfo() async {
    var json = await httpUtil.post(Api.getGuessGamesInfo);
    return GuessInfosEntity.fromJson(json);
  }

  static Future<GuessInfosEntity> getGuessInfos() async {
    var json = await httpUtil.post(Api.getGuessInfos);
    return GuessInfosEntity.fromJson(json);
  }

  static Future<NbaPlayerInfosEntity> getNBAPlayerInfo() async {
    var json = await httpUtil.post(Api.getNBAPlayerInfo);
    return NbaPlayerInfosEntity.fromJson(json);
  }

  static Future<NewsDefineEntity> getNewsDefine() async {
    List json = await httpUtil.get(Api.cNewsDefine);
    return NewsDefineEntity.fromJson(json[0]);
  }

  static Future<List<PlayerDayDataEntity>> getRecentAvg(
      int playerId, int gameCount) async {
    List json = await httpUtil.post(Api.getRecentAvg,
        data: {"playerId": playerId, "gameCount": gameCount});
    return json.map((e) => PlayerDayDataEntity.fromJson(e)).toList();
  }

  static Future<List<NbaTeamEntity>> getNBATeamDefine() async{
    List data = await httpUtil.get(Api.cNBATeamDefine);
    return data.map((e)=> NbaTeamEntity.fromJson(e)).toList();
  }

  static Future<GuessInfosEntity> guess(List<GuessParamEntity> guessParams) async{
    var json = await httpUtil.post(Api.guess,data: guessParams);
    return GuessInfosEntity.fromJson(json);
  }
}
