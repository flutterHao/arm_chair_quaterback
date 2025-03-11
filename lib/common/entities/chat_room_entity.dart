import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/chat_room_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/chat_room_entity.g.dart';

@JsonSerializable()
class ChatRoomEntity {
	late int lastChatPosition = 0;
	late bool dndStatus = false;
	late int createTime = 0;
	late int teamId = 0;
	late String lastMessage = '';
	late int unreadMessageCount = 0;
	late int updateTime = 0;
	late int id = 0;
	/// type： 1 球员聊天室 2 比赛聊天室 3 ovr聊天室
	late int type = 0;
	late String categoryId = '';
	late bool pinnedStatus = false;
	late String roomId = '';

	ChatRoomEntity();

	factory ChatRoomEntity.fromJson(Map<String, dynamic> json) => $ChatRoomEntityFromJson(json);

	Map<String, dynamic> toJson() => $ChatRoomEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}