import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/schedule_choose_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/schedule_choose_entity.g.dart';

@JsonSerializable()
class ScheduleChooseEntity {
	late int num = 0;
	late int id = 0;
	late int type = 0;

	ScheduleChooseEntity();

	factory ScheduleChooseEntity.fromJson(Map<String, dynamic> json) => $ScheduleChooseEntityFromJson(json);

	Map<String, dynamic> toJson() => $ScheduleChooseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}