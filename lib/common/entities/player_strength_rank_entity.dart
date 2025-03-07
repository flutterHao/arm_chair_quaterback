import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_strength_rank_entity.g.dart';

export 'package:arm_chair_quaterback/generated/json/player_strength_rank_entity.g.dart';

@JsonSerializable()
class PlayerStrengthRankEntity {
  late List<PlayerStrengthRankTrendList> trendList = [];
  late int strength = 0;
  late int rank = 0;
  late int playerId = 0;

  PlayerStrengthRankEntity();

  factory PlayerStrengthRankEntity.fromJson(Map<String, dynamic> json) => $PlayerStrengthRankEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlayerStrengthRankEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PlayerStrengthRankTrendList {
  late int playerMarketPrice = 0;
  late int createTime = 0;
  late int playerScore = 0;
  late int updateTime = 0;
  late int playerStrength = 0;
  late int playerId = 0;

  PlayerStrengthRankTrendList();

  factory PlayerStrengthRankTrendList.fromJson(Map<String, dynamic> json) => $PlayerStrengthRankTrendListFromJson(json);

  Map<String, dynamic> toJson() => $PlayerStrengthRankTrendListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
