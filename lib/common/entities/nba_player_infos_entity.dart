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
  Map<int, NbaPlayerInfosPlayerDataAvgList> dataAvgMap = {};
  Map<int, NbaPlayerInfosPlayerDataCapList> dataCapMap = {};
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
  late double blk = 0;
  late double fga = 0;
  late double ast = 0;
  late double dreb = 0;
  late int starterCount = 0;
  late double stl = 0;
  late int updateTime = 0;
  late double fgm = 0;
  late double pts = 0;
  late double threePa = 0;
  late int playCount = 0;
  late double fta = 0;
  late double min = 0;
  late double oreb = 0;
  late int createTime = 0;
  late int seasonId = 0;
  late double pf = 0;
  late double threePm = 0;
  late double to = 0;
  late double ftm = 0;
  late int playerId = 0;

  NbaPlayerInfosPlayerDataAvgList();

  factory NbaPlayerInfosPlayerDataAvgList.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerInfosPlayerDataAvgListFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerInfosPlayerDataAvgListToJson(this);

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

  NbaPlayerInfosPlayerDataCapList();

  factory NbaPlayerInfosPlayerDataCapList.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerInfosPlayerDataCapListFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerInfosPlayerDataCapListToJson(this);

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

  NbaPlayerInfosPlayerBaseInfoList();

  factory NbaPlayerInfosPlayerBaseInfoList.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerInfosPlayerBaseInfoListFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerInfosPlayerBaseInfoListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
