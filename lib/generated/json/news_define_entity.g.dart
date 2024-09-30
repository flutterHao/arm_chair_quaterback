import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';

NewsDefineEntity $NewsDefineEntityFromJson(Map<String, dynamic> json) {
  final NewsDefineEntity newsDefineEntity = NewsDefineEntity();
  final String? betMutMax = jsonConvert.convert<String>(json['BetMutMax']);
  if (betMutMax != null) {
    newsDefineEntity.betMutMax = betMutMax;
  }
  final String? betMutOdds = jsonConvert.convert<String>(json['BetMutOdds']);
  if (betMutOdds != null) {
    newsDefineEntity.betMutOdds = betMutOdds;
  }
  final String? iD = jsonConvert.convert<String>(json['ID']);
  if (iD != null) {
    newsDefineEntity.iD = iD;
  }
  final String? betCost = jsonConvert.convert<String>(json['betCost']);
  if (betCost != null) {
    newsDefineEntity.betCost = betCost;
  }
  final String? betOdds = jsonConvert.convert<String>(json['betOdds']);
  if (betOdds != null) {
    newsDefineEntity.betOdds = betOdds;
  }
  final String? betPlayerNum = jsonConvert.convert<String>(
      json['betPlayerNum']);
  if (betPlayerNum != null) {
    newsDefineEntity.betPlayerNum = betPlayerNum;
  }
  final String? betRankrefresh = jsonConvert.convert<String>(
      json['betRankrefresh']);
  if (betRankrefresh != null) {
    newsDefineEntity.betRankrefresh = betRankrefresh;
  }
  final String? betRewardRank = jsonConvert.convert<String>(
      json['betRewardRank']);
  if (betRewardRank != null) {
    newsDefineEntity.betRewardRank = betRewardRank;
  }
  final List<String>? btRankClose = (json['btRankClose'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (btRankClose != null) {
    newsDefineEntity.btRankClose = btRankClose;
  }
  final List<String>? btRankOpen = (json['btRankOpen'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (btRankOpen != null) {
    newsDefineEntity.btRankOpen = btRankOpen;
  }
  final List<String>? cBetData = (json['cBetData'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (cBetData != null) {
    newsDefineEntity.cBetData = cBetData;
  }
  final String? dailyCoins = jsonConvert.convert<String>(json['dailyCoins']);
  if (dailyCoins != null) {
    newsDefineEntity.dailyCoins = dailyCoins;
  }
  final String? gamePlay = jsonConvert.convert<String>(json['gamePlay']);
  if (gamePlay != null) {
    newsDefineEntity.gamePlay = gamePlay;
  }
  final String? gamePlayRecent = jsonConvert.convert<String>(
      json['gamePlayRecent']);
  if (gamePlayRecent != null) {
    newsDefineEntity.gamePlayRecent = gamePlayRecent;
  }
  final List<String>? newsRefresh = (json['newsRefresh'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (newsRefresh != null) {
    newsDefineEntity.newsRefresh = newsRefresh;
  }
  final String? newsRefreshNum = jsonConvert.convert<String>(
      json['newsRefreshNum']);
  if (newsRefreshNum != null) {
    newsDefineEntity.newsRefreshNum = newsRefreshNum;
  }
  final List<String>? pfBetData = (json['pfBetData'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (pfBetData != null) {
    newsDefineEntity.pfBetData = pfBetData;
  }
  final List<String>? pgBetDate = (json['pgBetDate'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (pgBetDate != null) {
    newsDefineEntity.pgBetDate = pgBetDate;
  }
  final List<String>? sfBetData = (json['sfBetData'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (sfBetData != null) {
    newsDefineEntity.sfBetData = sfBetData;
  }
  final List<String>? sgBetData = (json['sgBetData'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (sgBetData != null) {
    newsDefineEntity.sgBetData = sgBetData;
  }
  final int? newsReviewShowNum = jsonConvert.convert<int>(
      json['newsReviewShowNum']);
  if (newsReviewShowNum != null) {
    newsDefineEntity.newsReviewShowNum = newsReviewShowNum;
  }
  final int? newsReviewOpenNum = jsonConvert.convert<int>(
      json['newsReviewOpenNum']);
  if (newsReviewOpenNum != null) {
    newsDefineEntity.newsReviewOpenNum = newsReviewOpenNum;
  }
  return newsDefineEntity;
}

Map<String, dynamic> $NewsDefineEntityToJson(NewsDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['BetMutMax'] = entity.betMutMax;
  data['BetMutOdds'] = entity.betMutOdds;
  data['ID'] = entity.iD;
  data['betCost'] = entity.betCost;
  data['betOdds'] = entity.betOdds;
  data['betPlayerNum'] = entity.betPlayerNum;
  data['betRankrefresh'] = entity.betRankrefresh;
  data['betRewardRank'] = entity.betRewardRank;
  data['btRankClose'] = entity.btRankClose;
  data['btRankOpen'] = entity.btRankOpen;
  data['cBetData'] = entity.cBetData;
  data['dailyCoins'] = entity.dailyCoins;
  data['gamePlay'] = entity.gamePlay;
  data['gamePlayRecent'] = entity.gamePlayRecent;
  data['newsRefresh'] = entity.newsRefresh;
  data['newsRefreshNum'] = entity.newsRefreshNum;
  data['pfBetData'] = entity.pfBetData;
  data['pgBetDate'] = entity.pgBetDate;
  data['sfBetData'] = entity.sfBetData;
  data['sgBetData'] = entity.sgBetData;
  data['newsReviewShowNum'] = entity.newsReviewShowNum;
  data['newsReviewOpenNum'] = entity.newsReviewOpenNum;
  return data;
}

extension NewsDefineEntityExtension on NewsDefineEntity {
  NewsDefineEntity copyWith({
    String? betMutMax,
    String? betMutOdds,
    String? iD,
    String? betCost,
    String? betOdds,
    String? betPlayerNum,
    String? betRankrefresh,
    String? betRewardRank,
    List<String>? btRankClose,
    List<String>? btRankOpen,
    List<String>? cBetData,
    String? dailyCoins,
    String? gamePlay,
    String? gamePlayRecent,
    List<String>? newsRefresh,
    String? newsRefreshNum,
    List<String>? pfBetData,
    List<String>? pgBetDate,
    List<String>? sfBetData,
    List<String>? sgBetData,
    int? newsReviewShowNum,
    int? newsReviewOpenNum,
  }) {
    return NewsDefineEntity()
      ..betMutMax = betMutMax ?? this.betMutMax
      ..betMutOdds = betMutOdds ?? this.betMutOdds
      ..iD = iD ?? this.iD
      ..betCost = betCost ?? this.betCost
      ..betOdds = betOdds ?? this.betOdds
      ..betPlayerNum = betPlayerNum ?? this.betPlayerNum
      ..betRankrefresh = betRankrefresh ?? this.betRankrefresh
      ..betRewardRank = betRewardRank ?? this.betRewardRank
      ..btRankClose = btRankClose ?? this.btRankClose
      ..btRankOpen = btRankOpen ?? this.btRankOpen
      ..cBetData = cBetData ?? this.cBetData
      ..dailyCoins = dailyCoins ?? this.dailyCoins
      ..gamePlay = gamePlay ?? this.gamePlay
      ..gamePlayRecent = gamePlayRecent ?? this.gamePlayRecent
      ..newsRefresh = newsRefresh ?? this.newsRefresh
      ..newsRefreshNum = newsRefreshNum ?? this.newsRefreshNum
      ..pfBetData = pfBetData ?? this.pfBetData
      ..pgBetDate = pgBetDate ?? this.pgBetDate
      ..sfBetData = sfBetData ?? this.sfBetData
      ..sgBetData = sgBetData ?? this.sgBetData
      ..newsReviewShowNum = newsReviewShowNum ?? this.newsReviewShowNum
      ..newsReviewOpenNum = newsReviewOpenNum ?? this.newsReviewOpenNum;
  }
}