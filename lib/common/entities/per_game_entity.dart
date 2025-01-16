import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/per_game_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/per_game_entity.g.dart';

@JsonSerializable()
class PerGameEntity {
	late double fga;
	late double ast;
	late double dreb;
	late double fgm;
	late double fta;
	late int min = 0;
	late int nbaId = 0;
	late int seasonId = 0;
	late double wp;
	late double ftm;
	late int playerId = 0;
	late double blk;
	late int seasonType = 0;
	late int gp = 0;
	late double stl;
	late int updateTime = 0;
	late int l = 0;
	late double pts;
	late double threePa;
	late double oreb;
	late int createTime = 0;
	late int pf = 0;
	late int w = 0;
	late double threePm;
	late int to = 0;

	PerGameEntity();

	factory PerGameEntity.fromJson(Map<String, dynamic> json) => $PerGameEntityFromJson(json);

	Map<String, dynamic> toJson() => $PerGameEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}