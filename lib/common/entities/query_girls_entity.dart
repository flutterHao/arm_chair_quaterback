import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/query_girls_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/query_girls_entity.g.dart';

@JsonSerializable()
class QueryGirlsEntity {
	late int currentPlotId = 0;
	late int currentSuit = 0;
	late int charm = 0;
	late int currentChatId = 0;
	late int signTime = 0;
	late int girlId = 0;
	late int teamId = 0;
	late int sign = 0;
	late List<dynamic> suitList = [];
	late int exchange = 0;
	late int intimacyLevel = 0;
	late int id = 0;

	QueryGirlsEntity();

	factory QueryGirlsEntity.fromJson(Map<String, dynamic> json) => $QueryGirlsEntityFromJson(json);

	Map<String, dynamic> toJson() => $QueryGirlsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}