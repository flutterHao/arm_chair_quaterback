import 'dart:math';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_player_infos_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_player_infos_entity.g.dart';

@JsonSerializable()
class NbaPlayerInfosEntity {
  late List<NbaPlayerInfosPlayerDataAvgList> playerDataAvgList = [];
  late List<NbaPlayerInfosPlayerDataCapList> playerDataCapList = [];
  late List<NbaPlayerInfosPlayerBaseInfoList> playerBaseInfoList = [];

  ///使用Map映射，减少遍历查找时间复杂度
  @JSONField(deserialize: false)
  Map<int, NbaPlayerInfosPlayerDataAvgList> dataAvgMap = {};
  @JSONField(deserialize: false)
  Map<int, NbaPlayerInfosPlayerDataCapList> dataCapMap = {};
  @JSONField(deserialize: false)
  Map<int, NbaPlayerInfosPlayerBaseInfoList> baseInfoMap = {};

  NbaPlayerInfosEntity();

  factory NbaPlayerInfosEntity.fromJson(Map<String, dynamic> json) {
    NbaPlayerInfosEntity entity = $NbaPlayerInfosEntityFromJson(json);
    entity.dataAvgMap = {
      for (var item in entity.playerDataAvgList) item.playerId: item
    };
    entity.dataCapMap = {
      for (var item in entity.playerDataCapList) item.playerId: item
    };
    entity.baseInfoMap = {
      for (var item in entity.playerBaseInfoList) item.playerId: item
    };
    return entity;
  }

  Map<String, dynamic> toJson() => $NbaPlayerInfosEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerInfosPlayerDataAvgList {
  double blk = 0;
  double fga = 0;
  double ast = 0;
  double dreb = 0;
  int starterCount = 0;
  double stl = 0;
  int updateTime = 0;
  double fgm = 0;
  double pts = 0;
  double threePa = 0;
  int playCount = 0;
  double fta = 0;
  double min = 0;
  double oreb = 0;
  int createTime = 0;
  int seasonId = 0;
  double pf = 0;
  double threePm = 0;
  double to = 0;
  double ftm = 0;
  int playerId = 0;

  NbaPlayerInfosPlayerDataAvgList();

  factory NbaPlayerInfosPlayerDataAvgList.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerInfosPlayerDataAvgListFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerInfosPlayerDataAvgListToJson(this);

  num getValue(String key) {
    if (key.toLowerCase() == "reb") {
      return _getREB();
    }
    var json = toJson();
    for (var k in json.keys) {
      if (k.toLowerCase() == key.toLowerCase()) {
        return json[k];
      }
    }
    return 0;
  }

  double _getREB() {
    return (oreb + dreb);
  }

  double getThreePT() {
    return double.parse((threePm).toStringAsFixed(0));
  }

  double getMaxValue() {
    var value = max(pts, getThreePT());
    value = max(value, ast);
    value = max(value, (dreb + oreb));
    value = max(value, blk);
    value = max(value, stl);
    return value + 20;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerInfosPlayerDataCapList {
  late int fga = 0;
  late int ast = 0;
  late int beforeThreePm = 0;
  late int dreb = 0;
  late int beforeBlk = 0;
  late int defenseCap = 0;
  late int beforeStl = 0;
  late int fgm = 0;
  late int fta = 0;
  late int min = 0;
  late int beforePts = 0;
  late int slamDunk = 0;
  late int attackCap = 0;
  late int ftm = 0;
  late int playerId = 0;
  late int blk = 0;
  late int threePts = 0;
  late int beforeAst = 0;
  late int stl = 0;
  late int updateTime = 0;
  late int beforeDreb = 0;
  late int pts = 0;
  late int threePa = 0;
  late int twoPts = 0;
  late int oreb = 0;
  late int createTime = 0;
  late int pf = 0;
  late int beforeOreb = 0;
  late int threePm = 0;
  late int to = 0;
  int? reb;
  int? threePt;
  double pass = 0;
  double tech = 0;

  NbaPlayerInfosPlayerDataCapList();

  factory NbaPlayerInfosPlayerDataCapList.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerInfosPlayerDataCapListFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerInfosPlayerDataCapListToJson(this);

  num getValue(String key) {
    if (key.toLowerCase() == "reb") {
      return reb ?? _getREB();
    }
    var json = toJson();
    for (var k in json.keys) {
      if (k.toLowerCase() == key.toLowerCase()) {
        return json[k];
      }
    }
    return 0;
  }

  double _getREB() {
    return (oreb + dreb).toDouble();
  }

  double getThreePT() {
    return double.parse((threePt ?? threePm).toStringAsFixed(0));
  }

  double getMaxValue() {
    var value = max(pts, (threePt ?? threePm).toDouble());
    value = max(value, ast);
    value = max(value, reb ?? (dreb + oreb));
    value = max(value, blk);
    value = max(value, stl);
    return value.toDouble();
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerInfosPlayerBaseInfoList {
  late int marketPrice = 0;
  late int espnId = 0;
  late bool injuries = false;
  late int maxPlayerScore = 0;
  late int updateTime = 0;
  late int beforePlayerStrength = 0;
  late int birthTime = 0;
  late int playerStrength = 0;
  late int salary = 0;
  late int minPlayerScore = 0;
  late String ename = "";
  late int createTime = 0;
  late int playerScore = 0;
  late int pos = 0;
  late String sname = "";
  late String grade = "";
  late int teamId = 0;
  late String name = "";
  late int property = 0;
  late String position = "";
  late List<int> tag = [];
  late int beforeMarketPrice = 0;
  late int playerId = 0;
  late int basicMarketPrice = 0;
  late int beforeMarketPriceUpdateTime = 0;
  late String elname = "";
  late int number;
  double layupWeight = 0;
  double threePointWeight = 0;
  double perimeterShotWeight = 0;

  NbaPlayerInfosPlayerBaseInfoList();

  factory NbaPlayerInfosPlayerBaseInfoList.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerInfosPlayerBaseInfoListFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerInfosPlayerBaseInfoListToJson(this);

  String getGrade() {
    return grade.replaceAll("-", "").replaceAll("+", "");
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
