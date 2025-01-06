import 'package:arm_chair_quaterback/common/entities/guess_top_reviews_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/scores_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/scores_entity.g.dart';

@JsonSerializable()
class ScoresEntity {
  late int gameId = 0;
  late int gameType = 0;

  /// 竞猜赛程获胜一方的id，未选择则为=00
  late int isGuess = 0;
  GuessTopReviewsEntity? guessTopReviews;
  late int awayTeamWins = 0;
  late int gameTime = 0;
  late int homeTeamWins = 0;
  late int createTime = 0;
  late int gameStartTime = 0;
  late int homeTeamScore = 0;
  late int seasonId = 0;
  late int awayTeamScore = 0;
  late String homeTeamWL = "";
  late String awayTeamWL = "";
  late int homeTeamId = 0;
  late int awayTeamId = 0;

  ///
  /// 0 未开始 1 进行中 2 已结束
  late int status = 1;

  ///
  /// 1：未结算 2：已结算未领取奖励 3：已结算已领取奖励
  late int guessStatus = 1;

  ScoresEntity();

  factory ScoresEntity.fromJson(Map<String, dynamic> json) =>
      $ScoresEntityFromJson(json);

  Map<String, dynamic> toJson() => $ScoresEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
