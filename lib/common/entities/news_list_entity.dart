/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-26 18:53:41
 * @LastEditTime: 2025-03-19 17:17:22
 */
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/news_list_entity.g.dart';
import 'dart:convert';
import 'package:get/get.dart';
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
  late List<NewsListDetail> all = [];

  NewsListEntity();

  factory NewsListEntity.fromJson(Map<String, dynamic> json) {
    NewsListEntity newsEntity = $NewsListEntityFromJson(json);
    newsEntity.all.addAll(newsEntity.match);
    newsEntity.all.addAll(newsEntity.injuries);
    newsEntity.all.addAll(newsEntity.trade);
    newsEntity.all.addAll(newsEntity.draft);
    newsEntity.all.addAll(newsEntity.latest);
    for (var entry in newsEntity.teamRumors.entries) {
      newsEntity.all.add(entry.value);
    }
    for (var entry in newsEntity.playerRumors.entries) {
      newsEntity.all.add(entry.value);
    }
    for (var entry in newsEntity.playerNews.entries) {
      newsEntity.all.addAll(entry.value);
    }
    return newsEntity;
  }

  Map<String, dynamic> toJson() => $NewsListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NewsListDetail {
  @JSONField(name: 'isLike')
  late int isLikeInt = 0;
  @JSONField(deserialize: false, serialize: false)
  RxInt isLike = 0.obs;
  late int isView = 0;
  late String dataLabel = '';
  late int updateTime = 0;
  @JSONField(name: 'reviewsCount')
  late int reviewsCountInt = 0;
  @JSONField(deserialize: false, serialize: false)
  late RxInt reviewsCount = 0.obs;
  late String source = '';
  late String title = '';
  late int unLikes = 0;
  late String content = '';
  late List<ReviewEntity> reviewsList = [];
  late int postTime = 0;
  late int award = 0;
  @JSONField(name: 'createTime')
  late int ct = 0;
  late int id = 0;
  late int views = 0;
  late int likes = 0;
  late List<int> teams = [];
  late List<int> players = [];
  late String imgUrl = "";
  late List<String> imgList = [];
  @JSONField(deserialize: false)
  late int type = 0;
  @JSONField(deserialize: false)
  double? imageHeight;
  @JSONField(deserialize: false)
  double? imamgeWidth;
  Map<String, int> emojis = {};
  List<int> myEmoji = [];
  int eventType = 0;
  @JSONField(deserialize: false, serialize: false)
  bool hasRecieve = false;

  NewsListDetail();

  int get createTime => ct + Utils.getTimeZoneOffset().inMilliseconds;

  factory NewsListDetail.fromJson(Map<String, dynamic> json) {
    NewsListDetail newsDetail = $NewsListDetailFromJson(json);
    newsDetail.imgList = newsDetail.imgList.map((element) {
      if (!element.contains(Address.imgBaseUrl)) {
        return element = element.contains(".gif")
            ? Address.imgBaseUrl + element
            : Address.compressImgBaseUrl + element;
      }
      return element;
    }).toList();

    newsDetail.reviewsCount.value = newsDetail.reviewsCountInt;
    newsDetail.isLike.value = newsDetail.isLikeInt;
    return newsDetail;
  }

  Map<String, dynamic> toJson() => $NewsListDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
