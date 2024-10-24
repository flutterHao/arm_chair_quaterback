import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_player_list_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_player_list_entity.g.dart';

@JsonSerializable()
class TeamPlayerListEntity {
	late int powerReplyTime;
	late List<TeamPlayerInfoEntity> teamPlayers;
	late int powerP;
	@JSONField(name: "OVR")
	late int oVR;
	late int salary;
	late int benchCount;
	late int salaryCap;

	TeamPlayerListEntity();

	factory TeamPlayerListEntity.fromJson(Map<String, dynamic> json) => $TeamPlayerListEntityFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}