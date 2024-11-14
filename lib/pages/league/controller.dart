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

  PageController pageController = PageController();
  var currentPageIndex = 0;
  List<GameGuess> scoreList = [];
  PicksDefineEntity? picksDefineEntity;
  var loadStatus = LoadDataStatus.noData.obs;

  loading() {
    getData();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() {
    if(!Utils.canOperate()){
      return;
    }
    loadStatus.value = LoadDataStatus.loading;
    var nowDateTime = MyDateUtils.getNowDateTime();
    var nowDay =
        MyDateUtils.getDateTimeByMs(MyDateUtils.getDayStartTimeMS(nowDateTime));
    var previousDay = MyDateUtils.previousDay(nowDay);
    var nextDay = MyDateUtils.nextDay(nowDay);
    int startTime, endTime;
    if (currentPageIndex == 0) {
      startTime = previousDay.millisecondsSinceEpoch;
      endTime = nowDay.millisecondsSinceEpoch;
    } else if (currentPageIndex == 1) {
      startTime = nowDay.millisecondsSinceEpoch;
      endTime = nextDay.millisecondsSinceEpoch;
    } else {
      startTime = nextDay.millisecondsSinceEpoch;
      endTime = MyDateUtils.nextDay(nextDay).millisecondsSinceEpoch;
    }
    MyDateUtils.getDayStartTimeMS(nowDateTime);
    Future.wait([
      LeagueApi.getNBAGameSchedules(startTime, endTime),
      CacheApi.getPickDefine(),
    ]).then((result) {
      var list = result[0] as List<ScoresEntity>;
      scoreList = list.map((e) => GameGuess(e)).toList();
      picksDefineEntity = result[1] as PicksDefineEntity;
      if (scoreList.isEmpty) {
        loadStatus.value = LoadDataStatus.noData;
      } else {
        loadStatus.value = LoadDataStatus.success;
      }
      update([idLeagueMain]);
      refreshController.refreshCompleted();
    }, onError: (e) {
      print(e.stackTrace);
      loadStatus.value = LoadDataStatus.error;
      refreshController.refreshCompleted();
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
    ClickFeedBack.selectionClick();
    if (currentPageIndex == 0) {
      return;
    }
    pageController.jumpToPage(--currentPageIndex);
    getData();
  }

  nextPage() {
    ClickFeedBack.selectionClick();
    if (currentPageIndex == pageText.length - 1) {
      return;
    }
    pageController.jumpToPage(++currentPageIndex);
    getData();
  }

  onPageChanged(int index) {
    currentPageIndex = index;
    getData();
  }

  void btnTap(GameGuess gameGuess, int teamId) {
    gameGuess.choiceTeamId.value =
        gameGuess.choiceTeamId.value == teamId ? 0 : teamId;
  }
}
