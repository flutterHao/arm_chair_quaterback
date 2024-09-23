/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-13 18:19:28
 * @LastEditTime: 2024-09-23 09:42:28
 */
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_guess.dart';
import 'package:get/get.dart';

import 'reviews.dart';

class NewsDetail {
  int? award;
  String? content;
  int? createTime;
  String? dataLabel;
  int? id;
  RxBool? isLike;
  // int? isLike;
  int? isView;
  int? likes;
  int? postTime;
  int? reviewsCount;
  List<Reviews>? reviewsList;
  String? source;
  String? title;
  int? unLikes;
  int? updateTime;
  int? views;
  NewsGuess? guess;

  NewsDetail({
    this.award = 0,
    this.content = "",
    this.createTime = 0,
    this.dataLabel = "",
    this.id = 0,
    this.isLike,
    this.isView = 0,
    this.likes = 0,
    this.postTime = 0,
    this.reviewsCount = 0,
    this.reviewsList,
    this.source = "",
    this.title = "",
    this.unLikes = 0,
    this.updateTime = 0,
    this.views = 0,
    this.guess,
  });

  factory NewsDetail.fromJson(Map<String, dynamic> json) {
    RxBool isLike = RxBool(json['isLike'] == 1 ? true : false);
    return NewsDetail(
      award: json['award'] as int?,
      content: json['content'] as String?,
      createTime: json['createTime'] as int?,
      dataLabel: json['dataLabel'] as String?,
      id: json['id'] as int?,
      isLike: isLike,
      isView: json['isView'] as int?,
      likes: json['likes'] as int?,
      postTime: json['postTime'] as int?,
      reviewsCount: json['reviewsCount'] as int?,
      reviewsList: ((json['reviewsList'] ?? []) as List<dynamic>)
          .map((e) => Reviews.fromJson(e as Map<String, dynamic>))
          .toList(),
      source: json['source'] as String?,
      title: json['title'] as String?,
      unLikes: json['unLikes'] as int?,
      updateTime: json['updateTime'] as int?,
      views: json['views'] as int?,
      guess: json['guess'] == null
          ? null
          : NewsGuess.fromJson(json['NBANewsGuess'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'award': award,
        'content': content,
        'createTime': createTime,
        'dataLabel': dataLabel,
        'id': id,
        'isLike': isLike,
        'isView': isView,
        'likes': likes,
        'postTime': postTime,
        'reviewsCount': reviewsCount,
        'reviewsList': reviewsList?.map((e) => e.toJson()).toList(),
        'source': source,
        'title': title,
        'unLikes': unLikes,
        'updateTime': updateTime,
        'views': views,
      };
}
