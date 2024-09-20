import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PicksIndexController extends GetxController {
  PicksIndexController();

  final state = PicksIndexState();
  late ScrollController scrollController = ScrollController();
  final GlobalKey targetKey = GlobalKey(); // 用来标记目标 widget
  var isSelfInfoFloatShow = false.obs; //竞猜榜单自己的信息浮窗是否显示

  late List<PicksPlayer> picksPlayers = [];

  Map<int, double> choiceData = {};

  var betCount = 0.0.obs; // 总赔率
  var costCount = 0.0.obs; // 总花费

  /// 选择了more/less
  choiceOne(int index, double choice) {
    if (choiceData[index] == choice) {
      choiceData.remove(index);
    } else {
      choiceData[index] = choice;
    }
    var len = choiceData.length;
    var odds = double.parse(picksPlayers[0].betOdds);
    betCount.value = len == 0
        ? odds
        : double.parse(
            (pow(odds, len) * double.parse(picksPlayers[0].betMutOdds))
                .toStringAsFixed(1));
    costCount.value = double.parse(
        (len * double.parse(picksPlayers[0].betCost)).toStringAsFixed(1));
  }

  guess() {
    print('guess--------');
    List<GuessParamEntity> params = [];
    for (int i = 0; i < choiceData.keys.length; i++) {
      var key = choiceData.keys.toList()[i];
      var value = choiceData[key];
      var split = value.toString().split(".");
      var betDataIndex = split[0];
      var choiceIndex = split[1];
      var picksPlayer = picksPlayers[key];
      GuessInfosGuessInfos guessInfo = picksPlayer.guessInfo;
      GuessParamEntity guessParamEntity = GuessParamEntity();
      guessParamEntity.awayTeamId = guessInfo.awayTeamId;
      guessParamEntity.gameId = guessInfo.gameId;
      guessParamEntity.playerId = guessInfo.playerId;
      guessParamEntity.gameStartTime = guessInfo.gameStartTime;
      guessParamEntity.type = guessInfo.type;
      GuessParamGuessData guessData = GuessParamGuessData();
      var propertyName = picksPlayer.betData[int.parse(betDataIndex)];
      guessData.guessAttr = propertyName;
      guessData.guessChoice = int.parse(choiceIndex);
      guessData.guessReferenceValue = guessInfo.guessReferenceValue
          .toJson()[ParamUtils.getProKey(propertyName.toLowerCase())];
      // guessParamEntity.guessData
      params.add(guessParamEntity);
    }

    PicksApi.guess(params).then((result) {});
  }

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  // 滚动监听器
  void _scrollListener() {
    // 获取目标 widget 的 RenderObject
    final targetContext = targetKey.currentContext;
    if (targetContext != null) {
      final box = targetContext.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero); // 获取目标在屏幕中的位置
      final targetOffset = position.dy;

      final screenHeight = Get.height;

      // 比较目标的相对位置和滚动位置，确保检测到精确的进入和离开时机
      if (targetOffset <= screenHeight) {
        if (!isSelfInfoFloatShow.value) {
          isSelfInfoFloatShow.value = true;
          update();
          print('已经到达目标 Widget');
        }
      } else {
        if (isSelfInfoFloatShow.value) {
          isSelfInfoFloatShow.value = false;
          update();
          print('离开目标 Widget');
        }
      }
    }
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);

    Future.wait([
      PicksApi.getGuessGamesInfo(),
      PicksApi.getNBAPlayerInfo(),
      PicksApi.getNewsDefine(),
      PicksApi.getNBATeamDefine()
    ]).then((results) {
      GuessInfosEntity guessInfosEntity = results[0] as GuessInfosEntity;
      NbaPlayerInfosEntity nbaPlayerInfosEntity =
          results[1] as NbaPlayerInfosEntity;
      NewsDefineEntity newsDefineEntity = results[2] as NewsDefineEntity;
      List<NbaTeamEntity> nbaTeams = results[3] as List<NbaTeamEntity>;
      for (GuessInfosGuessInfos e in guessInfosEntity.guessInfos) {
        PicksPlayer picksPlayer = PicksPlayer();
        picksPlayer.baseInfoList = nbaPlayerInfosEntity
            .nBAPlayerInfos.playerBaseInfoList
            .firstWhere((nba) => nba.playerId == e.playerId);
        picksPlayer.dataAvgList = nbaPlayerInfosEntity
            .nBAPlayerInfos.playerDataAvgList
            .firstWhere((nba) => nba.playerId == e.playerId);
        switch (picksPlayer.baseInfoList.position.toLowerCase()) {
          case "c":
            picksPlayer.betData = newsDefineEntity.cBetData;
          case "pg":
            picksPlayer.betData = newsDefineEntity.pgBetDate;
          case "sg":
            picksPlayer.betData = newsDefineEntity.sgBetData;
          case "pf":
            picksPlayer.betData = newsDefineEntity.pfBetData;
          case "sf":
            picksPlayer.betData = newsDefineEntity.sfBetData;
        }
        picksPlayer.betMutOdds = newsDefineEntity.betMutOdds;
        picksPlayer.betCost = newsDefineEntity.betCost;
        picksPlayer.betOdds = newsDefineEntity.betOdds;
        picksPlayer.selfTeamInfo = nbaTeams.firstWhere(
            (nba) => nba.id == picksPlayer.baseInfoList.teamId.toString());
        picksPlayer.awayTeamInfo =
            nbaTeams.firstWhere((nba) => nba.id == e.awayTeamId.toString());
        picksPlayer.guessInfo = e;
        picksPlayers.add(picksPlayer);
      }
      update(['guessList']);
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
}
