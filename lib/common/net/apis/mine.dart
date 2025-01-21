import 'package:arm_chair_quaterback/common/entities/reward_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_mission_entity.dart';
import 'package:arm_chair_quaterback/common/entities/turn_table_entity.dart';
import 'package:arm_chair_quaterback/common/net/index.dart';

///
///@auther gejiahui
///created at 2025/1/17/18:04

class MineApi {
  /// 获取转盘信息
  static Future<TurnTableEntity> getTurntableInfo() async {
    var json = await httpUtil.post(Api.getTurntableInfo);
    return TurnTableEntity.fromJson(json);
  }

  /// 转动转盘
  static Future<TurnTableEntity> turntable() async {
    var json = await httpUtil.post(Api.turntable);
    return TurnTableEntity.fromJson(json);
  }

  /// 复活
  static Future<TurnTableEntity> reLife() async {
    var json = await httpUtil.post(Api.reLife);
    return TurnTableEntity.fromJson(json);
  }

  /// 领取转盘奖励
  static Future<List<RewardEntity>> claimRewards() async {
    List json = await httpUtil.post(Api.claimRewards);
    return json.map((e) => RewardEntity.fromJson(e)).toList();
  }

  /// 领取任务奖励
  static Future<List<RewardEntity>> getTeamMissionAward(int missionId) async {
    List json = await httpUtil.post(Api.getTeamMissionAward,data: {
      "missionId": missionId,
    });
    return json.map((e) => RewardEntity.fromJson(e)).toList();
  }

  /// 获取玩家任务 ：剧情任务=1，每日任务=2，每周任务=3
  static Future<List<TeamMissionEntity>> getTeamMissionList(int type) async {
    List json = await httpUtil.post(Api.getTeamMissionList, data: {
      "type": type,
    });
    return json.map((e) => TeamMissionEntity.fromJson(e)).toList();
  }

  /// 领取转盘奖励
  static Future<dynamic> giveUp() async {
    var json = await httpUtil.post(Api.giveUp);
    return json;
  }
}
