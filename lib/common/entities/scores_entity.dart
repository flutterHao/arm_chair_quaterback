import 'package:arm_chair_quaterback/common/entities/guess_top_reviews_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/scores_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/scores_entity.g.dart';

@JsonSerializable()
class ScoresEntity {
  late int gameId;
  late int gameType;
  late int isGuess;
  GuessTopReviewsEntity? guessTopReviews;
  late int awayTeamWins;
  late int gameTime;
  late int homeTeamWins;
  late int createTime;
  late int gameStartTime;
  late int homeTeamScore;
  late int seasonId;
  late int awayTeamScore;
  late String homeTeamWL;
  late String awayTeamWL;
  late int homeTeamId;
  late int awayTeamId;
  ///
  /// 0 未开始 1 进行中 2 已结束
  late int status;
  ///
  /// 1：未结算 2：已结算未领取奖励 3：已结算已领取奖励
  late int guessStatus;

  ScoresEntity();

  factory ScoresEntity.fromJson(Map<String, dynamic> json) =>
      $ScoresEntityFromJson(json);

  Map<String, dynamic> toJson() => $ScoresEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
