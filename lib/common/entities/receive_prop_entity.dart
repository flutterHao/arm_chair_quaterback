import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/receive_prop_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/receive_prop_entity.g.dart';

@JsonSerializable()
class ReceivePropEntity {
	late int num = 0;
	late int id = 0;
	late int type = 0;

	ReceivePropEntity();

	factory ReceivePropEntity.fromJson(Map<String, dynamic> json) => $ReceivePropEntityFromJson(json);

	Map<String, dynamic> toJson() => $ReceivePropEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}