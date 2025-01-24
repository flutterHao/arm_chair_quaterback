import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';

RankAwardEntity $RankAwardEntityFromJson(Map<String, dynamic> json) {
  final RankAwardEntity rankAwardEntity = RankAwardEntity();
  final String? awardData = jsonConvert.convert<String>(json['awardData']);
  if (awardData != null) {
    rankAwardEntity.awardData = awardData;
  }
  final String? disc = jsonConvert.convert<String>(json['disc']);
  if (disc != null) {
    rankAwardEntity.disc = disc;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    rankAwardEntity.id = id;
  }
  final String? maxRank = jsonConvert.convert<String>(json['maxRank']);
  if (maxRank != null) {
    rankAwardEntity.maxRank = maxRank;
  }
  final String? minRank = jsonConvert.convert<String>(json['minRank']);
  if (minRank != null) {
    rankAwardEntity.minRank = minRank;
  }
  final String? paramValue = jsonConvert.convert<String>(json['paramValue']);
  if (paramValue != null) {
    rankAwardEntity.paramValue = paramValue;
  }
  final String? rankAwardType = jsonConvert.convert<String>(
      json['rankAwardType']);
  if (rankAwardType != null) {
    rankAwardEntity.rankAwardType = rankAwardType;
  }
  return rankAwardEntity;
}

Map<String, dynamic> $RankAwardEntityToJson(RankAwardEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awardData'] = entity.awardData;
  data['disc'] = entity.disc;
  data['id'] = entity.id;
  data['maxRank'] = entity.maxRank;
  data['minRank'] = entity.minRank;
  data['paramValue'] = entity.paramValue;
  data['rankAwardType'] = entity.rankAwardType;
  return data;
}

extension RankAwardEntityExtension on RankAwardEntity {
  RankAwardEntity copyWith({
    String? awardData,
    String? disc,
    String? id,
    String? maxRank,
    String? minRank,
    String? paramValue,
    String? rankAwardType,
  }) {
    return RankAwardEntity()
      ..awardData = awardData ?? this.awardData
      ..disc = disc ?? this.disc
      ..id = id ?? this.id
      ..maxRank = maxRank ?? this.maxRank
      ..minRank = minRank ?? this.minRank
      ..paramValue = paramValue ?? this.paramValue
      ..rankAwardType = rankAwardType ?? this.rankAwardType;
  }
}