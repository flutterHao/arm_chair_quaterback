import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/api_error_code_entity.dart';

ApiErrorCodeEntity $ApiErrorCodeEntityFromJson(Map<String, dynamic> json) {
  final ApiErrorCodeEntity apiErrorCodeEntity = ApiErrorCodeEntity();
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    apiErrorCodeEntity.desc = desc;
  }
  final String? enDesc = jsonConvert.convert<String>(json['enDesc']);
  if (enDesc != null) {
    apiErrorCodeEntity.enDesc = enDesc;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    apiErrorCodeEntity.id = id;
  }
  return apiErrorCodeEntity;
}

Map<String, dynamic> $ApiErrorCodeEntityToJson(ApiErrorCodeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['desc'] = entity.desc;
  data['enDesc'] = entity.enDesc;
  data['id'] = entity.id;
  return data;
}

extension ApiErrorCodeEntityExtension on ApiErrorCodeEntity {
  ApiErrorCodeEntity copyWith({
    String? desc,
    String? enDesc,
    String? id,
  }) {
    return ApiErrorCodeEntity()
      ..desc = desc ?? this.desc
      ..enDesc = enDesc ?? this.enDesc
      ..id = id ?? this.id;
  }
}