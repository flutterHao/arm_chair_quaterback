import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/app_image_version_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/app_image_version_entity.g.dart';

@JsonSerializable()
class AppImageVersionEntity {
	late int imageVersion = 1;
	late String path = '';

	AppImageVersionEntity();

	factory AppImageVersionEntity.fromJson(Map<String, dynamic> json) => $AppImageVersionEntityFromJson(json);

	Map<String, dynamic> toJson() => $AppImageVersionEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}