import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/up_start_team_player_response_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/up_start_team_player_response_entity.g.dart';

@JsonSerializable()
class UpStartTeamPlayerResponseEntity {
	late UpStartTeamPlayerResponseDataBefore before;
	late bool success;
	late UpStartTeamPlayerResponseDataAfter after;

	UpStartTeamPlayerResponseEntity();

	factory UpStartTeamPlayerResponseEntity.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStartTeamPlayerResponseDataBefore {
	late int buyPrice;
	late int buyPlayerScore;
	late int updateTime;
	late String uuid;
	late int gradeExp;
	late int fromType;
	late int createTime;
	late int playerGrade;
	late int teamId;
	late int id;
	late int position;
	late int power;
	late UpStartTeamPlayerResponseDataBeforePotential potential;
	late bool bindStatus;
	late int breakThroughGrade;
	late int playerId;
	late UpStartTeamPlayerResponseDataBeforeUpStarBase upStarBase;

	UpStartTeamPlayerResponseDataBefore();

	factory UpStartTeamPlayerResponseDataBefore.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseDataBeforeFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseDataBeforeToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStartTeamPlayerResponseDataBeforePotential {
	late double blk;
	late double threePt;
	late double ast;
	late double stl;
	late double pts;
	late double reb;

	UpStartTeamPlayerResponseDataBeforePotential();

	factory UpStartTeamPlayerResponseDataBeforePotential.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseDataBeforePotentialFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseDataBeforePotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStartTeamPlayerResponseDataBeforeUpStarBase {
	late double blk;
	late double threePt;
	late double ast;
	late double stl;
	late double pts;
	late double reb;

	UpStartTeamPlayerResponseDataBeforeUpStarBase();

	factory UpStartTeamPlayerResponseDataBeforeUpStarBase.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseDataBeforeUpStarBaseFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseDataBeforeUpStarBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStartTeamPlayerResponseDataAfter {
	late int buyPrice;
	late int buyPlayerScore;
	late int updateTime;
	late String uuid;
	late int gradeExp;
	late int fromType;
	late int createTime;
	late int playerGrade;
	late int teamId;
	late int id;
	late int position;
	late int power;
	late UpStartTeamPlayerResponseDataAfterPotential potential;
	late bool bindStatus;
	late int breakThroughGrade;
	late int playerId;
	late UpStartTeamPlayerResponseDataAfterUpStarBase upStarBase;

	UpStartTeamPlayerResponseDataAfter();

	factory UpStartTeamPlayerResponseDataAfter.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseDataAfterFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseDataAfterToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStartTeamPlayerResponseDataAfterPotential {
	late double blk;
	late double threePt;
	late double ast;
	late double stl;
	late double pts;
	late double reb;

	UpStartTeamPlayerResponseDataAfterPotential();

	factory UpStartTeamPlayerResponseDataAfterPotential.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseDataAfterPotentialFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseDataAfterPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStartTeamPlayerResponseDataAfterUpStarBase {
	late double blk;
	late double threePt;
	late double ast;
	late double stl;
	late double pts;
	late double reb;

	UpStartTeamPlayerResponseDataAfterUpStarBase();

	factory UpStartTeamPlayerResponseDataAfterUpStarBase.fromJson(Map<String, dynamic> json) => $UpStartTeamPlayerResponseDataAfterUpStarBaseFromJson(json);

	Map<String, dynamic> toJson() => $UpStartTeamPlayerResponseDataAfterUpStarBaseToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}