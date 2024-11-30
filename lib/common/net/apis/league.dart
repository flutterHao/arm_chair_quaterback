import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/league_detail_picks_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_game_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

///
///@auther gejiahui
///created at 2024/11/14/16:45

class LeagueApi {
  static Future<List<ScoresEntity>> getNBAGameSchedules(
      int startTime, int endTime) async {
    List json = await httpUtil.post(Api.getNBAGameSchedules,
        data: {"startTime": startTime, "endTime": endTime});
    return json.map((e) => ScoresEntity.fromJson(e)).toList();
  }

  static Future<NbaGameDetailEntity> getNBAGameData(int gameId) async {
    var json =
        await httpUtil.post(Api.getNBAGameData, data: {"gameId": gameId});
    return NbaGameDetailEntity.fromJson(json);
  }

  static Future<ScoresNotStartGameEntity> getNotStartGameData(
      int gameId) async {
    var json =
        await httpUtil.post(Api.getNotStartGameData, data: {"gameId": gameId});
    return ScoresNotStartGameEntity.fromJson(json);
  }

  static Future<ScoresEntity> getNBAGameHeaderData(int gameId) async {
    var json =
        await httpUtil.post(Api.getNBAGameHeaderData, data: {"gameId": gameId});
    return ScoresEntity.fromJson(json);
  }

  static Future<LeagueDetailPicksEntity> getNBAGamePicks(int gameId) async {
    var json =
        await httpUtil.post(Api.getNBAGamePicks, data: {"gameId": gameId});
    Map guessDataInfo = json["guessDataInfo"];
    Map<String, List<GuessGameInfoEntity>> g = guessDataInfo.map((k, v) {
      return MapEntry(
          k, (v as List).map((e) => GuessGameInfoEntity.fromJson(e)).toList());
    });
    List<ScoresEntity> s = (json["scheduleData"] as List)
        .map((e) => ScoresEntity.fromJson(e))
        .toList();
    return LeagueDetailPicksEntity(g, s);
  }

  static Future<List<GameSchedulesInfo>> queryNBAGameSchedulesInfo(
      int startTime, int endTime) async {
    List json = await httpUtil.post(Api.queryNBAGameSchedulesInfo,
        data: {"startTime": startTime, "endTime": endTime});
    return json.map((e) => GameSchedulesInfo.fromJson(e)).toList();
  }
}
