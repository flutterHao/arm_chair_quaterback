import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/game_schedules_info.g.dart';

///
///@auther gejiahui
///created at 2024/11/30/18:10

@JsonSerializable()
class GameSchedulesInfo {
  late int gameId;
  late int gameType;
  late List<dynamic> homePlayerScoreList;
  late List<dynamic> awayPlayerScoreList;
  late int gameTime;
  late int createTime;
  late int gameStartTime;
  late int homeTeamScore;
  late int seasonId;
  late int awayTeamScore;
  late int homeTeamId;
  late int awayTeamId;
  late int status;

  GameSchedulesInfo();

  factory GameSchedulesInfo.fromJson(Map<String, dynamic> json) =>
      $GameSchedulesInfoFromJson(json);

  Map<String, dynamic> toJson() => $GameSchedulesInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
