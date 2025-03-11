import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/battle_pass_info_entity.dart';

BattlePassInfoEntity $BattlePassInfoEntityFromJson(Map<String, dynamic> json) {
  final BattlePassInfoEntity battlePassInfoEntity = BattlePassInfoEntity();
  final int? hostTeam = jsonConvert.convert<int>(json['hostTeam']);
  if (hostTeam != null) {
    battlePassInfoEntity.hostTeam = hostTeam;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    battlePassInfoEntity.createTime = createTime;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    battlePassInfoEntity.seasonId = seasonId;
  }
  final bool? allReadyClaimed = jsonConvert.convert<bool>(
      json['allReadyClaimed']);
  if (allReadyClaimed != null) {
    battlePassInfoEntity.allReadyClaimed = allReadyClaimed;
  }
  final Map? claimedRewardMaps =
  (json['claimedRewardMaps'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, e));
  if (claimedRewardMaps != null) {
    battlePassInfoEntity.claimedRewardMaps = claimedRewardMaps;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    battlePassInfoEntity.teamId = teamId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    battlePassInfoEntity.updateTime = updateTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    battlePassInfoEntity.id = id;
  }
  final int? value = jsonConvert.convert<int>(json['value']);
  if (value != null) {
    battlePassInfoEntity.value = value;
  }
  return battlePassInfoEntity;
}

Map<String, dynamic> $BattlePassInfoEntityToJson(BattlePassInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['hostTeam'] = entity.hostTeam;
  data['createTime'] = entity.createTime;
  data['seasonId'] = entity.seasonId;
  data['allReadyClaimed'] = entity.allReadyClaimed;
  data['claimedRewardMaps'] = entity.claimedRewardMaps;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  data['id'] = entity.id;
  data['value'] = entity.value;
  return data;
}

extension BattlePassInfoEntityExtension on BattlePassInfoEntity {
  BattlePassInfoEntity copyWith({
    int? hostTeam,
    int? createTime,
    int? seasonId,
    bool? allReadyClaimed,
    Map? claimedRewardMaps,
    int? teamId,
    int? updateTime,
    int? id,
    int? value,
  }) {
    return BattlePassInfoEntity()
      ..hostTeam = hostTeam ?? this.hostTeam
      ..createTime = createTime ?? this.createTime
      ..seasonId = seasonId ?? this.seasonId
      ..allReadyClaimed = allReadyClaimed ?? this.allReadyClaimed
      ..claimedRewardMaps = claimedRewardMaps ?? this.claimedRewardMaps
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime
      ..id = id ?? this.id
      ..value = value ?? this.value;
  }
}

BattlePassInfoClaimedRewardMaps $BattlePassInfoClaimedRewardMapsFromJson(
    Map<String, dynamic> json) {
  final BattlePassInfoClaimedRewardMaps battlePassInfoClaimedRewardMaps = BattlePassInfoClaimedRewardMaps();
  return battlePassInfoClaimedRewardMaps;
}

Map<String, dynamic> $BattlePassInfoClaimedRewardMapsToJson(
    BattlePassInfoClaimedRewardMaps entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension BattlePassInfoClaimedRewardMapsExtension on BattlePassInfoClaimedRewardMaps {
}