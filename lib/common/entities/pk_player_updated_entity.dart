import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/pk_player_updated_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/pk_player_updated_entity.g.dart';

@JsonSerializable()
class PkPlayerUpdatedEntity {
  late int changePlayerCoolTime = 0;
  late int playerId1 = 0; //被替换的选手
  late int playerId2 = 0; //替换上场的选手
  late String serverId = '';
  late int teamId = 0;
  late int type = 0;
  late List<PkPlayerUpdatedPlayers> players;

  PkPlayerUpdatedEntity();

  factory PkPlayerUpdatedEntity.fromJson(Map<String, dynamic> json) =>
      $PkPlayerUpdatedEntityFromJson(json);

  Map<String, dynamic> toJson() => $PkPlayerUpdatedEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PkPlayerUpdatedPlayers {
  late int position;
  late int playerId;

  PkPlayerUpdatedPlayers();

  factory PkPlayerUpdatedPlayers.fromJson(Map<String, dynamic> json) =>
      $PkPlayerUpdatedPlayersFromJson(json);

  Map<String, dynamic> toJson() => $PkPlayerUpdatedPlayersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
