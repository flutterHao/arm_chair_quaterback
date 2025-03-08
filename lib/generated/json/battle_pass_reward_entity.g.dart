import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/battle_pass_reward_entity.dart';

BattlePassRewardEntity $BattlePassRewardEntityFromJson(
    Map<String, dynamic> json) {
  final BattlePassRewardEntity battlePassRewardEntity = BattlePassRewardEntity();
  final String? fixReward = jsonConvert.convert<String>(json['fixReward']);
  if (fixReward != null) {
    battlePassRewardEntity.fixReward = fixReward;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    battlePassRewardEntity.id = id;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    battlePassRewardEntity.level = level;
  }
  final int? poolId = jsonConvert.convert<int>(json['poolId']);
  if (poolId != null) {
    battlePassRewardEntity.poolId = poolId;
  }
  final int? threshold = jsonConvert.convert<int>(json['threshold']);
  if (threshold != null) {
    battlePassRewardEntity.threshold = threshold;
  }
  return battlePassRewardEntity;
}

Map<String, dynamic> $BattlePassRewardEntityToJson(
    BattlePassRewardEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fixReward'] = entity.fixReward;
  data['id'] = entity.id;
  data['level'] = entity.level;
  data['poolId'] = entity.poolId;
  data['threshold'] = entity.threshold;
  return data;
}

extension BattlePassRewardEntityExtension on BattlePassRewardEntity {
  BattlePassRewardEntity copyWith({
    String? fixReward,
    int? id,
    int? level,
    int? poolId,
    int? threshold,
  }) {
    return BattlePassRewardEntity()
      ..fixReward = fixReward ?? this.fixReward
      ..id = id ?? this.id
      ..level = level ?? this.level
      ..poolId = poolId ?? this.poolId
      ..threshold = threshold ?? this.threshold;
  }
}