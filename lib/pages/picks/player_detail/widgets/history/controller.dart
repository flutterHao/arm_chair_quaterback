import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_season_game_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/enums/load_status.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeasonHistoryItems {
  final NbaPlayerSeasonGameEntity playerSeasonGameEntity;
  final NabPlayerSeasonGameRankEntity playerSeasonGameRankEntity;
  final NbaTeamEntity teamEntity;
  SeasonHistoryItems(this.playerSeasonGameEntity, this.teamEntity,
      this.playerSeasonGameRankEntity);
}

class SeasonHistory {
  late List<SeasonHistoryItems> seasonHistoryItems = [];
  var loadStatus = LoadDataStatus.loading.obs;
  var isOpen = false.obs;
}

class HistoryController extends GetxController {
  HistoryController(this.playerId);

  final int playerId;

  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> tileKeys = List.generate(10, (index) => GlobalKey());
  List<String> items = [];

  Map<String, SeasonHistory> data = {};
  var loadStatus = LoadDataStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    queryPlayerGameYear();
  }

  queryPlayerGameYear(){
    loadStatus.value = LoadDataStatus.loading;
    PicksApi.queryPlayerGameYear(playerId).then((result){
      if(result.isEmpty){
        loadStatus.value = LoadDataStatus.noData;
        return;
      }
      loadStatus.value = LoadDataStatus.success;
      result.sort((a, b) {
        return b.compareTo(a);
      });
      items = result.map((e)=> e.toString()).toList();
      data = items.fold({}, (pre, e) {
        pre[e] = SeasonHistory();
        return pre;
      });
      data.values.toList()[0].isOpen.value = true;
      getData(data.keys.toList()[0]);
    },onError: (e){
      loadStatus.value = LoadDataStatus.error;
    });
  }

  getData(String season) {
    data[season.toString()]!.loadStatus.value = LoadDataStatus.loading;
    var futures = [
      PicksApi.getNBAPlayerSeasonGameData(playerId, int.parse(season), 1, 60),
      CacheApi.getNBATeamDefine(getList: true)
    ];
    Future.wait(futures).then((result) {
      NbaPlayerSeasonEntity nbaPlayerSeasonEntity =
          result[0] as NbaPlayerSeasonEntity;
      List<NbaPlayerSeasonGameEntity> seasons =
          nbaPlayerSeasonEntity.playerGameData;
      if (seasons.isEmpty) {
        data[season.toString()]!.loadStatus.value = LoadDataStatus.noData;
      } else {
        data[season.toString()]!.seasonHistoryItems = seasons
            .map((e) => SeasonHistoryItems(e, Utils.getTeamInfo(e.awayTeamId),
                nbaPlayerSeasonEntity.playerRank))
            .toList();
        data[season.toString()]!.loadStatus.value = LoadDataStatus.success;
      }
      update([season]);
    }, onError: (e) {
      data[season.toString()]!.loadStatus.value = LoadDataStatus.error;
    });
  }

  static String get idHistoryMain => "id_history_main";

  @override
  void onClose() {
    super.onClose();
  }
}
