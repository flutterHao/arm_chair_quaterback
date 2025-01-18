import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_mission_entity.dart';

TeamMissionEntity $TeamMissionEntityFromJson(Map<String, dynamic> json) {
  final TeamMissionEntity teamMissionEntity = TeamMissionEntity();
  final int? subCategory = jsonConvert.convert<int>(json['subCategory']);
  if (subCategory != null) {
    teamMissionEntity.subCategory = subCategory;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamMissionEntity.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamMissionEntity.teamId = teamId;
  }
  final int? totalProcess = jsonConvert.convert<int>(json['totalProcess']);
  if (totalProcess != null) {
    teamMissionEntity.totalProcess = totalProcess;
  }
  final int? missionDefineId = jsonConvert.convert<int>(
      json['missionDefineId']);
  if (missionDefineId != null) {
    teamMissionEntity.missionDefineId = missionDefineId;
  }
  final int? startTime = jsonConvert.convert<int>(json['startTime']);
  if (startTime != null) {
    teamMissionEntity.startTime = startTime;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    teamMissionEntity.updateTime = updateTime;
  }
  final int? currProcess = jsonConvert.convert<int>(json['currProcess']);
  if (currProcess != null) {
    teamMissionEntity.currProcess = currProcess;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    teamMissionEntity.id = id;
  }
  final int? category = jsonConvert.convert<int>(json['category']);
  if (category != null) {
    teamMissionEntity.category = category;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    teamMissionEntity.status = status;
  }
  return teamMissionEntity;
}

Map<String, dynamic> $TeamMissionEntityToJson(TeamMissionEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['subCategory'] = entity.subCategory;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['totalProcess'] = entity.totalProcess;
  data['missionDefineId'] = entity.missionDefineId;
  data['startTime'] = entity.startTime;
  data['updateTime'] = entity.updateTime;
  data['currProcess'] = entity.currProcess;
  data['id'] = entity.id;
  data['category'] = entity.category;
  data['status'] = entity.status;
  return data;
}

extension TeamMissionEntityExtension on TeamMissionEntity {
  TeamMissionEntity copyWith({
    int? subCategory,
    int? createTime,
    int? teamId,
    int? totalProcess,
    int? missionDefineId,
    int? startTime,
    int? updateTime,
    int? currProcess,
    int? id,
    int? category,
    int? status,
  }) {
    return TeamMissionEntity()
      ..subCategory = subCategory ?? this.subCategory
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..totalProcess = totalProcess ?? this.totalProcess
      ..missionDefineId = missionDefineId ?? this.missionDefineId
      ..startTime = startTime ?? this.startTime
      ..updateTime = updateTime ?? this.updateTime
      ..currProcess = currProcess ?? this.currProcess
      ..id = id ?? this.id
      ..category = category ?? this.category
      ..status = status ?? this.status;
  }
}