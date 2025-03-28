import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'index.dart';

class ReciveRwardController extends GetxController {
  ReciveRwardController();

  List<List<PicksPlayer>> listData = [];
  RefreshController refreshController = RefreshController();

  PicksDefineEntity? picksDefineEntity;

  var loadStatusRx = LoadDataStatus.loading.obs;

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
    var futures = [
      PicksApi.getGuessInfos(
          Get.find<HomeController>().userEntiry.teamLoginInfo?.team?.teamId ??
              0),
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
      if (result.length == 4) {
        picksDefineEntity = result[3] as PicksDefineEntity;
      }

      /// 1.只取status为2的项
      ///
      ///  STATUS_未结算 = 1;
      ///  STATUS_已结算未领取奖励 = 2;
      ///  STATUS_已结算已领取奖励 = 3;
      ///
      var guessHistoryList =
          result0.pointGuessing.where((e) => e.status == 2).toList();
      guessHistoryList
          .addAll(result0.newsGuessing.where((e) => e.status == 2).toList());
      listData.clear();
      for (var l in guessHistoryList) {
        List<PicksPlayer> players = [];
        for (var r in l.guessData) {
          PicksPlayer player = PicksPlayer();
          player.baseInfoList = result2.playerBaseInfoList
              .firstWhere((e) => r.playerId == e.playerId);
          player.dataAvgList = result2.playerDataAvgList
              .firstWhere((e) => r.playerId == e.playerId);
          player.awayTeamInfo = result1.firstWhere((e) => e.id == r.awayTeamId);
          player.reciveAwardInfo = l;
          player.guessData = r;
          players.add(player);
        }
        listData.add(players);
      }
      if (picksDefineEntity == null || listData.isEmpty) {
        loadStatusRx.value = LoadDataStatus.noData;
      } else {
        loadStatusRx.value = LoadDataStatus.success;
      }
      refreshController.refreshCompleted();
      update();
    }, onError: (e) {
      refreshController.refreshCompleted();
      loadStatusRx.value = LoadDataStatus.error;
    });
  }

  /// 一键领取所有奖励
  getGuessAllAward() {
    PicksApi.getGuessAllAward().then((result) {
      _initData();
    });
  }
}
