import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_infos_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_infos_entity.g.dart';

@JsonSerializable()
class GuessInfosEntity {
  late int gameId;
  @JSONField(name: "L5Avg")
  late GuessInfosL5Avg l5Avg;
  @JSONField(name: 'gameStartTime')
  late int gst;
  late double teamId;
  late List<GuessInfosGuessData> guessData;
  late GuessInfosGuessReferenceValue guessReferenceValue;
  late double id;
  late int type;
  late int awayTeamId;
  late double scId;
  late int playerId;

  GuessInfosEntity();

  int get gameStartTime =>
      gst + Utils.getTimeZoneOffset().inMilliseconds;

  factory GuessInfosEntity.fromJson(Map<String, dynamic> json) =>
      $GuessInfosEntityFromJson(json);

  Map<String, dynamic> toJson() => $GuessInfosEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GuessInfosL5Avg {
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

  GuessInfosL5Avg();

  factory GuessInfosL5Avg.fromJson(Map<String, dynamic> json) =>
      $GuessInfosL5AvgFromJson(json);

  Map<String, dynamic> toJson() => $GuessInfosL5AvgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GuessInfosGuessData {
  late String guessAttr;
  late double guessChoice;
  late double guessTime;
  late List<dynamic> awards;
  late bool success;
  late double guessReferenceValue;
  late double winPro;
  late double status;

  GuessInfosGuessData();

  factory GuessInfosGuessData.fromJson(Map<String, dynamic> json) =>
      $GuessInfosGuessDataFromJson(json);

  Map<String, dynamic> toJson() => $GuessInfosGuessDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GuessInfosGuessReferenceValue {
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

  GuessInfosGuessReferenceValue();

  factory GuessInfosGuessReferenceValue.fromJson(Map<String, dynamic> json) =>
      $GuessInfosGuessReferenceValueFromJson(json);

  Map<String, dynamic> toJson() => $GuessInfosGuessReferenceValueToJson(this);

  double getValue(String key) {
    if (key.toLowerCase() == "reb") {
      return _getREB();
    }
    var json = toJson();
    for (var k in json.keys) {
      if (k.toLowerCase() == key.toLowerCase()) {
        return json[k];
      }
    }
    return 0;
  }

  double _getREB() {
    return (dreb + oreb);
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
