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
  return inboxMessageEntity;
}

Map<String, dynamic> $InboxMessageEntityToJson(InboxMessageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['userIcon'] = entity.userIcon;
  data['userSmallIcon'] = entity.userSmallIcon;
  data['userName'] = entity.userName;
  data['userText'] = entity.userText;
  return data;
}

extension InboxMessageEntityExtension on InboxMessageEntity {
  InboxMessageEntity copyWith({
    int? id,
    String? userIcon,
    String? userSmallIcon,
    String? userName,
    String? userText,
  }) {
    return InboxMessageEntity()
      ..id = id ?? this.id
      ..userIcon = userIcon ?? this.userIcon
      ..userSmallIcon = userSmallIcon ?? this.userSmallIcon
      ..userName = userName ?? this.userName
      ..userText = userText ?? this.userText;
  }
}