import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/pages/league/league_index/controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///
///@auther gejiahui
///created at 2024/11/19/11:54

class ScorePageController extends GetxController {
  late RefreshController refreshController = RefreshController();

  ScorePageController(this.time);

  final DateTime time;

  List<GameGuess> scoreList = [];

  var loadStatus = LoadDataStatus.loading.obs;

  bool loadDataSuccess = false;

  late StreamSubscription<int> subscription;

  late StreamSubscription<List> tabSubscription;

  @override
  void onInit() {
    print('ScorePageController----onInit-----');
    super.onInit();
    subscription = WSInstance.netStream.listen((value) {
      if (!loadDataSuccess) {
        initData();
      }
    });
    initData();
    tabSubscription =
        Get.find<LeagueController>().guessSuccessTabKeys.listen((v) {
      var startTime = time.millisecondsSinceEpoch;
      var endTime = MyDateUtils.nextDay(time).millisecondsSinceEpoch;
      if (v.contains("${startTime}_$endTime")) {
        //下注成功，刷新数据，清除所有选中状态
        getDataFromNet([]);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    tabSubscription.cancel();
    super.dispose();
  }

  void initData() {
    var startTime = time.millisecondsSinceEpoch;
    var endTime = MyDateUtils.nextDay(time).millisecondsSinceEpoch;
    getDataFromNet(Get.find<LeagueController>()
            .cacheGameGuessData["${startTime}_$endTime"] ??
        []);
  }

  loading() async {
    var leagueController = Get.find<LeagueController>();
    if (leagueController
            .getDataTimes()[leagueController.currentPageIndex.value] !=
        time) {
      refreshController.refreshCompleted();
      return;
    }
    await leagueController.getScoreDateTime();
    //下拉刷新，把之前选中的项恢复为选中状态
    getDataFromNet(List.from(scoreList));
  }

  void getDataFromNet(List<GameGuess> temp) {
    var startTime = time.millisecondsSinceEpoch;
    var endTime = MyDateUtils.nextDay(time).millisecondsSinceEpoch;
    print('scores -------->>> startTime: $startTime -> ${time.day}');
    // var key = "${startTime}_$endTime";
    var leagueController = Get.find<LeagueController>();
    // if (leagueController.cacheGameGuessData.containsKey(key) &&
    //     leagueController.cacheGameGuessData[key]!.isNotEmpty) {
    //   scoreList = leagueController.cacheGameGuessData[key]!;
    //   refreshController.refreshCompleted();
    //   update([idScorePageMain]);
    //   return;
    // }
    loadStatus.value = LoadDataStatus.loading;
    var futures = <Future>[
      LeagueApi.getNBAGameSchedules(startTime, endTime),
      CacheApi.getNBATeamDefine(),
      CacheApi.getNBAPlayerInfo(),
    ];
    if (leagueController.picksDefineEntity == null) {
      futures.add(CacheApi.getPickDefine());
    }

    Future.wait(futures).then((result) {
      loadDataSuccess = true;
      var list = result[0] as List<ScoresEntity>;
      if (futures.length == 4) {
        leagueController.picksDefineEntity = result[3] as PicksDefineEntity;
      }
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
      leagueController.cacheGameGuessData["${startTime}_$endTime"] = scoreList;
      if (scoreList.isEmpty) {
        loadStatus.value = LoadDataStatus.noData;
      } else {
        loadStatus.value = LoadDataStatus.success;
      }
      update([idScorePageMain]);
      refreshController.refreshCompleted();
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
      refreshController.refreshCompleted();
    });
  }

  String get idScorePageMain => "id_score_page_main_${time.day}";

  void sortScoreList() {
    scoreList.sort((a, b) =>
        a.scoresEntity.gameStartTime.compareTo(b.scoresEntity.gameStartTime));
    scoreList.sort((a, b) {
      if (time.millisecondsSinceEpoch <=
          DateTime.now().millisecondsSinceEpoch) {
        // 开奖之后猜过的排前面
        if (a.scoresEntity.isGuess != 0) return -1;
        if (b.scoresEntity.isGuess != 0) return 1;
      }
      //比赛开赛前，没有猜过的排前面
      if (a.scoresEntity.isGuess != 0) return 1;
      if (b.scoresEntity.isGuess != 0) return -1;
      return 0;
    });
  }
}
