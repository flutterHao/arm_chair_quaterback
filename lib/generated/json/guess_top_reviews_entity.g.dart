import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_top_reviews_entity.dart';

GuessTopReviewsEntity $GuessTopReviewsEntityFromJson(
    Map<String, dynamic> json) {
  final GuessTopReviewsEntity guessTopReviewsEntity = GuessTopReviewsEntity();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    guessTopReviewsEntity.gameId = gameId;
  }
  final int? parentReviewId = jsonConvert.convert<int>(json['parentReviewId']);
  if (parentReviewId != null) {
    guessTopReviewsEntity.parentReviewId = parentReviewId;
  }
  final String? teamLogo = jsonConvert.convert<String>(json['teamLogo']);
  if (teamLogo != null) {
    guessTopReviewsEntity.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    guessTopReviewsEntity.teamName = teamName;
  }
  final bool? isLike = jsonConvert.convert<bool>(json['isLike']);
  if (isLike != null) {
    guessTopReviewsEntity.isLike = isLike;
  }
  final int? targetId = jsonConvert.convert<int>(json['targetId']);
  if (targetId != null) {
    guessTopReviewsEntity.targetId = targetId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    guessTopReviewsEntity.updateTime = updateTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    guessTopReviewsEntity.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    guessTopReviewsEntity.teamId = teamId;
  }
  final String? context = jsonConvert.convert<String>(json['context']);
  if (context != null) {
    guessTopReviewsEntity.context = context;
  }
  final int? sonReviews = jsonConvert.convert<int>(json['sonReviews']);
  if (sonReviews != null) {
    guessTopReviewsEntity.sonReviews = sonReviews;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    guessTopReviewsEntity.id = id;
  }
  final int? likes = jsonConvert.convert<int>(json['likes']);
  if (likes != null) {
    guessTopReviewsEntity.likes = likes;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    guessTopReviewsEntity.playerId = playerId;
  }
  return guessTopReviewsEntity;
}

Map<String, dynamic> $GuessTopReviewsEntityToJson(
    GuessTopReviewsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['parentReviewId'] = entity.parentReviewId;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['isLike'] = entity.isLike;
  data['targetId'] = entity.targetId;
  data['updateTime'] = entity.updateTime;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['context'] = entity.context;
  data['sonReviews'] = entity.sonReviews;
  data['id'] = entity.id;
  data['likes'] = entity.likes;
  data['playerId'] = entity.playerId;
  return data;
}

extension GuessTopReviewsEntityExtension on GuessTopReviewsEntity {
  GuessTopReviewsEntity copyWith({
    int? gameId,
    int? parentReviewId,
    String? teamLogo,
    String? teamName,
    bool? isLike,
    int? targetId,
    int? updateTime,
    int? createTime,
    int? teamId,
    String? context,
    int? sonReviews,
    int? id,
    int? likes,
    int? playerId,
  }) {
    return GuessTopReviewsEntity()
      ..gameId = gameId ?? this.gameId
      ..parentReviewId = parentReviewId ?? this.parentReviewId
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..isLike = isLike ?? this.isLike
      ..targetId = targetId ?? this.targetId
      ..updateTime = updateTime ?? this.updateTime
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..context = context ?? this.context
      ..sonReviews = sonReviews ?? this.sonReviews
      ..id = id ?? this.id
      ..likes = likes ?? this.likes
      ..playerId = playerId ?? this.playerId;
  }
}