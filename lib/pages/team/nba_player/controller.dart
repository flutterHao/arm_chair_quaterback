import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:get/get.dart';

class NbaPlayerController extends GetxController {
  NbaPlayerController();
  RxList<PlayerStrengthRankEntity> allPlayerStrengthRank = RxList();
  RxList<PlayerStrengthRankEntity> nbaPlayerList = RxList();
  List<String> ordinalNumbers = ['st', 'nd', 'rd', 'th'];
  // ovr详情tab切换
  RxInt currentIndex = 0.obs;

  RxList<int> likePlayersList = RxList();
  Map<int, int> playerRankMap = {};
  initData() async {
    allPlayerStrengthRank.clear();
    allPlayerStrengthRank.value = await TeamApi.getPlayerStrengthRank();

    ///涨跌幅都是0，取前四个,否则取前两个和最后两个展示
    if (allPlayerStrengthRank[0].trendList[0].playerScore - allPlayerStrengthRank[0].trendList[1].playerScore != 0) {
      nbaPlayerList
          .addAll(allPlayerStrengthRank.sublist(allPlayerStrengthRank.length - 3, allPlayerStrengthRank.length - 1));
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 2));
    } else {
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 4));
    }

    var teamLoginInfo = await UserApi.getTeamLoginInfo();
    likePlayersList.value = teamLoginInfo.team!.teamPreference!.likePlayers!;

    currentIndexChange(currentIndex.value);
    // playerRankMap = {for (var e in allPlayerStrengthRank) ...[e.playerId: e.playerId]};
  }

  @override
  void onInit() {
    super.onInit();

    // initData();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
    timeCountDown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  ///球员排行榜详情页
  void goOvrStandingDetail() {
    Get.toNamed(RouteNames.ovrStandingDetailPage);
  }

  ///球员信息详情页
  void goPlayerDetail(int playerId) {
    Get.toNamed(RouteNames.picksPlayerDetail, arguments: PlayerDetailPageArguments(playerId));
  }

  /// 切换ovr排行榜tab
  void currentIndexChange(int tabIndex) {
    if (currentIndex.value != 2 * tabIndex) {
      currentIndex.value = 2 * tabIndex;
    } else {
      currentIndex.value = (2 * tabIndex) + 1;
    }
    switch (currentIndex.value) {
      case 0:
        {
          allPlayerStrengthRank.sort((a, b) => a.strength.compareTo(b.strength));
        }
      case 1:
        {
          allPlayerStrengthRank.sort((a, b) => b.strength.compareTo(a.strength));
        }
      case 2:
        {
          allPlayerStrengthRank.sort((a, b) {
            var aDifferenceScore = a.trendList[0].playerScore - a.trendList[1].playerScore;
            var bDifferenceScore = b.trendList[0].playerScore - b.trendList[1].playerScore;
            return aDifferenceScore.compareTo(bDifferenceScore);
          });
        }
      case 3:
        {
          allPlayerStrengthRank.sort((a, b) {
            var aDifferenceScore = a.trendList[0].playerScore - a.trendList[1].playerScore;
            var bDifferenceScore = b.trendList[0].playerScore - b.trendList[1].playerScore;
            return bDifferenceScore.compareTo(aDifferenceScore);
          });
        }
      case 4:
        {
          allPlayerStrengthRank.sort((a, b) {
            if (likePlayersList.contains(a.playerId) == likePlayersList.contains(b.playerId)) {
              return a.rank.compareTo(b.rank);
            }
            return likePlayersList.contains(b.playerId) ? 1 : -1;
          });
        }
      case 5:
        {
          allPlayerStrengthRank.sort((a, b) {
            if (likePlayersList.contains(a.playerId) == likePlayersList.contains(b.playerId)) {
              return a.rank.compareTo(b.rank);
            }
            return likePlayersList.contains(b.playerId) ? -1 : 1;
          });
        }
      default:
        {
          allPlayerStrengthRank.sort((a, b) => a.rank.compareTo(b.rank));
        }
    }
  }

  ///球员收藏或者取消收藏
  void changeLikePlayer(int playerId) async {
    if (likePlayersList.contains(playerId)) {
      var res = await UserApi.cancelLikingPlayer('${playerId}');
      likePlayersList.value = res.teamPreference!.likePlayers!;
    } else {
      var res = await UserApi.likePlayer('${playerId}');
      likePlayersList.value = res.teamPreference!.likePlayers!;
    }
  }

  Timer? _timer;
  RxInt gameStartTimesCountDown = 0.obs;
  int day = 0;
  int hh = 0;
  int minute = 0;
  int second = 0;

  void timeCountDown() {
    _timer?.cancel();
    var nowDate = DateTime.now();
    var nowMs = DateTime.now().millisecondsSinceEpoch;

    ///结束时间
    var endDate = DateTime(nowDate.year, nowDate.month, nowDate.day + 1, 4).add(Utils.getTimeZoneOffset());

    ///结束时间的服务器时间
    ///注意：服务器时间是utc时间，需要加上时区偏移
    var serverDate = endDate.add(Utils.getTimeZoneOffset());
    var serverMs = serverDate.millisecondsSinceEpoch;
    var diff = serverMs - nowMs;

    if (diff <= 0) {
      return;
    }
    gameStartTimesCountDown.value = diff;
    day = gameStartTimesCountDown.value ~/ 1000 ~/ 86400;
    hh = gameStartTimesCountDown.value ~/ 1000 % 86400 ~/ 3600;
    minute = gameStartTimesCountDown.value ~/ 1000 % 3600 ~/ 60;
    second = gameStartTimesCountDown.value ~/ 1000 % 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      var temp = gameStartTimesCountDown.value - 1000;
      if (temp <= 0) {
        t.cancel();
      } else {
        gameStartTimesCountDown.value = temp;
        day = gameStartTimesCountDown.value ~/ 1000 ~/ 86400;
        hh = gameStartTimesCountDown.value ~/ 1000 % 86400 ~/ 3600;
        minute = gameStartTimesCountDown.value ~/ 1000 % 3600 ~/ 60;
        second = gameStartTimesCountDown.value ~/ 1000 % 60;
      }
    });
  }

  /// 格式化为两位数
  String twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  String get getTime => '${twoDigits(hh)}:${twoDigits(minute)}:${twoDigits(second)}';
}
