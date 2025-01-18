import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/mission_define_entity.dart';

MissionDefineEntity $MissionDefineEntityFromJson(Map<String, dynamic> json) {
  final MissionDefineEntity missionDefineEntity = MissionDefineEntity();
  final String? awardData = jsonConvert.convert<String>(json['awardData']);
  if (awardData != null) {
    missionDefineEntity.awardData = awardData;
  }
  final int? category = jsonConvert.convert<int>(json['category']);
  if (category != null) {
    missionDefineEntity.category = category;
  }
  final int? condition = jsonConvert.convert<int>(json['condition']);
  if (condition != null) {
    missionDefineEntity.condition = condition;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    missionDefineEntity.desc = desc;
  }
  final String? desc1 = jsonConvert.convert<String>(json['desc1']);
  if (desc1 != null) {
    missionDefineEntity.desc1 = desc1;
  }
  final int? isShow = jsonConvert.convert<int>(json['isShow']);
  if (isShow != null) {
    missionDefineEntity.isShow = isShow;
  }
  final String? linkId = jsonConvert.convert<String>(json['linkId']);
  if (linkId != null) {
    missionDefineEntity.linkId = linkId;
  }
  final int? missionDefineId = jsonConvert.convert<int>(
      json['missionDefineId']);
  if (missionDefineId != null) {
    missionDefineEntity.missionDefineId = missionDefineId;
  }
  final String? missionDefineName = jsonConvert.convert<String>(
      json['missionDefineName']);
  if (missionDefineName != null) {
    missionDefineEntity.missionDefineName = missionDefineName;
  }
  final String? missionbackup = jsonConvert.convert<String>(
      json['missionbackup']);
  if (missionbackup != null) {
    missionDefineEntity.missionbackup = missionbackup;
  }
  final List<String>? nextMissionIds = (json['nextMissionIds'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (nextMissionIds != null) {
    missionDefineEntity.nextMissionIds = nextMissionIds;
  }
  final int? showProgress = jsonConvert.convert<int>(json['showProgress']);
  if (showProgress != null) {
    missionDefineEntity.showProgress = showProgress;
  }
  final int? subCategory = jsonConvert.convert<int>(json['subCategory']);
  if (subCategory != null) {
    missionDefineEntity.subCategory = subCategory;
  }
  final int? targetNum = jsonConvert.convert<int>(json['targetNum']);
  if (targetNum != null) {
    missionDefineEntity.targetNum = targetNum;
  }
  final int? teamGradeLimit = jsonConvert.convert<int>(json['teamGradeLimit']);
  if (teamGradeLimit != null) {
    missionDefineEntity.teamGradeLimit = teamGradeLimit;
  }
  return missionDefineEntity;
}

Map<String, dynamic> $MissionDefineEntityToJson(MissionDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awardData'] = entity.awardData;
  data['category'] = entity.category;
  data['condition'] = entity.condition;
  data['desc'] = entity.desc;
  data['desc1'] = entity.desc1;
  data['isShow'] = entity.isShow;
  data['linkId'] = entity.linkId;
  data['missionDefineId'] = entity.missionDefineId;
  data['missionDefineName'] = entity.missionDefineName;
  data['missionbackup'] = entity.missionbackup;
  data['nextMissionIds'] = entity.nextMissionIds;
  data['showProgress'] = entity.showProgress;
  data['subCategory'] = entity.subCategory;
  data['targetNum'] = entity.targetNum;
  data['teamGradeLimit'] = entity.teamGradeLimit;
  return data;
}

extension MissionDefineEntityExtension on MissionDefineEntity {
  MissionDefineEntity copyWith({
    String? awardData,
    int? category,
    int? condition,
    String? desc,
    String? desc1,
    int? isShow,
    String? linkId,
    int? missionDefineId,
    String? missionDefineName,
    String? missionbackup,
    List<String>? nextMissionIds,
    int? showProgress,
    int? subCategory,
    int? targetNum,
    int? teamGradeLimit,
  }) {
    return MissionDefineEntity()
      ..awardData = awardData ?? this.awardData
      ..category = category ?? this.category
      ..condition = condition ?? this.condition
      ..desc = desc ?? this.desc
      ..desc1 = desc1 ?? this.desc1
      ..isShow = isShow ?? this.isShow
      ..linkId = linkId ?? this.linkId
      ..missionDefineId = missionDefineId ?? this.missionDefineId
      ..missionDefineName = missionDefineName ?? this.missionDefineName
      ..missionbackup = missionbackup ?? this.missionbackup
      ..nextMissionIds = nextMissionIds ?? this.nextMissionIds
      ..showProgress = showProgress ?? this.showProgress
      ..subCategory = subCategory ?? this.subCategory
      ..targetNum = targetNum ?? this.targetNum
      ..teamGradeLimit = teamGradeLimit ?? this.teamGradeLimit;
  }
}