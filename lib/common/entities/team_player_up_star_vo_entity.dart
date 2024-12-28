import 'package:arm_chair_quaterback/common/entities/up_star_team_player_v2_entity.dart';
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
	late TeamPlayerUpStarVoPotential bestOneStarAbility;
	double playerStrength=0;
	/// 上次升星没有结束，过程中退出了才会有这个字段
	UpStarTeamPlayerV2Entity? starUpDTO;

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
	 double blk = 0;
	 double tech = 0;
	 double pass = 0;
	 double stl = 0;
	 double threePm = 0;
	 double ftm = 0;
	 double pts = 0;
	 double reb = 0;

	TeamPlayerUpStarVoPotential();

	factory TeamPlayerUpStarVoPotential.fromJson(Map<String, dynamic> json) => $TeamPlayerUpStarVoPotentialFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerUpStarVoPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
