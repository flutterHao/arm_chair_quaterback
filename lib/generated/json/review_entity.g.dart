import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:get/get.dart';


ReviewEntity $ReviewEntityFromJson(Map<String, dynamic> json) {
  final ReviewEntity reviewEntity = ReviewEntity();
  final int? parentReviewId = jsonConvert.convert<int>(json['parentReviewId']);
  if (parentReviewId != null) {
    reviewEntity.parentReviewId = parentReviewId;
  }
  final String? teamLogo = jsonConvert.convert<String>(json['teamLogo']);
  if (teamLogo != null) {
    reviewEntity.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    reviewEntity.teamName = teamName;
  }
  final int? targetId = jsonConvert.convert<int>(json['targetId']);
  if (targetId != null) {
    reviewEntity.targetId = targetId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    reviewEntity.updateTime = updateTime;
  }
  final int? newsId = jsonConvert.convert<int>(json['newsId']);
  if (newsId != null) {
    reviewEntity.newsId = newsId;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    reviewEntity.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    reviewEntity.teamId = teamId;
  }
  final String? context = jsonConvert.convert<String>(json['context']);
  if (context != null) {
    reviewEntity.context = context;
  }
  final int? sonReviews = jsonConvert.convert<int>(json['sonReviews']);
  if (sonReviews != null) {
    reviewEntity.sonReviews = sonReviews;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    reviewEntity.id = id;
  }
  final List<ReviewEntity>? subList = (json['subList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<ReviewEntity>(e) as ReviewEntity).toList();
  if (subList != null) {
    reviewEntity.subList = subList;
  }
  return reviewEntity;
}

Map<String, dynamic> $ReviewEntityToJson(ReviewEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['parentReviewId'] = entity.parentReviewId;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['targetId'] = entity.targetId;
  data['updateTime'] = entity.updateTime;
  data['newsId'] = entity.newsId;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['context'] = entity.context;
  data['sonReviews'] = entity.sonReviews;
  data['id'] = entity.id;
  data['subList'] = entity.subList.map((v) => v.toJson()).toList();
  return data;
}

extension ReviewEntityExtension on ReviewEntity {
  ReviewEntity copyWith({
    int? parentReviewId,
    String? teamLogo,
    String? teamName,
    int? targetId,
    int? updateTime,
    int? newsId,
    int? createTime,
    int? teamId,
    String? context,
    int? sonReviews,
    int? id,
    RxInt? likes,
    RxBool? isLike,
    List<ReviewEntity>? subList,
    int? page,
    int? size,
    int? current,
  }) {
    return ReviewEntity()
      ..parentReviewId = parentReviewId ?? this.parentReviewId
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..targetId = targetId ?? this.targetId
      ..updateTime = updateTime ?? this.updateTime
      ..newsId = newsId ?? this.newsId
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..context = context ?? this.context
      ..sonReviews = sonReviews ?? this.sonReviews
      ..id = id ?? this.id
      ..likes = likes ?? this.likes
      ..isLike = isLike ?? this.isLike
      ..subList = subList ?? this.subList
      ..page = page ?? this.page
      ..size = size ?? this.size
      ..current = current ?? this.current;
  }
}