import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/api_error_code_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/api_error_code_entity.g.dart';

@JsonSerializable()
class ApiErrorCodeEntity {
	late String desc;
	late String enDesc;
	late String id;

	ApiErrorCodeEntity();

	factory ApiErrorCodeEntity.fromJson(Map<String, dynamic> json) => $ApiErrorCodeEntityFromJson(json);

	Map<String, dynamic> toJson() => $ApiErrorCodeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}