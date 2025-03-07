import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/help_entity.dart';

HelpEntity $HelpEntityFromJson(Map<String, dynamic> json) {
  final HelpEntity helpEntity = HelpEntity();
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    helpEntity.desc = desc;
  }
  final String? helpDesc = jsonConvert.convert<String>(json['helpDesc']);
  if (helpDesc != null) {
    helpEntity.helpDesc = helpDesc;
  }
  final int? helpId = jsonConvert.convert<int>(json['helpId']);
  if (helpId != null) {
    helpEntity.helpId = helpId;
  }
  final String? helpName = jsonConvert.convert<String>(json['helpName']);
  if (helpName != null) {
    helpEntity.helpName = helpName;
  }
  return helpEntity;
}

Map<String, dynamic> $HelpEntityToJson(HelpEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['desc'] = entity.desc;
  data['helpDesc'] = entity.helpDesc;
  data['helpId'] = entity.helpId;
  data['helpName'] = entity.helpName;
  return data;
}

extension HelpEntityExtension on HelpEntity {
  HelpEntity copyWith({
    String? desc,
    String? helpDesc,
    int? helpId,
    String? helpName,
  }) {
    return HelpEntity()
      ..desc = desc ?? this.desc
      ..helpDesc = helpDesc ?? this.helpDesc
      ..helpId = helpId ?? this.helpId
      ..helpName = helpName ?? this.helpName;
  }
}