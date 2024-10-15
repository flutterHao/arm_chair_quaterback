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
  final int? taskRound = jsonConvert.convert<int>(json['taskRound']);
  if (taskRound != null) {
    trainTaskEntity.taskRound = taskRound;
  }
  return trainTaskEntity;
}

Map<String, dynamic> $TrainTaskEntityToJson(TrainTaskEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['taskLevel'] = entity.taskLevel;
  data['taskNeed'] = entity.taskNeed;
  data['taskReward'] = entity.taskReward;
  data['taskRound'] = entity.taskRound;
  return data;
}

extension TrainTaskEntityExtension on TrainTaskEntity {
  TrainTaskEntity copyWith({
    int? taskLevel,
    int? taskNeed,
    String? taskReward,
    int? taskRound,
  }) {
    return TrainTaskEntity()
      ..taskLevel = taskLevel ?? this.taskLevel
      ..taskNeed = taskNeed ?? this.taskNeed
      ..taskReward = taskReward ?? this.taskReward
      ..taskRound = taskRound ?? this.taskRound;
  }
}