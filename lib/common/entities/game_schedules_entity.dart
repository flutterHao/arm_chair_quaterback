import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/game_schedules_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/game_schedules_entity.g.dart';

@JsonSerializable()
class GameSchedulesEntity {
	late int gameId = 0;
	late int gameType = 0;
	late int homeScore = 0;
	late int updateTime = 0;
	late int gameTime = 0;
	late int awayScore = 0;
	late int createTime = 0;
	late String awayTeamName = '';
	late int homeLeagueId = 0;
	late int awayLeagueId = 0;
	late int awayTeamLogo = 0;
	late int homeTeamLogo = 0;
	late String homeTeamName = '';
	late int homeTeamId = 0;
	late String awayLeagueName = '';
	late int awayTeamId = 0;
	late String homeLeagueName = '';

	GameSchedulesEntity();

	factory GameSchedulesEntity.fromJson(Map<String, dynamic> json) => $GameSchedulesEntityFromJson(json);

	Map<String, dynamic> toJson() => $GameSchedulesEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}