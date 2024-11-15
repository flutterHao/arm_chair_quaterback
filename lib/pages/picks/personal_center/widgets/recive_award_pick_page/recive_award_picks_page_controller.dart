import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
///@auther gejiahui
///created at 2024/9/23/21:02
class ReciveAwardPicksPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ReciveAwardPicksPageController(this.teamId, this.teamSimpleEntity);

  final int teamId;

  List<List<PicksPlayer>> listPointsData = [];
  List<List<PicksPlayer>> listNewsData = [];

  late int lastWinningStreak;
  late int guessWinningStreak;
  late int streakReward;

  PicksDefineEntity? picksDefineEntity;

  RefreshController refreshController = RefreshController();

  late TabController tabController;
  var tabs = ["Points", "News"];

  var loadStatusRx = LoadDataStatus.loading.obs;

  final TeamSimpleEntity teamSimpleEntity;

  loading() {
    if (loadStatusRx.value == LoadDataStatus.loading) {
      refreshController.refreshCompleted();
      return;
    }
    _initData();
  }

  loadMore() {
    /// todo 暂未实现
    Future.delayed(
        const Duration(seconds: 1), () => refreshController.loadComplete());
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    _initData();
  }

  void _initData() {
    loadStatusRx.value = LoadDataStatus.loading;
    var futures = [
      PicksApi.getGuessInfos(teamId),
      CacheApi.getNBATeamDefine(getList: true),
      CacheApi.getNBAPlayerInfo(),
    ];
    if (picksDefineEntity == null) {
      futures.add(CacheApi.getPickDefine());
    }
    Future.wait(futures).then((result) {
      ReciveAwardV2Entity result0 = result[0] as ReciveAwardV2Entity;
      List<NbaTeamEntity> result1 = result[1] as List<NbaTeamEntity>;
      NbaPlayerInfosEntity result2 = result[2] as NbaPlayerInfosEntity;
      lastWinningStreak = result0.lastWinningStreak;
      guessWinningStreak = result0.guessWinningStreak;
      streakReward = result0.streakReward;

      if (result.length == 4) {
        picksDefineEntity = result[3] as PicksDefineEntity;
      }

      /// 1.剔除status为2（未开奖）的数据项
      // List<ReciveAwardV2GuessInfo> guessHistoryList = result0.guessInfo
      //     .where((e) =>e.guessData[0].status != 2)
      //     .toList();
      listPointsData.clear();
      for (var l in result0.pointGuessing) {
        List<PicksPlayer> players = [];
        for (var r in l.guessData) {
          PicksPlayer player = PicksPlayer();
          if(r.type == 1) {
            player.baseInfoList = result2.playerBaseInfoList
                .firstWhere((e) => r.playerId == e.playerId);
            player.dataAvgList = result2.playerDataAvgList
                .firstWhere((e) => r.playerId == e.playerId);
            player.awayTeamInfo =
                result1.firstWhere((e) => e.id == r.awayTeamId);
          }
          player.reciveAwardInfo = l;
          player.guessData = r;
          players.add(player);
        }
        listPointsData.add(players);
      }

      listNewsData.clear();
      for (var l in result0.newsGuessing) {
        List<PicksPlayer> players = [];
        for (var r in l.guessData) {
          PicksPlayer player = PicksPlayer();
          if(r.type == 1) {
            player.baseInfoList = result2.playerBaseInfoList
                .firstWhere((e) => r.playerId == e.playerId);
            player.dataAvgList = result2.playerDataAvgList
                .firstWhere((e) => r.playerId == e.playerId);
            player.awayTeamInfo =
                result1.firstWhere((e) => e.id == r.awayTeamId);
          }
          player.reciveAwardInfo = l;
          players.add(player);
        }
        listNewsData.add(players);
      }

      if (picksDefineEntity == null) {
        loadStatusRx.value = LoadDataStatus.noData;
      } else {
        loadStatusRx.value = LoadDataStatus.success;
      }
      refreshController.refreshCompleted();
      update([idReceivePageMain]);
    }, onError: (e) {
      refreshController.refreshCompleted();
      loadStatusRx.value = LoadDataStatus.error;
    });
  }

  static String get idReceivePageMain => "id_receive_page_main";
}
