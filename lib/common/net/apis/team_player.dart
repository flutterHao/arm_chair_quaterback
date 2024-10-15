import 'package:arm_chair_quaterback/common/entities/team_player_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

///
///@auther gejiahui
///created at 2024/10/15/16:37

class TeamPlayerApi {

  static Future<List<TeamPlayerEntity>> getTeamPlayerList(int teamId) async {
    List json =
        await httpUtil.post(Api.getTeamPlayerList, data: {"teamId": teamId});
    return json.map((e) => TeamPlayerEntity.fromJson(e)).toList();
  }
}
