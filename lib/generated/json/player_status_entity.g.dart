import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/player_status_entity.dart';

PlayerStatusEntity $PlayerStatusEntityFromJson(Map<String, dynamic> json) {
  final PlayerStatusEntity playerStatusEntity = PlayerStatusEntity();
  final String? statsBackUp = jsonConvert.convert<String>(json['statsBackUp']);
  if (statsBackUp != null) {
    playerStatusEntity.statsBackUp = statsBackUp;
  }
  final int? statsId = jsonConvert.convert<int>(json['statsId']);
  if (statsId != null) {
    playerStatusEntity.statsId = statsId;
  }
  final int? statsPictureName = jsonConvert.convert<int>(
      json['statsPictureName']);
  if (statsPictureName != null) {
    playerStatusEntity.statsPictureName = statsPictureName;
  }
  final double? statsTransformPower = jsonConvert.convert<double>(
      json['statsTransformPower']);
  if (statsTransformPower != null) {
    playerStatusEntity.statsTransformPower = statsTransformPower;
  }
  return playerStatusEntity;
}

Map<String, dynamic> $PlayerStatusEntityToJson(PlayerStatusEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['statsBackUp'] = entity.statsBackUp;
  data['statsId'] = entity.statsId;
  data['statsPictureName'] = entity.statsPictureName;
  data['statsTransformPower'] = entity.statsTransformPower;
  return data;
}

extension PlayerStatusEntityExtension on PlayerStatusEntity {
  PlayerStatusEntity copyWith({
    String? statsBackUp,
    int? statsId,
    int? statsPictureName,
    double? statsTransformPower,
  }) {
    return PlayerStatusEntity()
      ..statsBackUp = statsBackUp ?? this.statsBackUp
      ..statsId = statsId ?? this.statsId
      ..statsPictureName = statsPictureName ?? this.statsPictureName
      ..statsTransformPower = statsTransformPower ?? this.statsTransformPower;
  }
}