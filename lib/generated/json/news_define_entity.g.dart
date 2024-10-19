import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';

NewsDefineEntity $NewsDefineEntityFromJson(Map<String, dynamic> json) {
  final NewsDefineEntity newsDefineEntity = NewsDefineEntity();
  final num? iD = jsonConvert.convert<num>(json['ID']);
  if (iD != null) {
    newsDefineEntity.iD = iD;
  }
  final String? betCost = jsonConvert.convert<String>(json['betCost']);
  if (betCost != null) {
    newsDefineEntity.betCost = betCost;
  }
  final num? betNearDouble = jsonConvert.convert<num>(json['betNearDouble']);
  if (betNearDouble != null) {
    newsDefineEntity.betNearDouble = betNearDouble;
  }
  final num? betOddsPoint = jsonConvert.convert<num>(json['betOddsPoint']);
  if (betOddsPoint != null) {
    newsDefineEntity.betOddsPoint = betOddsPoint;
  }
  final List<num>? betPlayerNum = (json['betPlayerNum'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<num>(e) as num).toList();
  if (betPlayerNum != null) {
    newsDefineEntity.betPlayerNum = betPlayerNum;
  }
  final num? betRewardRank = jsonConvert.convert<num>(json['betRewardRank']);
  if (betRewardRank != null) {
    newsDefineEntity.betRewardRank = betRewardRank;
  }
  final num? betSuccessPoint = jsonConvert.convert<num>(
      json['betSuccessPoint']);
  if (betSuccessPoint != null) {
    newsDefineEntity.betSuccessPoint = betSuccessPoint;
  }
  final num? betSuccessTimes = jsonConvert.convert<num>(
      json['betSuccessTimes']);
  if (betSuccessTimes != null) {
    newsDefineEntity.betSuccessTimes = betSuccessTimes;
  }
  final num? betSuccessTimesPoint = jsonConvert.convert<num>(
      json['betSuccessTimesPoint']);
  if (betSuccessTimesPoint != null) {
    newsDefineEntity.betSuccessTimesPoint = betSuccessTimesPoint;
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
  final num? dailyCoins = jsonConvert.convert<num>(json['dailyCoins']);
  if (dailyCoins != null) {
    newsDefineEntity.dailyCoins = dailyCoins;
  }
  final List<num>? flexBet3 = (json['flexBet3'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<num>(e) as num).toList();
  if (flexBet3 != null) {
    newsDefineEntity.flexBet3 = flexBet3;
  }
  final List<num>? flexBet4 = (json['flexBet4'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<num>(e) as num).toList();
  if (flexBet4 != null) {
    newsDefineEntity.flexBet4 = flexBet4;
  }
  final List<num>? flexBet5 = (json['flexBet5'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<num>(e) as num).toList();
  if (flexBet5 != null) {
    newsDefineEntity.flexBet5 = flexBet5;
  }
  final List<num>? flexBet6 = (json['flexBet6'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<num>(e) as num).toList();
  if (flexBet6 != null) {
    newsDefineEntity.flexBet6 = flexBet6;
  }
  final num? gamePlay = jsonConvert.convert<num>(json['gamePlay']);
  if (gamePlay != null) {
    newsDefineEntity.gamePlay = gamePlay;
  }
  final num? gamePlayRecent = jsonConvert.convert<num>(json['gamePlayRecent']);
  if (gamePlayRecent != null) {
    newsDefineEntity.gamePlayRecent = gamePlayRecent;
  }
  final List<num>? newsBaseRead = (json['newsBaseRead'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<num>(e) as num).toList();
  if (newsBaseRead != null) {
    newsDefineEntity.newsBaseRead = newsBaseRead;
  }
  final num? newsCreatePickMax = jsonConvert.convert<num>(
      json['newsCreatePickMax']);
  if (newsCreatePickMax != null) {
    newsDefineEntity.newsCreatePickMax = newsCreatePickMax;
  }
  final num? newsCreatePlayerMax = jsonConvert.convert<num>(
      json['newsCreatePlayerMax']);
  if (newsCreatePlayerMax != null) {
    newsDefineEntity.newsCreatePlayerMax = newsCreatePlayerMax;
  }
  final num? newsPickOdds = jsonConvert.convert<num>(json['newsPickOdds']);
  if (newsPickOdds != null) {
    newsDefineEntity.newsPickOdds = newsPickOdds;
  }
  final List<num>? newsRefresh = (json['newsRefresh'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<num>(e) as num).toList();
  if (newsRefresh != null) {
    newsDefineEntity.newsRefresh = newsRefresh;
  }
  final num? newsRefreshNum = jsonConvert.convert<num>(json['newsRefreshNum']);
  if (newsRefreshNum != null) {
    newsDefineEntity.newsRefreshNum = newsRefreshNum;
  }
  final int? newsReviewOpenNum = jsonConvert.convert<int>(
      json['newsReviewOpenNum']);
  if (newsReviewOpenNum != null) {
    newsDefineEntity.newsReviewOpenNum = newsReviewOpenNum;
  }
  final num? pfBetData = jsonConvert.convert<num>(json['pfBetData']);
  if (pfBetData != null) {
    newsDefineEntity.pfBetData = pfBetData;
  }
  final List<num>? powerBetWin = (json['powerBetWin'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<num>(e) as num).toList();
  if (powerBetWin != null) {
    newsDefineEntity.powerBetWin = powerBetWin;
  }
  final num? professorMax = jsonConvert.convert<num>(json['professorMax']);
  if (professorMax != null) {
    newsDefineEntity.professorMax = professorMax;
  }
  final num? ptsGuessLine = jsonConvert.convert<num>(json['ptsGuessLine']);
  if (ptsGuessLine != null) {
    newsDefineEntity.ptsGuessLine = ptsGuessLine;
  }
  final double? sfBetData = jsonConvert.convert<double>(json['sfBetData']);
  if (sfBetData != null) {
    newsDefineEntity.sfBetData = sfBetData;
  }
  final double? sgBetData = jsonConvert.convert<double>(json['sgBetData']);
  if (sgBetData != null) {
    newsDefineEntity.sgBetData = sgBetData;
  }
  final num? winCoinPoint = jsonConvert.convert<num>(json['winCoinPoint']);
  if (winCoinPoint != null) {
    newsDefineEntity.winCoinPoint = winCoinPoint;
  }
  return newsDefineEntity;
}

Map<String, dynamic> $NewsDefineEntityToJson(NewsDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ID'] = entity.iD;
  data['betCost'] = entity.betCost;
  data['betNearDouble'] = entity.betNearDouble;
  data['betOddsPoint'] = entity.betOddsPoint;
  data['betPlayerNum'] = entity.betPlayerNum;
  data['betRewardRank'] = entity.betRewardRank;
  data['betSuccessPoint'] = entity.betSuccessPoint;
  data['betSuccessTimes'] = entity.betSuccessTimes;
  data['betSuccessTimesPoint'] = entity.betSuccessTimesPoint;
  data['btRankClose'] = entity.btRankClose;
  data['btRankOpen'] = entity.btRankOpen;
  data['dailyCoins'] = entity.dailyCoins;
  data['flexBet3'] = entity.flexBet3;
  data['flexBet4'] = entity.flexBet4;
  data['flexBet5'] = entity.flexBet5;
  data['flexBet6'] = entity.flexBet6;
  data['gamePlay'] = entity.gamePlay;
  data['gamePlayRecent'] = entity.gamePlayRecent;
  data['newsBaseRead'] = entity.newsBaseRead;
  data['newsCreatePickMax'] = entity.newsCreatePickMax;
  data['newsCreatePlayerMax'] = entity.newsCreatePlayerMax;
  data['newsPickOdds'] = entity.newsPickOdds;
  data['newsRefresh'] = entity.newsRefresh;
  data['newsRefreshNum'] = entity.newsRefreshNum;
  data['newsReviewOpenNum'] = entity.newsReviewOpenNum;
  data['pfBetData'] = entity.pfBetData;
  data['powerBetWin'] = entity.powerBetWin;
  data['professorMax'] = entity.professorMax;
  data['ptsGuessLine'] = entity.ptsGuessLine;
  data['sfBetData'] = entity.sfBetData;
  data['sgBetData'] = entity.sgBetData;
  data['winCoinPoint'] = entity.winCoinPoint;
  return data;
}

extension NewsDefineEntityExtension on NewsDefineEntity {
  NewsDefineEntity copyWith({
    num? iD,
    String? betCost,
    num? betNearDouble,
    num? betOddsPoint,
    List<num>? betPlayerNum,
    num? betRewardRank,
    num? betSuccessPoint,
    num? betSuccessTimes,
    num? betSuccessTimesPoint,
    List<String>? btRankClose,
    List<String>? btRankOpen,
    num? dailyCoins,
    List<num>? flexBet3,
    List<num>? flexBet4,
    List<num>? flexBet5,
    List<num>? flexBet6,
    num? gamePlay,
    num? gamePlayRecent,
    List<num>? newsBaseRead,
    num? newsCreatePickMax,
    num? newsCreatePlayerMax,
    num? newsPickOdds,
    List<num>? newsRefresh,
    num? newsRefreshNum,
    int? newsReviewOpenNum,
    num? pfBetData,
    List<num>? powerBetWin,
    num? professorMax,
    num? ptsGuessLine,
    double? sfBetData,
    double? sgBetData,
    num? winCoinPoint,
  }) {
    return NewsDefineEntity()
      ..iD = iD ?? this.iD
      ..betCost = betCost ?? this.betCost
      ..betNearDouble = betNearDouble ?? this.betNearDouble
      ..betOddsPoint = betOddsPoint ?? this.betOddsPoint
      ..betPlayerNum = betPlayerNum ?? this.betPlayerNum
      ..betRewardRank = betRewardRank ?? this.betRewardRank
      ..betSuccessPoint = betSuccessPoint ?? this.betSuccessPoint
      ..betSuccessTimes = betSuccessTimes ?? this.betSuccessTimes
      ..betSuccessTimesPoint = betSuccessTimesPoint ?? this.betSuccessTimesPoint
      ..btRankClose = btRankClose ?? this.btRankClose
      ..btRankOpen = btRankOpen ?? this.btRankOpen
      ..dailyCoins = dailyCoins ?? this.dailyCoins
      ..flexBet3 = flexBet3 ?? this.flexBet3
      ..flexBet4 = flexBet4 ?? this.flexBet4
      ..flexBet5 = flexBet5 ?? this.flexBet5
      ..flexBet6 = flexBet6 ?? this.flexBet6
      ..gamePlay = gamePlay ?? this.gamePlay
      ..gamePlayRecent = gamePlayRecent ?? this.gamePlayRecent
      ..newsBaseRead = newsBaseRead ?? this.newsBaseRead
      ..newsCreatePickMax = newsCreatePickMax ?? this.newsCreatePickMax
      ..newsCreatePlayerMax = newsCreatePlayerMax ?? this.newsCreatePlayerMax
      ..newsPickOdds = newsPickOdds ?? this.newsPickOdds
      ..newsRefresh = newsRefresh ?? this.newsRefresh
      ..newsRefreshNum = newsRefreshNum ?? this.newsRefreshNum
      ..newsReviewOpenNum = newsReviewOpenNum ?? this.newsReviewOpenNum
      ..pfBetData = pfBetData ?? this.pfBetData
      ..powerBetWin = powerBetWin ?? this.powerBetWin
      ..professorMax = professorMax ?? this.professorMax
      ..ptsGuessLine = ptsGuessLine ?? this.ptsGuessLine
      ..sfBetData = sfBetData ?? this.sfBetData
      ..sgBetData = sgBetData ?? this.sgBetData
      ..winCoinPoint = winCoinPoint ?? this.winCoinPoint;
  }
}