import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_rank_by_cycle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';

import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';


GuessRankByCycleEntity $GuessRankByCycleEntityFromJson(
    Map<String, dynamic> json) {
  final GuessRankByCycleEntity guessRankByCycleEntity = GuessRankByCycleEntity();
  final int? nowCycleEndTime = jsonConvert.convert<int>(
      json['nowCycleEndTime']);
  if (nowCycleEndTime != null) {
    guessRankByCycleEntity.nowCycleEndTime = nowCycleEndTime;
  }
  final List<RankInfoEntity>? ranks = (json['ranks'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<RankInfoEntity>(e) as RankInfoEntity)
      .toList();
  if (ranks != null) {
    guessRankByCycleEntity.ranks = ranks;
  }
  final int? lastRankTime = jsonConvert.convert<int>(json['lastRankTime']);
  if (lastRankTime != null) {
    guessRankByCycleEntity.lastRankTime = lastRankTime;
  }
  final RankListMyRank? myRank = jsonConvert.convert<RankListMyRank>(
      json['myRank']);
  if (myRank != null) {
    guessRankByCycleEntity.myRank = myRank;
  }
  final int? nowCycleStartTime = jsonConvert.convert<int>(
      json['nowCycleStartTime']);
  if (nowCycleStartTime != null) {
    guessRankByCycleEntity.nowCycleStartTime = nowCycleStartTime;
  }
  final int? firstRankTime = jsonConvert.convert<int>(json['firstRankTime']);
  if (firstRankTime != null) {
    guessRankByCycleEntity.firstRankTime = firstRankTime;
  }
  return guessRankByCycleEntity;
}

Map<String, dynamic> $GuessRankByCycleEntityToJson(
    GuessRankByCycleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nowCycleEndTime'] = entity.nowCycleEndTime;
  data['ranks'] = entity.ranks.map((v) => v.toJson()).toList();
  data['lastRankTime'] = entity.lastRankTime;
  data['myRank'] = entity.myRank.toJson();
  data['nowCycleStartTime'] = entity.nowCycleStartTime;
  data['firstRankTime'] = entity.firstRankTime;
  return data;
}

extension GuessRankByCycleEntityExtension on GuessRankByCycleEntity {
  GuessRankByCycleEntity copyWith({
    int? nowCycleEndTime,
    List<RankInfoEntity>? ranks,
    int? lastRankTime,
    RankListMyRank? myRank,
    int? nowCycleStartTime,
    int? firstRankTime,
  }) {
    return GuessRankByCycleEntity()
      ..nowCycleEndTime = nowCycleEndTime ?? this.nowCycleEndTime
      ..ranks = ranks ?? this.ranks
      ..lastRankTime = lastRankTime ?? this.lastRankTime
      ..myRank = myRank ?? this.myRank
      ..nowCycleStartTime = nowCycleStartTime ?? this.nowCycleStartTime
      ..firstRankTime = firstRankTime ?? this.firstRankTime;
  }
}