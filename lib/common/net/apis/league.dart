import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
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
}
