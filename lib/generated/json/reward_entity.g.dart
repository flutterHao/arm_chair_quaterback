import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/reward_entity.dart';

RewardEntity $RewardEntityFromJson(Map<String, dynamic> json) {
  final RewardEntity rewardEntity = RewardEntity();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    rewardEntity.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    rewardEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    rewardEntity.type = type;
  }
  return rewardEntity;
}

Map<String, dynamic> $RewardEntityToJson(RewardEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension RewardEntityExtension on RewardEntity {
  RewardEntity copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return RewardEntity()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}