import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/steal_team_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/steal_team_entity.g.dart';

@JsonSerializable()
class StealTeamEntity {
	late int teamLogo = 0;
	late String teamName = '';
	late List<StealTeamPlayers> players = [];
	late int teamId = 0;
	late int currTeamStrength = 0;
	late int logoBoxId = 0;
	late bool online = false;
	late int teamGrade = 0;
	late bool isRevenge = false;

	StealTeamEntity();

	factory StealTeamEntity.fromJson(Map<String, dynamic> json) => $StealTeamEntityFromJson(json);

	Map<String, dynamic> toJson() => $StealTeamEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StealTeamPlayers {
	late int buyPrice = 0;
	late int buyPlayerScore = 0;
	late int updateTime = 0;
	late int playerStrength = 0;
	late int playerStarAddRate = 0;
	late String uuid = '';
	late int playerReadiness = 0;
	late int gradeExp = 0;
	late int fromType = 0;
	late int createTime = 0;
	late int playerGrade = 0;
	late int teamId = 0;
	late int id = 0;
	late int position = 0;
	late int power = 0;
	late int playerStatus = 0;
	late int playerStatusValue = 0;
	late StealTeamPlayersPotential potential;
	late bool bindStatus = false;
	late int breakThroughGrade = 0;
	late int playerId = 0;
	late StealTeamPlayersUpStarBase upStarBase;

	StealTeamPlayers();

	factory StealTeamPlayers.fromJson(Map<String, dynamic> json) => $StealTeamPlayersFromJson(json);

	Map<String, dynamic> toJson() => $StealTeamPlayersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StealTeamPlayersPotential {
	late int blk = 0;
	late int tech = 0;
	late int pass = 0;
	late int stl = 0;
	late int threePm = 0;
	late int ftm = 0;
	late int pts = 0;
	late int reb = 0;

	StealTeamPlayersPotential();

	factory StealTeamPlayersPotential.fromJson(Map<String, dynamic> json) => $StealTeamPlayersPotentialFromJson(json);

	Map<String, dynamic> toJson() => $StealTeamPlayersPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StealTeamPlayersUpStarBase {
	late int blk = 0;
	late int tech = 0;
	late int pass = 0;
	late int stl = 0;
	late int threePm = 0;
	late int ftm = 0;
	late int pts = 0;
	late int reb = 0;

	StealTeamPlayersUpStarBase();

	factory StealTeamPlayersUpStarBase.fromJson(Map<String, dynamic> json) => $StealTeamPlayersUpStarBaseFromJson(json);

	Map<String, dynamic> toJson() => $StealTeamPlayersUpStarBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}