import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/pk_player_updated_entity.dart';

PkPlayerUpdatedEntity $PkPlayerUpdatedEntityFromJson(
    Map<String, dynamic> json) {
  final PkPlayerUpdatedEntity pkPlayerUpdatedEntity = PkPlayerUpdatedEntity();
  final int? changePlayerCoolTime = jsonConvert.convert<int>(
      json['changePlayerCoolTime']);
  if (changePlayerCoolTime != null) {
    pkPlayerUpdatedEntity.changePlayerCoolTime = changePlayerCoolTime;
  }
  final int? playerId1 = jsonConvert.convert<int>(json['playerId1']);
  if (playerId1 != null) {
    pkPlayerUpdatedEntity.playerId1 = playerId1;
  }
  final int? playerId2 = jsonConvert.convert<int>(json['playerId2']);
  if (playerId2 != null) {
    pkPlayerUpdatedEntity.playerId2 = playerId2;
  }
  final String? serverId = jsonConvert.convert<String>(json['serverId']);
  if (serverId != null) {
    pkPlayerUpdatedEntity.serverId = serverId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    pkPlayerUpdatedEntity.teamId = teamId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    pkPlayerUpdatedEntity.type = type;
  }
  final List<PkPlayerUpdatedPlayers>? players = (json['players'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<PkPlayerUpdatedPlayers>(e) as PkPlayerUpdatedPlayers)
      .toList();
  if (players != null) {
    pkPlayerUpdatedEntity.players = players;
  }
  return pkPlayerUpdatedEntity;
}

Map<String, dynamic> $PkPlayerUpdatedEntityToJson(
    PkPlayerUpdatedEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['changePlayerCoolTime'] = entity.changePlayerCoolTime;
  data['playerId1'] = entity.playerId1;
  data['playerId2'] = entity.playerId2;
  data['serverId'] = entity.serverId;
  data['teamId'] = entity.teamId;
  data['type'] = entity.type;
  data['players'] = entity.players.map((v) => v.toJson()).toList();
  return data;
}

extension PkPlayerUpdatedEntityExtension on PkPlayerUpdatedEntity {
  PkPlayerUpdatedEntity copyWith({
    int? changePlayerCoolTime,
    int? playerId1,
    int? playerId2,
    String? serverId,
    int? teamId,
    int? type,
    List<PkPlayerUpdatedPlayers>? players,
  }) {
    return PkPlayerUpdatedEntity()
      ..changePlayerCoolTime = changePlayerCoolTime ?? this.changePlayerCoolTime
      ..playerId1 = playerId1 ?? this.playerId1
      ..playerId2 = playerId2 ?? this.playerId2
      ..serverId = serverId ?? this.serverId
      ..teamId = teamId ?? this.teamId
      ..type = type ?? this.type
      ..players = players ?? this.players;
  }
}

PkPlayerUpdatedPlayers $PkPlayerUpdatedPlayersFromJson(
    Map<String, dynamic> json) {
  final PkPlayerUpdatedPlayers pkPlayerUpdatedPlayers = PkPlayerUpdatedPlayers();
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    pkPlayerUpdatedPlayers.position = position;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    pkPlayerUpdatedPlayers.playerId = playerId;
  }
  return pkPlayerUpdatedPlayers;
}

Map<String, dynamic> $PkPlayerUpdatedPlayersToJson(
    PkPlayerUpdatedPlayers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['position'] = entity.position;
  data['playerId'] = entity.playerId;
  return data;
}

extension PkPlayerUpdatedPlayersExtension on PkPlayerUpdatedPlayers {
  PkPlayerUpdatedPlayers copyWith({
    int? position,
    int? playerId,
  }) {
    return PkPlayerUpdatedPlayers()
      ..position = position ?? this.position
      ..playerId = playerId ?? this.playerId;
  }
}