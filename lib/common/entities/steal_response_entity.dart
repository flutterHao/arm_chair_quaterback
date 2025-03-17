import 'package:arm_chair_quaterback/common/entities/steal_team_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/steal_response_entity.g.dart';
import 'dart:convert';

export 'package:arm_chair_quaterback/generated/json/steal_response_entity.g.dart';

@JsonSerializable()
class StealResponseEntity {
	List<StealResponseAwardData> awardData = [];
	int teamId = 0;
	StealTeamPlayers? stealPlayer;

	StealResponseEntity();

	factory StealResponseEntity.fromJson(Map<String, dynamic> json) => $StealResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $StealResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StealResponseAwardData {
	late int num = 0;
	late int id = 0;
	late int type = 0;

	StealResponseAwardData();

	factory StealResponseAwardData.fromJson(Map<String, dynamic> json) => $StealResponseAwardDataFromJson(json);

	Map<String, dynamic> toJson() => $StealResponseAwardDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}