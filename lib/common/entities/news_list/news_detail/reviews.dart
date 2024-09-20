/*
 * @Description: ?
 * @Author: lihonghao
 * @Date: 2024-09-13 18:19:28
 * @LastEditTime: 2024-09-19 21:17:58
 */
import 'package:get/get.dart';

class Reviews {
  String? context;
  int? createTime;
  int? id;
  RxBool? isLike;
  RxInt? likes;
  int? newsId;
  int? parentReviewId;
  int? targetId = 0;
  int? teamId;
  String? teamName;
  int? updateTime;

  Reviews({
    this.context = "",
    this.createTime = 0,
    this.id = 0,
    this.isLike,
    this.likes,
    this.newsId = 0,
    this.parentReviewId = 0,
    this.targetId = 0,
    this.teamId = 0,
    this.teamName = "",
    this.updateTime = 0,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    RxBool isLike = RxBool(json['isLike'] ?? false);
    RxInt likes = RxInt(json['likes'] ?? 0);

    return Reviews(
      context: json['context'] as String?,
      createTime: json['createTime'] as int?,
      id: json['id'] as int?,
      isLike: isLike,
      likes: likes,
      newsId: json['newsId'] as int?,
      parentReviewId: json['parentReviewId'] as int?,
      targetId: json['targetId'] as int?,
      teamId: json['teamId'] as int?,
      teamName: json['teamName'] as String?,
      updateTime: json['updateTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'context': context,
        'createTime': createTime,
        'id': id,
        'isLike': isLike,
        'likes': likes,
        'newsId': newsId,
        'parentReviewId': parentReviewId,
        'targetId': targetId,
        'teamId': teamId,
        'teamName': teamName,
        'updateTime': updateTime,
      };
}
