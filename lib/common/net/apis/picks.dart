/*
 * @Description:
 * @Author: lihonghao
 * @Date: 2024-09-21 17:26:07
 * @LastEditTime: 2024-09-21 17:29:10
 */
import 'dart:convert';

import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/game_result_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_rank_by_cycle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_top_reviews_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_season_game_entity.dart';
import 'package:arm_chair_quaterback/common/entities/now_season_entity.dart';
import 'package:arm_chair_quaterback/common/entities/per_game_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_day_data_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/season_rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_done_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/entities/up_star_team_player_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/up_start_team_player_response_entity.dart';
import 'package:arm_chair_quaterback/common/enums/rank_type.dart';
import 'package:arm_chair_quaterback/common/enums/season_type.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

import '../../entities/inbox_email_entity.dart';

///
///@auther gejiahui
///created at 2024/9/20/10:42

class PicksApi {
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

  static Future guess(int type, List guessParams, int newsId) async {
    //newsId:新闻id，不是新闻竞猜填0
    var json = await httpUtil.post(Api.guess,
        data: ({
          "type": type,
          "guessInfo": jsonEncode(guessParams.map((e) => e.toJson()).toList()),
          "newsId": newsId,
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

  static Future<TeamPlayerInfoEntity> getPlayerUpGradeInfo(String uuid) async {
    var json =
        await httpUtil.post(Api.getPlayerUpGradeInfo, data: {"uuid": uuid});
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

  static Future<UpStarTeamPlayerV2Entity> upStarTeamPlayerV2(
      String uuid, String materialScienceUUID) async {
    var json = await httpUtil.post(Api.upStarTeamPlayer,
        data: {"uuid": uuid, "materialScienceUUID": materialScienceUUID});
    return UpStarTeamPlayerV2Entity.fromJson(json);
  }

  static Future<UpStarTeamPlayerV2Entity> continueStarUp(String uuid) async {
    var json = await httpUtil.post(Api.continueStarUp, data: {"uuid": uuid});
    return UpStarTeamPlayerV2Entity.fromJson(json);
  }

  static Future<StarUpDoneEntity> starUpDone(String uuid) async {
    var json = await httpUtil.post(Api.starUpDone, data: {"uuid": uuid});
    return StarUpDoneEntity.fromJson(json);
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

  static Future<NbaPlayerSeasonEntity> getNBAPlayerSeasonGameData(
      int playerId, int seasonId, int page, int pageSize) async {
    var json = await httpUtil.post(Api.getNBAPlayerSeasonGameData, data: {
      "playerId": playerId,
      "seasonId": seasonId,
      "page": page,
      "pageSize": pageSize,
    });
    return NbaPlayerSeasonEntity.fromJson(json);
  }

  static Future<List<GuessTopReviewsEntity>> getGuessTopReviews() async {
    List json = await httpUtil.post(Api.getGuessTopReviews);
    return json.map((e) => GuessTopReviewsEntity.fromJson(e)).toList();
  }

  static Future<GuessRankByCycleEntity> getGuessRankByCycle(
      {required int cycle, int page = 0, int pageSize = 10}) async {
    var json = await httpUtil.post(Api.getGuessRankByCycle, data: {
      "type": RankType.newsGuess.value,
      "cycle": cycle,
      "page": page,
      "pageSize": pageSize,
    });
    return GuessRankByCycleEntity.fromJson(json);
  }

  static Future<Map<String, List<PerGameEntity>>>
      getNBAPlayerOverAllPerGameData(
          {required int playerId,
          int limit = 20,
          SeasonType seasonType = SeasonType.regular}) async {
    Map json = await httpUtil.post(Api.getNBAPlayerOverAllPerGameData, data: {
      "seasonType": seasonType.value,
      "playerId": playerId,
      "limit": limit,
    });
    return json.map((key, value) => MapEntry(key,
        (value as List).map((item) => PerGameEntity.fromJson(item)).toList()));
  }

  static Future<List<GameSchedule>> getGameSchedules(int teamId,
      [int limit = 5]) async {
    List json = await httpUtil
        .post(Api.getGameSchedules, data: {"teamId": teamId, "limit": limit});
    return json.map((e) => GameSchedule.fromJson(e)).toList();
  }

  static Future<GameResultInfoEntity> getGameResultInfo(int gameId) async {
    var json =
        await httpUtil.post(Api.getGameResultInfo, data: {"gameId": gameId});
    return GameResultInfoEntity.fromJson(json);
  }

  static Future<SeasonRankInfoEntity> getSeasonRankInfo(int seasonId,
      {int page = 0, String pageSize = '50'}) async {
    var json = await httpUtil.post(Api.getSeasonRankInfo,
        data: {"seasonId": seasonId, "page": page, "pageSize": pageSize});
    return SeasonRankInfoEntity.fromJson(json);
  }

  static Future<NowSeasonEntity> getNowSeason() async {
    var json = await httpUtil.post(Api.getNowSeason);
    return NowSeasonEntity.fromJson(json);
  }

  /// 获取赛季排行榜奖励
  static Future getSeasonRankAward(int cupRankId) async {
    await httpUtil.post(Api.getSeasonRankAward, data: {"rankId": cupRankId});
  }

  /// 分享竞猜
  static Future shareGuess() async {
    await httpUtil.post(Api.shareGuess);
  }

  /// 查询邮件列表
  static Future<List<InboxEmailEntity>> getInBoxEmailList() async {
    List json = await httpUtil.post(Api.getInboxEmail);
    return json.map((e) => InboxEmailEntity.fromJson(e)).toList();
  }

  ///提取附件奖励
  static Future receiveMailAward(String mailIds) async {
    await httpUtil.post(Api.receiveMailAward, data: {"mailIds": mailIds});
  }
}
