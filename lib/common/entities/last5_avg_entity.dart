/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-07 10:55:31
 * @LastEditTime: 2025-01-07 12:08:42
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/last5_avg_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/last5_avg_entity.g.dart';

@JsonSerializable()
class Last5AvgEntity {
  @JSONField(name: "BLK")
  late double bLK = 0;
  @JSONField(name: "FGA")
  late double fGA = 0;
  @JSONField(name: "AST")
  late double aST = 0;
  @JSONField(name: "FG3_PCT")
  late double fg3Pct = 0;
  @JSONField(name: "OREB")
  late double oREB = 0;
  @JSONField(name: "Game_ID")
  late String gameId = '';
  @JSONField(name: "STL")
  late double sTL = 0;
  @JSONField(name: "MATCHUP")
  late String mATCHUP = '';
  @JSONField(name: "FG_PCT")
  late double fgPct = 0;
  @JSONField(name: "DREB")
  late double dREB = 0;
  @JSONField(name: "FGM")
  late double fGM = 0;
  @JSONField(name: "PTS")
  late double pTS = 0;
  @JSONField(name: "REB")
  late double rEB = 0;
  @JSONField(name: "FG3A")
  late double fG3A = 0;
  @JSONField(name: "FT_PCT")
  late double ftPct = 0;
  @JSONField(name: "FTA")
  late double fTA = 0;
  @JSONField(name: "Team_ID")
  late int teamId = 0;
  @JSONField(name: "MIN")
  late double mIN = 0;
  @JSONField(name: "PF")
  late double pF = 0;
  @JSONField(name: "TOV")
  late double tOV = 0;
  @JSONField(name: "GAME_DATE")
  late String gameDate = '';
  @JSONField(name: "FG3M")
  late double fG3M = 0;
  @JSONField(name: "FTM")
  late double fTM = 0;

  Last5AvgEntity();

  factory Last5AvgEntity.fromJson(Map<String, dynamic> json) =>
      $Last5AvgEntityFromJson(json);

  Map<String, dynamic> toJson() => $Last5AvgEntityToJson(this);

  double getValue(String key) {
    if ("FOUL" == key) {
      return pF;
    }
    if ("TO" == key) {
      return tOV;
    }

    return toJson()[key] ?? 0;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
