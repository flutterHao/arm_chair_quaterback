/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-07 10:55:31
 * @LastEditTime: 2025-01-16 19:53:08
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
  int gameDateMs = 0;

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

  double getRankValue(String type) {
    double value = 0;
    switch (type) {
      case "PPG": //场均PTS
        value = pTS;
      case "PTS":
        value = pTS;
      case "FGM":
        value = fGM;
      case "FGA":
        value = fGA;
      // case "3PM":
      //   value = threePM;
      case "3PA":
        value = fGA;
      case "FTM":
        value = fTM;
      case "FTA":
        value = fTA;
      case "FG%":
        value = fgPct * 100;
      case "3P%":
        value = fg3Pct * 100;
      case "FT%":
        value = ftPct * 100;
      case "APG": //场均AST
        value = aST;
      case "AST":
        value = aST;
      case "TPG": //场均TO
        value = tOV;
      case "TO":
        value = tOV;
      case "RPG":
        value = rEB;
      case "REB": //场均RPG
        value = rEB;
      case "BPG": //场均blk
        value = bLK;
      case "BLK":
        value = bLK;
      case "MIN":
        value = mIN;
      case "FOUL":
        value = pF;
      case "STL":
        value = sTL;
      default:
        value = 0.0;
    }
    return (value * 10).roundToDouble() / 10;
  }

  int parseCustomDate() {
    // 手动定义月份对应的数字
    Map<String, int> monthMap = {
      'JAN': 1,
      'FEB': 2,
      'MAR': 3,
      'APR': 4,
      'MAY': 5,
      'JUN': 6,
      'JUL': 7,
      'AUG': 8,
      'SEP': 9,
      'OCT': 10,
      'NOV': 11,
      'DEC': 12
    };

    // 分割字符串，获取月份、日期和年份
    List<String> parts = gameDate.split(' ');
    String monthStr = parts[0].toUpperCase(); // 月份（如 JAN）
    int day = int.parse(parts[1].split(',')[0]); // 日期（如 06）
    int year = int.parse(parts[2]); // 年份（如 2025）

    // 获取月份对应的数字
    int month = monthMap[monthStr] ?? 1; // 默认返回1，如果月份不匹配

    // 返回转换后的 DateTime 对象
    return DateTime(year, month, day).microsecondsSinceEpoch;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
