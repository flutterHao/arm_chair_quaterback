import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/pk_result_updated_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/pk_result_updated_entity.g.dart';

@JsonSerializable()
class PkResultUpdatedEntity {
	late PkResultUpdatedTeamResult awayTeamResult;
	late int gameType = 0;
	late PkResultUpdatedTeamResult homeTeamResult;
	late List<PkResultUpdatedPlayerResults> playerResults = [];

	PkResultUpdatedEntity();

	factory PkResultUpdatedEntity.fromJson(Map<String, dynamic> json) => $PkResultUpdatedEntityFromJson(json);

	Map<String, dynamic> toJson() => $PkResultUpdatedEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PkResultUpdatedTeamResult {
	late bool ast = false;
	late int cardBoxId = 0;
	late List<dynamic> dropAwardData = [];
	late bool mvp = false;
	late List<dynamic> otherAwardData = [];
	late String parameter = '';
	late bool pts = false;
	late bool reb = false;
	late int score = 0;
	late List<PkResultUpdatedAwayTeamResultScoreBoardDetailList> scoreBoardDetailList = [];
	late int starNum = 0;
	late int teamId = 0;
	late int teamLogo = 0;
	late String teamName = '';
	late List<dynamic> vipAwardData = [];
	late bool win = false;

	PkResultUpdatedTeamResult();

  factory PkResultUpdatedTeamResult.fromJson(Map<String, dynamic> json) =>
      $PkResultUpdatedTeamResultFromJson(json);

  Map<String, dynamic> toJson() => $PkResultUpdatedTeamResultToJson(this);

  @override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PkResultUpdatedAwayTeamResultScoreBoardDetailList {
	late int ast = 0;
	late int astPoint = 0;
	late int blk = 0;
	late int blkPoint = 0;
	late int createTime = 0;
	late int dreb = 0;
	late int fga = 0;
	late int fgm = 0;
	late int fta = 0;
	late int ftm = 0;
	late int gameId = 0;
	late int min = 0;
	late int mvpPoint = 0;
	late int oreb = 0;
	late int pass = 0;
	late int pf = 0;
	late int playerId = 0;
	late int property = 0;
	late int pts = 0;
	late int ptsPoint = 0;
	late int reb = 0;
	late int rebPoint = 0;
	late bool starter = false;
	late int starterPos = 0;
	late int stl = 0;
	late int teamId = 0;
	late int tech = 0;
	late int threePa = 0;
	late int threePm = 0;
	late int to = 0;
	late int updateTime = 0;

	PkResultUpdatedAwayTeamResultScoreBoardDetailList();

	factory PkResultUpdatedAwayTeamResultScoreBoardDetailList.fromJson(Map<String, dynamic> json) => $PkResultUpdatedAwayTeamResultScoreBoardDetailListFromJson(json);

	Map<String, dynamic> toJson() => $PkResultUpdatedAwayTeamResultScoreBoardDetailListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PkResultUpdatedHomeTeamResultScoreBoardDetailList {
	late int ast = 0;
	late int astPoint = 0;
	late int blk = 0;
	late int blkPoint = 0;
	late int createTime = 0;
	late int dreb = 0;
	late int fga = 0;
	late int fgm = 0;
	late int fta = 0;
	late int ftm = 0;
	late int gameId = 0;
	late int min = 0;
	late int mvpPoint = 0;
	late int oreb = 0;
	late int pass = 0;
	late int pf = 0;
	late int playerId = 0;
	late int property = 0;
	late int pts = 0;
	late int ptsPoint = 0;
	late int reb = 0;
	late int rebPoint = 0;
	late bool starter = false;
	late int starterPos = 0;
	late int stl = 0;
	late int teamId = 0;
	late int tech = 0;
	late int threePa = 0;
	late int threePm = 0;
	late int to = 0;
	late int updateTime = 0;

	PkResultUpdatedHomeTeamResultScoreBoardDetailList();

	factory PkResultUpdatedHomeTeamResultScoreBoardDetailList.fromJson(Map<String, dynamic> json) => $PkResultUpdatedHomeTeamResultScoreBoardDetailListFromJson(json);

	Map<String, dynamic> toJson() => $PkResultUpdatedHomeTeamResultScoreBoardDetailListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PkResultUpdatedPlayerResults {
	late int ast = 0;
	late int blk = 0;
	late int playerId = 0;
	late int pts = 0;
	late int reb = 0;
	late int stl = 0;
	late int teamId = 0;
	/// 1 mvp 2 reb 3 pts 4 ast
	late int type = 0;

	PkResultUpdatedPlayerResults();

	factory PkResultUpdatedPlayerResults.fromJson(Map<String, dynamic> json) => $PkResultUpdatedPlayerResultsFromJson(json);

	Map<String, dynamic> toJson() => $PkResultUpdatedPlayerResultsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}