import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_rank_by_cycle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_top_reviews_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pick_type_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/click_feed_back.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/low_resources_bottomsheet.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PicksIndexController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PicksIndexController();

  TabController? tabController;
  late ScrollController scrollController = ScrollController();
  final GlobalKey targetKey = GlobalKey(); // 用来标记目标 widget
  var isSelfInfoFloatShow = false.obs; //竞猜榜单自己的信息浮窗是否显示
  RefreshController refreshController = RefreshController();

  var loadStatusRx = LoadDataStatus.noData.obs;

  GuessRankByCycleEntity? rankInfo;

  Map<String, List<PicksPlayerV2>> guessGamePlayers = {};
  double streakReward = 0;
  int guessWinningStreak = 0;

  late PicksDefineEntity picksDefine;

  late List<PickTypeEntity> _pickTypeEntity;

  var currentIndex = 0.obs;

  var choiceSize = 0.obs; //选中个数

  var batchDeleteOpen = false.obs;

  bool loadDataSuccess = false;

  late StreamSubscription<int> subscription;

  late StreamSubscription<int> tabSubscription;

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
  choiceOne({PicksPlayerV2? player, bool needRefreshList = false}) async {
    print('choiceOne---');
    if (player != null) {
      bool hasPlayer = false;
      for (int i = 0; i < guessGamePlayers.keys.length; i++) {
        var key = guessGamePlayers.keys.toList()[i];
        var list2 = guessGamePlayers[key]!;
        var firstWhereOrNull = list2.firstWhereOrNull((e) =>
            e.guessInfo.playerId == player.guessInfo.playerId &&
            e.tabStr == player.tabStr);
        if (firstWhereOrNull != null) {
          firstWhereOrNull.status = player.status;
          hasPlayer = true;
          break;
        }
      }

      /// 现有的列表不包含此球员,刷新数据之后再加一次
      if (!hasPlayer) {
        _initData().then((v){
          choiceOne(player: player, needRefreshList: needRefreshList);
        });
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

  clearAll() {
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

  guess(int type, Function onSuccess) {
    ///消耗钱币大于我的拥有钱币时
    if (int.parse(picksDefine.betCost) >
        HomeController.to.userEntiry.teamLoginInfo!.getCoin().toInt()) {
      return LowResourcesBottomsheet.show(ResourceType.coins);
    }

    List params = [];
    //组装已下注的球员的参数列表
    var fold = guessGamePlayers.keys.fold([], (p, key) {
      var list = guessGamePlayers[key]!;
      var list2 = list.where((e) => e.status != -1).map((playerV2) {
        GuessPlayerParamEntity guessParamEntity = GuessPlayerParamEntity();
        guessParamEntity.awayTeamId = playerV2.awayTeamInfo!.id;
        guessParamEntity.gameId = playerV2.guessInfo.gameId;
        guessParamEntity.playerId = playerV2.guessInfo.playerId;
        guessParamEntity.gameStartTime = playerV2.guessInfo.gameStartTime;
        guessParamEntity.guessAttr = playerV2.tabStr;
        guessParamEntity.guessChoice = playerV2.status == 0 ? 1 : 2;
        guessParamEntity.guessReferenceValue =
            playerV2.guessInfo.guessReferenceValue[playerV2.tabStr] ?? 0;
        return guessParamEntity;
      }).toList();
      p.addAll(list2);
      return p;
    });
    params.addAll(fold);
    //组装已下注的赛程参数列表
    var leagueController = Get.find<LeagueController>();
    List<GameGuess> guessGameList = leagueController.getAllChoiceData();
    var list = guessGameList.map((e) {
      var guessGameParamEntity = GuessGameParamEntity();
      guessGameParamEntity.awayTeamId = e.scoresEntity.awayTeamId;
      guessGameParamEntity.homeTeamId = e.scoresEntity.homeTeamId;
      guessGameParamEntity.gameId = e.scoresEntity.gameId;
      guessGameParamEntity.gameStartTime = e.scoresEntity.gameStartTime;
      guessGameParamEntity.guessChoice = e.choiceTeamId.value;
      return guessGameParamEntity;
    }).toList();
    params.addAll(list);
    PicksApi.guess(type, params, 0).then((result) {
      Get.back();
      clearAll();
      _initData();
      Get.find<HomeController>().refreshMoneyCoinWidget();
      leagueController.refreshDataAfterGuessSuccess();
      ClickFeedBack.selectionClick();
      onSuccess.call();
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
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
    tabSubscription = Get.find<HomeController>().tabIndex.listen((value) {
      if (value == 3) {
        sort();
        update([idMain]);
      }
    });
    subscription = WSInstance.netStream.listen((value) {
      if (!loadDataSuccess) {
        _initData();
      }
    });
    _initData();
  }

  Future _initData() {
    if (loadStatusRx.value == LoadDataStatus.loading) {
      return Future.delayed(Duration.zero);
    }
    loadStatusRx.value = LoadDataStatus.loading;
    Completer completer = Completer();
    Future.wait([
      PicksApi.getGuessGamesInfo(),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getPickDefine(),
      CacheApi.getNBATeamDefine(getList: true),
      PicksApi.getGuessRankByCycle(
          cycle: DateTime.now().millisecondsSinceEpoch),
      PicksApi.getGuessTopReviews(),
      CacheApi.getPickType(),
    ]).then((results) {
      loadDataSuccess = true;
      guessGamePlayers.clear();
      _count(false);
      var guessGameInfo = results[0] as GuessGameInfoV2Entity;
      var res = guessGameInfo.guessInfo;
      streakReward = guessGameInfo.streakReward;
      guessWinningStreak = guessGameInfo.guessWinningStreak;
      var nbaPlayers = results[1] as NbaPlayerInfosEntity;
      picksDefine = results[2];
      _pickTypeEntity = results[6];
      List<GuessTopReviewsEntity> guessTopReviewsEntity =
          results[5] as List<GuessTopReviewsEntity>;
      Map<String, List<PicksPlayerV2>> temp = {};
      List<NbaTeamEntity> teamList = results[3] as List<NbaTeamEntity>;
      for (int i = 0; i < res.keys.length; i++) {
        List<PicksPlayerV2> item = [];
        var key = res.keys.toList()[i];
        var list = res[key] ?? [];
        for (int i1 = 0; i1 < list.length; i1++) {
          GuessGameInfoEntity guessGameInfoEntity = list[i1];
          PicksPlayerV2 playerV2 = PicksPlayerV2();
          playerV2.tabStr = key;
          playerV2.baseInfoList = nbaPlayers.playerBaseInfoList
              .firstWhere((e) => e.playerId == guessGameInfoEntity.playerId);
          playerV2.dataAvgList = nbaPlayers.playerDataAvgList
              .firstWhere((e) => e.playerId == guessGameInfoEntity.playerId);
          playerV2.awayTeamInfo = teamList
              .firstWhereOrNull((e) => e.id == guessGameInfoEntity.awayTeamId);
          playerV2.guessInfo = guessGameInfoEntity;
          playerV2.guessTopReviews = guessTopReviewsEntity.firstWhereOrNull(
              (e) => e.playerId == guessGameInfoEntity.playerId);
          item.add(playerV2);
        }
        temp[key] = item;
      }
      for (var item in _pickTypeEntity) {
        var key = item.pickTypeName;
        if (temp.containsKey(key)) {
          guessGamePlayers[key] = temp[key]!;
        }
      }
      sort();

      ///rank 排行榜
      rankInfo = results[4] as GuessRankByCycleEntity;
      tabController ??=
          TabController(length: guessGamePlayers.keys.length, vsync: this);

      if (guessGamePlayers.isEmpty) {
        loadStatusRx.value = LoadDataStatus.noData;
      } else {
        loadStatusRx.value = LoadDataStatus.success;
      }
      refreshController.refreshCompleted();
      completer.complete();
      update([idMain]);
    }, onError: (e) {
      refreshController.refreshCompleted();
      completer.completeError(e);
      loadStatusRx.value = LoadDataStatus.error;
    });
    return completer.future;
  }

  /// 排序
  void sort() {
    guessGamePlayers = guessGamePlayers.keys.fold({}, (p, key) {
      var guessGamePlayer = guessGamePlayers[key]!;
      var nowMilliseconds = DateTime.now().millisecondsSinceEpoch;
      var gameNotStartPlayers = guessGamePlayer.fold([], (p, e) {
        if (e.guessInfo.gameStartTime > nowMilliseconds) {
          p.add(e);
        }
        return p;
      });
      gameNotStartPlayers.sort((a, b) {
        var compareTo =
            a.guessInfo.gameStartTime.compareTo(b.guessInfo.gameStartTime);
        if (compareTo != 0) {
          return compareTo;
        }
        //都使用PTS的竞猜分排序
        return (b.guessInfo.guessReferenceValue["PTS"] ?? 0)
            .compareTo(a.guessInfo.guessReferenceValue["PTS"] ?? 0);
      });
      var gameAlreadyStartPlayers = guessGamePlayer.fold([], (p, e) {
        if (e.guessInfo.gameStartTime <= nowMilliseconds) {
          p.add(e);
        }
        return p;
      });
      gameAlreadyStartPlayers.sort((a, b) {
        var compareTo =
            a.guessInfo.gameStartTime.compareTo(b.guessInfo.gameStartTime);
        if (compareTo != 0) {
          return compareTo;
        }
        //都使用PTS的竞猜分排序
        return (b.guessInfo.guessReferenceValue["PTS"] ?? 0)
            .compareTo(a.guessInfo.guessReferenceValue["PTS"] ?? 0);
      });
      p[key] = [...gameNotStartPlayers, ...gameAlreadyStartPlayers];
      return p;
    });
  }

  void scrollToTop() {
    try {
      if (scrollController.offset == 0) {
        return;
      }
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      print('PickIndexController--scrollToTop--error--: $e');
    }
  }

  static String get idMain => "id_main";

  static String get idGuessList => "id_guess_list";

  static String get idGuessConfirmDialog => "id_guess_confirm_dialog";

  @override
  void onClose() {
    subscription.cancel();
    tabSubscription.cancel();
    refreshController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
