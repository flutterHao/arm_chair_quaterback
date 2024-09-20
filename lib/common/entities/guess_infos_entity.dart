import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_infos_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_infos_entity.g.dart';

@JsonSerializable()
class GuessInfosEntity {
	late List<GuessInfosGuessInfos> guessInfos;

	GuessInfosEntity();

	factory GuessInfosEntity.fromJson(Map<String, dynamic> json) => $GuessInfosEntityFromJson(json);

	Map<String, dynamic> toJson() => $GuessInfosEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GuessInfosGuessInfos {
	@JSONField(name: "L5Avg")
	late GuessInfosGuessInfosL5Avg l5Avg;
	late int awayTeamId;
	late int createTime;
	late int gameId;
	late int gameStartTime;
	late List<GuessInfosGuessInfosGuessData> guessData;
	late GuessInfosGuessInfosGuessReferenceValue guessReferenceValue;
	late int id;
	late int playerId;
	late int scId;
	late int teamId;
	late int type;
	late int updateTime;

	GuessInfosGuessInfos();

	factory GuessInfosGuessInfos.fromJson(Map<String, dynamic> json) => $GuessInfosGuessInfosFromJson(json);

	Map<String, dynamic> toJson() => $GuessInfosGuessInfosToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GuessInfosGuessInfosL5Avg {
	late double ast;
	late double blk;
	late int createTime;
	late double dreb;
	late double fga;
	late int fgm;
	late double fta;
	late double ftm;
	late double min;
	late int oreb;
	late double pf;
	late int playCount;
	late int playerId;
	late double pts;
	late int seasonId;
	late int starterCount;
	late double stl;
	late double threePa;
	late double threePm;
	late double to;
	late int updateTime;

	GuessInfosGuessInfosL5Avg();

	factory GuessInfosGuessInfosL5Avg.fromJson(Map<String, dynamic> json) => $GuessInfosGuessInfosL5AvgFromJson(json);

	Map<String, dynamic> toJson() => $GuessInfosGuessInfosL5AvgToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GuessInfosGuessInfosGuessData {
	late List<dynamic> awards;
	late String guessAttr;
	late int guessChoice;
	late int guessReferenceValue;
	late int guessTime;
	late int status;
	late bool success;
	late int winPro;

	GuessInfosGuessInfosGuessData();

	factory GuessInfosGuessInfosGuessData.fromJson(Map<String, dynamic> json) => $GuessInfosGuessInfosGuessDataFromJson(json);

	Map<String, dynamic> toJson() => $GuessInfosGuessInfosGuessDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class GuessInfosGuessInfosGuessReferenceValue {
	late double ast;
	late double blk;
	late int createTime;
	late double dreb;
	late double fga;
	late double fgm;
	late double fta;
	late double ftm;
	late double min;
	late double oreb;
	late double pf;
	late int playCount;
	late int playerId;
	late double pts;
	late int seasonId;
	late int starterCount;
	late double stl;
	late double threePa;
	late double threePm;
	late double to;
	late int updateTime;

	GuessInfosGuessInfosGuessReferenceValue();

	factory GuessInfosGuessInfosGuessReferenceValue.fromJson(Map<String, dynamic> json) => $GuessInfosGuessInfosGuessReferenceValueFromJson(json);

	Map<String, dynamic> toJson() => $GuessInfosGuessInfosGuessReferenceValueToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}