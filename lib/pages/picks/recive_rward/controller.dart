import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:get/get.dart';

import 'index.dart';

class ReciveRwardController extends GetxController {
  ReciveRwardController();

  List<List<PicksPlayer>> listData = [];
  final state = ReciveRwardState();

  NewsDefineEntity? newsDefineEntity;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    _initData();
    PicksApi.getNewsDefine().then((result) {
      newsDefineEntity = result;
    });
  }

  void _initData() {
    Future.wait([
      PicksApi.getGuessInfos(),
      PicksApi.getNBATeamDefine(),
      PicksApi.getNBAPlayerInfo(),
    ]).then((result) {
      List<List<ReciveAwardEntity>> result0 =
          result[0] as List<List<ReciveAwardEntity>>;
      List<NbaTeamEntity> result1 = result[1] as List<NbaTeamEntity>;
      NbaPlayerInfosEntity result2 = result[2] as NbaPlayerInfosEntity;

      /// 1.剔除status为1（未开奖）的数据项
      /// 2.剔除未中奖的（awards为空）
      var guessHistoryList = result0
          .where((e) => (e
              .where((f) =>
                  f.guessData[0].status != 1 &&
                  f.guessData[0].awards.isNotEmpty)
              .toList()
              .isNotEmpty))
          .toList();
      listData.clear();
      for(List l in guessHistoryList){
        List<PicksPlayer> players = [];
        for(ReciveAwardEntity r in l){
          PicksPlayer player = PicksPlayer();
          player.baseInfoList = result2.playerBaseInfoList.firstWhere((e)=> r.playerId==e.playerId);
          player.dataAvgList = result2.playerDataAvgList.firstWhere((e)=> r.playerId==e.playerId);
          player.awayTeamInfo = result1.firstWhere((e)=>e.id == r.awayTeamId);
          player.reciveAwardInfo = r;
          players.add(player);
        }
        listData.add(players);
      }
      update();
    });

  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  /// 一键领取所有奖励
  getGuessAllAward() {
    PicksApi.getGuessAllAward().then((result) {
      _initData();
    });
  }
}
