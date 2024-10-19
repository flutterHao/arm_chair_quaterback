import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/user_entity/user_entiry.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/enums/rank_type.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '';

import 'index.dart';

class PicksIndexController extends GetxController {
  PicksIndexController();

  late ScrollController scrollController = ScrollController();
  final GlobalKey targetKey = GlobalKey(); // 用来标记目标 widget
  var isSelfInfoFloatShow = false.obs; //竞猜榜单自己的信息浮窗是否显示
  RefreshController refreshController = RefreshController();

  var loadStatusRx = LoadDataStatus.loading.obs;

  List<PicksPlayer> picksPlayers = [];

  RankListEntity rankInfo = RankListEntity();

  Map<int, double> choiceData = {};

  var currentIndex = 0.obs;
  var tabs = List.generate(10, (_)=> "PTS");

  var betCount = 0.0.obs; // 总赔率
  var costCount = 0.0.obs; // 总花费

  var batchDeleteOpen = false.obs;

  /// 选择了more/less
  choiceOne(int itemIndex,double choice, {bool needRefreshList = false}) {
    var index = currentIndex.value;
    if (choiceData[index] == choice) {
      choiceData.remove(index);
    } else {
      choiceData[index] = choice;
    }
    _count(needRefreshList);
  }

  void _count(bool needRefreshList) {

    //todo 功能未实现
    var len = choiceData.length;
    // var odds = double.parse(picksPlayers[0].betOdds);
    // betCount.value = len == 0
    //     ? 0
    //     : len == 1
    //         ? odds
    //         : double.parse(
    //             (pow(odds, len) * double.parse(picksPlayers[0].betMutOdds))
    //                 .toStringAsFixed(1));
    // costCount.value = double.parse(
    //     (len * double.parse(picksPlayers[0].betCost)).toStringAsFixed(1));

    if (needRefreshList) {
      update([idGuessList]);
    }
  }

  deleteOne(int index) {
    choiceData.remove(index);
    _count(true);
  }

  deleteAll() {
    choiceData.clear();
    _count(true);
  }

  clearChoiceData() {
    print('clearChoiceData--------');
    choiceData.clear();
    betCount.value = 0.0;
    costCount.value = 0.0;
  }

  guess({bool inDialog = false}) {
    List<GuessParamEntity> params = [];
    for (int i = 0; i < choiceData.keys.length; i++) {
      var key = choiceData.keys.toList()[i];
      var value = choiceData[key];
      var split = value.toString().split(".");
      var betDataIndex = split[0];
      var choiceIndex = split[1];
      var picksPlayer = picksPlayers[key];
      GuessInfosEntity guessInfo = picksPlayer.guessInfo;
      GuessParamEntity guessParamEntity = GuessParamEntity();
      guessParamEntity.awayTeamId = guessInfo.awayTeamId;
      guessParamEntity.gameId = guessInfo.gameId;
      guessParamEntity.playerId = guessInfo.playerId;
      guessParamEntity.gameStartTime = guessInfo.gameStartTime;
      guessParamEntity.type =
          choiceData.keys.length > 1 ? 2 : 1; //type=1就是单选，type=2就是多选
      GuessParamGuessData guessData = GuessParamGuessData();
      var propertyName = picksPlayer.betData[int.parse(betDataIndex)];
      guessData.guessAttr = propertyName.toLowerCase();
      guessData.guessChoice = int.parse(choiceIndex);
      guessData.guessReferenceValue =
          guessInfo.guessReferenceValue.getValue(propertyName);
      guessParamEntity.guessData = [guessData];
      params.add(guessParamEntity);
    }
    PicksApi.guess(params).then((result) {
      if (inDialog) Get.back();
      clearChoiceData();
      _initData();
    });
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

  loading() {
    if (loadStatusRx.value == LoadDataStatus.loading) {
      refreshController.refreshCompleted();
      return;
    }
    _initData();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void _initData() {
    loadStatusRx.value = LoadDataStatus.loading;
    Future.wait([
      PicksApi.getGuessGamesInfo(),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNewsDefine(),
      CacheApi.getNBATeamDefine(getList: true),
      PicksApi.getRedisRankInfo(type: RankType.newsGuess)
    ]).then((results) {
      picksPlayers.clear();
      List<GuessInfosEntity> guessInfosEntity =
          results[0] as List<GuessInfosEntity>;
      NbaPlayerInfosEntity nbaPlayerInfosEntity =
          results[1] as NbaPlayerInfosEntity;
      NewsDefineEntity newsDefineEntity = results[2] as NewsDefineEntity;
      List<NbaTeamEntity> nbaTeams = results[3] as List<NbaTeamEntity>;

      ///rank 排行榜
      rankInfo = results[4] as RankListEntity;
      for (GuessInfosEntity e in guessInfosEntity) {
        PicksPlayer picksPlayer = PicksPlayer();
        picksPlayer.baseInfoList = nbaPlayerInfosEntity.playerBaseInfoList
            .firstWhere((nba) => nba.playerId == e.playerId);
        picksPlayer.dataAvgList = nbaPlayerInfosEntity.playerDataAvgList
            .firstWhere((nba) => nba.playerId == e.playerId);

        //todo
        // switch (picksPlayer.baseInfoList.position.toLowerCase()) {
        //   case "c":
        //     picksPlayer.betData = newsDefineEntity.cBetData;
        //   case "pg":
        //     picksPlayer.betData = newsDefineEntity.pgBetDate;
        //   case "sg":
        //     picksPlayer.betData = newsDefineEntity.sgBetData;
        //   case "pf":
        //     picksPlayer.betData = newsDefineEntity.pfBetData;
        //   case "sf":
        //     picksPlayer.betData = newsDefineEntity.sfBetData;
        // }
        picksPlayer.betMutOdds = "2";//newsDefineEntity.betMutOdds;//todo
        picksPlayer.betCost = newsDefineEntity.betCost;
        picksPlayer.betOdds = "2";//newsDefineEntity.betOdds;//todo
        picksPlayer.selfTeamInfo = nbaTeams.firstWhere((nba) =>
            nba.id.toString() == picksPlayer.baseInfoList.teamId.toString());
        picksPlayer.awayTeamInfo = nbaTeams
            .firstWhere((nba) => nba.id.toString() == e.awayTeamId.toString());
        picksPlayer.guessInfo = e;
        picksPlayers.add(picksPlayer);
      }
      if (picksPlayers.isEmpty && rankInfo.ranks.isEmpty) {
        loadStatusRx.value = LoadDataStatus.noData;
      } else {
        loadStatusRx.value = LoadDataStatus.success;
      }
      refreshController.refreshCompleted();

      update([idMain]);
      UserEntity userEntiry = Get.find<HomeController>().userEntiry;
      var indexWhere = rankInfo.ranks.indexWhere(
          (e) => e.teamId == userEntiry.teamLoginInfo?.team?.teamId);
      if (indexWhere == -1) {
        scrollController.removeListener(_scrollListener);
        scrollController.addListener(_scrollListener);
      }
    }, onError: (e) {
      refreshController.refreshCompleted();
      loadStatusRx.value = LoadDataStatus.error;
    });
  }

  static String get idMain => "main";
  static String get idGuessList => "guessList";

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
