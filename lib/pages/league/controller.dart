import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/click_feed_back.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
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
    with GetSingleTickerProviderStateMixin {
  LeagueController();

  RefreshController refreshController = RefreshController();

  List<String> pageText = ["YESTERDAY", "TODAY", "TOMORROW"];

  var currentPageIndex = 1.obs;
  PageController pageController = PageController(initialPage: 1);
  List<GameGuess> scoreList = [];

  //缓存数据，下拉刷新则删除对应缓存 key :startTime_endTime, value : 对应日期的缓存数据
  Map<String, List<GameGuess>> cacheGameGuessData = {};
  PicksDefineEntity? picksDefineEntity;
  var loadStatus = LoadDataStatus.noData.obs;
  var choiceSize = 0.obs;

  late TabController tabController;

  loading() {
    getData(isRefresh: true);
  }

  List<DateTime> getDataTimes() {
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

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    currentPageIndex.value = 6;
    tabController = TabController(
      initialIndex: currentPageIndex.value,
        length:
            getDataTimes().map((e) => e.millisecondsSinceEpoch).toList().length,
        vsync: this)..addListener((){
          onPageChanged(tabController.index);
    });
    getData();
  }

  getData({bool isRefresh = false}) {
    int startTime = getStartTime();
    int endTime = getEndTime();
    var cacheKey = "${startTime}_$endTime";
    if (cacheGameGuessData.containsKey(cacheKey) &&
        !isRefresh &&
        picksDefineEntity != null) {
      getDataFromCache(cacheKey);
      return;
    }
    //获取已选择的项,暂存
    List<GameGuess> temp = [];
    if (cacheGameGuessData.containsKey(cacheKey)) {
      temp = cacheGameGuessData[cacheKey]!
          .where((e) => e.choiceTeamId.value != 0)
          .toList();
    }
    scoreList = [];
    loadStatus.value = LoadDataStatus.loading;
    update([idLeagueMain]);
    getDataFromNet(startTime, endTime, cacheKey, temp);
  }

  String getCurrentCacheKey() {
    int startTime = getStartTime();
    int endTime = getEndTime();
    var cacheKey = "${startTime}_$endTime";
    return cacheKey;
  }

  int getStartTime() {
    var dataTime = getDataTimes()[currentPageIndex.value];
    return dataTime.millisecondsSinceEpoch;
  }

  int getEndTime() {
    var dataTime = getDataTimes()[currentPageIndex.value];
    return MyDateUtils.nextDay(dataTime).millisecondsSinceEpoch;
  }

  void getDataFromCache(String cacheKey) {
    scoreList = cacheGameGuessData[cacheKey]!;
    sortScoreList();
    if (scoreList.isEmpty) {
      loadStatus.value = LoadDataStatus.noData;
    } else {
      loadStatus.value = LoadDataStatus.success;
    }
    refreshController.refreshCompleted();
    update([idLeagueMain]);
  }

  void sortScoreList() {
    scoreList.sort((a,b) => a.scoresEntity.gameStartTime.compareTo(b.scoresEntity.gameStartTime));
    scoreList.sort((a, b) {
      if (a.scoresEntity.isGuess != 0) return 1;
      if (b.scoresEntity.isGuess != 0) return -1;
      return 0;
    });
  }

  void getDataFromNet(
      int startTime, int endTime, String cacheKey, List<GameGuess> temp) {
    Future.wait([
      LeagueApi.getNBAGameSchedules(startTime, endTime),
      CacheApi.getPickDefine(),
    ]).then((result) {
      var list = result[0] as List<ScoresEntity>;
      scoreList = list.map((e) {
        var gameGuess = GameGuess(e);
        if (temp.isNotEmpty) {
          var firstWhereOrNull = temp
              .firstWhereOrNull((item) => item.scoresEntity.gameId == e.gameId);
          if (firstWhereOrNull != null) {
            gameGuess.choiceTeamId.value = firstWhereOrNull.choiceTeamId.value;
          }
        }
        return gameGuess;
      }).toList();
      sortScoreList();
      cacheGameGuessData[cacheKey] = scoreList;
      picksDefineEntity = result[1] as PicksDefineEntity;
      if (scoreList.isEmpty) {
        loadStatus.value = LoadDataStatus.noData;
      } else {
        loadStatus.value = LoadDataStatus.success;
      }
      update([idLeagueMain]);
      refreshController.refreshCompleted();
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
      refreshController.refreshCompleted();
      update([idLeagueMain]);
    });
  }

  static String get idLeagueMain => "id_league_main";

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

  onPageChanged(int index) {
    currentPageIndex.value = index;
    if (!Utils.canOperate(delayTime: 300)) {
      return;
    }
    getData();
  }

  void btnTap(GameGuess gameGuess, int teamId) {
    gameGuess.choiceTeamId.value =
        gameGuess.choiceTeamId.value == teamId ? 0 : teamId;
    choiceSize.value = getAllChoiceData().length;
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
    cacheGameGuessData.clear();
    choiceSize.value = getAllChoiceData().length;
    getData(isRefresh: true);
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
    update([idLeagueMain]);
  }
}
