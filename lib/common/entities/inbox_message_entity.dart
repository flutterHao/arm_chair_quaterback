import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/inbox_message_entity.g.dart';

export 'package:arm_chair_quaterback/generated/json/inbox_message_entity.g.dart';

@JsonSerializable()
class InboxMessageEntity {
  late int id = 0;
  late String userIcon = '';
  late String userSmallIcon = '';
  late String userName = '';
  late String userText = '';
  late bool isRead = false;
  late DateTime time = DateTime.now();
  late List<String> messageList = [];
  late List<String> messageList2 = [];
  late int noReadNum = 0;
  InboxMessageEntity();

  factory InboxMessageEntity.fromJson(Map<String, dynamic> json) => $InboxMessageEntityFromJson(json);

  Map<String, dynamic> toJson() => $InboxMessageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
