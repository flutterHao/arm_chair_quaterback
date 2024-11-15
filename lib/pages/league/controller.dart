import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/click_feed_back.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GameGuess {
  final ScoresEntity scoresEntity;

  ///选中的teamId,未选中 =0
  RxInt choiceTeamId = RxInt(0);

  GameGuess(this.scoresEntity);
}

class LeagueController extends GetxController {
  LeagueController();

  RefreshController refreshController = RefreshController();

  List<String> pageText = ["YESTERDAY", "TODAY", "TOMORROW"];

  var currentPageIndex = 1;
  PageController pageController = PageController(initialPage: 1);
  List<GameGuess> scoreList = [];

  //缓存数据，下拉刷新则删除对应缓存 key :startTime_endTime, value : 对应日期的缓存数据
  Map<String, List<GameGuess>> cacheGameGuessData = {};
  PicksDefineEntity? picksDefineEntity;
  var loadStatus = LoadDataStatus.noData.obs;
  var choiceSize = 0.obs;

  loading() {
    getData(isRefresh: true);
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
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

  String getCurrentCacheKey(){
    int startTime = getStartTime();
    int endTime = getEndTime();
    var cacheKey = "${startTime}_$endTime";
    return cacheKey;
  }

  int getStartTime() {
    var nowDateTime = MyDateUtils.getNowDateTime();
    var nowDay =
        MyDateUtils.getDateTimeByMs(MyDateUtils.getDayStartTimeMS(nowDateTime));
    var previousDay = MyDateUtils.previousDay(nowDay);
    var nextDay = MyDateUtils.nextDay(nowDay);
    int startTime;
    if (currentPageIndex == 0) {
      startTime = previousDay.millisecondsSinceEpoch;
    } else if (currentPageIndex == 1) {
      startTime = nowDay.millisecondsSinceEpoch;
    } else {
      startTime = nextDay.millisecondsSinceEpoch;
    }
    return startTime;
  }

  int getEndTime() {
    var nowDateTime = MyDateUtils.getNowDateTime();
    var nowDay =
        MyDateUtils.getDateTimeByMs(MyDateUtils.getDayStartTimeMS(nowDateTime));
    var nextDay = MyDateUtils.nextDay(nowDay);
    int endTime;
    if (currentPageIndex == 0) {
      endTime = nowDay.millisecondsSinceEpoch;
    } else if (currentPageIndex == 1) {
      endTime = nextDay.millisecondsSinceEpoch;
    } else {
      endTime = MyDateUtils.nextDay(nextDay).millisecondsSinceEpoch;
    }
    return endTime;
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

  void sortScoreList(){
    scoreList.sort((a,b){
      if(a.scoresEntity.isGuess != 0) return 1;
      if(b.scoresEntity.isGuess != 0) return -1;
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
      print(":-_-: ${e.stackTrace}");
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

  prePage() {
    if (!Utils.canOperate(delayTime: 300)) {
      return;
    }
    ClickFeedBack.selectionClick();
    if (currentPageIndex == 0) {
      return;
    }
    pageController.jumpToPage(--currentPageIndex);
    getData();
  }

  nextPage() {
    if (!Utils.canOperate(delayTime: 300)) {
      return;
    }
    ClickFeedBack.selectionClick();
    if (currentPageIndex == pageText.length - 1) {
      return;
    }
    pageController.jumpToPage(++currentPageIndex);
    getData();
  }

  onPageChanged(int index) {
    currentPageIndex = index;
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
    return cacheGameGuessData.keys.fold([], (p,e){
      var list = cacheGameGuessData[e]!.where((e) => e.choiceTeamId.value != 0).toList();
      p.addAll(list);
      return p;
    });
  }

  void changeGuessSuccessDataStatusAndRefreshUi() {
    for (int i = 0; i < cacheGameGuessData.keys.length; i++) {
      var key = cacheGameGuessData.keys.toList()[i];
      var item = cacheGameGuessData[key]!;
      for (int j = 0; j < item.length; j++) {
        var gameGuessItem = item[j];
        if(gameGuessItem.choiceTeamId.value != 0){
          gameGuessItem.scoresEntity.isGuess = gameGuessItem.choiceTeamId.value;
          gameGuessItem.choiceTeamId.value = 0;
        }
      }
    }
    sortScoreList();
    choiceSize.value = getAllChoiceData().length;
    update([idLeagueMain]);
  }
}
