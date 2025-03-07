import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/next_massage_entity.dart';

NextMessageEntity $NextMessageEntityFromJson(Map<String, dynamic> json) {
  final NextMessageEntity nextMessageEntity = NextMessageEntity();
  final int? storyId = jsonConvert.convert<int>(json['storyId']);
  if (storyId != null) {
    nextMessageEntity.storyId = storyId;
  }
  final int? messageDefineId = jsonConvert.convert<int>(
      json['messageDefineId']);
  if (messageDefineId != null) {
    nextMessageEntity.messageDefineId = messageDefineId;
  }
  final int? girlId = jsonConvert.convert<int>(json['girlId']);
  if (girlId != null) {
    nextMessageEntity.girlId = girlId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nextMessageEntity.teamId = teamId;
  }
  final String? context = jsonConvert.convert<String>(json['context']);
  if (context != null) {
    nextMessageEntity.context = context;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    nextMessageEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    nextMessageEntity.type = type;
  }
  final bool? receiveReward = jsonConvert.convert<bool>(json['receiveReward']);
  if (receiveReward != null) {
    nextMessageEntity.receiveReward = receiveReward;
  }
  return nextMessageEntity;
}

Map<String, dynamic> $NextMessageEntityToJson(NextMessageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['storyId'] = entity.storyId;
  data['messageDefineId'] = entity.messageDefineId;
  data['girlId'] = entity.girlId;
  data['teamId'] = entity.teamId;
  data['context'] = entity.context;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['receiveReward'] = entity.receiveReward;
  return data;
}

extension NextMessageEntityExtension on NextMessageEntity {
  NextMessageEntity copyWith({
    int? storyId,
    int? messageDefineId,
    int? girlId,
    int? teamId,
    String? context,
    int? id,
    int? type,
    bool? receiveReward,
  }) {
    return NextMessageEntity()
      ..storyId = storyId ?? this.storyId
      ..messageDefineId = messageDefineId ?? this.messageDefineId
      ..girlId = girlId ?? this.girlId
      ..teamId = teamId ?? this.teamId
      ..context = context ?? this.context
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..receiveReward = receiveReward ?? this.receiveReward;
  }
}