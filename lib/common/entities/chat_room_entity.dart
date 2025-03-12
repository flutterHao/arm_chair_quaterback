import 'package:arm_chair_quaterback/common/entities/simple_message_push_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/chat_room_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/chat_room_entity.g.dart';

@JsonSerializable()
class ChatRoomEntity {
	int lastChatPosition = 0;
	bool dndStatus = false;
	@JSONField(name: "createTime")
	int ct = 0;
	int teamId = 0;
	String lastMessage = '';
	int unreadMessageCount = 0;
	@JSONField(name: "updateTime")
	int ut = 0;
	int id = 0;
	/// type： 1 球员聊天室 2 比赛聊天室 3 ovr聊天室
	int type = 0;
	String categoryId = '';
	bool pinnedStatus = false;
	String roomId = '';
	@JSONField(name: "lastMessageSendTime")
	int lMST = 0;

	ChatRoomEntity();

	int get createTime => Utils.getTimeZoneOffset().inMilliseconds + ct;

	int get updateTime => Utils.getTimeZoneOffset().inMilliseconds + ut;

	int get lastMessageSendTime => Utils.getTimeZoneOffset().inMilliseconds + lMST;

	factory ChatRoomEntity.fromJson(Map<String, dynamic> json) => $ChatRoomEntityFromJson(json);

	ChatRoomEntity copyWith(SimpleMessagePushEntity s){
		lastMessage = s.message;
		categoryId = s.playerId.toString();
		roomId = s.roomId;
		lMST = s.sendTime;
		teamId = s.teamId;
		type = s.type;
		return this;
	}

	Map<String, dynamic> toJson() => $ChatRoomEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}