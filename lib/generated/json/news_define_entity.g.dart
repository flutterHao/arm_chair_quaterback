import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';

NewsDefineEntity $NewsDefineEntityFromJson(Map<String, dynamic> json) {
  final NewsDefineEntity newsDefineEntity = NewsDefineEntity();
  final int? iD = jsonConvert.convert<int>(json['ID']);
  if (iD != null) {
    newsDefineEntity.iD = iD;
  }
  final String? betCost = jsonConvert.convert<String>(json['betCost']);
  if (betCost != null) {
    newsDefineEntity.betCost = betCost;
  }
  final double? betNearDouble = jsonConvert.convert<double>(
      json['betNearDouble']);
  if (betNearDouble != null) {
    newsDefineEntity.betNearDouble = betNearDouble;
  }
  final double? betOddsPoint = jsonConvert.convert<double>(
      json['betOddsPoint']);
  if (betOddsPoint != null) {
    newsDefineEntity.betOddsPoint = betOddsPoint;
  }
  final List<double>? betPlayerNum = (json['betPlayerNum'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<double>(e) as double)
      .toList();
  if (betPlayerNum != null) {
    newsDefineEntity.betPlayerNum = betPlayerNum;
  }
  final double? betRewardRank = jsonConvert.convert<double>(
      json['betRewardRank']);
  if (betRewardRank != null) {
    newsDefineEntity.betRewardRank = betRewardRank;
  }
  final double? betSuccessPoint = jsonConvert.convert<double>(
      json['betSuccessPoint']);
  if (betSuccessPoint != null) {
    newsDefineEntity.betSuccessPoint = betSuccessPoint;
  }
  final double? betSuccessTimes = jsonConvert.convert<double>(
      json['betSuccessTimes']);
  if (betSuccessTimes != null) {
    newsDefineEntity.betSuccessTimes = betSuccessTimes;
  }
  final double? betSuccessTimesPoint = jsonConvert.convert<double>(
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
  final List<double>? flexBet3 = (json['flexBet3'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (flexBet3 != null) {
    newsDefineEntity.flexBet3 = flexBet3;
  }
  final List<double>? flexBet4 = (json['flexBet4'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (flexBet4 != null) {
    newsDefineEntity.flexBet4 = flexBet4;
  }
  final List<double>? flexBet5 = (json['flexBet5'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (flexBet5 != null) {
    newsDefineEntity.flexBet5 = flexBet5;
  }
  final List<double>? flexBet6 = (json['flexBet6'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (flexBet6 != null) {
    newsDefineEntity.flexBet6 = flexBet6;
  }
  final double? gamePlay = jsonConvert.convert<double>(json['gamePlay']);
  if (gamePlay != null) {
    newsDefineEntity.gamePlay = gamePlay;
  }
  final double? gamePlayRecent = jsonConvert.convert<double>(
      json['gamePlayRecent']);
  if (gamePlayRecent != null) {
    newsDefineEntity.gamePlayRecent = gamePlayRecent;
  }
  final double? pfBetData = jsonConvert.convert<double>(json['pfBetData']);
  if (pfBetData != null) {
    newsDefineEntity.pfBetData = pfBetData;
  }
  final List<double>? powerBetWin = (json['powerBetWin'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<double>(e) as double)
      .toList();
  if (powerBetWin != null) {
    newsDefineEntity.powerBetWin = powerBetWin;
  }
  final double? professorMax = jsonConvert.convert<double>(
      json['professorMax']);
  if (professorMax != null) {
    newsDefineEntity.professorMax = professorMax;
  }
  final double? ptsGuessLine = jsonConvert.convert<double>(
      json['ptsGuessLine']);
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
  final double? winCoinPoint = jsonConvert.convert<double>(
      json['winCoinPoint']);
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
  data['flexBet3'] = entity.flexBet3;
  data['flexBet4'] = entity.flexBet4;
  data['flexBet5'] = entity.flexBet5;
  data['flexBet6'] = entity.flexBet6;
  data['gamePlay'] = entity.gamePlay;
  data['gamePlayRecent'] = entity.gamePlayRecent;
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
    int? iD,
    String? betCost,
    double? betNearDouble,
    double? betOddsPoint,
    List<double>? betPlayerNum,
    double? betRewardRank,
    double? betSuccessPoint,
    double? betSuccessTimes,
    double? betSuccessTimesPoint,
    List<String>? btRankClose,
    List<String>? btRankOpen,
    List<double>? flexBet3,
    List<double>? flexBet4,
    List<double>? flexBet5,
    List<double>? flexBet6,
    double? gamePlay,
    double? gamePlayRecent,
    double? pfBetData,
    List<double>? powerBetWin,
    double? professorMax,
    double? ptsGuessLine,
    double? sfBetData,
    double? sgBetData,
    double? winCoinPoint,
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
      ..flexBet3 = flexBet3 ?? this.flexBet3
      ..flexBet4 = flexBet4 ?? this.flexBet4
      ..flexBet5 = flexBet5 ?? this.flexBet5
      ..flexBet6 = flexBet6 ?? this.flexBet6
      ..gamePlay = gamePlay ?? this.gamePlay
      ..gamePlayRecent = gamePlayRecent ?? this.gamePlayRecent
      ..pfBetData = pfBetData ?? this.pfBetData
      ..powerBetWin = powerBetWin ?? this.powerBetWin
      ..professorMax = professorMax ?? this.professorMax
      ..ptsGuessLine = ptsGuessLine ?? this.ptsGuessLine
      ..sfBetData = sfBetData ?? this.sfBetData
      ..sgBetData = sgBetData ?? this.sgBetData
      ..winCoinPoint = winCoinPoint ?? this.winCoinPoint;
  }
}