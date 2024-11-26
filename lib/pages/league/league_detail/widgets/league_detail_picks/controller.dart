import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/league_detail_picks_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LeagueDetailPicksController extends GetxController
    with GetTickerProviderStateMixin {
  LeagueDetailPicksController(this.item);

  final ScoresEntity item;

  var loadStatus = LoadDataStatus.loading.obs;

  LeagueDetailPicksEntity? leagueDetailPicks;

  TabController? tabController;

  ScrollController scrollController = ScrollController();

  var isWidgetReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
    Get.find<LeagueController>().guessSuccessTabKeys.listen((v) {
      initData();
    });
  }

  @override
  void dispose() {
    tabController?.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 300), () {
      isWidgetReady.value = true;
    });
  }

  initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      LeagueApi.getNBAGamePicks(item.gameId),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getPickDefine(),
      CacheApi.getNBATeamDefine(getList: true),
      CacheApi.getPickType(),
    ]).then((result) {
      leagueDetailPicks = result[0];
      tabController ??= TabController(length: getTabs().length, vsync: this)
        ..addListener(() {
          scrollController.animateTo(
              min(scrollController.position.maxScrollExtent,
                  108.w * tabController!.index),
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOutSine);
        });
      loadStatus.value = LoadDataStatus.success;
      update([idLeagueDetailPicks]);
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  static String get idLeagueDetailPicks => "id_league_detail_picks";

  GameGuess getGameGuess() {
    var gameGuess = GameGuess(leagueDetailPicks!.scheduleData.first);
    Get.find<LeagueController>().cacheGameGuessData.forEach((key, e) {
      var firstWhereOrNull = e.firstWhereOrNull(
          (e) => e.scoresEntity.gameId == gameGuess.scoresEntity.gameId);
      if (firstWhereOrNull != null) {
        gameGuess = firstWhereOrNull;
      }
    });
    return gameGuess;
  }

  Map<String, List<PicksPlayerV2>> getPlayerV2() {
    Map<String, List<PicksPlayerV2>> playerV2 = {};
    var res = leagueDetailPicks!.guessDataInfo;
    var choiceGuessPlayers = Get.find<PicksIndexController>().guessGamePlayers;
    for (int i = 0; i < res.keys.length; i++) {
      List<PicksPlayerV2> data = [];
      var key = res.keys.toList()[i];
      var list = res[key] ?? [];
      for (int i1 = 0; i1 < list.length; i1++) {
        GuessGameInfoEntity item = list[i1];
        PicksPlayerV2? p;
        choiceGuessPlayers.forEach((k, e) {
          var firstWhereOrNull = e.firstWhereOrNull(
              (e) => e.tabStr == key && e.guessInfo.playerId == item.playerId);
          if (firstWhereOrNull != null) {
            p = firstWhereOrNull;
          }
        });
        if (p != null) {
          data.add(p!);
          continue;
        }
        PicksPlayerV2 playerV2 = PicksPlayerV2();
        playerV2.tabStr = key;
        playerV2.baseInfoList = Utils.getPlayBaseInfo(item.playerId);
        playerV2.dataAvgList = Utils.getPlayerDataAvg(item.playerId);
        playerV2.awayTeamInfo = Utils.getTeamInfo(item.teamId);
        playerV2.guessInfo = item;
        data.add(playerV2);
      }

      //排序：赛季平均得分
      data.sort((a, b) {
        return b.dataAvgList!.pts.compareTo(a.dataAvgList!.pts);
      });

      //排序：选过的放后面
      // item.sort((a, b) {
      //   if (a.guessInfo.guessData.isNotEmpty) return 1;
      //   if (b.guessInfo.guessData.isNotEmpty) return -1;
      //   return 0;
      // });
      playerV2[key] = data;
    }
    Map<String, List<PicksPlayerV2>> result = {};
    for (var item in CacheApi.pickType ?? []) {
      var key = item.pickTypeName;
      if (playerV2.containsKey(key)) {
        result[key] = playerV2[key]!;
      }
    }
    return result;
  }

  List<String> getTabs() {
    return getPlayerV2().keys.toList();
  }

  int getPlayerMaxLength() {
    var playerV2 = getPlayerV2();
    int len = 0;
    for (var key in playerV2.keys) {
      len = max(len, playerV2[key]!.length);
    }
    return len;
  }
}
