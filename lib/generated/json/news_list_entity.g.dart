import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';
import 'package:arm_chair_quaterback/common/utils/image_ext.dart';

import 'package:common_utils/common_utils.dart';

import 'package:flutter/material.dart';


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
  }) {
    return NewsListEntity()
      ..trade = trade ?? this.trade
      ..draft = draft ?? this.draft
      ..teamRumors = teamRumors ?? this.teamRumors
      ..match = match ?? this.match
      ..playerRumors = playerRumors ?? this.playerRumors
      ..latest = latest ?? this.latest
      ..playerNews = playerNews ?? this.playerNews
      ..injuries = injuries ?? this.injuries;
  }
}

NewsListDetail $NewsListDetailFromJson(Map<String, dynamic> json) {
  final NewsListDetail newsListDetail = NewsListDetail();
  final int? isLike = jsonConvert.convert<int>(json['isLike']);
  if (isLike != null) {
    newsListDetail.isLike = isLike;
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
  final int? reviewsCount = jsonConvert.convert<int>(json['reviewsCount']);
  if (reviewsCount != null) {
    newsListDetail.reviewsCount = reviewsCount;
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
  final List<dynamic>? reviewsList = (json['reviewsList'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
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
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    newsListDetail.createTime = createTime;
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
  return newsListDetail;
}

Map<String, dynamic> $NewsListDetailToJson(NewsListDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isLike'] = entity.isLike;
  data['isView'] = entity.isView;
  data['dataLabel'] = entity.dataLabel;
  data['updateTime'] = entity.updateTime;
  data['reviewsCount'] = entity.reviewsCount;
  data['source'] = entity.source;
  data['title'] = entity.title;
  data['unLikes'] = entity.unLikes;
  data['content'] = entity.content;
  data['reviewsList'] = entity.reviewsList;
  data['postTime'] = entity.postTime;
  data['award'] = entity.award;
  data['createTime'] = entity.createTime;
  data['id'] = entity.id;
  data['views'] = entity.views;
  data['likes'] = entity.likes;
  data['teams'] = entity.teams;
  data['players'] = entity.players;
  data['imgUrl'] = entity.imgUrl;
  data['type'] = entity.type;
  return data;
}

extension NewsListDetailExtension on NewsListDetail {
  NewsListDetail copyWith({
    int? isLike,
    int? isView,
    String? dataLabel,
    int? updateTime,
    int? reviewsCount,
    String? source,
    String? title,
    int? unLikes,
    String? content,
    List<dynamic>? reviewsList,
    int? postTime,
    int? award,
    int? createTime,
    int? id,
    int? views,
    int? likes,
    List<int>? teams,
    List<int>? players,
    String? imgUrl,
    int? type,
  }) {
    return NewsListDetail()
      ..isLike = isLike ?? this.isLike
      ..isView = isView ?? this.isView
      ..dataLabel = dataLabel ?? this.dataLabel
      ..updateTime = updateTime ?? this.updateTime
      ..reviewsCount = reviewsCount ?? this.reviewsCount
      ..source = source ?? this.source
      ..title = title ?? this.title
      ..unLikes = unLikes ?? this.unLikes
      ..content = content ?? this.content
      ..reviewsList = reviewsList ?? this.reviewsList
      ..postTime = postTime ?? this.postTime
      ..award = award ?? this.award
      ..createTime = createTime ?? this.createTime
      ..id = id ?? this.id
      ..views = views ?? this.views
      ..likes = likes ?? this.likes
      ..teams = teams ?? this.teams
      ..players = players ?? this.players
      ..imgUrl = imgUrl ?? this.imgUrl
      ..type = type ?? this.type;
  }
}

NewsListDraft $NewsListDraftFromJson(Map<String, dynamic> json) {
  final NewsListDraft newsListDraft = NewsListDraft();
  final int? isLike = jsonConvert.convert<int>(json['isLike']);
  if (isLike != null) {
    newsListDraft.isLike = isLike;
  }
  final int? isView = jsonConvert.convert<int>(json['isView']);
  if (isView != null) {
    newsListDraft.isView = isView;
  }
  final String? dataLabel = jsonConvert.convert<String>(json['dataLabel']);
  if (dataLabel != null) {
    newsListDraft.dataLabel = dataLabel;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    newsListDraft.updateTime = updateTime;
  }
  final int? reviewsCount = jsonConvert.convert<int>(json['reviewsCount']);
  if (reviewsCount != null) {
    newsListDraft.reviewsCount = reviewsCount;
  }
  final String? source = jsonConvert.convert<String>(json['source']);
  if (source != null) {
    newsListDraft.source = source;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    newsListDraft.title = title;
  }
  final int? unLikes = jsonConvert.convert<int>(json['unLikes']);
  if (unLikes != null) {
    newsListDraft.unLikes = unLikes;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    newsListDraft.content = content;
  }
  final List<dynamic>? reviewsList = (json['reviewsList'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (reviewsList != null) {
    newsListDraft.reviewsList = reviewsList;
  }
  final int? postTime = jsonConvert.convert<int>(json['postTime']);
  if (postTime != null) {
    newsListDraft.postTime = postTime;
  }
  final int? award = jsonConvert.convert<int>(json['award']);
  if (award != null) {
    newsListDraft.award = award;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    newsListDraft.createTime = createTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    newsListDraft.id = id;
  }
  final int? views = jsonConvert.convert<int>(json['views']);
  if (views != null) {
    newsListDraft.views = views;
  }
  final int? likes = jsonConvert.convert<int>(json['likes']);
  if (likes != null) {
    newsListDraft.likes = likes;
  }
  return newsListDraft;
}

Map<String, dynamic> $NewsListDraftToJson(NewsListDraft entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isLike'] = entity.isLike;
  data['isView'] = entity.isView;
  data['dataLabel'] = entity.dataLabel;
  data['updateTime'] = entity.updateTime;
  data['reviewsCount'] = entity.reviewsCount;
  data['source'] = entity.source;
  data['title'] = entity.title;
  data['unLikes'] = entity.unLikes;
  data['content'] = entity.content;
  data['reviewsList'] = entity.reviewsList;
  data['postTime'] = entity.postTime;
  data['award'] = entity.award;
  data['createTime'] = entity.createTime;
  data['id'] = entity.id;
  data['views'] = entity.views;
  data['likes'] = entity.likes;
  return data;
}

extension NewsListDraftExtension on NewsListDraft {
  NewsListDraft copyWith({
    int? isLike,
    int? isView,
    String? dataLabel,
    int? updateTime,
    int? reviewsCount,
    String? source,
    String? title,
    int? unLikes,
    String? content,
    List<dynamic>? reviewsList,
    int? postTime,
    int? award,
    int? createTime,
    int? id,
    int? views,
    int? likes,
  }) {
    return NewsListDraft()
      ..isLike = isLike ?? this.isLike
      ..isView = isView ?? this.isView
      ..dataLabel = dataLabel ?? this.dataLabel
      ..updateTime = updateTime ?? this.updateTime
      ..reviewsCount = reviewsCount ?? this.reviewsCount
      ..source = source ?? this.source
      ..title = title ?? this.title
      ..unLikes = unLikes ?? this.unLikes
      ..content = content ?? this.content
      ..reviewsList = reviewsList ?? this.reviewsList
      ..postTime = postTime ?? this.postTime
      ..award = award ?? this.award
      ..createTime = createTime ?? this.createTime
      ..id = id ?? this.id
      ..views = views ?? this.views
      ..likes = likes ?? this.likes;
  }
}