import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/game_event_entity.dart';

GameEventEntity $GameEventEntityFromJson(Map<String, dynamic> json) {
  final GameEventEntity gameEventEntity = GameEventEntity();
  final String? constantId = jsonConvert.convert<String>(json['constantId']);
  if (constantId != null) {
    gameEventEntity.constantId = constantId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    gameEventEntity.desc = desc;
  }
  final String? eventDescripition = jsonConvert.convert<String>(
      json['eventDescripition']);
  if (eventDescripition != null) {
    gameEventEntity.eventDescripition = eventDescripition;
  }
  final String? eventWeight = jsonConvert.convert<String>(json['eventWeight']);
  if (eventWeight != null) {
    gameEventEntity.eventWeight = eventWeight;
  }
  final String? gameEventType = jsonConvert.convert<String>(
      json['gameEventType']);
  if (gameEventType != null) {
    gameEventEntity.gameEventType = gameEventType;
  }
  final String? headLine = jsonConvert.convert<String>(json['headLine']);
  if (headLine != null) {
    gameEventEntity.headLine = headLine;
  }
  return gameEventEntity;
}

Map<String, dynamic> $GameEventEntityToJson(GameEventEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['constantId'] = entity.constantId;
  data['desc'] = entity.desc;
  data['eventDescripition'] = entity.eventDescripition;
  data['eventWeight'] = entity.eventWeight;
  data['gameEventType'] = entity.gameEventType;
  data['headLine'] = entity.headLine;
  return data;
}

extension GameEventEntityExtension on GameEventEntity {
  GameEventEntity copyWith({
    String? constantId,
    String? desc,
    String? eventDescripition,
    String? eventWeight,
    String? gameEventType,
    String? headLine,
  }) {
    return GameEventEntity()
      ..constantId = constantId ?? this.constantId
      ..desc = desc ?? this.desc
      ..eventDescripition = eventDescripition ?? this.eventDescripition
      ..eventWeight = eventWeight ?? this.eventWeight
      ..gameEventType = gameEventType ?? this.gameEventType
      ..headLine = headLine ?? this.headLine;
  }
}