import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_day_data_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/player_day_data_entity.g.dart';

@JsonSerializable()
class PlayerDayDataEntity {
	late double blk;
	late double fga;
	late double ast;
	late double dreb;
	late double starterCount;
	late double stl;
	late double updateTime;
	late double fgm;
	late double pts;
	late double threePa;
	late double playCount;
	late double fta;
	late double min;
	late double oreb;
	late double createTime;
	late double seasonId;
	late double pf;
	late double threePm;
	late double to;
	late double ftm;
	late double playerId;

	PlayerDayDataEntity();

	factory PlayerDayDataEntity.fromJson(Map<String, dynamic> json) => $PlayerDayDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $PlayerDayDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}