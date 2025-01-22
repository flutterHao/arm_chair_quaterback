import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_player_season_game_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_player_season_game_entity.g.dart';

@JsonSerializable()
class NbaPlayerSeasonEntity {
  late List<NbaPlayerSeasonGameEntity> playerGameData;
  late NabPlayerSeasonGameRankEntity playerRank;

  NbaPlayerSeasonEntity();

  factory NbaPlayerSeasonEntity.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerSeasonEntityFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerSeasonEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerSeasonGameEntity {
  late double fga;
  late double ast;
  late double dreb;
  late double espnId;
  late double fgm;
  late double reb;
  late double fta;
  late double min;
  late bool isStarter;
  late double ftm;
  late double playerId;
  late double blk;
  late double gameId;
  late double stl;
  late double updateTime;
  late double pts;
  late double threePa;
  late String ename;
  late double oreb;
  late double createTime;
  late double pf;
  late double teamId;
  late double threePm;
  late double to;
  late int awayTeamId;
  late int gameStartTime;

  NbaPlayerSeasonGameEntity();

  factory NbaPlayerSeasonGameEntity.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerSeasonGameEntityFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerSeasonGameEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
