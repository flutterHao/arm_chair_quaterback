import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';
import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_game_detail_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_game_detail_entity.g.dart';

@JsonSerializable()
class NbaGameDetailEntity {
	late List<NbaGameDetailScoreBoardDetails> scoreBoardDetails;
	late NbaGameDetailGameData gameData;

	NbaGameDetailEntity();

	factory NbaGameDetailEntity.fromJson(Map<String, dynamic> json) => $NbaGameDetailEntityFromJson(json);

	Map<String, dynamic> toJson() => $NbaGameDetailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaGameDetailScoreBoardDetails {
	late int blk;
	late int gameId;
	late int fga;
	late int ast;
	late int dreb;
	late int espnId;
	late int stl;
	late int fgm;
	late int pts;
	late int reb;
	late int threePa;
	late int fta;
	late int min;
	late int oreb;
	late int pf;
	late int teamId;
	late bool isStarter;
	late int threePm;
	late int to;
	late int awayTeamId;
	late int ftm;
	late int playerId;

	NbaGameDetailScoreBoardDetails();

	factory NbaGameDetailScoreBoardDetails.fromJson(Map<String, dynamic> json) => $NbaGameDetailScoreBoardDetailsFromJson(json);

	Map<String, dynamic> toJson() => $NbaGameDetailScoreBoardDetailsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaGameDetailGameData {
	late GameSchedulesInfo schedule;
	NbaGameDetailGameDataTeamScore? homeTeamScore;
	late List<NbaGameDetailGameDataPlayerScores> homePlayerScores;
	NbaGameDetailGameDataTeamScore? awayTeamScore;
	late List<NbaGameDetailGameDataPlayerScores> awayPlayerScores;

	NbaGameDetailGameData();

	factory NbaGameDetailGameData.fromJson(Map<String, dynamic> json) => $NbaGameDetailGameDataFromJson(json);

	Map<String, dynamic> toJson() => $NbaGameDetailGameDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaGameDetailGameDataTeamScore {
	late int gameId;
	late int quarter1;
	late int quarter2;
	late int quarter3;
	late int quarter4;
	int? updateTime;
	late int ot2;
	late int ot1;
	late int ot4;
	late int ot3;
	late int ot6;
	late int ot5;
	late int ot8;
	late int total;
	late int ot7;
	@JSONField(name: 'createTime')
	late int ct = 0;
	late int teamId;

	NbaGameDetailGameDataTeamScore();

	int get createTime =>
			ct + Utils.getTimeZoneOffset().inMilliseconds;

  factory NbaGameDetailGameDataTeamScore.fromJson(Map<String, dynamic> json) =>
      $NbaGameDetailGameDataTeamScoreFromJson(json);

  Map<String, dynamic> toJson() => $NbaGameDetailGameDataTeamScoreToJson(this);

  @override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaGameDetailGameDataPlayerScores {
	late int fga;
	late int ast;
	late int dreb;
	late int espnId;
	late int fgm;
	late int reb;
	late int fta;
	late int min;
	late bool isStarter;
	late int ftm;
	late int playerId;
	late int blk;
	late int gameId;
	late int stl;
	int? updateTime;
	late int pts;
	late int threePa;
	late String ename;
	late int oreb;
	@JSONField(name: 'createTime')
	late int ct = 0;
	late int pf;
	late int teamId;
	late int threePm;
	late int to;
	late int awayTeamId;

	NbaGameDetailGameDataPlayerScores();

	int get createTime =>
			ct + Utils.getTimeZoneOffset().inMilliseconds;

  factory NbaGameDetailGameDataPlayerScores.fromJson(
          Map<String, dynamic> json) =>
      $NbaGameDetailGameDataPlayerScoresFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaGameDetailGameDataPlayerScoresToJson(this);

  @override
	String toString() {
		return jsonEncode(this);
	}
}

