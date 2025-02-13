import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/jump_defined_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/jump_defined_entity.g.dart';

@JsonSerializable()
class JumpDefinedEntity {
	late int jumpId = 0;
	late String jumpUiLine = '';
	late int jumpUiButtonId = 0;
	late String jumpDes = '';

	JumpDefinedEntity();

	factory JumpDefinedEntity.fromJson(Map<String, dynamic> json) => $JumpDefinedEntityFromJson(json);

	Map<String, dynamic> toJson() => $JumpDefinedEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}