import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/pick_type_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/pick_type_entity.g.dart';

@JsonSerializable()
class PickTypeEntity {
	late String pickTypeId;
	late String pickTypeName;
	late String pickTypeFullName;

	PickTypeEntity();

	factory PickTypeEntity.fromJson(Map<String, dynamic> json) => $PickTypeEntityFromJson(json);

	Map<String, dynamic> toJson() => $PickTypeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}