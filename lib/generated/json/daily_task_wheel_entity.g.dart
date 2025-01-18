import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/daily_task_wheel_entity.dart';

DailyTaskWheelEntity $DailyTaskWheelEntityFromJson(Map<String, dynamic> json) {
  final DailyTaskWheelEntity dailyTaskWheelEntity = DailyTaskWheelEntity();
  final int? circle = jsonConvert.convert<int>(json['circle']);
  if (circle != null) {
    dailyTaskWheelEntity.circle = circle;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dailyTaskWheelEntity.id = id;
  }
  final int? reward = jsonConvert.convert<int>(json['reward']);
  if (reward != null) {
    dailyTaskWheelEntity.reward = reward;
  }
  final int? rewardNum = jsonConvert.convert<int>(json['rewardNum']);
  if (rewardNum != null) {
    dailyTaskWheelEntity.rewardNum = rewardNum;
  }
  final int? rewardType = jsonConvert.convert<int>(json['rewardType']);
  if (rewardType != null) {
    dailyTaskWheelEntity.rewardType = rewardType;
  }
  final int? rewardWeight = jsonConvert.convert<int>(json['rewardWeight']);
  if (rewardWeight != null) {
    dailyTaskWheelEntity.rewardWeight = rewardWeight;
  }
  return dailyTaskWheelEntity;
}

Map<String, dynamic> $DailyTaskWheelEntityToJson(DailyTaskWheelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['circle'] = entity.circle;
  data['id'] = entity.id;
  data['reward'] = entity.reward;
  data['rewardNum'] = entity.rewardNum;
  data['rewardType'] = entity.rewardType;
  data['rewardWeight'] = entity.rewardWeight;
  return data;
}

extension DailyTaskWheelEntityExtension on DailyTaskWheelEntity {
  DailyTaskWheelEntity copyWith({
    int? circle,
    int? id,
    int? reward,
    int? rewardNum,
    int? rewardType,
    int? rewardWeight,
  }) {
    return DailyTaskWheelEntity()
      ..circle = circle ?? this.circle
      ..id = id ?? this.id
      ..reward = reward ?? this.reward
      ..rewardNum = rewardNum ?? this.rewardNum
      ..rewardType = rewardType ?? this.rewardType
      ..rewardWeight = rewardWeight ?? this.rewardWeight;
  }
}