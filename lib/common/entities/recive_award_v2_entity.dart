import 'package:arm_chair_quaterback/common/entities/guess_data.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/recive_award_v2_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/recive_award_v2_entity.g.dart';

@JsonSerializable()
class ReciveAwardV2Entity {
  late List<ReciveAwardV2GuessInfo> pointGuessing;
  late List<ReciveAwardV2GuessInfo> newsGuessing;
  late int lastWinningStreak;
  late int guessWinningStreak;
  late int streakReward;

  ReciveAwardV2Entity();

  factory ReciveAwardV2Entity.fromJson(Map<String, dynamic> json) =>
      $ReciveAwardV2EntityFromJson(json);

  Map<String, dynamic> toJson() => $ReciveAwardV2EntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReciveAwardV2GuessInfo {
  late int newsId;
  @JSONField(name: 'createTime')
  late int ct = 0;
  late bool success;
  late int teamId;
  late List<ReciveAwardV2GuessInfoGuessData> guessData;
  late int updateTime;
  late int id;
  /// 1 flex模式 2 power模式
  late int type;
  /// 1 未结算 2 已结算未领取奖励 3 已结算已领取奖励
  late int status;

  ReciveAwardV2GuessInfo();

  int get createTime =>
      ct + Utils.getTimeZoneOffset().inMilliseconds;

  factory ReciveAwardV2GuessInfo.fromJson(Map<String, dynamic> json) =>
      $ReciveAwardV2GuessInfoFromJson(json);

  Map<String, dynamic> toJson() => $ReciveAwardV2GuessInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ReciveAwardV2GuessInfoGuessData {
  late int gameId;
  late String guessAttr;
  /// type 1: 1 more 2 less
  /// type 2: 队伍id
  late int guessChoice;
  @JSONField(name: 'gameStartTime')
  late int gst;
  late List<Awards> awards;
  late bool success;
  late int guessGameAttrValue;
  late double guessReferenceValue;
  late int winPro;
  late int awayTeamId;
  late int playerId;
  /// 1 未结算 2 已结算未领取奖励 3 已结算已领取奖励
  late int status;
  ///type=1：球员，type=2：比赛
  late int type;
  late int homeTeamScore;
  late int awayTeamScore;
  late int homeTeamId;
  /// 评论数
  late int reviewsCount;


  ReciveAwardV2GuessInfoGuessData();

  int get gameStartTime =>
      gst + Utils.getTimeZoneOffset().inMilliseconds;

  factory ReciveAwardV2GuessInfoGuessData.fromJson(Map<String, dynamic> json) =>
      $ReciveAwardV2GuessInfoGuessDataFromJson(json);

  Map<String, dynamic> toJson() => $ReciveAwardV2GuessInfoGuessDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
