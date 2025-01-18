import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/mission_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/mission_define_entity.g.dart';

@JsonSerializable()
class MissionDefineEntity {
	late String awardData = "";
	late int category = 0;
	late int condition = 0;
	late String desc = '';
	late String desc1 = '';
	late int isShow = 0;
	late String linkId = '';
	late int missionDefineId = 0;
	late String missionDefineName = '';
	late String missionbackup = '';
	late List<String> nextMissionIds = [];
	late int showProgress = 0;
	late int subCategory = 0;
	late int targetNum = 0;
	late int teamGradeLimit = 1;

	MissionDefineEntity();

	factory MissionDefineEntity.fromJson(Map<String, dynamic> json) => $MissionDefineEntityFromJson(json);

	Map<String, dynamic> toJson() => $MissionDefineEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}