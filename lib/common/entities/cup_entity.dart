import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/cup_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/cup_entity.g.dart';

@JsonSerializable()
class CupEntity {
	late int createTime = 0;
	late int cup = 0;
	late int cupRankId = 0;
	late int currentContinuousLoss = 0;
	late int currentGameWinningStreak = 0;
	late int currentWinGames = 0;
	late int maxCup = 0;
	late int maxGameWinningStreak = 0;
	late int rankProtect = 0;
	late int seasonId = 0;
	late int seasonTotalGames = 0;
	late int teamId = 0;
	late int updateTime = 0;

	CupEntity();

	factory CupEntity.fromJson(Map<String, dynamic> json) => $CupEntityFromJson(json);

	Map<String, dynamic> toJson() => $CupEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}