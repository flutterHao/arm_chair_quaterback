import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_param_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_param_entity.g.dart';

@JsonSerializable()
class GuessPlayerParamEntity {
  late int awayTeamId;
  late int gameId;
  late int playerId;
  @JSONField(name: 'gameStartTime')
  late int gst;
  late String guessAttr;
  late int guessChoice;
  late double guessReferenceValue;
  int type =1;

  GuessPlayerParamEntity();

  int get gameStartTime =>
      gst + Utils.getTimeZoneOffset().inMilliseconds;

  set gameStartTime(int value) {
    gst = value;
  }
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
  @JSONField(name: 'gameStartTime')
  late int gst;
  late int guessChoice;
  int type =2;
  //后端要求，前端不使用
  String guessAttr="";

  GuessGameParamEntity();

  int get gameStartTime =>
      gst + Utils.getTimeZoneOffset().inMilliseconds;

  set gameStartTime(int value) {
    gst = value;
  }

  factory GuessGameParamEntity.fromJson(Map<String, dynamic> json) =>
      $GuessGameParamEntityFromJson(json);

  	Map<String, dynamic> toJson() => $GuessGameParamEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}