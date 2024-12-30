import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/star_up_done_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/star_up_done_entity.g.dart';

@JsonSerializable()
class StarUpDoneEntity {
	late StarUpDoneAddPotential addPotential;
	late bool success = false;
	late TeamPlayerUpStarVoEntity teamPlayerVO;
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