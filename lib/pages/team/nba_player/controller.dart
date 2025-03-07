import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/net/apis/user.dart';
import 'package:arm_chair_quaterback/common/routers/routes.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/view.dart';
import 'package:flutter/material.dart';
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
  List<PlayerStrengthRankEntity> allPlayerRank = [];
  Future initData() async {
    allPlayerStrengthRank.clear();

    allPlayerStrengthRank.value = await TeamApi.getPlayerStrengthRank();
    allPlayerRank = allPlayerStrengthRank.value;
    nbaPlayerList.clear();

    ///涨跌幅都是0，取前四个,否则取前两个和最后两个展示
    if (allPlayerStrengthRank[0].trendList[0].playerScore -
            allPlayerStrengthRank[0].trendList[1].playerScore !=
        0) {
      nbaPlayerList
          .add(allPlayerStrengthRank[allPlayerStrengthRank.length - 1]);
      nbaPlayerList
          .add(allPlayerStrengthRank[allPlayerStrengthRank.length - 2]);
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 2));
    } else {
      nbaPlayerList.addAll(allPlayerStrengthRank.sublist(0, 4));
    }

    allPlayerStrengthRank.sort((a, b) => b.strength.compareTo(a.strength));

    var teamLoginInfo = await UserApi.getTeamLoginInfo();
    likePlayersList.value = teamLoginInfo.team!.teamPreference!.likePlayers!;
  }

  @override
  void onInit() {
    super.onInit();

    // initData();
    initFilter();
  }

  @override
  void onReady() {
    super.onReady();
    // initData();
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
    Get.toNamed(RouteNames.picksPlayerDetail,
        arguments: PlayerDetailPageArguments(playerId));
  }

  /// 切换ovr排行榜tab
  void currentIndexChange(int tabIndex) {
    if (currentIndex.value == (2 * tabIndex)) {
      currentIndex.value = (2 * tabIndex) + 1;
    } else {
      currentIndex.value = (2 * tabIndex);
    }
    switch (currentIndex.value) {
      case 0:
        {
          allPlayerStrengthRank
              .sort((a, b) => b.strength.compareTo(a.strength));
        }
      case 1:
        {
          allPlayerStrengthRank
              .sort((a, b) => a.strength.compareTo(b.strength));
        }
      case 2:
        {
          allPlayerStrengthRank.sort((a, b) {
            var aDifferenceScore =
                a.trendList[0].playerScore - a.trendList[1].playerScore;
            var bDifferenceScore =
                b.trendList[0].playerScore - b.trendList[1].playerScore;
            return bDifferenceScore.compareTo(aDifferenceScore);
          });
        }
      case 3:
        {
          allPlayerStrengthRank.sort((a, b) {
            var aDifferenceScore =
                a.trendList[0].playerScore - a.trendList[1].playerScore;
            var bDifferenceScore =
                b.trendList[0].playerScore - b.trendList[1].playerScore;
            return aDifferenceScore.compareTo(bDifferenceScore);
          });
        }
      case 4:
        {
          allPlayerStrengthRank.sort((a, b) {
            if (likePlayersList.contains(a.playerId) ==
                likePlayersList.contains(b.playerId)) {
              return a.rank.compareTo(b.rank);
            }
            return likePlayersList.contains(b.playerId) ? 1 : -1;
          });
        }
      case 5:
        {
          allPlayerStrengthRank.sort((a, b) {
            if (likePlayersList.contains(a.playerId) ==
                likePlayersList.contains(b.playerId)) {
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
    var endDate = DateTime(nowDate.year, nowDate.month, nowDate.day + 1, 4)
        .add(Utils.getTimeZoneOffset());

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

  ///过滤

  final List<String> positions = ["ALL", "C", "SF", "PF", "SG", "PG"];
  final List<String> grades = [
    "ALL",
    "S+",
    "S",
    "S-",
    "A+",
    "A",
    "A-",
    "B+",
    "B",
    "B-",
    "C+",
    "C",
    "C-",
    "D+",
    "D",
    "D-"
  ];
  List<RxBool> posiStatuList = [];
  List<RxBool> gradesStatuList = [];
  List<RxBool> teamStatuList = [];
  List<int> teams = [];
  String get getTime =>
      '${twoDigits(hh)}:${twoDigits(minute)}:${twoDigits(second)}';
  var rangeValues = const RangeValues(1, 100).obs;
  void reset() {
    rangeValues.value = const RangeValues(1, 100);
    for (int i = 0; i < posiStatuList.length; i++) {
      posiStatuList[i].value = i == 0 ? true : false;
    }

    for (int i = 0; i < gradesStatuList.length; i++) {
      gradesStatuList[i].value = i == 0 ? true : false;
    }
    for (int i = 0; i < teamStatuList.length; i++) {
      teamStatuList[i].value = i == 0 ? true : false;
    }
  }

  ///筛选点击
  void onTapChange(List<RxBool> list, int index) {
    if (index != 0) {
      list[0].value = false;
      list[index].value = !list[index].value;
    } else {
      for (var i = 1; i < list.length; i++) {
        list[i].value = false;
      }
      list[0].value = !list[0].value;
      // list[index].value = !list[index].value;
    }
    // list[index].value = !list[index].value;
  }

  void initFilter() {
    for (int i = 0; i < positions.length; i++) {
      posiStatuList.add(i == 0 ? true.obs : false.obs);
    }

    for (int i = 0; i < grades.length; i++) {
      gradesStatuList.add(i == 0 ? true.obs : false.obs);
    }
    teams.add(0);
    teamStatuList.add(true.obs);
    for (int i = 101; i <= 130; i++) {
      teams.add(i);
      teamStatuList.add(false.obs);
    }
  }

  ///根据Position,Grade,Team等条件进行筛选
  List<PlayerStrengthRankEntity> onfilter() {
    // List<PlayerCollectCollects> list = List.from(CacheApi.playerBookRuleList);
    List<PlayerStrengthRankEntity> list = allPlayerRank;
    list = list.where((e) {
      //OVR
      bool isSelOvr = false;
      var ovr = Utils.getPlayBaseInfo(e.playerId).playerScore;
      if (rangeValues.value.start <= ovr && ovr <= rangeValues.value.end) {
        isSelOvr = true;
      }
      // 位置
      bool isSelPosition = false;
      var p = Utils.getPlayBaseInfo(e.playerId).position;

      // 如果第一个选项被选中，直接返回 true
      if (posiStatuList[0].value) {
        isSelPosition = true;
      } else {
        // 遍历所有的位置
        var isSelect = false;
        for (int i = 1; i < posiStatuList.length; i++) {
          // 找出选中的位置那些球员
          isSelect = isSelect || posiStatuList[i].value;
          if (posiStatuList[i].value && p.contains(positions[i])) {
            isSelPosition = true;
            break; // 找到一个匹配的位置即可退出循环
          }
        }
        // 如果没有选中的位置，则返回 true
        if (!isSelect) {
          isSelPosition = true;
        }
      }

      // 等级
      bool isSelGrade = false;
      var g = Utils.getPlayBaseInfo(e.playerId).grade;

      // 如果第一个选项被选中，直接返回 true
      if (gradesStatuList[0].value) {
        isSelGrade = true;
      } else {
        // 遍历所有的等级
        var isSelect = false;
        for (int i = 1; i < gradesStatuList.length; i++) {
          isSelect = isSelect || gradesStatuList[i].value;
          // 找出选中的等级那些球员
          if (gradesStatuList[i].value && g == grades[i]) {
            isSelGrade = true;
            break; // 找到一个匹配的等级即可退出循环
          }
        }
        if (!isSelect) {
          isSelGrade = true;
        }
      }

      // 球队
      bool isSelTeam = false;
      var t = Utils.getPlayBaseInfo(e.playerId).teamId;

      // 如果第一个选项被选中，直接返回 true
      if (teamStatuList[0].value) {
        isSelTeam = true;
      } else {
        // 遍历所有的球队
        var isSelect = false;

        for (int i = 1; i < teamStatuList.length; i++) {
          isSelect = isSelect || teamStatuList[i].value;
          // 找出选中的球队那些球员
          if (teamStatuList[i].value && t == teams[i]) {
            isSelTeam = true;
            break; // 找到一个匹配的球队即可退出循环
          }
        }
        if (!isSelect) {
          isSelTeam = true;
        }
      }

      return isSelPosition && isSelGrade && isSelTeam && isSelOvr;
    }).toList();
    return list;
  }
}
