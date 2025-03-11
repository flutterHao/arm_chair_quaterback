import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/battle_pass_udf_reward_entity.dart';

BattlePassUdfRewardEntity $BattlePassUdfRewardEntityFromJson(
    Map<String, dynamic> json) {
  final BattlePassUdfRewardEntity battlePassUdfRewardEntity = BattlePassUdfRewardEntity();
  final String? comment = jsonConvert.convert<String>(json['comment']);
  if (comment != null) {
    battlePassUdfRewardEntity.comment = comment;
  }
  final int? hostTeamId = jsonConvert.convert<int>(json['hostTeamId']);
  if (hostTeamId != null) {
    battlePassUdfRewardEntity.hostTeamId = hostTeamId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    battlePassUdfRewardEntity.id = id;
  }
  final int? poolId = jsonConvert.convert<int>(json['poolId']);
  if (poolId != null) {
    battlePassUdfRewardEntity.poolId = poolId;
  }
  final List<String>? reward = (json['reward'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (reward != null) {
    battlePassUdfRewardEntity.reward = reward;
  }
  return battlePassUdfRewardEntity;
}

Map<String, dynamic> $BattlePassUdfRewardEntityToJson(
    BattlePassUdfRewardEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['comment'] = entity.comment;
  data['hostTeamId'] = entity.hostTeamId;
  data['id'] = entity.id;
  data['poolId'] = entity.poolId;
  data['reward'] = entity.reward;
  return data;
}

extension BattlePassUdfRewardEntityExtension on BattlePassUdfRewardEntity {
  BattlePassUdfRewardEntity copyWith({
    String? comment,
    int? hostTeamId,
    int? id,
    int? poolId,
    List<String>? reward,
  }) {
    return BattlePassUdfRewardEntity()
      ..comment = comment ?? this.comment
      ..hostTeamId = hostTeamId ?? this.hostTeamId
      ..id = id ?? this.id
      ..poolId = poolId ?? this.poolId
      ..reward = reward ?? this.reward;
  }
}