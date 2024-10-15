/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-14 17:25:31
 * @LastEditTime: 2024-10-15 14:46:12
 */
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
  static Future<List<TeamPlayerInfoEntity>> getTeamPlayerList(
      int teamId) async {
    List list = await HttpUtil().post(
      Api.getTeamPlayerList,
      data: {"teamId": teamId},
    );
    return list.map((e) => TeamPlayerInfoEntity.fromJson(e)).toList();
  }

  ///获取任务列表
  static Future<List<TrainTaskEntity>> getTrainTaskList() async {
    List list = await HttpUtil().get(Api.cTrainTask);
    return list.map((e) => TrainTaskEntity.fromJson(e)).toList();
  }

  static Future<Map<String,dynamic>> getTrainDefine() async {
    var list = await HttpUtil().post(Api.cTrainDefine);
    Map<String,dynamic> map=list.length>0?list[0]:{};
    return map;
  }
}
