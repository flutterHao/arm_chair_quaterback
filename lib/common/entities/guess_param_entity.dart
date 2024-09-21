import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_param_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_param_entity.g.dart';

@JsonSerializable()
class GuessParamEntity {
  late int awayTeamId;
  late int gameId;
  late int playerId;
  late int gameStartTime;
  late int type;
  late List<GuessParamGuessData> guessData;

  GuessParamEntity();

  factory GuessParamEntity.fromJson(Map<String, dynamic> json) =>
      $GuessParamEntityFromJson(json);

  Map<String, dynamic> toJson() => $GuessParamEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GuessParamGuessData {
  late String guessAttr;
  late int guessChoice;
  late double guessReferenceValue;

  GuessParamGuessData();

  factory GuessParamGuessData.fromJson(Map<String, dynamic> json) =>
      $GuessParamGuessDataFromJson(json);

  Map<String, dynamic> toJson() => $GuessParamGuessDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
