/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-14 17:25:31
 * @LastEditTime: 2024-11-19 15:34:39
 */
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_status_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_define_entity.dart';
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

  static Future<TrainDefineEntity> getTrainDefine() async {
    List list = await HttpUtil().post(Api.cTrainDefine);
    return TrainDefineEntity.fromJson(list.first);
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

  static Future<BattleEntity> teamMatch() async {
    var json = await HttpUtil().post(Api.teamMatch);
    return BattleEntity.fromJson(json);
  }

  ///获取战斗宝箱信息
  static Future<CardPackInfoEntity> getBattleBox() async {
    var json = await HttpUtil().post(Api.getCardPackInfo);
    return CardPackInfoEntity.fromJson(json);
  }

  ///激活宝箱
  static Future<CardPackInfoEntity> activeBox(int index) async {
    var json = await HttpUtil().post(Api.activeBox, data: {"index": index});
    return CardPackInfoEntity.fromJson(json);
  }

  ///开启宝箱
  static Future<List<TrainingInfoAward>> opneBattleBox(int index) async {
    List list = await HttpUtil().post(Api.openCardPack, data: {"index": index});
    return list.map((e) => TrainingInfoAward.fromJson(e)).toList();
  }

  ///加速开启宝箱
  static Future<List<TrainingInfoAward>> speedOpneBattleBox(int index) async {
    List list =
        await HttpUtil().post(Api.speedOpenCardPack, data: {"index": index});
    return list.map((e) => TrainingInfoAward.fromJson(e)).toList();
  }

  ///开启免费宝箱
  static Future<List<TrainingInfoAward>> openFreeGift() async {
    List list = await HttpUtil().post(Api.getFreeGift);
    return list.map((e) => TrainingInfoAward.fromJson(e)).toList();
  }

  static Future<int> buyTrainingBall(count) async {
    var json =
        await HttpUtil().post(Api.buyTrainingBall, data: {"buyCount": count});
    return json["num"];
  }
}
