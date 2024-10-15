import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/training_task_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/training_task_entity.g.dart';

@JsonSerializable()
class TrainingTaskEntity {
	late String taskLevel = '';
	late String taskNeed = '';
	late String taskReward = '';
	late String taskRound = '';

	TrainingTaskEntity();

	factory TrainingTaskEntity.fromJson(Map<String, dynamic> json) => $TrainingTaskEntityFromJson(json);

	Map<String, dynamic> toJson() => $TrainingTaskEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}