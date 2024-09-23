/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-09-21 17:26:07
 * @LastEditTime: 2024-09-21 17:29:10
 */
import 'dart:convert';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_day_data_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/enums/rank_type.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

///
///@auther gejiahui
///created at 2024/9/20/10:42

class PicksApi {
  static Future<List<GuessInfosEntity>> getGuessGamesInfo() async {
    List json = await httpUtil.post(Api.getGuessGamesInfo);
    var guessInfosEntitys =
        json.map((e) => GuessInfosEntity.fromJson(e)).toList();
    return guessInfosEntitys;
  }

  static Future<List<List<ReciveAwardEntity>>> getGuessInfos() async {
    List json = await httpUtil.post(Api.getGuessInfos);
    return json
        .map((e) =>
            (e as List).map((f) => ReciveAwardEntity.fromJson(f)).toList())
        .toList();
  }

  static Future<NbaPlayerInfosEntity> getNBAPlayerInfo() async {
    var json = await httpUtil.post(Api.getNBAPlayerInfo);
    return NbaPlayerInfosEntity.fromJson(json);
  }

  static Future<NewsDefineEntity> getNewsDefine() async {
    List json = await httpUtil.get(Api.cNewsDefine);
    return NewsDefineEntity.fromJson(json[0]);
  }

  static Future<List<PlayerDayDataEntity>> getRecentAvg(int playerId,
      {int gameCount = 5}) async {
    List json = await httpUtil.post(Api.getRecentAvg,
        data: {"playerId": playerId, "gameCount": gameCount});
    return json.map((e) => PlayerDayDataEntity.fromJson(e)).toList();
  }

  static Future<List<NbaTeamEntity>> getNBATeamDefine() async {
    List data = await httpUtil.get(Api.cNBATeamDefine);
    return data.map((e) => NbaTeamEntity.fromJson(e)).toList();
  }

  static Future<List<GuessInfosEntity>> guess(
      List<GuessParamEntity> guessParams) async {
    List json = await httpUtil.post(Api.guess,
        data: ({
          "guessInfo": jsonEncode(guessParams.map((e) => e.toJson()).toList())
        }));
    return json.map((e) => GuessInfosEntity.fromJson(e)).toList();
  }

  static Future<RankListEntity> getRedisRankInfo(
      {RankType type = RankType.newsGuess,
      int page = 0,
      int pageSize = 10}) async {
    var json = await httpUtil.post(Api.getRedisRankInfo, data: {
      "type": type.value,
      "page": page,
      "pageSize": pageSize,
    });
    return RankListEntity.fromJson(json);
  }

  static Future<List<RankAwardEntity>> getGameRankAwardRule() async {
    List json = await httpUtil.get(Api.cGameRankAwardRule);
    return json.map((e) => RankAwardEntity.fromJson(e)).toList();
  }

  static Future<ReciveAwardEntity> getGuessAward(int scId) async {
    var json = await httpUtil.post(Api.getGuessAward, data: {"guessId": scId});
    return ReciveAwardEntity.fromJson(json);
  }

  static Future<List<ReciveAwardEntity>> getGuessAllAward() async {
    List json = await httpUtil.post(Api.getGuessAllAward);
    return json.map((e) => ReciveAwardEntity.fromJson(e)).toList();
  }
}
