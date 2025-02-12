import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/turn_table_entity.dart';
import 'package:arm_chair_quaterback/common/entities/week_lucky_count_entity.dart';


TurnTableEntity $TurnTableEntityFromJson(Map<String, dynamic> json) {
  final TurnTableEntity turnTableEntity = TurnTableEntity();
  final String? currentAward = jsonConvert.convert<String>(
      json['currentAward']);
  if (currentAward != null) {
    turnTableEntity.currentAward = currentAward;
  }
  final int? cardProgress = jsonConvert.convert<int>(json['cardProgress']);
  if (cardProgress != null) {
    turnTableEntity.cardProgress = cardProgress;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    turnTableEntity.createTime = createTime;
  }
  final int? currentId = jsonConvert.convert<int>(json['currentId']);
  if (currentId != null) {
    turnTableEntity.currentId = currentId;
  }
  final int? currentLife = jsonConvert.convert<int>(json['currentLife']);
  if (currentLife != null) {
    turnTableEntity.currentLife = currentLife;
  }
  final String? functionAward = jsonConvert.convert<String>(
      json['functionAward']);
  if (functionAward != null) {
    turnTableEntity.functionAward = functionAward;
  }
  final int? reLifeCount = jsonConvert.convert<int>(json['reLifeCount']);
  if (reLifeCount != null) {
    turnTableEntity.reLifeCount = reLifeCount;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    turnTableEntity.teamId = teamId;
  }
  final int? vgCount = jsonConvert.convert<int>(json['vgCount']);
  if (vgCount != null) {
    turnTableEntity.vgCount = vgCount;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    turnTableEntity.updateTime = updateTime;
  }
  final int? circle = jsonConvert.convert<int>(json['circle']);
  if (circle != null) {
    turnTableEntity.circle = circle;
  }
  final String? awardPool = jsonConvert.convert<String>(json['awardPool']);
  if (awardPool != null) {
    turnTableEntity.awardPool = awardPool;
  }
  final int? isStart = jsonConvert.convert<int>(json['isStart']);
  if (isStart != null) {
    turnTableEntity.isStart = isStart;
  }
  final String? matchScore = jsonConvert.convert<String>(json['matchScore']);
  if (matchScore != null) {
    turnTableEntity.matchScore = matchScore;
  }
  final int? unKnowRewardId = jsonConvert.convert<int>(json['unKnowRewardId']);
  if (unKnowRewardId != null) {
    turnTableEntity.unKnowRewardId = unKnowRewardId;
  }
  final WeekLuckyCountEntity? weekLuckyCount = jsonConvert.convert<
      WeekLuckyCountEntity>(json['weekLuckyCount']);
  if (weekLuckyCount != null) {
    turnTableEntity.weekLuckyCount = weekLuckyCount;
  }
  return turnTableEntity;
}

Map<String, dynamic> $TurnTableEntityToJson(TurnTableEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['currentAward'] = entity.currentAward;
  data['cardProgress'] = entity.cardProgress;
  data['createTime'] = entity.createTime;
  data['currentId'] = entity.currentId;
  data['currentLife'] = entity.currentLife;
  data['functionAward'] = entity.functionAward;
  data['reLifeCount'] = entity.reLifeCount;
  data['teamId'] = entity.teamId;
  data['vgCount'] = entity.vgCount;
  data['updateTime'] = entity.updateTime;
  data['circle'] = entity.circle;
  data['awardPool'] = entity.awardPool;
  data['isStart'] = entity.isStart;
  data['matchScore'] = entity.matchScore;
  data['unKnowRewardId'] = entity.unKnowRewardId;
  data['weekLuckyCount'] = entity.weekLuckyCount.toJson();
  return data;
}

extension TurnTableEntityExtension on TurnTableEntity {
  TurnTableEntity copyWith({
    String? currentAward,
    int? cardProgress,
    int? createTime,
    int? currentId,
    int? currentLife,
    String? functionAward,
    int? reLifeCount,
    int? teamId,
    int? vgCount,
    int? updateTime,
    int? circle,
    String? awardPool,
    int? isStart,
    String? matchScore,
    int? unKnowRewardId,
    WeekLuckyCountEntity? weekLuckyCount,
  }) {
    return TurnTableEntity()
      ..currentAward = currentAward ?? this.currentAward
      ..cardProgress = cardProgress ?? this.cardProgress
      ..createTime = createTime ?? this.createTime
      ..currentId = currentId ?? this.currentId
      ..currentLife = currentLife ?? this.currentLife
      ..functionAward = functionAward ?? this.functionAward
      ..reLifeCount = reLifeCount ?? this.reLifeCount
      ..teamId = teamId ?? this.teamId
      ..vgCount = vgCount ?? this.vgCount
      ..updateTime = updateTime ?? this.updateTime
      ..circle = circle ?? this.circle
      ..awardPool = awardPool ?? this.awardPool
      ..isStart = isStart ?? this.isStart
      ..matchScore = matchScore ?? this.matchScore
      ..unKnowRewardId = unKnowRewardId ?? this.unKnowRewardId
      ..weekLuckyCount = weekLuckyCount ?? this.weekLuckyCount;
  }
}