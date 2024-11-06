/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-14 17:25:31
 * @LastEditTime: 2024-11-06 11:28:46
 */
import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_status_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

class TeamApi {
  ///获取球员训练信息
  static Future<TrainingInfoEntity> getTrainingInfo() async {
    var json = await HttpUtil().post(Api.getTrainingInfo);
    return TrainingInfoEntity.fromJson(json);
  }

  ///球员训练
  static Future<TrainingInfoEntity> playerTraining(String uuid) async {
    var json = await HttpUtil().post(Api.playerTraining, data: {"uuid": uuid});
    return TrainingInfoEntity.fromJson(json);
  }

  ///获取队伍球员
  static Future<MyTeamEntity> getMyTeamPlayer(int teamId) async {
    var json = await HttpUtil().post(
      Api.getTeamPlayerList,
      data: {"teamId": teamId},
    );
    return MyTeamEntity.fromJson(json);
  }

  ///获取任务列表
  static Future<List<TrainTaskEntity>> getTrainTaskList() async {
    List list = await HttpUtil().get(Api.cTrainTask);
    return list.map((e) => TrainTaskEntity.fromJson(e)).toList();
  }

  static Future<Map<String, dynamic>> getTrainDefine() async {
    var list = await HttpUtil().post(Api.cTrainDefine);
    Map<String, dynamic> map = list.length > 0 ? list[0] : {};
    return map;
  }

  static Future<List<TeamPlayerInfoEntity>> getMyBagPlayers() async {
    List list = await HttpUtil().post(Api.getTeamPlayers);
    return list.map((e) => TeamPlayerInfoEntity.fromJson(e)).toList();
  }

  static Future<MyTeamEntity> recoverPower({int type = 1, String? uuid}) async {
    var json = await HttpUtil()
        .post(Api.replyPower, data: {"type": type, "uuid": uuid});
    return MyTeamEntity.fromJson(json);
  }

  static Future<MyTeamEntity> changeTeamPlayer(
      String uuid1, String? uuid2) async {
    var json = await HttpUtil()
        .post(Api.changeTeamPlayer, data: {"uuId1": uuid1, "uuId2": uuid2});
    return MyTeamEntity.fromJson(json);
  }

  static Future<PlayerStatusEntity> getPlayerStatusConfig() async {
    var json = await HttpUtil().post(Api.cPlayerStatsDefine);
    return PlayerStatusEntity.fromJson(json);
  }
}
