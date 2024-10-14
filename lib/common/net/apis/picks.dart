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
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_day_data_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
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

  static Future<List<List<ReciveAwardEntity>>> getGuessInfos(int teamId) async {
    List json =
        await httpUtil.post(Api.getGuessInfos, data: {"teamId": teamId});
    return json
        .map((e) =>
            (e as List).map((f) => ReciveAwardEntity.fromJson(f)).toList())
        .toList();
  }

  static Future<List<PlayerDayDataEntity>> getRecentAvg(int playerId,
      {int gameCount = 5}) async {
    List json = await httpUtil.post(Api.getRecentAvg,
        data: {"playerId": playerId, "gameCount": gameCount});
    return json.map((e) => PlayerDayDataEntity.fromJson(e)).toList();
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

  static Future<List<ReciveAwardEntity>> getGuessAward(int scId) async {
    List json = await httpUtil.post(Api.getGuessAward, data: {"guessId": scId});
    print('json:$json');
    return json.map((e)=>ReciveAwardEntity.fromJson(e)).toList();
  }

  static Future<List<ReciveAwardEntity>> getGuessAllAward() async {
    List json = await httpUtil.post(Api.getGuessAllAward);
    return json.map((e) => ReciveAwardEntity.fromJson(e)).toList();
  }

  static Future<TeamSimpleEntity> getTeamSimple(int teamId) async {
    var json = await httpUtil.post(Api.getTeamSimple, data: {"teamId": teamId});
    return TeamSimpleEntity.fromJson(json);
  }

  static Future<List> getRankRewards(RankType rankType) async {
    var json =
        await httpUtil.post(Api.getRankRewards, data: {"rankType": rankType});
    return json;
  }

  static Future<TeamPlayerInfoEntity> getTeamPlayerByUUID(
      int teamId, String uuid) async {
    var json = await httpUtil
        .post(Api.getTeamPlayerByUUID, data: {"teamId": teamId, "uuid": uuid});
    return TeamPlayerInfoEntity.fromJson(json);
  }

  static Future<NbaPlayerBaseInfoEntity> getNBAPlayerBaseInfo(int playerId) async {
    var json = await httpUtil.post(Api.getNBAPlayerBaseInfo, data: {"playerId": playerId});
    return NbaPlayerBaseInfoEntity.fromJson(json);
  }

}
