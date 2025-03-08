import 'package:arm_chair_quaterback/common/entities/battle_pass_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

class BattlePassApi {
  /// 查询通行证信息
  static Future<BattlePassInfoEntity> getBattlePassInfo() async {
    var json = await httpUtil.post(Api.getBattlePassInfo);
    return BattlePassInfoEntity.fromJson(json);
  }

  /// 通行证选择主队
  static Future chooseHomeTeam(int hostTeam) async {
    var json =
        await httpUtil.post(Api.chooseHomeTeam, data: {'hostTeam': hostTeam});
  }

  /// 通行证选择主队
  static Future claimLevelReward(int level) async {
    var json =
        await httpUtil.post(Api.claimLevelReward, data: {'level': level});
  }
}
