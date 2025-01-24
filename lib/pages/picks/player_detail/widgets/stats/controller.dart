import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/per_game_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/enums/season_type.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/7/14:07

class StatsController extends GetxController with GetTickerProviderStateMixin {

  StatsController(this.playerDetailController);
  final PlayerDetailController playerDetailController;

  late NbaPlayerBaseInfoEntity nbaPlayerBaseInfoEntity;

  var currentIndex = 0.obs;

  late TabController tabController;

  /// 常规赛
  Map<String, List<PerGameEntity>>? regularSeasonData;
  var regularLoadStatus = LoadDataStatus.loading.obs;

  /// 季后赛
  Map<String, List<PerGameEntity>>? offSeasonData;
  var offLoadStatus = LoadDataStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    _initData();
  }

  void _initData() {
    nbaPlayerBaseInfoEntity = playerDetailController.nbaPlayerBaseInfoEntity!;
  }

  List<StatsItem> getStats() {
    List<String> names = [
      "POINTS",
      "REBOUND",
      "ASSIST",
      "THREE POINTS MAKES",
      "THREE POINTS PERCENT",
      "FIELD GOLD",
      "FREE THROW MAKES",
      "FREE THROW ATTEMPT",
      "FREE THROW",
      "TURNOVER"
    ];
    List<String> shortNames = [
      "PPG",
      "RPG",
      "APG",
      "3PM",
      "3P%",
      "FG%",
      "FTM",
      "FTA",
      "FT%",
      "TOG"
    ];
    List<String> keys = [
      "PTS",
      "REB",
      "AST",
      "FG3M",
      "FG3_PCT",
      "FG_PCT",
      "FTM",
      "FTA",
      "FT_PCT",
      "TOV"
    ];
    List<StatsItem> list = [];
    var json = nbaPlayerBaseInfoEntity.playerRegularMap?.toJson();
    for (int i = 0; i < names.length; i++) {
      String name = names[i];
      String shortName = shortNames[i];
      String keyName = keys[i];
      if (json != null && json.containsKey(keyName)) {
        var value = json[keyName];
        var rank = json["${keyName}_RANK"];
        list.add(StatsItem(
          name,
          value,
          shortName,
          rank,
          keyName,
        ));
      }
    }
    return list;
  }

  List<String> getTitles() {
    return ["REGULAR SEASON", "POSTSEASON"];
  }

  onTabTap(int index) {
    currentIndex.value = index;
  }

  List<SeasonItem> getRegularDataByKey(StatsItem item) {
    List<List<SeasonItem>>? list = regularSeasonData?.keys.map((key) {
      var list = regularSeasonData![key]!;
      var result = list.map((v) {
        double value = 0;
        switch (item.keyName) {
          case "PTS":
            value = v.pts;
            break;
          case "REB":
            value = v.dreb + v.oreb;
            break;
          case "AST":
            value = v.ast;
            break;
          case "FG3M":
            value = v.threePm;
            break;
          case "FG3_PCT":
            value = v.threePm / v.threePa;
            break;
          case "FG_PCT":
            value = v.fgm / v.fga;
            break;
          case "FTM":
            value = v.ftm;
            break;
          case "FTA":
            value = v.fta;
            break;
          case "FT_PCT":
            value = v.ftm / v.fta;
            break;
          case "TOV":
            value = v.to.toDouble();
            break;
        }
        return SeasonItem(v.seasonId, value, v.gp);
      }).toList();
      return result;
    }).toList();
    var result = list?.fold(<SeasonItem>[], (p, e) {
      p.addAll(e);
      return p;
    });
    result?.sort((a,b)=>b.season.compareTo(a.season));
    return result ?? [];
  }

  List<SeasonItem> getOffDataByKey(StatsItem item) {
    List<List<SeasonItem>>? list = offSeasonData?.keys.map((key) {
      var list = offSeasonData![key]!;
      var result = list.map((v) {
        double value = 0;
        switch (item.keyName) {
          case "PTS":
            value = v.pts;
            break;
          case "REB":
            value = v.dreb + v.oreb;
            break;
          case "AST":
            value = v.ast;
            break;
          case "FG3M":
            value = v.threePm;
            break;
          case "FG3_PCT":
            value = v.threePm / v.threePa;
            break;
          case "FG_PCT":
            value = v.fgm / v.fga;
            break;
          case "FTM":
            value = v.ftm;
            break;
          case "FTA":
            value = v.fta;
            break;
          case "FT_PCT":
            value = v.ftm / v.fta;
            break;
          case "TOV":
            value = v.to.toDouble();
            break;
        }
        return SeasonItem(v.seasonId, value, v.gp);
      }).toList();
      return result;
    }).toList();
    var result = list?.fold(<SeasonItem>[], (p, e) {
      p.addAll(e);
      return p;
    });
    result?.sort((a,b)=>b.season.compareTo(a.season));
    return result ?? [];
  }

  getRegularData() {
    if (regularSeasonData != null) {
      return;
    }
    regularLoadStatus.value = LoadDataStatus.loading;
    var arguments = playerDetailController.arguments;
    PicksApi.getNBAPlayerOverAllPerGameData(
            playerId: arguments.playerId, seasonType: SeasonType.regular)
        .then((result) {
      var len = result.values.fold(0, (p, e) {
        return p + e.length;
      });
      if (len == 0) {
        regularLoadStatus.value = LoadDataStatus.noData;
      } else {
        regularSeasonData = result;
        regularLoadStatus.value = LoadDataStatus.success;
      }
    }, onError: (e) {
      regularLoadStatus.value = LoadDataStatus.error;
    });
  }

  getOffData() {
    if (offSeasonData != null) {
      return;
    }
    offLoadStatus.value = LoadDataStatus.loading;
    var arguments = playerDetailController.arguments;
    PicksApi.getNBAPlayerOverAllPerGameData(
            playerId: arguments.playerId, seasonType: SeasonType.playoffs)
        .then((result) {
      var len = result.values.fold(0, (p, e) {
        return p + e.length;
      });
      if (len == 0) {
        offLoadStatus.value = LoadDataStatus.noData;
      } else {
        offSeasonData = result;
        offLoadStatus.value = LoadDataStatus.success;
      }
    }, onError: (e) {
      offLoadStatus.value = LoadDataStatus.error;
    });
  }
}

class StatsItem {
  final String name;

  /// 属性全名
  final double value;

  /// 属性短名
  final String shortName;
  final int rank;

  /// 属性 键名
  final String keyName;

  StatsItem(this.name, this.value, this.shortName, this.rank, this.keyName);
}

class SeasonItem {
  /// 赛季（年份）
  final int season;

  /// 属性值
  final double value;

  /// 比赛场数
  final int gp;

  SeasonItem(this.season, this.value, this.gp);
}
