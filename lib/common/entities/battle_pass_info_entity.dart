import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/battle_pass_info_entity.g.dart';

export 'package:arm_chair_quaterback/generated/json/battle_pass_info_entity.g.dart';

@JsonSerializable()
class BattlePassInfoEntity {
  late int hostTeam = 0;
  late int createTime = 0;
  late int seasonId = 0;
  late bool allReadyClaimed = false;
  late Map claimedRewardMaps;
  late int teamId = 0;
  late int updateTime = 0;
  late int id = 0;
  late int value = 0;

  BattlePassInfoEntity();

  factory BattlePassInfoEntity.fromJson(Map<String, dynamic> json) =>
      $BattlePassInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $BattlePassInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BattlePassInfoClaimedRewardMaps {
  BattlePassInfoClaimedRewardMaps();

  factory BattlePassInfoClaimedRewardMaps.fromJson(Map<String, dynamic> json) =>
      $BattlePassInfoClaimedRewardMapsFromJson(json);

  Map<String, dynamic> toJson() => $BattlePassInfoClaimedRewardMapsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
