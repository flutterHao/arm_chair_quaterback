import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/news_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_list_entity.dart';


NewsEntity $NewsEntityFromJson(Map<String, dynamic> json) {
  final NewsEntity newsEntity = NewsEntity();
  final List<NewsListDetail>? trade = (json['Trade'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (trade != null) {
    newsEntity.trade = trade;
  }
  final List<NewsListDetail>? draft = (json['Draft'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (draft != null) {
    newsEntity.draft = draft;
  }
  final Map<String, NewsListDetail>? teamRumors =
  (json['teamRumors'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
          k, jsonConvert.convert<NewsListDetail>(e) as NewsListDetail));
  if (teamRumors != null) {
    newsEntity.teamRumors = teamRumors;
  }
  final List<NewsListDetail>? match = (json['match'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (match != null) {
    newsEntity.match = match;
  }
  final Map<String, NewsListDetail>? playerRumors =
  (json['playerRumors'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
          k, jsonConvert.convert<NewsListDetail>(e) as NewsListDetail));
  if (playerRumors != null) {
    newsEntity.playerRumors = playerRumors;
  }
  final List<NewsListDetail>? latest = (json['Latest'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (latest != null) {
    newsEntity.latest = latest;
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
    newsEntity.playerNews = playerNews;
  }
  final List<NewsListDetail>? injuries = (json['Injuries'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<NewsListDetail>(e) as NewsListDetail)
      .toList();
  if (injuries != null) {
    newsEntity.injuries = injuries;
  }
  return newsEntity;
}

Map<String, dynamic> $NewsEntityToJson(NewsEntity entity) {
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

extension NewsEntityExtension on NewsEntity {
  NewsEntity copyWith({
    List<NewsListDetail>? trade,
    List<NewsListDetail>? draft,
    Map<String, NewsListDetail>? teamRumors,
    List<NewsListDetail>? match,
    Map<String, NewsListDetail>? playerRumors,
    List<NewsListDetail>? latest,
    Map<String, List<NewsListDetail>>? playerNews,
    List<NewsListDetail>? injuries,
  }) {
    return NewsEntity()
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