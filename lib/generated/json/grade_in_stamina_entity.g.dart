import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/grade_in_stamina_entity.dart';

GradeInStaminaEntity $GradeInStaminaEntityFromJson(Map<String, dynamic> json) {
  final GradeInStaminaEntity gradeInStaminaEntity = GradeInStaminaEntity();
  final String? gradeDes = jsonConvert.convert<String>(json['gradeDes']);
  if (gradeDes != null) {
    gradeInStaminaEntity.gradeDes = gradeDes;
  }
  final int? gradeId = jsonConvert.convert<int>(json['gradeId']);
  if (gradeId != null) {
    gradeInStaminaEntity.gradeId = gradeId;
  }
  final double? recoverStaminaValue = jsonConvert.convert<double>(
      json['recoverStaminaValue']);
  if (recoverStaminaValue != null) {
    gradeInStaminaEntity.recoverStaminaValue = recoverStaminaValue;
  }
  return gradeInStaminaEntity;
}

Map<String, dynamic> $GradeInStaminaEntityToJson(GradeInStaminaEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gradeDes'] = entity.gradeDes;
  data['gradeId'] = entity.gradeId;
  data['recoverStaminaValue'] = entity.recoverStaminaValue;
  return data;
}

extension GradeInStaminaEntityExtension on GradeInStaminaEntity {
  GradeInStaminaEntity copyWith({
    String? gradeDes,
    int? gradeId,
    double? recoverStaminaValue,
  }) {
    return GradeInStaminaEntity()
      ..gradeDes = gradeDes ?? this.gradeDes
      ..gradeId = gradeId ?? this.gradeId
      ..recoverStaminaValue = recoverStaminaValue ?? this.recoverStaminaValue;
  }
}