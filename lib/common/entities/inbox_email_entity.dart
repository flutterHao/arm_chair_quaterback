import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/inbox_email_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/inbox_email_entity.g.dart';

@JsonSerializable()
class InboxEmailEntity {
	late int mailType = 0;
	late List<InboxEmailMailList> mailList = [];

	InboxEmailEntity();

	factory InboxEmailEntity.fromJson(Map<String, dynamic> json) => $InboxEmailEntityFromJson(json);

	Map<String, dynamic> toJson() => $InboxEmailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InboxEmailMailList {
	late bool receive = false;
	late int mailType = 0;
	@JSONField(name: 'createTime')
	late int ct = 0;
	late int inboxMessageId = 0;
	late List<InboxEmailMailListAwardData> awardData = [];
	late int teamId = 0;
	late int mailId = 0;
	late int updateTime = 0;
	late int state = 0;
	late String title = '';
	late String content = '';

	InboxEmailMailList();

	int get createTime =>
			ct + Utils.getTimeZoneOffset().inMilliseconds;

	factory InboxEmailMailList.fromJson(Map<String, dynamic> json) => $InboxEmailMailListFromJson(json);

	Map<String, dynamic> toJson() => $InboxEmailMailListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InboxEmailMailListAwardData {
	late int num = 0;
	late int id = 0;
	late int type = 0;

	InboxEmailMailListAwardData();

	factory InboxEmailMailListAwardData.fromJson(Map<String, dynamic> json) => $InboxEmailMailListAwardDataFromJson(json);

	Map<String, dynamic> toJson() => $InboxEmailMailListAwardDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}