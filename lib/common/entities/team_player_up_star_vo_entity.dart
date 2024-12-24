import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_player_up_star_vo_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_player_up_star_vo_entity.g.dart';

@JsonSerializable()
class TeamPlayerUpStarVoEntity {
	late String uuid = '';
	late double jumpShot = 0;
	late int gradeExp = 0;
	late int fromType = 0;
	late int playerGrade = 0;
	late int id = 0;
	late int power = 0;
	late double midlineDefense = 0;
	late double outsideDefense = 0;
	late int playerStatus = 0;
	late int playerStatusValue = 0;
	late TeamPlayerUpStarVoPotential potential;
	late bool bindStatus = false;
	late int playerId = 0;
	late int buyPrice = 0;
	late double layup = 0;
	late int buyPlayerScore = 0;
	late double insideDefense = 0;
	late double threeShot = 0;
	late int updateTime = 0;
	late double playerReadiness;
	late int createTime = 0;
	late int teamId = 0;
	late int position = 0;
	late int breakThroughGrade = 0;
	late TeamPlayerUpStarVoPotential maxAbility;

	TeamPlayerUpStarVoEntity();

	factory TeamPlayerUpStarVoEntity.fromJson(Map<String, dynamic> json) => $TeamPlayerUpStarVoEntityFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerUpStarVoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TeamPlayerUpStarVoPotential {
	 int blk = 0;
	 int tech = 0;
	 int pass = 0;
	 int stl = 0;
	 int threePm = 0;
	 int ftm = 0;
	 int pts = 0;
	 int reb = 0;

	TeamPlayerUpStarVoPotential();

	factory TeamPlayerUpStarVoPotential.fromJson(Map<String, dynamic> json) => $TeamPlayerUpStarVoPotentialFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerUpStarVoPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
