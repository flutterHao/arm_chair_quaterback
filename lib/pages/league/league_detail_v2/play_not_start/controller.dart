import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/league_detail_picks_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/extension/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/param_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/league/league_detail_v2/play_already_start/controller.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/22/16:20

class PlayNotStartController extends GetxController
    with GetTickerProviderStateMixin, WidgetsBindingObserver {
  final ScoresEntity item;

  PlayNotStartController(this.item);

  GlobalKey headerKey = GlobalKey();

  ScoresNotStartGameEntity? scoresNotStartGameEntity;

  var loadStatus = LoadDataStatus.loading.obs;

  List<String> tabPropertyTitles = ["DATA", "HISTORY"];

  late TabController teamL5GameTabController;

  late TabController teamPlayersTabController;

  LeagueDetailPicksEntity? leagueDetailPicks;

  TabController? tabController;

  ScrollController scrollController = ScrollController();

  Timer? _timer;

  var gameStartTimesCountDown = 0.obs;

  int day = 0;
  int hh = 0;
  int minute = 0;

  late StreamSubscription<List> subscription;

  var isExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    initData();
    subscription = Get.find<LeagueController>().guessSuccessTabKeys.listen((v) {
      initData();
    });
    teamL5GameTabController = TabController(length: 2, vsync: this);
    teamPlayersTabController = TabController(length: 2, vsync: this);
    timeCountDown();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      timeCountDown();
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.addObserver(this);
    teamL5GameTabController.dispose();
    teamPlayersTabController.dispose();
    tabController?.dispose();
    scrollController.dispose();
    _timer?.cancel();
    subscription.cancel();
    super.onClose();
  }

  timeCountDown() {
    _timer?.cancel();
    var duration = MyDateUtils.getDateTimeByMs(item.gameStartTime)
        .difference(DateTime.now());
    if (duration <= Duration.zero) {
      return;
    }
    updateCountDownTime(duration);
    _timer = Timer.periodic(const Duration(minutes: 1), (t) {
      var duration = MyDateUtils.getDateTimeByMs(item.gameStartTime)
          .difference(DateTime.now());
      if (duration <= Duration.zero) {
        t.cancel();
        return;
      }
      updateCountDownTime(duration);
    });
  }

  void updateCountDownTime(Duration duration) {
    day = duration.inDays;
    hh = duration.inHours % 24;
    minute = duration.inMinutes % 60;
    gameStartTimesCountDown.value = duration.inMilliseconds;
  }

  /// 格式化为两位数
  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      LeagueApi.getNotStartGameData(item.gameId),
      CacheApi.getNBATeamDefine(),
      CacheApi.getNBAPlayerInfo(),
      LeagueApi.getNBAGamePicks(item.gameId),
      CacheApi.getPickDefine(),
      CacheApi.getPickType(),
    ]).then((result) {
      scoresNotStartGameEntity = result[0];
      leagueDetailPicks = result[3];
      tabController ??= TabController(length: getTabs().length, vsync: this)
        ..addListener(() {
          scrollController.animateTo(
              min(scrollController.position.maxScrollExtent,
                  108.w * tabController!.index),
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOutSine);
        });
      loadStatus.value = LoadDataStatus.success;
      update();
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  List<TeamStats> getTeamStatsData() {
    List<TeamStats> list = [];
    if (scoresNotStartGameEntity?.nbaTeamStatRankList.isEmpty == true) {
      return [];
    }
    var homeDetail = scoresNotStartGameEntity?.nbaTeamStatRankList
        .firstWhereOrNull((e) => e.teamId == item.homeTeamId);
    var awayDetail = scoresNotStartGameEntity?.nbaTeamStatRankList
        .firstWhereOrNull((e) => e.teamId == item.awayTeamId);

    list.add(TeamStats("Points", homeDetail?.pts ?? 0, awayDetail?.pts ?? 0));
    list.add(TeamStats("Rebound", homeDetail?.reb ?? 0, awayDetail?.reb ?? 0));
    list.add(TeamStats("Assist", homeDetail?.ast ?? 0, awayDetail?.ast ?? 0));
    list.add(TeamStats("Steals", homeDetail?.stl ?? 0, awayDetail?.stl ?? 0));
    list.add(
        TeamStats("Block Shot ", homeDetail?.blk ?? 0, awayDetail?.blk ?? 0));
    list.add(TeamStats(
        "Free Throw Make", homeDetail?.ftm ?? 0, awayDetail?.ftm ?? 0));
    list.add(TeamStats(
        "3 Points Make", homeDetail?.fg3M ?? 0, awayDetail?.fg3M ?? 0));
    list.add(
        TeamStats("Turn over", homeDetail?.tov ?? 0, awayDetail?.tov ?? 0));
    list.add(TeamStats("Foul", homeDetail?.pf ?? 0, awayDetail?.pf ?? 0));

    list.add(TeamStats(
        "Field Goal %",
        ((homeDetail?.fgm ?? 0) / (homeDetail?.fga ?? 0)).handlerNaNInfinity(),
        ((awayDetail?.fgm ?? 0) / (awayDetail?.fga ?? 0)).handlerNaNInfinity(),
        valueIsPercent: true));
    list.add(TeamStats(
        "Free Throw %",
        ((homeDetail?.ftm ?? 0) / (homeDetail?.fta ?? 0)).handlerNaNInfinity(),
        ((awayDetail?.ftm ?? 0) / (awayDetail?.fta ?? 0)).handlerNaNInfinity(),
        valueIsPercent: true));
    list.add(TeamStats(
        "3 Point %",
        ((homeDetail?.fg3M ?? 0) / (homeDetail?.fg3A ?? 0))
            .handlerNaNInfinity(),
        ((awayDetail?.fg3M ?? 0) / (awayDetail?.fg3A ?? 0))
            .handlerNaNInfinity(),
        valueIsPercent: true));
    return list;
  }

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
        playerV2.awayTeamInfo = Utils.getTeamInfo(item.awayTeamId);
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

  int getMVPTotalSupportCount() {
    return scoresNotStartGameEntity!.questions.fold(0, (p, e) {
      return p + e.supportCount;
    });
  }

  scheduleChoose(Question question) {
    LeagueApi.scheduleChoose(question.playerId, question.gameId).then((result) {
      initData();
      // try {
      //   /// 获得篮球，刷新篮球数量
      //   Get.find<TrainingController>().getData();
      // } finally {}
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  String getGuessStr() {
    var question = scoresNotStartGameEntity!.questions[0];
    Map<String, String> map = {
      "pts": "Who is the scorer leader in the game?",
      "reb": "Who is the rebound leader in the game?",
      "3pm": "Who can make the most three points in the game?",
      "ast": "Who can make the most assists in the game?",
      "blk": "Who can make the most block shot  in the game?",
    };
    return map[ParamUtils.getProKey(question.attr ?? '')] ?? '';
  }
}
