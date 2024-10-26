/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-09-21 17:26:07
 * @LastEditTime: 2024-09-21 17:29:10
 */
import 'dart:convert';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_v2_entity.dart';
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
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/entities/up_start_team_player_response_entity.dart';
import 'package:arm_chair_quaterback/common/enums/rank_type.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';

import '../../entities/guess_game_info_entity.dart';

///
///@auther gejiahui
///created at 2024/9/20/10:42

class PicksApi {
  static Future<List<GuessInfosEntity>> getGuessGamesInfo_v1() async {
    List json = await httpUtil.post(Api.getGuessGamesInfo);
    var guessInfosEntitys =
        json.map((e) => GuessInfosEntity.fromJson(e)).toList();
    return guessInfosEntitys;
  }

  static Future<GuessGameInfoV2Entity> getGuessGamesInfo() async {
    var json = await httpUtil.post(Api.getGuessGamesInfo);
    return GuessGameInfoV2Entity.fromJson(json);
  }

  static Future<ReciveAwardV2Entity> getGuessInfos(int teamId) async {
    var json = await httpUtil.post(Api.getGuessInfos, data: {"teamId": teamId});
    return ReciveAwardV2Entity.fromJson(json);
  }

  static Future<List<PlayerDayDataEntity>> getRecentAvg(int playerId,
      {int gameCount = 5}) async {
    List json = await httpUtil.post(Api.getRecentAvg,
        data: {"playerId": playerId, "gameCount": gameCount});
    return json.map((e) => PlayerDayDataEntity.fromJson(e)).toList();
  }

  static Future guess(int type, List<GuessParamEntity> guessParams) async {
    var json = await httpUtil.post(Api.guess,
        data: ({
          "type": type,
          "guessInfo": jsonEncode(guessParams.map((e) => e.toJson()).toList())
        }));
    return json;
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

  static Future getGuessAward(int scId) async {
    var json = await httpUtil.post(Api.getGuessAward, data: {"guessId": scId});
    return json;
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

  static Future<NbaPlayerBaseInfoEntity> getNBAPlayerBaseInfo(
      int playerId) async {
    var json = await httpUtil
        .post(Api.getNBAPlayerBaseInfo, data: {"playerId": playerId});
    return NbaPlayerBaseInfoEntity.fromJson(json);
  }

  static Future<UpStartTeamPlayerResponseEntity> upStarTeamPlayer(
      String uuid, String materialScienceUUID) async {
    var json = await httpUtil.post(Api.upStarTeamPlayer,
        data: {"uuid": uuid, "materialScienceUUID": materialScienceUUID});
    return UpStartTeamPlayerResponseEntity.fromJson(json);
  }

  static Future<List<AllTeamPlayersByUpStarEntity>> getAllTeamPlayersByUpStar(
      String uuid) async {
    List json = await httpUtil
        .post(Api.getAllTeamPlayersByUpStar, data: {"uuid": uuid});
    return json.map((e) => AllTeamPlayersByUpStarEntity.fromJson(e)).toList();
  }

  static Future<TeamInfoEntity> getTeamInfo() async {
    var json = await httpUtil.post(Api.getTeamInfo);
    return TeamInfoEntity.fromJson(json);
  }
}
