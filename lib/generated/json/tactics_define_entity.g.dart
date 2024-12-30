import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/tactics_define_entity.dart';

TacticsDefineEntity $TacticsDefineEntityFromJson(Map<String, dynamic> json) {
  final TacticsDefineEntity tacticsDefineEntity = TacticsDefineEntity();
  final double? degreeAdd = jsonConvert.convert<double>(json['degreeAdd']);
  if (degreeAdd != null) {
    tacticsDefineEntity.degreeAdd = degreeAdd;
  }
  final String? tacticStruct = jsonConvert.convert<String>(
      json['tacticStruct']);
  if (tacticStruct != null) {
    tacticsDefineEntity.tacticStruct = tacticStruct;
  }
  final int? tacticTypeGrade = jsonConvert.convert<int>(
      json['tacticTypeGrade']);
  if (tacticTypeGrade != null) {
    tacticsDefineEntity.tacticTypeGrade = tacticTypeGrade;
  }
  final int? tacticTypeId = jsonConvert.convert<int>(json['tacticTypeId']);
  if (tacticTypeId != null) {
    tacticsDefineEntity.tacticTypeId = tacticTypeId;
  }
  return tacticsDefineEntity;
}

Map<String, dynamic> $TacticsDefineEntityToJson(TacticsDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['degreeAdd'] = entity.degreeAdd;
  data['tacticStruct'] = entity.tacticStruct;
  data['tacticTypeGrade'] = entity.tacticTypeGrade;
  data['tacticTypeId'] = entity.tacticTypeId;
  return data;
}

extension TacticsDefineEntityExtension on TacticsDefineEntity {
  TacticsDefineEntity copyWith({
    double? degreeAdd,
    String? tacticStruct,
    int? tacticTypeGrade,
    int? tacticTypeId,
  }) {
    return TacticsDefineEntity()
      ..degreeAdd = degreeAdd ?? this.degreeAdd
      ..tacticStruct = tacticStruct ?? this.tacticStruct
      ..tacticTypeGrade = tacticTypeGrade ?? this.tacticTypeGrade
      ..tacticTypeId = tacticTypeId ?? this.tacticTypeId;
  }
}