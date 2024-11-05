import 'package:arm_chair_quaterback/common/entities/guess_data.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/recive_award_v2_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/recive_award_v2_entity.g.dart';

@JsonSerializable()
class ReciveAwardV2Entity {
  late List<ReciveAwardV2GuessInfo> pointGuessing;
  late List<ReciveAwardV2GuessInfo> newsGuessing;
  late int lastWinningStreak;
  late int guessWinningStreak;
  late int streakReward;

  ReciveAwardV2Entity();

  factory ReciveAwardV2Entity.fromJson(Map<String, dynamic> json) =>
      $ReciveAwardV2EntityFromJson(json);

  Map<String, dynamic> toJson() => $ReciveAwardV2EntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReciveAwardV2GuessInfo {
  late int newsId;
  late int createTime;
  late bool success;
  late int teamId;
  late List<ReciveAwardV2GuessInfoGuessData> guessData;
  late int updateTime;
  late int id;
  late int type;
  late int status;

  ReciveAwardV2GuessInfo();

  factory ReciveAwardV2GuessInfo.fromJson(Map<String, dynamic> json) =>
      $ReciveAwardV2GuessInfoFromJson(json);

  Map<String, dynamic> toJson() => $ReciveAwardV2GuessInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReciveAwardV2GuessInfoGuessData {
  late int gameId;
  late String guessAttr;
  late int guessChoice;
  late int gameStartTime;
  late List<Awards> awards;
  late bool success;
  late int guessGameAttrValue;
  late double guessReferenceValue;
  late int winPro;
  late int awayTeamId;
  late int playerId;
  late int status;

  ReciveAwardV2GuessInfoGuessData();

  factory ReciveAwardV2GuessInfoGuessData.fromJson(Map<String, dynamic> json) =>
      $ReciveAwardV2GuessInfoGuessDataFromJson(json);

  Map<String, dynamic> toJson() => $ReciveAwardV2GuessInfoGuessDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
