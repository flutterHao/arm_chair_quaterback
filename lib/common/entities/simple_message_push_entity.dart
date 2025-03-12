import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/simple_message_push_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/simple_message_push_entity.g.dart';

@JsonSerializable()
class SimpleMessagePushEntity {
	late String message = '';
	late int playerId = 0;
	late String roomId = '';
	late int sendTime = 0;
	late int teamId = 0;
	late String teamLogo = '';
	late String teamName = '';
	late int type = 0;

	SimpleMessagePushEntity();

	factory SimpleMessagePushEntity.fromJson(Map<String, dynamic> json) => $SimpleMessagePushEntityFromJson(json);

	Map<String, dynamic> toJson() => $SimpleMessagePushEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}