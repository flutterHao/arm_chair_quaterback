import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GameGuess {
  final ScoresEntity scoresEntity;

  ///选中的teamId,未选中 =0
  RxInt choiceTeamId = RxInt(0);

  GameGuess(this.scoresEntity);
}

class LeagueController extends GetxController
    with GetTickerProviderStateMixin {
  LeagueController();

  RefreshController refreshController = RefreshController();

  var currentPageIndex = 1.obs;
  PageController pageController = PageController(initialPage: 1);
  List<GameGuess> scoreList = [];

  //缓存数据，下拉刷新则删除对应缓存 key :startTime_endTime, value : 对应日期的缓存数据
  Map<String, List<GameGuess>> cacheGameGuessData = {};
  PicksDefineEntity? picksDefineEntity;
  var loadStatus = LoadDataStatus.noData.obs;
  var choiceSize = 0.obs;

  var guessSuccessTabKeys = [].obs;

  TabController? tabController;

  bool isLoadSuccess = false;

  // 存储的没有数据的日期
  List<DateTime> noDataDayList = [];

  AppLifecycleListener? _appLifecycleListener;
  StreamSubscription? _subscription;

  late StreamSubscription<int> tabSubscription;

  List<DateTime> getDataTimes() {
    var dateList = getAllDataTimes();
    dateList.removeWhere((e) => noDataDayList.contains(e));
    return dateList;
  }

  List<DateTime> getAllDataTimes() {
    // 获取今天的日期
    DateTime today = DateTime.now();

    // 计算前六天、今天和后七天的零点日期
    List<DateTime> dateList = List.generate(
      6 + 1 + 7, // 前六天 + 今天 + 后七天
      (index) {
        DateTime date = today.add(Duration(days: index - 6));
        return DateTime(date.year, date.month, date.day); // 设置时间为零点
      },
    );
    return dateList;
  }

  /// 预加载今明两天的数据,因为只可以竞猜这两天的赛程
  preLoadData() {
    currentPageIndex.value = 6;
    getDataFromNet(getDataTimes()[currentPageIndex.value]);
    getDataFromNet(getDataTimes()[currentPageIndex.value + 1]);
  }

  void getDataFromNet(DateTime time) {
    var startTime = time.millisecondsSinceEpoch;
    var endTime = MyDateUtils.nextDay(time).millisecondsSinceEpoch;
    print('scores -------->>> startTime: $startTime -> ${time.day}');
    var key = "${startTime}_$endTime";
    if (cacheGameGuessData.containsKey(key) &&
        cacheGameGuessData[key]!.isNotEmpty) {
      return;
    }
    var futures = <Future>[
      LeagueApi.getNBAGameSchedules(startTime, endTime),
      CacheApi.getNBATeamDefine(),
      CacheApi.getNBAPlayerInfo(),
    ];
    if (picksDefineEntity == null) {
      futures.add(CacheApi.getPickDefine());
    }

    Future.wait(futures).then((result) {
      var list = result[0] as List<ScoresEntity>;
      if (futures.length == 4) {
        picksDefineEntity = result[3] as PicksDefineEntity;
      }
      scoreList = list.map((e) {
        var gameGuess = GameGuess(e);
        return gameGuess;
      }).toList();
      sortScoreList();
      cacheGameGuessData[key] = scoreList;
    }, onError: (e) {});
  }

  void sortScoreList() {
    scoreList.sort((a, b) =>
        a.scoresEntity.gameStartTime.compareTo(b.scoresEntity.gameStartTime));
    scoreList.sort((a, b) {
      //比赛开赛前，没有猜过的排前面
      if (a.scoresEntity.isGuess != 0) return 1;
      if (b.scoresEntity.isGuess != 0) return -1;
      return 0;
    });
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getScoreDateTime();
    _subscription = WSInstance.netStream.listen((status) {
      print('lllllll------net----');
      if (!isLoadSuccess) {
        getScoreDateTime();
      }
    });
    tabSubscription = Get.find<HomeController>().tabIndex.listen((value) {
      if (value == 1) {
        getScoreDateTime();
      }
    });
    _appLifecycleListener = AppLifecycleListener(
      onResume: () {
        _subscription?.resume();
        getScoreDateTime();
      },
      onPause: _subscription?.pause,
      onHide: _subscription?.pause,
    );
  }

  Future getScoreDateTime() {
    if (loadStatus.value == LoadDataStatus.loading) {
      return Future.delayed(Duration.zero);
    }
    bool needShowLoading = !isLoadSuccess;
    if (needShowLoading) {
      loadStatus.value = LoadDataStatus.loading;
    }
    return Future.wait([
      CacheApi.getPickDefine(),
      LeagueApi.queryNBAGameSchedulesInfo(
          getAllDataTimes().first.millisecondsSinceEpoch,
          getAllDataTimes().last.millisecondsSinceEpoch)
    ]).then((result) {
      isLoadSuccess = true;
      picksDefineEntity = result[0] as PicksDefineEntity;
      List<GameSchedulesInfo> list = result[1] as List<GameSchedulesInfo>;

      noDataDayList = getDataTimes()
          .where((e) => list
              .where((l) => MyDateUtils.isSameDay(
                  MyDateUtils.getDateTimeByMs(l.gameStartTime), e))
              .isEmpty)
          .toList();
      if (needShowLoading) {
        var dateTime = DateTime.now();
        var nowStartTime =
            DateTime(dateTime.year, dateTime.month, dateTime.day);
        if (getDataTimes().contains(nowStartTime)) {
          currentPageIndex.value = getDataTimes().indexOf(nowStartTime);
        } else if (getDataTimes().length > 6) {
          currentPageIndex.value = 6;
        } else {
          currentPageIndex.value = getDataTimes().length - 1;
        }
      }
      if (getDataTimes().isEmpty) {
        if (needShowLoading) {
          loadStatus.value = LoadDataStatus.noData;
        }
      } else {
        if (needShowLoading) {
          loadStatus.value = LoadDataStatus.success;
        }
        if(tabController != null){
          tabController!.dispose();
        }
        tabController = TabController(
            initialIndex: currentPageIndex.value,
            length: getDataTimes()
                .map((e) => e.millisecondsSinceEpoch)
                .toList()
                .length,
            vsync: this)
          ..addListener(() {
            onPageChanged(tabController!.index);
          });
      }

      // if (!needShowLoading) {
      update();
      // }
      refreshController.refreshCompleted();
    }, onError: (e) {
      ErrorUtils.toast(e);
      if (isLoadSuccess) {
        return;
      }
      loadStatus.value = LoadDataStatus.error;
      refreshController.refreshCompleted();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    _subscription?.cancel();
    tabSubscription.cancel();
    _appLifecycleListener?.dispose();
    super.dispose();
  }

  int getStartTime() {
    var dataTime = getDataTimes()[currentPageIndex.value];
    return dataTime.millisecondsSinceEpoch;
  }

  int getEndTime() {
    var dataTime = getDataTimes()[currentPageIndex.value];
    return MyDateUtils.nextDay(dataTime).millisecondsSinceEpoch;
  }

  onPageChanged(int index) {
    currentPageIndex.value = index;
  }

  void btnTap(GameGuess gameGuess, int teamId) {
    print(
        'gameGuess.choiceTeamId.value:${gameGuess.choiceTeamId.value},teamId:$teamId');
    gameGuess.choiceTeamId.value =
        gameGuess.choiceTeamId.value == teamId ? 0 : teamId;
    print('gameGuess.choiceTeamId.value:${gameGuess.choiceTeamId.value}');
    print('LeagueController---choiceSize.value000:${choiceSize.value}');
    choiceSize.value = getAllChoiceData().length;
    print('LeagueController---choiceSize.value111:${choiceSize.value}');
  }

  static String get idGameGuessConfirmDialog => "id_game_guess_confirm_dialog";

  deleteOne() {
    choiceSize.value = getAllChoiceData().length;
    update([idGameGuessConfirmDialog]);
  }

  List<GameGuess> getAllChoiceData() {
    return cacheGameGuessData.keys.fold([], (p, e) {
      var list = cacheGameGuessData[e]!
          .where((e) => e.choiceTeamId.value != 0)
          .toList();
      p.addAll(list);
      return p;
    });
  }

  void refreshDataAfterGuessSuccess() {
    var listKeys = cacheGameGuessData.keys.fold([], (p, e) {
      var list = cacheGameGuessData[e]!
          .where((e) => e.choiceTeamId.value != 0)
          .toList();
      if (list.isNotEmpty) {
        p.add(e);
      }
      return p;
    });
    guessSuccessTabKeys.value = listKeys;
    cacheGameGuessData.clear();
    choiceSize.value = getAllChoiceData().length;
  }

  void cleanAll() {
    for (int i = 0; i < cacheGameGuessData.keys.length; i++) {
      var key = cacheGameGuessData.keys.toList()[i];
      var list = cacheGameGuessData[key] ?? [];
      if (list.isNotEmpty) {
        for (int j = 0; j < list.length; j++) {
          var guessItem = list[j];
          if (guessItem.choiceTeamId.value == 0) {
            continue;
          }
          guessItem.choiceTeamId.value = 0;
        }
      }
    }
    var startTime = getStartTime();
    var endTime = getEndTime();
    var cacheKey = "${startTime}_$endTime";
    scoreList = cacheGameGuessData[cacheKey] ?? [];
    choiceSize.value = getAllChoiceData().length;
  }

  GameGuess? getGameGuess(int gameId) {
    GameGuess? gameGuess;
    cacheGameGuessData.forEach((key, e) {
      var firstWhereOrNull =
          e.firstWhereOrNull((e) => e.scoresEntity.gameId == gameId);
      if (firstWhereOrNull != null) {
        gameGuess = firstWhereOrNull;
      }
    });
    return gameGuess;
  }
}
