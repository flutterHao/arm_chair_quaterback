import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/steal_response_entity.dart';
import 'package:arm_chair_quaterback/common/entities/steal_team_entity.dart';

import 'package:arm_chair_quaterback/pages/mine/daily_task/controller.dart';


StealResponseEntity $StealResponseEntityFromJson(Map<String, dynamic> json) {
  final StealResponseEntity stealResponseEntity = StealResponseEntity();
  final List<StealResponseAwardData>? awardData = (json['awardData'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<StealResponseAwardData>(e) as StealResponseAwardData)
      .toList();
  if (awardData != null) {
    stealResponseEntity.awardData = awardData;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    stealResponseEntity.teamId = teamId;
  }
  final StealTeamPlayers? stealPlayer = jsonConvert.convert<StealTeamPlayers>(
      json['stealPlayer']);
  if (stealPlayer != null) {
    stealResponseEntity.stealPlayer = stealPlayer;
  }
  return stealResponseEntity;
}

Map<String, dynamic> $StealResponseEntityToJson(StealResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awardData'] = entity.awardData.map((v) => v.toJson()).toList();
  data['teamId'] = entity.teamId;
  data['stealPlayer'] = entity.stealPlayer?.toJson();
  return data;
}

extension StealResponseEntityExtension on StealResponseEntity {
  StealResponseEntity copyWith({
    List<StealResponseAwardData>? awardData,
    int? teamId,
    StealTeamPlayers? stealPlayer,
  }) {
    return StealResponseEntity()
      ..awardData = awardData ?? this.awardData
      ..teamId = teamId ?? this.teamId
      ..stealPlayer = stealPlayer ?? this.stealPlayer;
  }
}

StealResponseAwardData $StealResponseAwardDataFromJson(
    Map<String, dynamic> json) {
  final StealResponseAwardData stealResponseAwardData = StealResponseAwardData();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    stealResponseAwardData.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    stealResponseAwardData.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    stealResponseAwardData.type = type;
  }
  return stealResponseAwardData;
}

Map<String, dynamic> $StealResponseAwardDataToJson(
    StealResponseAwardData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension StealResponseAwardDataExtension on StealResponseAwardData {
  StealResponseAwardData copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return StealResponseAwardData()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}