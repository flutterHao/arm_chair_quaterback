import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/inbox_email_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/inbox_email_entity.g.dart';

@JsonSerializable()
class InboxEmailEntity {
	late bool receive = false;
	late int mailType = 0;
	late int createTime = 0;
	late List<InboxEmailAwardData> awardData = [];
	late int teamId = 0;
	late int mailId = 0;
	late int updateTime = 0;
	late int state = 0;
	late String content = '';

	InboxEmailEntity();

	factory InboxEmailEntity.fromJson(Map<String, dynamic> json) => $InboxEmailEntityFromJson(json);

	Map<String, dynamic> toJson() => $InboxEmailEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class InboxEmailAwardData {
	late int num = 0;
	late int id = 0;
	late int type = 0;

	InboxEmailAwardData();

	factory InboxEmailAwardData.fromJson(Map<String, dynamic> json) => $InboxEmailAwardDataFromJson(json);

	Map<String, dynamic> toJson() => $InboxEmailAwardDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}