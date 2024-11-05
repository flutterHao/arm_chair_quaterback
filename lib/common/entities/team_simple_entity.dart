import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_simple_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_simple_entity.g.dart';

@JsonSerializable()
class TeamSimpleEntity {
  late int teamLogo;
  late String teamName;
  late int winCount;
  late int teamGrade;
  late String serverId;
  late String lastGuess;
  late int vipGrade;
  late int friendType;
  late int expertTop;
  late int teamId;
  late int currTeamStrength;
  late int logoBoxId;
  late int lastOffLineTime;
  late bool online;
  late int wearNicknameId;
  late int betCoin;
  late double guessSuccessRate;

  TeamSimpleEntity();

  factory TeamSimpleEntity.fromJson(Map<String, dynamic> json) =>
      $TeamSimpleEntityFromJson(json);

  Map<String, dynamic> toJson() => $TeamSimpleEntityToJson(this);

  String get getGuessSuccessRate => (guessSuccessRate * 100).toStringAsFixed(0);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
