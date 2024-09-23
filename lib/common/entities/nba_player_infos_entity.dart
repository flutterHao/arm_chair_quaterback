import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_player_infos_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_player_infos_entity.g.dart';

@JsonSerializable()
class NbaPlayerInfosEntity {
  late List<NbaPlayerInfosPlayerDataAvgList> playerDataAvgList;
  late List<NbaPlayerInfosPlayerDataCapList> playerDataCapList;
  late List<NbaPlayerInfosPlayerBaseInfoList> playerBaseInfoList;

  NbaPlayerInfosEntity();

  factory NbaPlayerInfosEntity.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerInfosEntityFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerInfosEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerInfosPlayerDataAvgList {
  late double blk;
  late double fga;
  late double ast;
  late double dreb;
  late int starterCount;
  late double stl;
  late int updateTime;
  late double fgm;
  late double pts;
  late double threePa;
  late int playCount;
  late double fta;
  late double min;
  late double oreb;
  late int createTime;
  late int seasonId;
  late double pf;
  late double threePm;
  late double to;
  late double ftm;
  late int playerId;

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
  late int fga;
  late int ast;
  late int beforeThreePm;
  late int dreb;
  late int beforeBlk;
  late int defenseCap;
  late int beforeStl;
  late int fgm;
  late int fta;
  late int min;
  late int beforePts;
  late int slamDunk;
  late int attackCap;
  late int ftm;
  late int playerId;
  late int blk;
  late int threePts;
  late int beforeAst;
  late int stl;
  late int updateTime;
  late int beforeDreb;
  late int pts;
  late int threePa;
  late int twoPts;
  late int oreb;
  late int createTime;
  late int pf;
  late int beforeOreb;
  late int threePm;
  late int to;

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
  late int marketPrice;
  late int espnId;
  late bool injuries;
  late int maxPlayerScore;
  late int updateTime;
  late int beforePlayerStrength;
  late int birthTime;
  late int playerStrength;
  late int salary;
  late int minPlayerScore;
  late String ename;
  late int createTime;
  late int playerScore;
  late int pos;
  late String sname;
  late String grade;
  late int teamId;
  late String name;
  late int property;
  late String position;
  late List<int> tag;
  late int beforeMarketPrice;
  late int playerId;

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
