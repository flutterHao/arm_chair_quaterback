import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/review_entity.dart';

import 'package:arm_chair_quaterback/common/net/address.dart';

import 'package:arm_chair_quaterback/common/utils/utils.dart';

import 'package:get/get.dart';


NewsListEntity $NewsListEntityFromJson(Map<String, dynamic> json) {
  final NewsListEntity newsListEntity = NewsListEntity();
  final List<NewsListDetail>? trade = (json['Trade'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (trade != null) {
    newsListEntity.trade = trade;
  }
  final List<NewsListDetail>? draft = (json['Draft'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (draft != null) {
    newsListEntity.draft = draft;
  }
  final Map<String, NewsListDetail>? teamRumors =
  (json['teamRumors'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
          k, jsonConvert.convert<NewsListDetail>(e) as NewsListDetail));
  if (teamRumors != null) {
    newsListEntity.teamRumors = teamRumors;
  }
  final List<NewsListDetail>? match = (json['match'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (match != null) {
    newsListEntity.match = match;
  }
  final Map<String, NewsListDetail>? playerRumors =
  (json['playerRumors'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
          k, jsonConvert.convert<NewsListDetail>(e) as NewsListDetail));
  if (playerRumors != null) {
    newsListEntity.playerRumors = playerRumors;
  }
  final List<NewsListDetail>? latest = (json['Latest'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (latest != null) {
    newsListEntity.latest = latest;
  }
  final Map<String, List<NewsListDetail>>? playerNews =
  (json['playerNews'] as Map<String, dynamic>).map(
          (k, e) =>
          MapEntry(k, (e as List<dynamic>)
              .map(
                  (e) =>
              jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
              .toList()));
  if (playerNews != null) {
    newsListEntity.playerNews = playerNews;
  }
  final List<NewsListDetail>? injuries = (json['Injuries'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (injuries != null) {
    newsListEntity.injuries = injuries;
  }
  final List<NewsListDetail>? all = (json['all'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (all != null) {
    newsListEntity.all = all;
  }
  return newsListEntity;
}

Map<String, dynamic> $NewsListEntityToJson(NewsListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Trade'] = entity.trade.map((v) => v.toJson()).toList();
  data['Draft'] = entity.draft.map((v) => v.toJson()).toList();
  data['teamRumors'] = entity.teamRumors;
  data['match'] = entity.match.map((v) => v.toJson()).toList();
  data['playerRumors'] = entity.playerRumors;
  data['Latest'] = entity.latest.map((v) => v.toJson()).toList();
  data['playerNews'] = entity.playerNews;
  data['Injuries'] = entity.injuries.map((v) => v.toJson()).toList();
  data['all'] = entity.all.map((v) => v.toJson()).toList();
  return data;
}

extension NewsListEntityExtension on NewsListEntity {
  NewsListEntity copyWith({
    List<NewsListDetail>? trade,
    List<NewsListDetail>? draft,
    Map<String, NewsListDetail>? teamRumors,
    List<NewsListDetail>? match,
    Map<String, NewsListDetail>? playerRumors,
    List<NewsListDetail>? latest,
    Map<String, List<NewsListDetail>>? playerNews,
    List<NewsListDetail>? injuries,
    List<NewsListDetail>? all,
  }) {
    return NewsListEntity()
      ..trade = trade ?? this.trade
      ..draft = draft ?? this.draft
      ..teamRumors = teamRumors ?? this.teamRumors
      ..match = match ?? this.match
      ..playerRumors = playerRumors ?? this.playerRumors
      ..latest = latest ?? this.latest
      ..playerNews = playerNews ?? this.playerNews
      ..injuries = injuries ?? this.injuries
      ..all = all ?? this.all;
  }
}

NewsListDetail $NewsListDetailFromJson(Map<String, dynamic> json) {
  final NewsListDetail newsListDetail = NewsListDetail();
  final int? isLikeInt = jsonConvert.convert<int>(json['isLike']);
  if (isLikeInt != null) {
    newsListDetail.isLikeInt = isLikeInt;
  }
  final int? isView = jsonConvert.convert<int>(json['isView']);
  if (isView != null) {
    newsListDetail.isView = isView;
  }
  final String? dataLabel = jsonConvert.convert<String>(json['dataLabel']);
  if (dataLabel != null) {
    newsListDetail.dataLabel = dataLabel;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    newsListDetail.updateTime = updateTime;
  }
  final int? reviewsCountInt = jsonConvert.convert<int>(json['reviewsCount']);
  if (reviewsCountInt != null) {
    newsListDetail.reviewsCountInt = reviewsCountInt;
  }
  final String? source = jsonConvert.convert<String>(json['source']);
  if (source != null) {
    newsListDetail.source = source;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    newsListDetail.title = title;
  }
  final int? unLikes = jsonConvert.convert<int>(json['unLikes']);
  if (unLikes != null) {
    newsListDetail.unLikes = unLikes;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    newsListDetail.content = content;
  }
  final List<ReviewEntity>? reviewsList = (json['reviewsList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<ReviewEntity>(e) as ReviewEntity).toList();
  if (reviewsList != null) {
    newsListDetail.reviewsList = reviewsList;
  }
  final int? postTime = jsonConvert.convert<int>(json['postTime']);
  if (postTime != null) {
    newsListDetail.postTime = postTime;
  }
  final int? award = jsonConvert.convert<int>(json['award']);
  if (award != null) {
    newsListDetail.award = award;
  }
  final int? ct = jsonConvert.convert<int>(json['createTime']);
  if (ct != null) {
    newsListDetail.ct = ct;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    newsListDetail.id = id;
  }
  final int? views = jsonConvert.convert<int>(json['views']);
  if (views != null) {
    newsListDetail.views = views;
  }
  final int? likes = jsonConvert.convert<int>(json['likes']);
  if (likes != null) {
    newsListDetail.likes = likes;
  }
  final List<int>? teams = (json['teams'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (teams != null) {
    newsListDetail.teams = teams;
  }
  final List<int>? players = (json['players'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (players != null) {
    newsListDetail.players = players;
  }
  final String? imgUrl = jsonConvert.convert<String>(json['imgUrl']);
  if (imgUrl != null) {
    newsListDetail.imgUrl = imgUrl;
  }
  final List<String>? imgList = (json['imgList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (imgList != null) {
    newsListDetail.imgList = imgList;
  }
  return newsListDetail;
}

Map<String, dynamic> $NewsListDetailToJson(NewsListDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isLike'] = entity.isLikeInt;
  data['isView'] = entity.isView;
  data['dataLabel'] = entity.dataLabel;
  data['updateTime'] = entity.updateTime;
  data['reviewsCount'] = entity.reviewsCountInt;
  data['source'] = entity.source;
  data['title'] = entity.title;
  data['unLikes'] = entity.unLikes;
  data['content'] = entity.content;
  data['reviewsList'] = entity.reviewsList.map((v) => v.toJson()).toList();
  data['postTime'] = entity.postTime;
  data['award'] = entity.award;
  data['createTime'] = entity.ct;
  data['id'] = entity.id;
  data['views'] = entity.views;
  data['likes'] = entity.likes;
  data['teams'] = entity.teams;
  data['players'] = entity.players;
  data['imgUrl'] = entity.imgUrl;
  data['imgList'] = entity.imgList;
  data['type'] = entity.type;
  data['imageHeight'] = entity.imageHeight;
  data['imamgeWidth'] = entity.imamgeWidth;
  return data;
}

extension NewsListDetailExtension on NewsListDetail {
  NewsListDetail copyWith({
    int? isLikeInt,
    RxInt? isLike,
    int? isView,
    String? dataLabel,
    int? updateTime,
    int? reviewsCountInt,
    RxInt? reviewsCount,
    String? source,
    String? title,
    int? unLikes,
    String? content,
    List<ReviewEntity>? reviewsList,
    int? postTime,
    int? award,
    int? ct,
    int? id,
    int? views,
    int? likes,
    List<int>? teams,
    List<int>? players,
    String? imgUrl,
    List<String>? imgList,
    int? type,
    double? imageHeight,
    double? imamgeWidth,
  }) {
    return NewsListDetail()
      ..isLikeInt = isLikeInt ?? this.isLikeInt
      ..isLike = isLike ?? this.isLike
      ..isView = isView ?? this.isView
      ..dataLabel = dataLabel ?? this.dataLabel
      ..updateTime = updateTime ?? this.updateTime
      ..reviewsCountInt = reviewsCountInt ?? this.reviewsCountInt
      ..reviewsCount = reviewsCount ?? this.reviewsCount
      ..source = source ?? this.source
      ..title = title ?? this.title
      ..unLikes = unLikes ?? this.unLikes
      ..content = content ?? this.content
      ..reviewsList = reviewsList ?? this.reviewsList
      ..postTime = postTime ?? this.postTime
      ..award = award ?? this.award
      ..ct = ct ?? this.ct
      ..id = id ?? this.id
      ..views = views ?? this.views
      ..likes = likes ?? this.likes
      ..teams = teams ?? this.teams
      ..players = players ?? this.players
      ..imgUrl = imgUrl ?? this.imgUrl
      ..imgList = imgList ?? this.imgList
      ..type = type ?? this.type
      ..imageHeight = imageHeight ?? this.imageHeight
      ..imamgeWidth = imamgeWidth ?? this.imamgeWidth;
  }
}