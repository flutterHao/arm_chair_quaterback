/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-27 18:50:14
 * @LastEditTime: 2024-12-31 11:15:16
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/player_stats_entity.g.dart';

@JsonSerializable()
class StatsEntity {
  @JSONField(name: "BLK")
  late double bLK = 0;
  @JSONField(name: "TOTAL_FG3_PCT")
  late double totalFg3Pct = 0;
  @JSONField(name: "FG3_PCT")
  late double fg3Pct = 0;
  @JSONField(name: "TOTAL_AST")
  late double totalAst = 0;
  @JSONField(name: "TOTAL_FGA")
  late double totalFga = 0;
  @JSONField(name: "FG_PCT")
  late double fgPct;
  @JSONField(name: "TOTAL_3PA")
  late double total3pa = 0;
  @JSONField(name: "PTS")
  late double pTS = 0;
  @JSONField(name: "TOTAL_FGM")
  late double totalFgm = 0;
  @JSONField(name: "TOTAL_FT_PCT")
  late double totalFtPct = 0;
  @JSONField(name: "TOTAL_FG_PCT")
  late double totalFgPct = 0;
  @JSONField(name: "TOTAL_3PM")
  late double total3pm = 0;
  @JSONField(name: "TOTAL_REB")
  late double totalReb = 0;
  @JSONField(name: "TOTAL_FTA")
  late double totalFta = 0;
  @JSONField(name: "PLAYER_NAME")
  late String playerName = '';
  @JSONField(name: "FGA")
  late double fGA = 0;
  @JSONField(name: "AST")
  late double aST = 0;
  @JSONField(name: "TOTAL_TOV")
  late double totalTov = 0;
  late double threePA = 0;
  @JSONField(name: "TOTAL_BLK")
  late double totalBlk = 0;
  @JSONField(name: "TOTAL_FTM")
  late double totalFtm = 0;
  @JSONField(name: "FGM")
  late double fGM = 0;
  @JSONField(name: "REB")
  late double rEB;
  @JSONField(name: "FT_PCT")
  late double ftPct = 0;
  @JSONField(name: "3PM")
  late double threePM = 0;
  @JSONField(name: "FTA")
  late double fTA = 0;
  @JSONField(name: "TOTAL_PTS")
  late double totalPts = 0;
  @JSONField(name: "PLAYER_ID")
  late int playerId = 0;
  @JSONField(name: "TOV")
  late double tOV = 0;
  @JSONField(name: "FTM")
  late double fTM = 0;
  @JSONField(name: "TEAM_NAME")
  late String teamName = "";
  @JSONField(name: "TEAM_ID")
  late int teamId = 0;
  @JSONField(name: "GP")
  late double gp = 0;
  @JSONField(name: "MIN")
  late double min = 0;

  StatsEntity();
  factory StatsEntity.fromJson(Map<String, dynamic> json) =>
      $StatsEntityFromJson(json);

  Map<String, dynamic> toJson() => $StatsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
