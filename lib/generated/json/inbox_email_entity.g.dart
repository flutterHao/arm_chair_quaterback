import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_email_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';


InboxEmailEntity $InboxEmailEntityFromJson(Map<String, dynamic> json) {
  final InboxEmailEntity inboxEmailEntity = InboxEmailEntity();
  final int? mailType = jsonConvert.convert<int>(json['mailType']);
  if (mailType != null) {
    inboxEmailEntity.mailType = mailType;
  }
  final List<InboxEmailMailList>? mailList = (json['mailList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<InboxEmailMailList>(e) as InboxEmailMailList)
      .toList();
  if (mailList != null) {
    inboxEmailEntity.mailList = mailList;
  }
  return inboxEmailEntity;
}

Map<String, dynamic> $InboxEmailEntityToJson(InboxEmailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mailType'] = entity.mailType;
  data['mailList'] = entity.mailList.map((v) => v.toJson()).toList();
  return data;
}

extension InboxEmailEntityExtension on InboxEmailEntity {
  InboxEmailEntity copyWith({
    int? mailType,
    List<InboxEmailMailList>? mailList,
  }) {
    return InboxEmailEntity()
      ..mailType = mailType ?? this.mailType
      ..mailList = mailList ?? this.mailList;
  }
}

InboxEmailMailList $InboxEmailMailListFromJson(Map<String, dynamic> json) {
  final InboxEmailMailList inboxEmailMailList = InboxEmailMailList();
  final bool? receive = jsonConvert.convert<bool>(json['receive']);
  if (receive != null) {
    inboxEmailMailList.receive = receive;
  }
  final int? mailType = jsonConvert.convert<int>(json['mailType']);
  if (mailType != null) {
    inboxEmailMailList.mailType = mailType;
  }
  final int? ct = jsonConvert.convert<int>(json['createTime']);
  if (ct != null) {
    inboxEmailMailList.ct = ct;
  }
  final int? inboxMessageId = jsonConvert.convert<int>(json['inboxMessageId']);
  if (inboxMessageId != null) {
    inboxEmailMailList.inboxMessageId = inboxMessageId;
  }
  final List<
      InboxEmailMailListAwardData>? awardData = (json['awardData'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<InboxEmailMailListAwardData>(
          e) as InboxEmailMailListAwardData).toList();
  if (awardData != null) {
    inboxEmailMailList.awardData = awardData;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    inboxEmailMailList.teamId = teamId;
  }
  final int? mailId = jsonConvert.convert<int>(json['mailId']);
  if (mailId != null) {
    inboxEmailMailList.mailId = mailId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    inboxEmailMailList.updateTime = updateTime;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    inboxEmailMailList.state = state;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    inboxEmailMailList.title = title;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    inboxEmailMailList.content = content;
  }
  return inboxEmailMailList;
}

Map<String, dynamic> $InboxEmailMailListToJson(InboxEmailMailList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['receive'] = entity.receive;
  data['mailType'] = entity.mailType;
  data['createTime'] = entity.ct;
  data['inboxMessageId'] = entity.inboxMessageId;
  data['awardData'] = entity.awardData.map((v) => v.toJson()).toList();
  data['teamId'] = entity.teamId;
  data['mailId'] = entity.mailId;
  data['updateTime'] = entity.updateTime;
  data['state'] = entity.state;
  data['title'] = entity.title;
  data['content'] = entity.content;
  return data;
}

extension InboxEmailMailListExtension on InboxEmailMailList {
  InboxEmailMailList copyWith({
    bool? receive,
    int? mailType,
    int? ct,
    int? inboxMessageId,
    List<InboxEmailMailListAwardData>? awardData,
    int? teamId,
    int? mailId,
    int? updateTime,
    int? state,
    String? title,
    String? content,
  }) {
    return InboxEmailMailList()
      ..receive = receive ?? this.receive
      ..mailType = mailType ?? this.mailType
      ..ct = ct ?? this.ct
      ..inboxMessageId = inboxMessageId ?? this.inboxMessageId
      ..awardData = awardData ?? this.awardData
      ..teamId = teamId ?? this.teamId
      ..mailId = mailId ?? this.mailId
      ..updateTime = updateTime ?? this.updateTime
      ..state = state ?? this.state
      ..title = title ?? this.title
      ..content = content ?? this.content;
  }
}

InboxEmailMailListAwardData $InboxEmailMailListAwardDataFromJson(
    Map<String, dynamic> json) {
  final InboxEmailMailListAwardData inboxEmailMailListAwardData = InboxEmailMailListAwardData();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    inboxEmailMailListAwardData.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    inboxEmailMailListAwardData.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    inboxEmailMailListAwardData.type = type;
  }
  return inboxEmailMailListAwardData;
}

Map<String, dynamic> $InboxEmailMailListAwardDataToJson(
    InboxEmailMailListAwardData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension InboxEmailMailListAwardDataExtension on InboxEmailMailListAwardData {
  InboxEmailMailListAwardData copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return InboxEmailMailListAwardData()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}