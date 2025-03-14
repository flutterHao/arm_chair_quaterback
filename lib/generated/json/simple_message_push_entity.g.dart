import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/simple_message_push_entity.dart';

SimpleMessagePushEntity $SimpleMessagePushEntityFromJson(
    Map<String, dynamic> json) {
  final SimpleMessagePushEntity simpleMessagePushEntity = SimpleMessagePushEntity();
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    simpleMessagePushEntity.message = message;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    simpleMessagePushEntity.playerId = playerId;
  }
  final String? roomId = jsonConvert.convert<String>(json['roomId']);
  if (roomId != null) {
    simpleMessagePushEntity.roomId = roomId;
  }
  final int? sendTime = jsonConvert.convert<int>(json['sendTime']);
  if (sendTime != null) {
    simpleMessagePushEntity.sendTime = sendTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    simpleMessagePushEntity.teamId = teamId;
  }
  final String? teamLogo = jsonConvert.convert<String>(json['teamLogo']);
  if (teamLogo != null) {
    simpleMessagePushEntity.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    simpleMessagePushEntity.teamName = teamName;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    simpleMessagePushEntity.type = type;
  }
  final int? unReadCount = jsonConvert.convert<int>(json['unReadCount']);
  if (unReadCount != null) {
    simpleMessagePushEntity.unReadCount = unReadCount;
  }
  return simpleMessagePushEntity;
}

Map<String, dynamic> $SimpleMessagePushEntityToJson(
    SimpleMessagePushEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['message'] = entity.message;
  data['playerId'] = entity.playerId;
  data['roomId'] = entity.roomId;
  data['sendTime'] = entity.sendTime;
  data['teamId'] = entity.teamId;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['type'] = entity.type;
  data['unReadCount'] = entity.unReadCount;
  return data;
}

extension SimpleMessagePushEntityExtension on SimpleMessagePushEntity {
  SimpleMessagePushEntity copyWith({
    String? message,
    int? playerId,
    String? roomId,
    int? sendTime,
    int? teamId,
    String? teamLogo,
    String? teamName,
    int? type,
    int? unReadCount,
  }) {
    return SimpleMessagePushEntity()
      ..message = message ?? this.message
      ..playerId = playerId ?? this.playerId
      ..roomId = roomId ?? this.roomId
      ..sendTime = sendTime ?? this.sendTime
      ..teamId = teamId ?? this.teamId
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..type = type ?? this.type
      ..unReadCount = unReadCount ?? this.unReadCount;
  }
}