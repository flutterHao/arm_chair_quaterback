import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/jump_defined_entity.dart';

JumpDefinedEntity $JumpDefinedEntityFromJson(Map<String, dynamic> json) {
  final JumpDefinedEntity jumpDefinedEntity = JumpDefinedEntity();
  final int? jumpId = jsonConvert.convert<int>(json['jumpId']);
  if (jumpId != null) {
    jumpDefinedEntity.jumpId = jumpId;
  }
  final String? jumpUiLine = jsonConvert.convert<String>(json['jumpUiLine']);
  if (jumpUiLine != null) {
    jumpDefinedEntity.jumpUiLine = jumpUiLine;
  }
  final int? jumpUiButtonId = jsonConvert.convert<int>(json['jumpUiButtonId']);
  if (jumpUiButtonId != null) {
    jumpDefinedEntity.jumpUiButtonId = jumpUiButtonId;
  }
  final String? jumpDes = jsonConvert.convert<String>(json['jumpDes']);
  if (jumpDes != null) {
    jumpDefinedEntity.jumpDes = jumpDes;
  }
  return jumpDefinedEntity;
}

Map<String, dynamic> $JumpDefinedEntityToJson(JumpDefinedEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['jumpId'] = entity.jumpId;
  data['jumpUiLine'] = entity.jumpUiLine;
  data['jumpUiButtonId'] = entity.jumpUiButtonId;
  data['jumpDes'] = entity.jumpDes;
  return data;
}

extension JumpDefinedEntityExtension on JumpDefinedEntity {
  JumpDefinedEntity copyWith({
    int? jumpId,
    String? jumpUiLine,
    int? jumpUiButtonId,
    String? jumpDes,
  }) {
    return JumpDefinedEntity()
      ..jumpId = jumpId ?? this.jumpId
      ..jumpUiLine = jumpUiLine ?? this.jumpUiLine
      ..jumpUiButtonId = jumpUiButtonId ?? this.jumpUiButtonId
      ..jumpDes = jumpDes ?? this.jumpDes;
  }
}