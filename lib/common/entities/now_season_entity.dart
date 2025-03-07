import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/now_season_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/now_season_entity.g.dart';

@JsonSerializable()
class NowSeasonEntity {
	late int seasonEndTime = 0;
	late int createTime = 0;
	late int seasonId = 0;
	late int seasonDuration = 0;
	late int updateTime = 0;
	late int seasonNum = 0;
	late int seasonStartTime = 0;

	NowSeasonEntity();

	factory NowSeasonEntity.fromJson(Map<String, dynamic> json) => $NowSeasonEntityFromJson(json);

	Map<String, dynamic> toJson() => $NowSeasonEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}