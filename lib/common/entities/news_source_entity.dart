import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/news_source_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/news_source_entity.g.dart';

@JsonSerializable()
class NewsSourceEntity {
	late String sourceEnName = '';
	late String sourceIcon = '';
	late int sourceId = 0;
	late String sourceName = '';

	NewsSourceEntity();

	factory NewsSourceEntity.fromJson(Map<String, dynamic> json) => $NewsSourceEntityFromJson(json);

	Map<String, dynamic> toJson() => $NewsSourceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}