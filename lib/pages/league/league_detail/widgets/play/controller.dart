import 'package:arm_chair_quaterback/common/entities/nba_game_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2024/11/21/11:18

class LeagueDetailPlayController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ScoresEntity item;

  LeagueDetailPlayController(this.item);

  var loadStatus = LoadDataStatus.loading.obs;

  NbaGameDetailEntity? nbaGameDetailEntity;

  List<String> tabTitles = ["POINTS", "REBOUNGS", "ASSISTS"];
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    initData();
    tabController = TabController(length: tabTitles.length, vsync: this);
  }

  initData() {
    loadStatus.value = LoadDataStatus.loading;
    LeagueApi.getNBAGameData(item.gameId).then((result) {
      nbaGameDetailEntity = result;
      loadStatus.value = LoadDataStatus.success;
      update();
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  List<String> getQuarterColumnNames() {
    List<String> list = [];
    list.addAll(['1st', '2nd', '3rd', '4th']);
    var homeOts = nbaGameDetailEntity?.gameData.homeTeamScore
        ?.toJson()
        .keys
        .toList()
        .where((e) =>
            e.contains("ot") &&
            e.length == 3 &&
            nbaGameDetailEntity?.gameData.homeTeamScore?.toJson()[e] != 0)
        .toList();
    var awayOts = nbaGameDetailEntity?.gameData.awayTeamScore
        ?.toJson()
        .keys
        .toList()
        .where((e) =>
            e.contains("ot") &&
            e.length == 3 &&
            nbaGameDetailEntity?.gameData.awayTeamScore?.toJson()[e] != 0)
        .toList();
    var list2 =
        (awayOts ?? []).length > ((homeOts ?? []).length) ? awayOts : homeOts;
    list.addAll(list2 ?? []);
    return list;
  }

  /// tab取值范围：["pts","reb","ast"]
  List<NbaGameDetailGameDataPlayerScores> getTwoMaxByTab(String tab) {
    List<NbaGameDetailGameDataPlayerScores> list = [];
    if (nbaGameDetailEntity == null) {
      return [];
    }
    List<NbaGameDetailGameDataPlayerScores> concatList = [
      ...nbaGameDetailEntity!.gameData.homePlayerScores,
      ...nbaGameDetailEntity!.gameData.awayPlayerScores
    ];
    concatList.sort((a, b) => b.toJson()[tab]!.compareTo(a.toJson()[tab]));
    list = concatList.sublist(0,2);
    return list;
  }
}
