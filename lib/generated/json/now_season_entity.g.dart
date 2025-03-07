import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/now_season_entity.dart';

NowSeasonEntity $NowSeasonEntityFromJson(Map<String, dynamic> json) {
  final NowSeasonEntity nowSeasonEntity = NowSeasonEntity();
  final int? seasonEndTime = jsonConvert.convert<int>(json['seasonEndTime']);
  if (seasonEndTime != null) {
    nowSeasonEntity.seasonEndTime = seasonEndTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nowSeasonEntity.createTime = createTime;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    nowSeasonEntity.seasonId = seasonId;
  }
  final int? seasonDuration = jsonConvert.convert<int>(json['seasonDuration']);
  if (seasonDuration != null) {
    nowSeasonEntity.seasonDuration = seasonDuration;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nowSeasonEntity.updateTime = updateTime;
  }
  final int? seasonNum = jsonConvert.convert<int>(json['seasonNum']);
  if (seasonNum != null) {
    nowSeasonEntity.seasonNum = seasonNum;
  }
  final int? seasonStartTime = jsonConvert.convert<int>(
      json['seasonStartTime']);
  if (seasonStartTime != null) {
    nowSeasonEntity.seasonStartTime = seasonStartTime;
  }
  return nowSeasonEntity;
}

Map<String, dynamic> $NowSeasonEntityToJson(NowSeasonEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['seasonEndTime'] = entity.seasonEndTime;
  data['createTime'] = entity.createTime;
  data['seasonId'] = entity.seasonId;
  data['seasonDuration'] = entity.seasonDuration;
  data['updateTime'] = entity.updateTime;
  data['seasonNum'] = entity.seasonNum;
  data['seasonStartTime'] = entity.seasonStartTime;
  return data;
}

extension NowSeasonEntityExtension on NowSeasonEntity {
  NowSeasonEntity copyWith({
    int? seasonEndTime,
    int? createTime,
    int? seasonId,
    int? seasonDuration,
    int? updateTime,
    int? seasonNum,
    int? seasonStartTime,
  }) {
    return NowSeasonEntity()
      ..seasonEndTime = seasonEndTime ?? this.seasonEndTime
      ..createTime = createTime ?? this.createTime
      ..seasonId = seasonId ?? this.seasonId
      ..seasonDuration = seasonDuration ?? this.seasonDuration
      ..updateTime = updateTime ?? this.updateTime
      ..seasonNum = seasonNum ?? this.seasonNum
      ..seasonStartTime = seasonStartTime ?? this.seasonStartTime;
  }
}