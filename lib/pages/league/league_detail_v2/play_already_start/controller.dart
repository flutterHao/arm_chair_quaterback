import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/nba_game_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
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

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      LeagueApi.getNBAGameData(item.gameId),
      CacheApi.getNBAPlayerInfo(),
      CacheApi.getNBATeamDefine()
    ]).then((result) {
      nbaGameDetailEntity = result[0];
      loadStatus.value = LoadDataStatus.success;
      update();
    }, onError: (e) {
      ErrorUtils.toast(e);
      loadStatus.value = LoadDataStatus.error;
    });
  }

  List<String> getQuarterColumnNames() {
    List<String> list = [];
    list.addAll(['1st', '2nd', '3rd', '4th', "ot1"]);
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
    if (list2?.contains("ot1") == true) {
      list.remove("ot1");
    }
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
    list = concatList.sublist(0, min(2, concatList.length));
    return list;
  }

  List<TeamStats> getTeamStatsData() {
    List<TeamStats> list = [];
    if (nbaGameDetailEntity?.scoreBoardDetails.isEmpty == true) {
      return [];
    }
    var homeDetail = nbaGameDetailEntity?.scoreBoardDetails
        .firstWhereOrNull((e) => e.teamId == item.homeTeamId);
    var awayDetail = nbaGameDetailEntity?.scoreBoardDetails
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
        "3 Points Make", homeDetail?.threePm ?? 0, awayDetail?.threePm ?? 0));
    list.add(TeamStats("Turn over", homeDetail?.to.handlerNaNInfinity() ?? 0,
        awayDetail?.to.handlerNaNInfinity() ?? 0));
    list.add(TeamStats("Foul", homeDetail?.pf.handlerNaNInfinity() ?? 0,
        awayDetail?.pf.handlerNaNInfinity() ?? 0));

    list.add(TeamStats(
        "3 Point %",
        ((homeDetail?.threePm ?? 0) / (homeDetail?.threePa ?? 0))
            .handlerNaNInfinity()
            .format(),
        ((awayDetail?.threePm ?? 0) / (awayDetail?.threePa ?? 0))
            .handlerNaNInfinity()
            .format(),
        valueIsPercent: true));
    list.add(TeamStats(
        "Field Goal %",
        ((homeDetail?.fgm ?? 0) / (homeDetail?.fga ?? 0))
            .handlerNaNInfinity()
            .format(),
        ((awayDetail?.fgm ?? 0) / (awayDetail?.fga ?? 0))
            .handlerNaNInfinity()
            .format(),
        valueIsPercent: true));
    list.add(TeamStats(
        "Free Throw %",
        ((homeDetail?.ftm ?? 0) / (homeDetail?.fta ?? 0))
            .handlerNaNInfinity()
            .format(),
        ((awayDetail?.ftm ?? 0) / (awayDetail?.fta ?? 0))
            .handlerNaNInfinity()
            .format(),
        valueIsPercent: true));
    return list;
  }
}

class TeamStats {
  final String name;
  final num leftV;
  final num rightV;
  final bool valueIsPercent;

  TeamStats(this.name, this.leftV, this.rightV, {this.valueIsPercent = false});

  num get getLeftPercent => (leftV == 0 && leftV == rightValue)
          ? 50
          : (leftV / (leftV + rightV)).handlerNaNInfinity();

  num get getRightPercent => (leftV == 0 && leftV == rightValue)
          ? 50
          : (rightV / (leftV + rightV)).handlerNaNInfinity();

  Color get getLeftColor =>
      leftV > rightV ? AppColors.c000000 : AppColors.cD1D1D1;

  Color get getRightColor =>
      rightV > leftV ? AppColors.c000000 : AppColors.cD1D1D1;

  dynamic get leftValue => valueIsPercent ? (leftV * 100).format() : leftV;

  dynamic get rightValue => valueIsPercent ? (rightV * 100).format() : rightV;
}
