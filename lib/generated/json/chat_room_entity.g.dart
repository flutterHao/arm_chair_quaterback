import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/chat_room_entity.dart';
import 'package:arm_chair_quaterback/common/entities/simple_message_push_entity.dart';

import 'package:arm_chair_quaterback/common/utils/utils.dart';


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
  final int? ct = jsonConvert.convert<int>(json['createTime']);
  if (ct != null) {
    chatRoomEntity.ct = ct;
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
  final int? ut = jsonConvert.convert<int>(json['updateTime']);
  if (ut != null) {
    chatRoomEntity.ut = ut;
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
  final int? lMST = jsonConvert.convert<int>(json['lastMessageSendTime']);
  if (lMST != null) {
    chatRoomEntity.lMST = lMST;
  }
  return chatRoomEntity;
}

Map<String, dynamic> $ChatRoomEntityToJson(ChatRoomEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['lastChatPosition'] = entity.lastChatPosition;
  data['dndStatus'] = entity.dndStatus;
  data['createTime'] = entity.ct;
  data['teamId'] = entity.teamId;
  data['lastMessage'] = entity.lastMessage;
  data['unreadMessageCount'] = entity.unreadMessageCount;
  data['updateTime'] = entity.ut;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['categoryId'] = entity.categoryId;
  data['pinnedStatus'] = entity.pinnedStatus;
  data['roomId'] = entity.roomId;
  data['lastMessageSendTime'] = entity.lMST;
  return data;
}

extension ChatRoomEntityExtension on ChatRoomEntity {
  ChatRoomEntity copyWith({
    int? lastChatPosition,
    bool? dndStatus,
    int? ct,
    int? teamId,
    String? lastMessage,
    int? unreadMessageCount,
    int? ut,
    int? id,
    int? type,
    String? categoryId,
    bool? pinnedStatus,
    String? roomId,
    int? lMST,
  }) {
    return ChatRoomEntity()
      ..lastChatPosition = lastChatPosition ?? this.lastChatPosition
      ..dndStatus = dndStatus ?? this.dndStatus
      ..ct = ct ?? this.ct
      ..teamId = teamId ?? this.teamId
      ..lastMessage = lastMessage ?? this.lastMessage
      ..unreadMessageCount = unreadMessageCount ?? this.unreadMessageCount
      ..ut = ut ?? this.ut
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..categoryId = categoryId ?? this.categoryId
      ..pinnedStatus = pinnedStatus ?? this.pinnedStatus
      ..roomId = roomId ?? this.roomId
      ..lMST = lMST ?? this.lMST;
  }
}