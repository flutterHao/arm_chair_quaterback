import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';

NbaTeamEntity $NbaTeamEntityFromJson(Map<String, dynamic> json) {
  final NbaTeamEntity nbaTeamEntity = NbaTeamEntity();
  final int? force = jsonConvert.convert<int>(json['force']);
  if (force != null) {
    nbaTeamEntity.force = force;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    nbaTeamEntity.id = id;
  }
  final String? longEname = jsonConvert.convert<String>(json['longEname']);
  if (longEname != null) {
    nbaTeamEntity.longEname = longEname;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    nbaTeamEntity.name = name;
  }
  final String? shortEname = jsonConvert.convert<String>(json['shortEname']);
  if (shortEname != null) {
    nbaTeamEntity.shortEname = shortEname;
  }
  final String? shortName = jsonConvert.convert<String>(json['shortName']);
  if (shortName != null) {
    nbaTeamEntity.shortName = shortName;
  }
  final int? teamDivision = jsonConvert.convert<int>(json['teamDivision']);
  if (teamDivision != null) {
    nbaTeamEntity.teamDivision = teamDivision;
  }
  final int? nbaId = jsonConvert.convert<int>(json['nbaId']);
  if (nbaId != null) {
    nbaTeamEntity.nbaId = nbaId;
  }
  final String? teamEname = jsonConvert.convert<String>(json['teamEname']);
  if (teamEname != null) {
    nbaTeamEntity.teamEname = teamEname;
  }
  return nbaTeamEntity;
}

Map<String, dynamic> $NbaTeamEntityToJson(NbaTeamEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['force'] = entity.force;
  data['id'] = entity.id;
  data['longEname'] = entity.longEname;
  data['name'] = entity.name;
  data['shortEname'] = entity.shortEname;
  data['shortName'] = entity.shortName;
  data['teamDivision'] = entity.teamDivision;
  data['nbaId'] = entity.nbaId;
  data['teamEname'] = entity.teamEname;
  return data;
}

extension NbaTeamEntityExtension on NbaTeamEntity {
  NbaTeamEntity copyWith({
    int? force,
    int? id,
    String? longEname,
    String? name,
    String? shortEname,
    String? shortName,
    int? teamDivision,
    int? nbaId,
    String? teamEname,
  }) {
    return NbaTeamEntity()
      ..force = force ?? this.force
      ..id = id ?? this.id
      ..longEname = longEname ?? this.longEname
      ..name = name ?? this.name
      ..shortEname = shortEname ?? this.shortEname
      ..shortName = shortName ?? this.shortName
      ..teamDivision = teamDivision ?? this.teamDivision
      ..nbaId = nbaId ?? this.nbaId
      ..teamEname = teamEname ?? this.teamEname;
  }
}