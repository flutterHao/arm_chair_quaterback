/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-14 17:25:31
 * @LastEditTime: 2025-02-27 21:07:08
 */
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_chat_entity.dart';
import 'package:arm_chair_quaterback/common/entities/last5_avg_entity.dart';
import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/next_massage_entity.dart';
import 'package:arm_chair_quaterback/common/entities/o_v_r_rank_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_collect_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_status_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_player_entity.dart';
import 'package:arm_chair_quaterback/common/entities/tactics_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/tatics_combine_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
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
  static Future<TrainingInfoEntity> playerTraining() async {
    var json = await HttpUtil().post(Api.playerTraining);
    return TrainingInfoEntity.fromJson(json);
  }

  ///放弃战术牌
  static Future cancelTactic() async {
    var json = await HttpUtil().post(Api.cancelTactic);
    return json;
  }

  ///获取队伍球员
  static Future<MyTeamEntity> getMyTeamPlayer(int teamId) async {
    var json = await HttpUtil().post(
      Api.getTeamPlayerList,
      data: {"teamId": teamId},
    );
    MyTeamEntity teamEntity = MyTeamEntity.fromJson(json);
    return teamEntity;
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
    MyTeamEntity teamEntity = MyTeamEntity.fromJson(json);
    return teamEntity;
  }

  static Future<MyTeamEntity> changeTeamPlayer(
      String? uuid1, String? uuid2) async {
    var json = await HttpUtil().post(Api.changeTeamPlayer,
        data: {"uuId1": uuid1 ?? "", "uuId2": uuid2 ?? ""});
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
  static Future<List<TrainingInfoAward>> opneBattleBox(
      int index, int playerId) async {
    List list = await HttpUtil().post(Api.openCardPack, data: {
      "index": index,
      "playerIds": [playerId]
    });
    return list.map((e) => TrainingInfoAward.fromJson(e)).toList();
  }

  //关闭宝箱结束
  static Future closeCard(int index) async {
    var json = await HttpUtil().post(Api.closeCard, data: {"index": index});
    return json;
  }

  ///加速开启宝箱
  static Future speedOpneBattleBox(int index) async {
    await HttpUtil().post(Api.speedOpenCardPack, data: {"index": index});
    // return list.map((e) => TrainingInfoAward.fromJson(e)).toList();
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

  static Future<List<TrainingInfoBuff>> chooseTactic(int tacticId,
      {int replaceTacticId = 0}) async {
    List list = await HttpUtil().post(Api.chooseTactic,
        data: {"tacticId": tacticId, "replaceTacticId": replaceTacticId});
    var chooseList = list.map((e) => TrainingInfoBuff.fromJson(e)).toList();
    chooseList.sort((a, b) => a.face.compareTo(b.face));
    return chooseList;
  }

  static Future<List<TacticsDefineEntity>> tacticsDefine() async {
    List list = await HttpUtil().post(Api.cTacticsDefine);
    return list.map((e) => TacticsDefineEntity.fromJson(e)).toList();
  }

  static Future<List<TaticsCombineEntity>> getTacticCombine() async {
    List list = await HttpUtil().post(Api.cTaticsCombine);
    return list.map((e) => TaticsCombineEntity.fromJson(e)).toList();
  }

  static Future dismissPlayer(String uuid, {int dismissType = 1}) async {
    var isDismiss = await HttpUtil().post(Api.dismissPlayer,
        data: {"uuids": uuid, "dismissType": dismissType});
    return isDismiss;
  }

  static Future<TeamPlayerUpStarVoEntity> getTeamPlayerUpStarVO(
      String uuid) async {
    var json = await HttpUtil().post(
      Api.getTeamPlayerUpStarVO,
      data: {"uuid": uuid},
    );
    TeamPlayerUpStarVoEntity teamEntity =
        TeamPlayerUpStarVoEntity.fromJson(json);
    return teamEntity;
  }

  static Future<TeamDetailEntity> getNBATeamDetail(int teamId) async {
    var json = await HttpUtil().post(
      Api.getNBATeamInfo,
      data: {"NBATeamId": teamId},
    );
    return TeamDetailEntity.fromJson(json);
  }

  static Future<PlayerCollectEntity> getPlayerCollect(
      {int bookId = 101}) async {
    var json = await HttpUtil()
        .post(Api.getTeamPlayerCollect, data: {"bookId": bookId});
    return PlayerCollectEntity.fromJson(json);
  }

  static Future composeTeamPlayer(
      {required int playerId, int bookId = 101, int composeNum = 1}) async {
    var result = await HttpUtil().post(Api.composeTeamPlayer, data: {
      "bookId": bookId,
      "composeNum": composeNum,
      "playerId": playerId
    });

    return result;
  }

  static Future destroyTeamPlayer(
      {int bookId = 101, required int playerId}) async {
    var result = await HttpUtil().post(Api.destroyTeamPlayer, data: {
      "bookId": bookId,
      "playerId": playerId,
    });
    return result;
  }

  static Future<List<Last5AvgEntity>> getNBAGameLogByTeamId(
      int teamId, String season) async {
    List list = await HttpUtil().post(Api.getNBAGameLogByTeamId, data: {
      "season": season,
      "seasonType": "Regular%20Season",
      "teamId": teamId
    });
    return list.map((e) => Last5AvgEntity.fromJson(e)).toList();
  }

  /// 获取球员实力排行榜
  static Future<List<PlayerStrengthRankEntity>> getPlayerStrengthRank(
      {int start = 0, int end = -1}) async {
    List json = await httpUtil
        .post(Api.getPlayerStrengthRank, data: {"start": start, "end": end});
    return json.map((e) => PlayerStrengthRankEntity.fromJson(e)).toList();
  }

  /// 获取球员趋势图果day=-1则获取所有趋势
  static Future<List<PlayerStrengthRankTrendList>> getPlayerTrends(
      {required int playerId, int day = -1}) async {
    List json = await httpUtil
        .post(Api.getPlayerTrends, data: {"playerId": playerId, "day": day});
    return json.map((e) => PlayerStrengthRankTrendList.fromJson(e)).toList();
  }

  /// 获取球员评分榜的球员详细信息
  static Future<OVRRankPlayerInfoEntity> getOVRRankPlayerInfo(
      {required int playerId}) async {
    var json = await httpUtil
        .post(Api.getOVRRankPlayerInfo, data: {"playerId": playerId});
    return OVRRankPlayerInfoEntity.fromJson(json);
  }

  static Future buySlotCount() async {
    await httpUtil.post(Api.buySlotCount);
  }

  ///1：刷新 0:获取
  static Future<StarUpPlayerEntity> getSlotStarUpEventVO(
      {required int type}) async {
    var json =
        await httpUtil.post(Api.getSlotStarUpEventVO, data: {"type": type});
    return StarUpPlayerEntity.fromJson(json);
  }

  static Future<GirlChatEntity> getSlotChatEventVO() {
    return httpUtil
        .post(Api.getSlotChatEventVO)
        .then((value) => GirlChatEntity.fromJson(value));
  }

  static Future<NextMessageEntity> nextMessage(
      int girlId, int nessageDefineId, int choice) async {
    var json = await httpUtil.post(Api.nextMessage, data: {
      "girlId": girlId,
      "messageDefineId": nessageDefineId,
      "choice": choice
    });
    return NextMessageEntity.fromJson(json);
  }
}
