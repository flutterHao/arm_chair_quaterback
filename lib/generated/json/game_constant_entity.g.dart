import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/config/game_constant_entity.dart';

GameConstantEntity $GameConstantEntityFromJson(Map<String, dynamic> json) {
  final GameConstantEntity gameConstantEntity = GameConstantEntity();
  final int? constantId = jsonConvert.convert<int>(json['constantId']);
  if (constantId != null) {
    gameConstantEntity.constantId = constantId;
  }
  final String? constantStrVal = jsonConvert.convert<String>(
      json['constantStrVal']);
  if (constantStrVal != null) {
    gameConstantEntity.constantStrVal = constantStrVal;
  }
  final double? constantValue = jsonConvert.convert<double>(
      json['constantValue']);
  if (constantValue != null) {
    gameConstantEntity.constantValue = constantValue;
  }
  final List<String>? constantValues = (json['constantValues'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (constantValues != null) {
    gameConstantEntity.constantValues = constantValues;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    gameConstantEntity.desc = desc;
  }
  return gameConstantEntity;
}

Map<String, dynamic> $GameConstantEntityToJson(GameConstantEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['constantId'] = entity.constantId;
  data['constantStrVal'] = entity.constantStrVal;
  data['constantValue'] = entity.constantValue;
  data['constantValues'] = entity.constantValues;
  data['desc'] = entity.desc;
  return data;
}

extension GameConstantEntityExtension on GameConstantEntity {
  GameConstantEntity copyWith({
    int? constantId,
    String? constantStrVal,
    double? constantValue,
    List<String>? constantValues,
    String? desc,
  }) {
    return GameConstantEntity()
      ..constantId = constantId ?? this.constantId
      ..constantStrVal = constantStrVal ?? this.constantStrVal
      ..constantValue = constantValue ?? this.constantValue
      ..constantValues = constantValues ?? this.constantValues
      ..desc = desc ?? this.desc;
  }
}