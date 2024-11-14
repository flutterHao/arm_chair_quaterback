import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_top_reviews_entity.dart';


ScoresEntity $ScoresEntityFromJson(Map<String, dynamic> json) {
  final ScoresEntity scoresEntity = ScoresEntity();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    scoresEntity.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    scoresEntity.gameType = gameType;
  }
  final int? isGuess = jsonConvert.convert<int>(json['isGuess']);
  if (isGuess != null) {
    scoresEntity.isGuess = isGuess;
  }
  final GuessTopReviewsEntity? guessTopReviews = jsonConvert.convert<
      GuessTopReviewsEntity>(json['guessTopReviews']);
  if (guessTopReviews != null) {
    scoresEntity.guessTopReviews = guessTopReviews;
  }
  final int? awayTeamWins = jsonConvert.convert<int>(json['awayTeamWins']);
  if (awayTeamWins != null) {
    scoresEntity.awayTeamWins = awayTeamWins;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    scoresEntity.gameTime = gameTime;
  }
  final int? homeTeamWins = jsonConvert.convert<int>(json['homeTeamWins']);
  if (homeTeamWins != null) {
    scoresEntity.homeTeamWins = homeTeamWins;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    scoresEntity.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    scoresEntity.gameStartTime = gameStartTime;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    scoresEntity.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    scoresEntity.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    scoresEntity.awayTeamScore = awayTeamScore;
  }
  final String? homeTeamWL = jsonConvert.convert<String>(json['homeTeamWL']);
  if (homeTeamWL != null) {
    scoresEntity.homeTeamWL = homeTeamWL;
  }
  final String? awayTeamWL = jsonConvert.convert<String>(json['awayTeamWL']);
  if (awayTeamWL != null) {
    scoresEntity.awayTeamWL = awayTeamWL;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    scoresEntity.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    scoresEntity.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    scoresEntity.status = status;
  }
  return scoresEntity;
}

Map<String, dynamic> $ScoresEntityToJson(ScoresEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['isGuess'] = entity.isGuess;
  data['guessTopReviews'] = entity.guessTopReviews?.toJson();
  data['awayTeamWins'] = entity.awayTeamWins;
  data['gameTime'] = entity.gameTime;
  data['homeTeamWins'] = entity.homeTeamWins;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamWL'] = entity.homeTeamWL;
  data['awayTeamWL'] = entity.awayTeamWL;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension ScoresEntityExtension on ScoresEntity {
  ScoresEntity copyWith({
    int? gameId,
    int? gameType,
    int? isGuess,
    GuessTopReviewsEntity? guessTopReviews,
    int? awayTeamWins,
    int? gameTime,
    int? homeTeamWins,
    int? createTime,
    int? gameStartTime,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    String? homeTeamWL,
    String? awayTeamWL,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return ScoresEntity()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..isGuess = isGuess ?? this.isGuess
      ..guessTopReviews = guessTopReviews ?? this.guessTopReviews
      ..awayTeamWins = awayTeamWins ?? this.awayTeamWins
      ..gameTime = gameTime ?? this.gameTime
      ..homeTeamWins = homeTeamWins ?? this.homeTeamWins
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamWL = homeTeamWL ?? this.homeTeamWL
      ..awayTeamWL = awayTeamWL ?? this.awayTeamWL
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}