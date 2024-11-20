import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/pages/league/controller.dart';
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

  @override
  void onInit() {
    print('ScorePageController----onInit-----');
    super.onInit();
    getDataFromNet([]);
    Get.find<LeagueController>().guessSuccessTabKeys.listen((v){
      var startTime = time.millisecondsSinceEpoch;
      var endTime = MyDateUtils.nextDay(time).millisecondsSinceEpoch;
      if(v.contains("${startTime}_$endTime")){
        //刷新数据，不计入缓存
        getDataFromNet([]);
      }
    });
  }

  loading(){
    getDataFromNet(List.from(scoreList));
  }

  void getDataFromNet(List<GameGuess> temp) {
    loadStatus.value = LoadDataStatus.loading;
    var startTime = time.millisecondsSinceEpoch;
    var endTime = MyDateUtils.nextDay(time).millisecondsSinceEpoch;
    print('scores -------->>> startTime: $startTime -> ${time.day}');
    var futures = <Future>[
      LeagueApi.getNBAGameSchedules(startTime, endTime),
      CacheApi.getNBATeamDefine()
    ];
    var leagueController = Get.find<LeagueController>();
    if(leagueController.picksDefineEntity == null){
      futures.add(CacheApi.getPickDefine());
    }

    Future.wait(futures).then((result) {
      var list = result[0] as List<ScoresEntity>;
      if(futures.length==3){
        leagueController.picksDefineEntity = result[2] as PicksDefineEntity;
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
      update();
      refreshController.refreshCompleted();
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  void sortScoreList() {
    scoreList.sort((a,b) => a.scoresEntity.gameStartTime.compareTo(b.scoresEntity.gameStartTime));
    scoreList.sort((a, b) {
      if (a.scoresEntity.isGuess != 0) return 1;
      if (b.scoresEntity.isGuess != 0) return -1;
      return 0;
    });
  }
}
