import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_simple_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_simple_entity.g.dart';

@JsonSerializable()
class TeamSimpleEntity {
  late String teamName = '';
  late int totalGames = 0;
  late String signature = '';
  late int teamGrade = 0;
  late String serverId = '';
  late String lastGuess = '';
  late int vipGrade = 0;
  late int maxGameWinningStreak = 0;
  late int cupRankId = 0;
  late int expertTop = 0;
  late int guessSuccessRate = 0;
  late int teamLogo = 0;
  late int winCount = 0;
  late int currentWinGames = 0;
  late int currentContinuousLoss = 0;
  late int currentGameWinningStreak = 0;
  late int friendType = 0;
  late int maxCup = 0;
  late int teamId = 0;
  late int currTeamStrength = 0;
  late int logoBoxId = 0;
  late int lastOffLineTime = 0;
  late bool online = false;
  late int wearNicknameId = 0;
  late double gameWinRate;
  late int betCoin = 0;
  late int cup = 0;

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
