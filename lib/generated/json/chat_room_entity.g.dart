import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/chat_room_entity.dart';

ChatRoomEntity $ChatRoomEntityFromJson(Map<String, dynamic> json) {
  final ChatRoomEntity chatRoomEntity = ChatRoomEntity();
  final int? lastChatPosition = jsonConvert.convert<int>(
      json['lastChatPosition']);
  if (lastChatPosition != null) {
    chatRoomEntity.lastChatPosition = lastChatPosition;
  }
  final bool? dndStatus = jsonConvert.convert<bool>(json['dndStatus']);
  if (dndStatus != null) {
    chatRoomEntity.dndStatus = dndStatus;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    chatRoomEntity.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    chatRoomEntity.teamId = teamId;
  }
  final String? lastMessage = jsonConvert.convert<String>(json['lastMessage']);
  if (lastMessage != null) {
    chatRoomEntity.lastMessage = lastMessage;
  }
  final int? unreadMessageCount = jsonConvert.convert<int>(
      json['unreadMessageCount']);
  if (unreadMessageCount != null) {
    chatRoomEntity.unreadMessageCount = unreadMessageCount;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    chatRoomEntity.updateTime = updateTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    chatRoomEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    chatRoomEntity.type = type;
  }
  final String? categoryId = jsonConvert.convert<String>(json['categoryId']);
  if (categoryId != null) {
    chatRoomEntity.categoryId = categoryId;
  }
  final bool? pinnedStatus = jsonConvert.convert<bool>(json['pinnedStatus']);
  if (pinnedStatus != null) {
    chatRoomEntity.pinnedStatus = pinnedStatus;
  }
  final String? roomId = jsonConvert.convert<String>(json['roomId']);
  if (roomId != null) {
    chatRoomEntity.roomId = roomId;
  }
  return chatRoomEntity;
}

Map<String, dynamic> $ChatRoomEntityToJson(ChatRoomEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['lastChatPosition'] = entity.lastChatPosition;
  data['dndStatus'] = entity.dndStatus;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['lastMessage'] = entity.lastMessage;
  data['unreadMessageCount'] = entity.unreadMessageCount;
  data['updateTime'] = entity.updateTime;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['categoryId'] = entity.categoryId;
  data['pinnedStatus'] = entity.pinnedStatus;
  data['roomId'] = entity.roomId;
  return data;
}

extension ChatRoomEntityExtension on ChatRoomEntity {
  ChatRoomEntity copyWith({
    int? lastChatPosition,
    bool? dndStatus,
    int? createTime,
    int? teamId,
    String? lastMessage,
    int? unreadMessageCount,
    int? updateTime,
    int? id,
    int? type,
    String? categoryId,
    bool? pinnedStatus,
    String? roomId,
  }) {
    return ChatRoomEntity()
      ..lastChatPosition = lastChatPosition ?? this.lastChatPosition
      ..dndStatus = dndStatus ?? this.dndStatus
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..lastMessage = lastMessage ?? this.lastMessage
      ..unreadMessageCount = unreadMessageCount ?? this.unreadMessageCount
      ..updateTime = updateTime ?? this.updateTime
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..categoryId = categoryId ?? this.categoryId
      ..pinnedStatus = pinnedStatus ?? this.pinnedStatus
      ..roomId = roomId ?? this.roomId;
  }
}