import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/pick_type_entity.dart';

PickTypeEntity $PickTypeEntityFromJson(Map<String, dynamic> json) {
  final PickTypeEntity pickTypeEntity = PickTypeEntity();
  final String? pickTypeId = jsonConvert.convert<String>(json['pickTypeId']);
  if (pickTypeId != null) {
    pickTypeEntity.pickTypeId = pickTypeId;
  }
  final String? pickTypeName = jsonConvert.convert<String>(
      json['pickTypeName']);
  if (pickTypeName != null) {
    pickTypeEntity.pickTypeName = pickTypeName;
  }
  final String? pickTypeFullName = jsonConvert.convert<String>(
      json['pickTypeFullName']);
  if (pickTypeFullName != null) {
    pickTypeEntity.pickTypeFullName = pickTypeFullName;
  }
  return pickTypeEntity;
}

Map<String, dynamic> $PickTypeEntityToJson(PickTypeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pickTypeId'] = entity.pickTypeId;
  data['pickTypeName'] = entity.pickTypeName;
  data['pickTypeFullName'] = entity.pickTypeFullName;
  return data;
}

extension PickTypeEntityExtension on PickTypeEntity {
  PickTypeEntity copyWith({
    String? pickTypeId,
    String? pickTypeName,
    String? pickTypeFullName,
  }) {
    return PickTypeEntity()
      ..pickTypeId = pickTypeId ?? this.pickTypeId
      ..pickTypeName = pickTypeName ?? this.pickTypeName
      ..pickTypeFullName = pickTypeFullName ?? this.pickTypeFullName;
  }
}