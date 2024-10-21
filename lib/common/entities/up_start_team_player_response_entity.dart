import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/up_start_team_player_response_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/up_start_team_player_response_entity.g.dart';

@JsonSerializable()
class UpStartTeamPlayerResponseEntity {
	late List<UpStartTeamPlayerResponseTeamPlayers> teamPlayers;

	UpStartTeamPlayerResponseEntity();

	factory UpStartTeamPlayerResponseEntity.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStartTeamPlayerResponseTeamPlayers {
	late List<int> areaMascotId;
	late bool bindStatus;
	late int breakThroughGrade;
	late int buyPlayerScore;
	late int buyPrice;
	late List<dynamic> coachPassivitySkills;
	late int createTime;
	late int famousAlmanacGrade;
	late int fromType;
	late int gradeExp;
	late int id;
	late int mascotId;
	late int mvpGrade;
	late List<dynamic> needAwardData;
	late int perfectPromoteCount;
	late int playerGrade;
	late int playerId;
	late int position;
	late int power;
	late int promoteCount;
	late int property;
	late List<UpStartTeamPlayerResponseTeamPlayersQualificationAbility> qualificationAbility;
	late int qualificationLuckValue;
	late int specialTrainingGrade;
	late int teamId;
	late int updateTime;
	late String uuid;

	UpStartTeamPlayerResponseTeamPlayers();

	factory UpStartTeamPlayerResponseTeamPlayers.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseTeamPlayersFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseTeamPlayersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStartTeamPlayerResponseTeamPlayersQualificationAbility {
	late int baseValue;
	late bool lock;
	late int newValue;
	late int type;

	UpStartTeamPlayerResponseTeamPlayersQualificationAbility();

	factory UpStartTeamPlayerResponseTeamPlayersQualificationAbility.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseTeamPlayersQualificationAbilityFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseTeamPlayersQualificationAbilityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}