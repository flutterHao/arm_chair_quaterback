import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_message_entity.dart';

InboxMessageEntity $InboxMessageEntityFromJson(Map<String, dynamic> json) {
  final InboxMessageEntity inboxMessageEntity = InboxMessageEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    inboxMessageEntity.id = id;
  }
  final String? userIcon = jsonConvert.convert<String>(json['userIcon']);
  if (userIcon != null) {
    inboxMessageEntity.userIcon = userIcon;
  }
  final String? userSmallIcon = jsonConvert.convert<String>(
      json['userSmallIcon']);
  if (userSmallIcon != null) {
    inboxMessageEntity.userSmallIcon = userSmallIcon;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    inboxMessageEntity.userName = userName;
  }
  final String? userText = jsonConvert.convert<String>(json['userText']);
  if (userText != null) {
    inboxMessageEntity.userText = userText;
  }
  final bool? isRead = jsonConvert.convert<bool>(json['isRead']);
  if (isRead != null) {
    inboxMessageEntity.isRead = isRead;
  }
  final DateTime? time = jsonConvert.convert<DateTime>(json['time']);
  if (time != null) {
    inboxMessageEntity.time = time;
  }
  final List<String>? messageList = (json['messageList'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (messageList != null) {
    inboxMessageEntity.messageList = messageList;
  }
  final List<String>? messageList2 = (json['messageList2'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (messageList2 != null) {
    inboxMessageEntity.messageList2 = messageList2;
  }
  final int? noReadNum = jsonConvert.convert<int>(json['noReadNum']);
  if (noReadNum != null) {
    inboxMessageEntity.noReadNum = noReadNum;
  }
  return inboxMessageEntity;
}

Map<String, dynamic> $InboxMessageEntityToJson(InboxMessageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userIcon'] = entity.userIcon;
  data['userSmallIcon'] = entity.userSmallIcon;
  data['userName'] = entity.userName;
  data['userText'] = entity.userText;
  data['isRead'] = entity.isRead;
  data['time'] = entity.time.toIso8601String();
  data['messageList'] = entity.messageList;
  data['messageList2'] = entity.messageList2;
  data['noReadNum'] = entity.noReadNum;
  return data;
}

extension InboxMessageEntityExtension on InboxMessageEntity {
  InboxMessageEntity copyWith({
    int? id,
    String? userIcon,
    String? userSmallIcon,
    String? userName,
    String? userText,
    bool? isRead,
    DateTime? time,
    List<String>? messageList,
    List<String>? messageList2,
    int? noReadNum,
  }) {
    return InboxMessageEntity()
      ..id = id ?? this.id
      ..userIcon = userIcon ?? this.userIcon
      ..userSmallIcon = userSmallIcon ?? this.userSmallIcon
      ..userName = userName ?? this.userName
      ..userText = userText ?? this.userText
      ..isRead = isRead ?? this.isRead
      ..time = time ?? this.time
      ..messageList = messageList ?? this.messageList
      ..messageList2 = messageList2 ?? this.messageList2
      ..noReadNum = noReadNum ?? this.noReadNum;
  }
}