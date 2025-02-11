import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_email_entity.dart';

InboxEmailEntity $InboxEmailEntityFromJson(Map<String, dynamic> json) {
  final InboxEmailEntity inboxEmailEntity = InboxEmailEntity();
  final bool? receive = jsonConvert.convert<bool>(json['receive']);
  if (receive != null) {
    inboxEmailEntity.receive = receive;
  }
  final int? mailType = jsonConvert.convert<int>(json['mailType']);
  if (mailType != null) {
    inboxEmailEntity.mailType = mailType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    inboxEmailEntity.createTime = createTime;
  }
  final List<InboxEmailAwardData>? awardData = (json['awardData'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<InboxEmailAwardData>(e) as InboxEmailAwardData)
      .toList();
  if (awardData != null) {
    inboxEmailEntity.awardData = awardData;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    inboxEmailEntity.teamId = teamId;
  }
  final int? mailId = jsonConvert.convert<int>(json['mailId']);
  if (mailId != null) {
    inboxEmailEntity.mailId = mailId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    inboxEmailEntity.updateTime = updateTime;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    inboxEmailEntity.state = state;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    inboxEmailEntity.content = content;
  }
  return inboxEmailEntity;
}

Map<String, dynamic> $InboxEmailEntityToJson(InboxEmailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['receive'] = entity.receive;
  data['mailType'] = entity.mailType;
  data['createTime'] = entity.createTime;
  data['awardData'] = entity.awardData.map((v) => v.toJson()).toList();
  data['teamId'] = entity.teamId;
  data['mailId'] = entity.mailId;
  data['updateTime'] = entity.updateTime;
  data['state'] = entity.state;
  data['content'] = entity.content;
  return data;
}

extension InboxEmailEntityExtension on InboxEmailEntity {
  InboxEmailEntity copyWith({
    bool? receive,
    int? mailType,
    int? createTime,
    List<InboxEmailAwardData>? awardData,
    int? teamId,
    int? mailId,
    int? updateTime,
    int? state,
    String? content,
  }) {
    return InboxEmailEntity()
      ..receive = receive ?? this.receive
      ..mailType = mailType ?? this.mailType
      ..createTime = createTime ?? this.createTime
      ..awardData = awardData ?? this.awardData
      ..teamId = teamId ?? this.teamId
      ..mailId = mailId ?? this.mailId
      ..updateTime = updateTime ?? this.updateTime
      ..state = state ?? this.state
      ..content = content ?? this.content;
  }
}

InboxEmailAwardData $InboxEmailAwardDataFromJson(Map<String, dynamic> json) {
  final InboxEmailAwardData inboxEmailAwardData = InboxEmailAwardData();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    inboxEmailAwardData.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    inboxEmailAwardData.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    inboxEmailAwardData.type = type;
  }
  return inboxEmailAwardData;
}

Map<String, dynamic> $InboxEmailAwardDataToJson(InboxEmailAwardData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension InboxEmailAwardDataExtension on InboxEmailAwardData {
  InboxEmailAwardData copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return InboxEmailAwardData()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}