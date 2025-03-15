import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/steal_player_rete_entity.dart';

StealPlayerReteEntity $StealPlayerReteEntityFromJson(
    Map<String, dynamic> json) {
  final StealPlayerReteEntity stealPlayerReteEntity = StealPlayerReteEntity();
  final String? difficulty = jsonConvert.convert<String>(json['difficulty']);
  if (difficulty != null) {
    stealPlayerReteEntity.difficulty = difficulty;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    stealPlayerReteEntity.id = id;
  }
  final int? permyriad = jsonConvert.convert<int>(json['permyriad']);
  if (permyriad != null) {
    stealPlayerReteEntity.permyriad = permyriad;
  }
  final String? quality = jsonConvert.convert<String>(json['quality']);
  if (quality != null) {
    stealPlayerReteEntity.quality = quality;
  }
  final int? star = jsonConvert.convert<int>(json['star']);
  if (star != null) {
    stealPlayerReteEntity.star = star;
  }
  return stealPlayerReteEntity;
}

Map<String, dynamic> $StealPlayerReteEntityToJson(
    StealPlayerReteEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['difficulty'] = entity.difficulty;
  data['id'] = entity.id;
  data['permyriad'] = entity.permyriad;
  data['quality'] = entity.quality;
  data['star'] = entity.star;
  return data;
}

extension StealPlayerReteEntityExtension on StealPlayerReteEntity {
  StealPlayerReteEntity copyWith({
    String? difficulty,
    int? id,
    int? permyriad,
    String? quality,
    int? star,
  }) {
    return StealPlayerReteEntity()
      ..difficulty = difficulty ?? this.difficulty
      ..id = id ?? this.id
      ..permyriad = permyriad ?? this.permyriad
      ..quality = quality ?? this.quality
      ..star = star ?? this.star;
  }
}