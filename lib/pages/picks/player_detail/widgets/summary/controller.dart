import 'dart:math';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/chart_sample_data.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/picks_player.dart';
import 'package:arm_chair_quaterback/common/entities/team_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/net/apis/trade.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/num_ext.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/picks/picks_index/controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PlayerRegular {
  final int rank;
  final double value;
  final String key;

  PlayerRegular(this.rank, this.value, this.key);
}

class SummaryController extends GetxController {
  SummaryController(this.playerId);

  final int playerId;

  var currentIndex = 0.obs;

  var loadStatus = LoadDataStatus.loading.obs;

  late PicksIndexController picksIndexController;

  NbaPlayerBaseInfoEntity? nbaPlayerBaseInfoEntity;

  final statsScrollController = ScrollController();
  final statsIsScrolling = false.obs;

  var pickIndex = RxInt(-1);

  onTabTap(int index) {
    currentIndex.value = index;
    update([idTabContent]);
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    statsScrollController.addListener(() {
      if (!statsIsScrolling.value && statsScrollController.offset > 5) {
        statsIsScrolling.value = true;
      }
      if (statsIsScrolling.value && statsScrollController.offset <= 5) {
        statsIsScrolling.value = false;
      }
    });
    picksIndexController = Get.find();
    initData();
  }

  initData() {
    loadStatus.value = LoadDataStatus.loading;
    Future.wait([
      PicksApi.getNBAPlayerBaseInfo(playerId),
      CacheApi.getNBATeamDefine(),
    ]).then((result) {
      nbaPlayerBaseInfoEntity = result[0];
      loadStatus.value = LoadDataStatus.success;
      var choiceGuessPlayers = picksIndexController.getChoiceGuessPlayers();
      var pickInfo = getPickInfo();
      var firstWhereOrNull = choiceGuessPlayers.firstWhereOrNull((e) =>
          e.tabStr == pickInfo?.playerV2.tabStr &&
          e.baseInfoList.playerId == playerId);
      pickIndex.value = firstWhereOrNull == null ? -1 : firstWhereOrNull.status;
      update([idSummaryMain]);
    }, onError: (e) {
      loadStatus.value = LoadDataStatus.error;
    });
  }

  static String get idSummaryMain => "id_summary_main";

  static String get idTabContent => "id_tab_content";

  List<PlayerRegular> getSeasonAverageData() {
    if (nbaPlayerBaseInfoEntity == null) {
      return [];
    }
    var json = nbaPlayerBaseInfoEntity!.playerRegularMap.toJson();
    List<PlayerRegular> list = Constant.statTypeList.fold([], (p, e) {
      var key = e;
      if (key == "TO") {
        key = "TOV";
      }
      if (json.containsKey(key) && json.containsKey("${key}_RANK")) {
        var value = json[key];
        var rank = json["${key}_RANK"];
        p.add(PlayerRegular(rank, value, e));
      }
      return p;
    });
    return list;
  }

  String getSeasonAvgWithTab() {
    var key = getCurrentTabKey();
    if (key == "3PM") {
      key = "FG3M";
    }
    return (nbaPlayerBaseInfoEntity!.playerRegularMap.toJson()[key] as num)
        .format();
  }

  String getCurrentTabKey() => Constant.guessTypeList[currentIndex.value];

  String getLast5AvgWithTab() {
    var key = getCurrentTabKey();
    return (nbaPlayerBaseInfoEntity!.l5DataAvg.getValue(key)).format();
  }

  _PickInfo? getPickInfo() {
    var key = getCurrentTabKey();
    if (key == "3PM") {
      key = "threePm";
    }
    key = key.toLowerCase();
    var guessInfos = NbaPlayerBaseInfoGuessInfosProperty.fromJson(
        nbaPlayerBaseInfoEntity?.guessInfos.toJson()[key]);
    var picks = guessInfos.picks;
    if (picks == null) {
      return null;
    }
    var dateTimeByMs = MyDateUtils.getDateTimeByMs(picks.gameStartTime);
    var month = MyDateUtils.getMonthEnName(dateTimeByMs, short: true);
    var day = dateTimeByMs.day;
    var teamInfo = Utils.getTeamInfo(picks.awayTeamId);
    var value = picks.guessReferenceValue.toJson()[key];
    var picksPlayerV2 = PicksPlayerV2();
    picksPlayerV2.guessInfo = picks;
    var currentTabKey = getCurrentTabKey();
    picksPlayerV2.tabStr = currentTabKey.toLowerCase();
    return _PickInfo(
        month, day, teamInfo, value, currentTabKey, picks, picksPlayerV2);
  }

  pickTap(int index) {
    //index:0 more 1 less
    var pickInfo = getPickInfo();
    if (pickInfo == null) {
      return;
    }
    if (pickIndex.value == index) {
      pickIndex.value = pickInfo.playerV2.status = -1;
    } else {
      pickIndex.value = pickInfo.playerV2.status = index;
    }
    Get.find<PicksIndexController>()
        .choiceOne(player: pickInfo.playerV2, needRefreshList: true);
  }

  NbaPlayerBaseInfoGuessInfosPtsCommunityPick? getCommunityPick() {
    NbaPlayerBaseInfoGuessInfosProperty nbaPlayerBaseInfoGuessInfosProperty =
        getGuessInfo();
    return nbaPlayerBaseInfoGuessInfosProperty.communityPick;
  }

  List<NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames> getVsTeams() {
    var guessInfos = getGuessInfo();
    return guessInfos.twoTeamGames ?? [];
  }

  NbaPlayerBaseInfoGuessInfosProperty getGuessInfo() {
    var currentTabKey = getCurrentTabKey();
    var json = nbaPlayerBaseInfoEntity?.guessInfos
        .toJson()[currentTabKey.toLowerCase()];
    var nbaPlayerBaseInfoGuessInfosProperty =
        NbaPlayerBaseInfoGuessInfosProperty.fromJson(json);
    return nbaPlayerBaseInfoGuessInfosProperty;
  }

  List<FlSpot> getTradeData() {
    var list =
        nbaPlayerBaseInfoEntity?.playerTrends.reversed.fold(<FlSpot>[], (p, e) {
      p.add(FlSpot(p.length.toDouble(), e.playerMarketPrice.toDouble()));
      return p;
    });
    return list ?? [];
  }

  TradeInfoTradePlayers? getTradePlayer(){
    return nbaPlayerBaseInfoEntity?.tradePlayers;
  }

  buyPlayer() {
    TradeApi.buyPlayer(playerId).then((result){
      initData();
    },onError: (e){
      EasyLoading.showToast("Server Error");
    });
  }
  

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

  List<LineSeries<ChartSampleData, num>> getDefaultLineSeries() {
    return <LineSeries<ChartSampleData, num>>[
      LineSeries<ChartSampleData, num>(
          dataSource: <ChartSampleData>[
            ChartSampleData(
              x: 1,
              y: 50,
            ),
            ChartSampleData(x: 2, y: 40),
            ChartSampleData(x: 3, y: 10),
            ChartSampleData(x: 4, y: 40),
            ChartSampleData(x: 5, y: 45),
            ChartSampleData(x: 6, y: 25),
            ChartSampleData(x: 7, y: 43),
            ChartSampleData(
              x: 8,
              y: 10,
            ),
            ChartSampleData(x: 9, y: 40),
            ChartSampleData(x: 10, y: 45),
            ChartSampleData(x: 11, y: 60),
            ChartSampleData(x: 12, y: 45),
            ChartSampleData(x: 13, y: 25),
            ChartSampleData(x: 14, y: 70)
          ],
          width: 1,
          xValueMapper: (ChartSampleData sales, _) => sales.x,
          yValueMapper: (ChartSampleData sales, _) => sales.y,
          color: Colors.black,
          pointColorMapper: (ChartSampleData sales, _) =>
              sales.x % 2 == 0 ? Colors.red : Colors.green,
          markerSettings: const MarkerSettings(
              isVisible: true, height: 3, width: 3, borderWidth: 5)),
    ];
  }

  List<ColumnSeries<ChartSampleData, String>> getDefaultColumnSeries() {
    var list = nbaPlayerBaseInfoEntity?.l5GameData.map((e) {
      var timeByMs = MyDateUtils.getDateTimeByMs(e.updateTime);
      var monthEnName = MyDateUtils.getMonthEnName(timeByMs, short: true);
      var currentTabKey = getCurrentTabKey();
      var value = e.getValue(currentTabKey);
      Color color = double.parse(getSeasonAvgWithTab()) <= value
          ? AppColors.cFF7954
          : AppColors.cD9D9D9;
      return ChartSampleData(
          x: '$monthEnName ${timeByMs.day}\nvs ${Utils.getTeamInfo(e.awayTeamId).shortEname}',
          y: value,
          pointColor: color);
    }).toList();
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        spacing: 0.8,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.w)),
        dataSource: list,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
        dataLabelSettings: DataLabelSettings(
            isVisible: true, textStyle: 10.w7(color: AppColors.c262626)),
      )
    ];
  }

}

class _PickInfo {
  final String month;
  final int day;
  final NbaTeamEntity teamInfo;
  final num value;
  final String key;
  final GuessGameInfoEntity picks;
  PicksPlayerV2 playerV2;

  _PickInfo(this.month, this.day, this.teamInfo, this.value, this.key,
      this.picks, this.playerV2);
}
