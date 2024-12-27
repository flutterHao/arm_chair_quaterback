import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/star_up_done_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/star_up_done_entity.g.dart';

@JsonSerializable()
class StarUpDoneEntity {
	late StarUpDoneAddPotential addPotential;
	late bool success = false;
	late StarUpDoneTeamPlayerVO teamPlayerVO;
	late StarUpDoneRandomCount randomCount;

	StarUpDoneEntity();

	factory StarUpDoneEntity.fromJson(Map<String, dynamic> json) => $StarUpDoneEntityFromJson(json);

	Map<String, dynamic> toJson() => $StarUpDoneEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StarUpDoneAddPotential {
	late int blk = 0;
	late double tech;
	late int pass = 0;
	late int stl = 0;
	late int threePm = 0;
	late int ftm = 0;
	late int pts = 0;
	late int reb = 0;

	StarUpDoneAddPotential();

	factory StarUpDoneAddPotential.fromJson(Map<String, dynamic> json) => $StarUpDoneAddPotentialFromJson(json);

	Map<String, dynamic> toJson() => $StarUpDoneAddPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StarUpDoneTeamPlayerVO {
	late double playerStrength;
	late StarUpDoneTeamPlayerVOMaxAbility maxAbility;
	late String uuid = '';
	late double jumpShot = 0;
	late double gradeExp = 0;
	late int fromType = 0;
	late int playerGrade = 0;
	late int id = 0;
	late double power = 0;
	late double midlineDefense = 0;
	late double outsideDefense = 0;
	late int playerStatus = 0;
	late int playerStatusValue = 0;
	late StarUpDoneTeamPlayerVOPotential potential;
	late bool bindStatus = false;
	late int playerId = 0;
	late double buyPrice = 0;
	late double layup = 0;
	late double buyPlayerScore = 0;
	late double insideDefense = 0;
	late double threeShot = 0;
	late int updateTime = 0;
	late double playerReadiness = 0;
	late int createTime = 0;
	late int teamId = 0;
	late int position = 0;
	late int breakThroughGrade = 0;

	StarUpDoneTeamPlayerVO();

	factory StarUpDoneTeamPlayerVO.fromJson(Map<String, dynamic> json) => $StarUpDoneTeamPlayerVOFromJson(json);

	Map<String, dynamic> toJson() => $StarUpDoneTeamPlayerVOToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StarUpDoneTeamPlayerVOMaxAbility {
	late double blk;
	late double tech;
	late double pass;
	late int stl = 0;
	late double threePm;
	late double ftm;
	late int pts = 0;
	late int reb = 0;

	StarUpDoneTeamPlayerVOMaxAbility();

	factory StarUpDoneTeamPlayerVOMaxAbility.fromJson(Map<String, dynamic> json) => $StarUpDoneTeamPlayerVOMaxAbilityFromJson(json);

	Map<String, dynamic> toJson() => $StarUpDoneTeamPlayerVOMaxAbilityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StarUpDoneTeamPlayerVOPotential {
	late int blk = 0;
	late double tech;
	late int pass = 0;
	late int stl = 0;
	late int threePm = 0;
	late int ftm = 0;
	late int pts = 0;
	late int reb = 0;

	StarUpDoneTeamPlayerVOPotential();

	factory StarUpDoneTeamPlayerVOPotential.fromJson(Map<String, dynamic> json) => $StarUpDoneTeamPlayerVOPotentialFromJson(json);

	Map<String, dynamic> toJson() => $StarUpDoneTeamPlayerVOPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class StarUpDoneRandomCount {
	late int blk = 0;
	late int tech = 0;
	late int pass = 0;
	late int stl = 0;
	late int threePm = 0;
	late int ftm = 0;
	late int pts = 0;
	late int reb = 0;

	StarUpDoneRandomCount();

	factory StarUpDoneRandomCount.fromJson(Map<String, dynamic> json) => $StarUpDoneRandomCountFromJson(json);

	Map<String, dynamic> toJson() => $StarUpDoneRandomCountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}