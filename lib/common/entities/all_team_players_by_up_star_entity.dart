import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/all_team_players_by_up_star_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/all_team_players_by_up_star_entity.g.dart';

@JsonSerializable()
class AllTeamPlayersByUpStarEntity {
	late double buyPrice;
	late double buyPlayerScore;
	late double probability;
	late double cost;
	late double updateTime;
	late String uuid;
	late double gradeExp;
	late double fromType;
	late double createTime;
	late double playerGrade;
	late double teamId;
	late double id;
	late double position;
	late double power;
	late AllTeamPlayersByUpStarPotential potential;
	late bool bindStatus;
	late double breakThroughGrade;
	late double playerId;
	late AllTeamPlayersByUpStarUpStarBase upStarBase;

	AllTeamPlayersByUpStarEntity();

	factory AllTeamPlayersByUpStarEntity.fromJson(Map<String, dynamic> json) => $AllTeamPlayersByUpStarEntityFromJson(json);

	Map<String, dynamic> toJson() => $AllTeamPlayersByUpStarEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AllTeamPlayersByUpStarPotential {
	late double blk;
	late double threePt;
	late double ast;
	late double stl;
	late double pts;
	late double reb;

	AllTeamPlayersByUpStarPotential();

	factory AllTeamPlayersByUpStarPotential.fromJson(Map<String, dynamic> json) => $AllTeamPlayersByUpStarPotentialFromJson(json);

	Map<String, dynamic> toJson() => $AllTeamPlayersByUpStarPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AllTeamPlayersByUpStarUpStarBase {
	late double blk;
	late double threePt;
	late double ast;
	late double stl;
	late double pts;
	late double reb;

	AllTeamPlayersByUpStarUpStarBase();

	factory AllTeamPlayersByUpStarUpStarBase.fromJson(Map<String, dynamic> json) => $AllTeamPlayersByUpStarUpStarBaseFromJson(json);

	Map<String, dynamic> toJson() => $AllTeamPlayersByUpStarUpStarBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}