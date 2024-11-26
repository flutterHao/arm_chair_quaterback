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

  static Future<ScoresNotStartGameEntity> getNotStartGameData(int gameId) async {
    var json =
    await httpUtil.post(Api.getNotStartGameData, data: {"gameId": gameId});
    return ScoresNotStartGameEntity.fromJson(json);
  }

  static Future<ScoresEntity> getNBAGameHeaderData(int gameId) async {
    var json =
    await httpUtil.post(Api.getNBAGameHeaderData, data: {"gameId": gameId});
    return ScoresEntity.fromJson(json);
  }
}
