import 'package:arm_chair_quaterback/common/entities/guess_data.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/recive_award_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/recive_award_entity.g.dart';

@JsonSerializable()
class ReciveAwardEntity {
  late int gameId;
  @JSONField(name: "L5Avg")
  late ReciveAwardL5Avg l5Avg;
  late int createTime;
  @JSONField(name: 'gameStartTime')
  late int gst;
  late int teamId;
  late List<GuessData> guessData;
  late int updateTime;
  late int id;
  late int type;
  late int awayTeamId;
  late int scId;
  late int playerId;

  ReciveAwardEntity();

  int get gameStartTime =>
      gst + Utils.getTimeZoneOffset().inMilliseconds;

  factory ReciveAwardEntity.fromJson(Map<String, dynamic> json) =>
      $ReciveAwardEntityFromJson(json);

  Map<String, dynamic> toJson() => $ReciveAwardEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReciveAwardL5Avg {
  late double blk;
  late double fga;
  late double ast;
  late double dreb;
  late int starterCount;
  late double stl;
  late int updateTime;
  late int fgm;
  late double pts;
  late double threePa;
  late int playCount;
  late double fta;
  late double min;
  late int oreb;
  late int createTime;
  late int seasonId;
  late double pf;
  late double threePm;
  late double to;
  late double ftm;
  late int playerId;

  ReciveAwardL5Avg();

  factory ReciveAwardL5Avg.fromJson(Map<String, dynamic> json) =>
      $ReciveAwardL5AvgFromJson(json);

  Map<String, dynamic> toJson() => $ReciveAwardL5AvgToJson(this);

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

  @override
  String toString() {
    return jsonEncode(this);
  }
}
