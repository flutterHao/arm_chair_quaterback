import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/training_task_entity.dart';

TrainingTaskEntity $TrainingTaskEntityFromJson(Map<String, dynamic> json) {
  final TrainingTaskEntity trainingTaskEntity = TrainingTaskEntity();
  final String? taskLevel = jsonConvert.convert<String>(json['taskLevel']);
  if (taskLevel != null) {
    trainingTaskEntity.taskLevel = taskLevel;
  }
  final String? taskNeed = jsonConvert.convert<String>(json['taskNeed']);
  if (taskNeed != null) {
    trainingTaskEntity.taskNeed = taskNeed;
  }
  final String? taskReward = jsonConvert.convert<String>(json['taskReward']);
  if (taskReward != null) {
    trainingTaskEntity.taskReward = taskReward;
  }
  final String? taskRound = jsonConvert.convert<String>(json['taskRound']);
  if (taskRound != null) {
    trainingTaskEntity.taskRound = taskRound;
  }
  return trainingTaskEntity;
}

Map<String, dynamic> $TrainingTaskEntityToJson(TrainingTaskEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['taskLevel'] = entity.taskLevel;
  data['taskNeed'] = entity.taskNeed;
  data['taskReward'] = entity.taskReward;
  data['taskRound'] = entity.taskRound;
  return data;
}

extension TrainingTaskEntityExtension on TrainingTaskEntity {
  TrainingTaskEntity copyWith({
    String? taskLevel,
    String? taskNeed,
    String? taskReward,
    String? taskRound,
  }) {
    return TrainingTaskEntity()
      ..taskLevel = taskLevel ?? this.taskLevel
      ..taskNeed = taskNeed ?? this.taskNeed
      ..taskReward = taskReward ?? this.taskReward
      ..taskRound = taskRound ?? this.taskRound;
  }
}