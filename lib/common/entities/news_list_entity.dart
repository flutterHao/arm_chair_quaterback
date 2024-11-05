/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-26 18:53:41
 * @LastEditTime: 2024-10-26 22:01:29
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/news_list_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/news_list_entity.g.dart';

@JsonSerializable()
class NewsListEntity {
  @JSONField(name: "Trade")
  late List<NewsListDetail> trade = [];
  @JSONField(name: "Draft")
  late List<NewsListDetail> draft = [];
  late Map<String, NewsListDetail> teamRumors = {};
  late List<NewsListDetail> match = [];
  // late NewsTeamNews teamNews;
  late Map<String, NewsListDetail> playerRumors = {};
  @JSONField(name: "Latest")
  late List<NewsListDetail> latest = [];
  late Map<String, List<NewsListDetail>> playerNews = {};
  @JSONField(name: "Injuries")
  late List<NewsListDetail> injuries = [];

  NewsListEntity();

  factory NewsListEntity.fromJson(Map<String, dynamic> json) =>
      $NewsListEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewsListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewsListDetail {
  late int isLike = 0;
  late int isView = 0;
  late String dataLabel = '';
  late int updateTime = 0;
  late int reviewsCount = 0;
  late String source = '';
  late String title = '';
  late int unLikes = 0;
  late String content = '';
  late List<dynamic> reviewsList = [];
  late int postTime = 0;
  late int award = 0;
  late int createTime = 0;
  late int id = 0;
  late int views = 0;
  late int likes = 0;
  late List<int> teams = [];
  late List<int> players = [];

  NewsListDetail();

  factory NewsListDetail.fromJson(Map<String, dynamic> json) =>
      $NewsListDetailFromJson(json);

  Map<String, dynamic> toJson() => $NewsListDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewsListDraft {
  late int isLike = 0;
  late int isView = 0;
  late String dataLabel = '';
  late int updateTime = 0;
  late int reviewsCount = 0;
  late String source = '';
  late String title = '';
  late int unLikes = 0;
  late String content = '';
  late List<dynamic> reviewsList = [];
  late int postTime = 0;
  late int award = 0;
  late int createTime = 0;
  late int id = 0;
  late int views = 0;
  late int likes = 0;

  NewsListDraft();

  factory NewsListDraft.fromJson(Map<String, dynamic> json) =>
      $NewsListDraftFromJson(json);

  Map<String, dynamic> toJson() => $NewsListDraftToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
