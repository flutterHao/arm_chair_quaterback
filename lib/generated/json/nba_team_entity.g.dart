import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';

NbaTeamEntity $NbaTeamEntityFromJson(Map<String, dynamic> json) {
  final NbaTeamEntity nbaTeamEntity = NbaTeamEntity();
  final String? force = jsonConvert.convert<String>(json['force']);
  if (force != null) {
    nbaTeamEntity.force = force;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
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
  return data;
}

extension NbaTeamEntityExtension on NbaTeamEntity {
  NbaTeamEntity copyWith({
    String? force,
    String? id,
    String? longEname,
    String? name,
    String? shortEname,
    String? shortName,
  }) {
    return NbaTeamEntity()
      ..force = force ?? this.force
      ..id = id ?? this.id
      ..longEname = longEname ?? this.longEname
      ..name = name ?? this.name
      ..shortEname = shortEname ?? this.shortEname
      ..shortName = shortName ?? this.shortName;
  }
}