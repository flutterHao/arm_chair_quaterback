import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_mission_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class TeamMissionEntity {
	late int subCategory = 0;
	late int createTime = 0;
	late int teamId = 0;
	late int totalProcess = 0;
	late int missionDefineId = 0;
	late int startTime = 0;
	late int updateTime = 0;
	late int currProcess = 0;
	late int id = 0;
	late int category = 0;
	/// 1 未完成 2 已完成 3 已领奖
	late int status = 0;

	TeamMissionEntity();

  factory TeamMissionEntity.fromJson(Map<String, dynamic> json) =>
      $TeamMissionEntityFromJson(json);

  Map<String, dynamic> toJson() => $TeamMissionEntityToJson(this);

  @override
	String toString() {
		return jsonEncode(this);
	}
}