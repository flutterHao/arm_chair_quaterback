import 'package:arm_chair_quaterback/common/entities/guess_top_reviews_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/scores_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/scores_entity.g.dart';

@JsonSerializable()
class ScoresEntity {
  int gameId = 0;
  int gameType = 0;

  /// 竞猜赛程获胜一方的id，未选择则为=00
  int isGuess = 0;
  GuessTopReviewsEntity? guessTopReviews;
  int awayTeamWins = 0;
  int gameTime = 0;
  int homeTeamWins = 0;
  int createTime = 0;
  @JSONField(name: "gameStartTime")
  late int gst = 0;
  int homeTeamScore = 0;
  int seasonId = 0;
  int awayTeamScore = 0;
  String homeTeamWL = "";
  String awayTeamWL = "";
  int homeTeamId = 0;
  int awayTeamId = 0;

  ///
  /// 0 未开始 1 进行中 2 已结束
  late int status = 1;

  ///
  /// 1：未结算 2：已结算未领取奖励 3：已结算已领取奖励
  late int guessStatus = 1;

  ScoresEntity();

  int get gameStartTime =>
      gst + Utils.getTimeZoneOffset().inMilliseconds;

  factory ScoresEntity.fromJson(Map<String, dynamic> json) =>
      $ScoresEntityFromJson(json);

  Map<String, dynamic> toJson() => $ScoresEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
