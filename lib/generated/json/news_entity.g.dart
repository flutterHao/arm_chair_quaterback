import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/news_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_list/news_detail/news_detail.dart';


NewsEntity $NewsEntityFromJson(Map<String, dynamic> json) {
  final NewsEntity newsEntity = NewsEntity();
  final List<NewsDetail>? trade = (json['Trade'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewsDetail>(e) as NewsDetail).toList();
  if (trade != null) {
    newsEntity.trade = trade;
  }
  final List<NewsDetail>? draft = (json['Draft'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewsDetail>(e) as NewsDetail).toList();
  if (draft != null) {
    newsEntity.draft = draft;
  }
  final Map<String, NewsDetail>? teamRumors =
  (json['teamRumors'] as Map<String, dynamic>).map(
          (k, e) =>
          MapEntry(k, jsonConvert.convert<NewsDetail>(e) as NewsDetail));
  if (teamRumors != null) {
    newsEntity.teamRumors = teamRumors;
  }
  final List<NewsDetail>? match = (json['match'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewsDetail>(e) as NewsDetail).toList();
  if (match != null) {
    newsEntity.match = match;
  }
  final Map<String, NewsDetail>? playerRumors =
  (json['playerRumors'] as Map<String, dynamic>).map(
          (k, e) =>
          MapEntry(k, jsonConvert.convert<NewsDetail>(e) as NewsDetail));
  if (playerRumors != null) {
    newsEntity.playerRumors = playerRumors;
  }
  final List<NewsDetail>? latest = (json['Latest'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewsDetail>(e) as NewsDetail).toList();
  if (latest != null) {
    newsEntity.latest = latest;
  }
  final Map<String, List<NewsDetail>>? playerNews =
  (json['playerNews'] as Map<String, dynamic>).map(
          (k, e) =>
          MapEntry(k, (e as List<dynamic>)
              .map(
                  (e) => jsonConvert.convert<NewsDetail>(e) as NewsDetail)
              .toList()));
  if (playerNews != null) {
    newsEntity.playerNews = playerNews;
  }
  final List<NewsDetail>? injuries = (json['Injuries'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NewsDetail>(e) as NewsDetail).toList();
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
    List<NewsDetail>? trade,
    List<NewsDetail>? draft,
    Map<String, NewsDetail>? teamRumors,
    List<NewsDetail>? match,
    Map<String, NewsDetail>? playerRumors,
    List<NewsDetail>? latest,
    Map<String, List<NewsDetail>>? playerNews,
    List<NewsDetail>? injuries,
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