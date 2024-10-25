import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/global_nest_key.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_v2_entity.dart';
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
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '';

import '../../../common/entities/guess_game_info_entity.dart';
import 'index.dart';

class PicksIndexController extends GetxController {
  PicksIndexController();

  late ScrollController scrollController = ScrollController();
  final GlobalKey targetKey = GlobalKey(); // 用来标记目标 widget
  var isSelfInfoFloatShow = false.obs; //竞猜榜单自己的信息浮窗是否显示
  RefreshController refreshController = RefreshController();

  var loadStatusRx = LoadDataStatus.loading.obs;

  RankListEntity rankInfo = RankListEntity();

  Map<String, List<PicksPlayerV2>> guessGamePlayers = {};
  double streakReward = 0;
  int guessWinningStreak = 0;

  late NewsDefineEntity newsDefine;

  var currentIndex = 0.obs;

  var betCount = 0.0.obs; // 总赔率
  var costCount = 0.0.obs; // 总花费
  var choiceSize = 0.obs; //选中个数

  var batchDeleteOpen = false.obs;

  String getCurrentTabStr() {
    return ParamUtils.getProKey(
        guessGamePlayers.keys.toList()[currentIndex.value]);
  }

  List<PicksPlayerV2> getChoiceGuessPlayers() {
    List<PicksPlayerV2> list = [];
    for (int i = 0; i < guessGamePlayers.keys.length; i++) {
      var key = guessGamePlayers.keys.toList()[i];
      var list2 = guessGamePlayers[key]!;
      list.addAll(list2.where((e) => e.status != -1));
    }
    return list;
  }

  /// 选择了more/less
  choiceOne({PicksPlayerV2? player, bool needRefreshList = false}) {
    print('choiceOne---');
    if (player != null) {
      for (int i = 0; i < guessGamePlayers.keys.length; i++) {
        var key = guessGamePlayers.keys.toList()[i];
        var list2 = guessGamePlayers[key]!;
        var firstWhereOrNull = list2.firstWhereOrNull((e) =>
            e.guessInfo.playerId == player.guessInfo.playerId &&
            e.tabStr == player.tabStr);
        if (firstWhereOrNull != null) {
          firstWhereOrNull.status = player.status;
          break;
        }
      }
    }
    _count(needRefreshList);
  }

  void _count(bool needRefreshList) {
    print('choiceSize1111:${choiceSize.value}');
    choiceSize.value = getChoiceGuessPlayers().length;
    print('choiceSize2222:${choiceSize.value}');
    if (needRefreshList) {
      update([idGuessList, PicksIndexController.idGuessConfirmDialog]);
    }
  }

  changeTab(int index) {
    currentIndex.value = index;
    update([idGuessList]);
  }

  deleteChoice() {
    _count(true);
  }

  cleanAll() {
    batchDeleteOpen.value = false;
    for (int i = 0; i < guessGamePlayers.keys.length; i++) {
      var key = guessGamePlayers.keys.toList()[i];
      var list2 = guessGamePlayers[key]!;
      for (int i1 = 0; i1 < list2.length; i1++) {
        var playerV2 = list2[i1];
        if (playerV2.status != -1) {
          playerV2.status = -1;
        }
      }
    }
    _count(true);
  }

  guess(int type) {
    List<GuessParamEntity> params = [];
    for (int i = 0; i < guessGamePlayers.keys.length; i++) {
      var key = guessGamePlayers.keys.toList()[i];
      var list2 = guessGamePlayers[key]!;
      for (int i1 = 0; i1 < list2.length; i1++) {
        var playerV2 = list2[i1];
        if (playerV2.status != -1) {
          GuessParamEntity guessParamEntity = GuessParamEntity();
          guessParamEntity.awayTeamId = playerV2.awayTeamInfo!.id;
          guessParamEntity.gameId = playerV2.guessInfo.gameId;
          guessParamEntity.playerId = playerV2.guessInfo.playerId;
          guessParamEntity.gameStartTime = playerV2.guessInfo.gameStartTime;
          guessParamEntity.guessAttr = playerV2.tabStr;
          guessParamEntity.guessChoice = playerV2.status == 0 ? 1 : 2;
          guessParamEntity.guessReferenceValue = playerV2.guessInfo.guessReferenceValue
              .toJson()[ParamUtils.getProKey(playerV2.tabStr)];
          params.add(guessParamEntity);
        }
      }
    }
    PicksApi.guess(type,params).then((result) {
      Get.back();
      cleanAll();
      _initData();
    },onError: (e){
      EasyLoading.showToast("SERVER ERROR");
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
      if (targetOffset <= screenHeight&&scrollController.position.pixels>0) {
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
      guessGamePlayers.clear();
      _count(false);
      var guessGameInfo = results[0] as GuessGameInfoV2Entity;
      var res = guessGameInfo.guessInfo.toJson();
      streakReward = guessGameInfo.streakReward;
      guessWinningStreak = guessGameInfo.guessWinningStreak;
      var nbaPlayers = results[1] as NbaPlayerInfosEntity;
      newsDefine = results[2];
      List<NbaTeamEntity> teamList = results[3] as List<NbaTeamEntity>;
      for (int i = 0; i < res.keys.length; i++) {
        List<PicksPlayerV2> item = [];
        var key = res.keys.toList()[i];
        var list = res[key]!;
        for (int i1 = 0; i1 < list.length; i1++) {
          GuessGameInfoEntity guessGameInfoEntity =
              GuessGameInfoEntity.fromJson(list[i1]);
          PicksPlayerV2 playerV2 = PicksPlayerV2();
          playerV2.tabStr = key;
          playerV2.baseInfoList = nbaPlayers.playerBaseInfoList
              .firstWhere((e) => e.playerId == guessGameInfoEntity.playerId);
          playerV2.dataAvgList = nbaPlayers.playerDataAvgList
              .firstWhere((e) => e.playerId == guessGameInfoEntity.playerId);
          playerV2.awayTeamInfo = teamList
              .firstWhereOrNull((e) => e.id == guessGameInfoEntity.awayTeamId);
          playerV2.guessInfo = guessGameInfoEntity;
          item.add(playerV2);
        }
        guessGamePlayers[key] = item;
      }

      ///rank 排行榜
      rankInfo = results[4] as RankListEntity;
      if (guessGamePlayers.isEmpty && rankInfo.ranks.isEmpty) {
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

  static String get idMain => "id_main";

  static String get idGuessList => "id_guess_list";

  static String get idGuessConfirmDialog => "id_guess_confirm_dialog";

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
