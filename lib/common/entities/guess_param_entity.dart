import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_param_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_param_entity.g.dart';

@JsonSerializable()
class GuessPlayerParamEntity {
  late int awayTeamId;
  late int gameId;
  late int playerId;
  late int gameStartTime;
  late String guessAttr;
  late int guessChoice;
  late double guessReferenceValue;
  int type =1;

  GuessPlayerParamEntity();

  factory GuessPlayerParamEntity.fromJson(Map<String, dynamic> json) =>
      $GuessPlayerParamEntityFromJson(json);

  Map<String, dynamic> toJson() => $GuessPlayerParamEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}


@JsonSerializable()
class GuessGameParamEntity {
  late int awayTeamId;
  late int homeTeamId;
  late int gameId;
  late int gameStartTime;
  late int guessChoice;
  int type =2;
  //后端要求，前端不使用
  String guessAttr="";

  GuessGameParamEntity();

  factory GuessGameParamEntity.fromJson(Map<String, dynamic> json) =>
      $GuessGameParamEntityFromJson(json);

  	Map<String, dynamic> toJson() => $GuessGameParamEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}