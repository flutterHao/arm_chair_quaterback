import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/config/wheel_random_reward_entity.dart';

WheelRandomRewardEntity $WheelRandomRewardEntityFromJson(
    Map<String, dynamic> json) {
  final WheelRandomRewardEntity wheelRandomRewardEntity = WheelRandomRewardEntity();
  final int? randomId = jsonConvert.convert<int>(json['randomId']);
  if (randomId != null) {
    wheelRandomRewardEntity.randomId = randomId;
  }
  final String? randomReward = jsonConvert.convert<String>(
      json['randomReward']);
  if (randomReward != null) {
    wheelRandomRewardEntity.randomReward = randomReward;
  }
  final String? randomRewardBack = jsonConvert.convert<String>(
      json['randomRewardBack']);
  if (randomRewardBack != null) {
    wheelRandomRewardEntity.randomRewardBack = randomRewardBack;
  }
  final int? randomRewardWeight = jsonConvert.convert<int>(
      json['randomRewardWeight']);
  if (randomRewardWeight != null) {
    wheelRandomRewardEntity.randomRewardWeight = randomRewardWeight;
  }
  return wheelRandomRewardEntity;
}

Map<String, dynamic> $WheelRandomRewardEntityToJson(
    WheelRandomRewardEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['randomId'] = entity.randomId;
  data['randomReward'] = entity.randomReward;
  data['randomRewardBack'] = entity.randomRewardBack;
  data['randomRewardWeight'] = entity.randomRewardWeight;
  return data;
}

extension WheelRandomRewardEntityExtension on WheelRandomRewardEntity {
  WheelRandomRewardEntity copyWith({
    int? randomId,
    String? randomReward,
    String? randomRewardBack,
    int? randomRewardWeight,
  }) {
    return WheelRandomRewardEntity()
      ..randomId = randomId ?? this.randomId
      ..randomReward = randomReward ?? this.randomReward
      ..randomRewardBack = randomRewardBack ?? this.randomRewardBack
      ..randomRewardWeight = randomRewardWeight ?? this.randomRewardWeight;
  }
}