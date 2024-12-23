import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';

TrainTaskEntity $TrainTaskEntityFromJson(Map<String, dynamic> json) {
  final TrainTaskEntity trainTaskEntity = TrainTaskEntity();
  final int? taskLevel = jsonConvert.convert<int>(json['taskLevel']);
  if (taskLevel != null) {
    trainTaskEntity.taskLevel = taskLevel;
  }
  final int? taskNeed = jsonConvert.convert<int>(json['taskNeed']);
  if (taskNeed != null) {
    trainTaskEntity.taskNeed = taskNeed;
  }
  final String? taskReward = jsonConvert.convert<String>(json['taskReward']);
  if (taskReward != null) {
    trainTaskEntity.taskReward = taskReward;
  }
  final List<int>? reward = (json['reward'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (reward != null) {
    trainTaskEntity.reward = reward;
  }
  final int? taskRound = jsonConvert.convert<int>(json['taskRound']);
  if (taskRound != null) {
    trainTaskEntity.taskRound = taskRound;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    trainTaskEntity.propId = propId;
  }
  final int? propNum = jsonConvert.convert<int>(json['propNum']);
  if (propNum != null) {
    trainTaskEntity.propNum = propNum;
  }
  return trainTaskEntity;
}

Map<String, dynamic> $TrainTaskEntityToJson(TrainTaskEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['taskLevel'] = entity.taskLevel;
  data['taskNeed'] = entity.taskNeed;
  data['taskReward'] = entity.taskReward;
  data['reward'] = entity.reward;
  data['taskRound'] = entity.taskRound;
  data['propId'] = entity.propId;
  data['propNum'] = entity.propNum;
  return data;
}

extension TrainTaskEntityExtension on TrainTaskEntity {
  TrainTaskEntity copyWith({
    int? taskLevel,
    int? taskNeed,
    String? taskReward,
    List<int>? reward,
    int? taskRound,
    int? propId,
    int? propNum,
  }) {
    return TrainTaskEntity()
      ..taskLevel = taskLevel ?? this.taskLevel
      ..taskNeed = taskNeed ?? this.taskNeed
      ..taskReward = taskReward ?? this.taskReward
      ..reward = reward ?? this.reward
      ..taskRound = taskRound ?? this.taskRound
      ..propId = propId ?? this.propId
      ..propNum = propNum ?? this.propNum;
  }
}