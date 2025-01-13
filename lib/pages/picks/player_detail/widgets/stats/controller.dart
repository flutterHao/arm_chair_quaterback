import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/pages/picks/player_detail/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
///@auther gejiahui
///created at 2025/1/7/14:07

class StatsController extends GetxController with GetTickerProviderStateMixin {
  late NbaPlayerBaseInfoEntity nbaPlayerBaseInfoEntity;

  var currentIndex = 0.obs;

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    _initData();
  }

  void _initData() {
    PlayerDetailController playerDetailController = Get.find();
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
    return ["REGULAR SEASON", "PRESEASON"];
  }

  onTabTap(int index) {
    currentIndex.value = index;
  }
}

class StatsItem {
  final String name;
  final double value;
  final String shortName;
  final int rank;
  final String keyName;

  StatsItem(this.name, this.value, this.shortName, this.rank, this.keyName);
}
