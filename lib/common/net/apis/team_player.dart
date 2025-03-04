import 'package:arm_chair_quaterback/common/entities/team_player_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/up_star_team_player_v2_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

///
///@auther gejiahui
///created at 2024/10/15/16:37

class TeamPlayerApi {
  static Future<TeamPlayerListEntity> getTeamPlayerList(int teamId) async {
    var json =
        await httpUtil.post(Api.getTeamPlayerList, data: {"teamId": teamId});
    return TeamPlayerListEntity.fromJson(json);
  }

  static Future<List<UpStarTeamPlayerV2Entity>> getLastTimeStarUpList() async {
    List json = await httpUtil.post(Api.getLastTimeStarUpList);
    return json.map((e) => UpStarTeamPlayerV2Entity.fromJson(e)).toList();
  }
}
