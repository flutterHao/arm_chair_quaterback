import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/daily_task_wheel_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/daily_task_wheel_entity.g.dart';

@JsonSerializable()
class DailyTaskWheelEntity {
	 int circle = 0;
	 int id = 0;
	 int reward = 0;
	 int rewardNum = 0;
	 int rewardType = 0;
	 int rewardWeight = 0;

	DailyTaskWheelEntity();

	factory DailyTaskWheelEntity.fromJson(Map<String, dynamic> json) => $DailyTaskWheelEntityFromJson(json);

	Map<String, dynamic> toJson() => $DailyTaskWheelEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}