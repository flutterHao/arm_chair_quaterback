import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/steal_player_rete_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/steal_player_rete_entity.g.dart';

@JsonSerializable()
class StealPlayerReteEntity {
	late String difficulty = '';
	late int id = 0;
	late int permyriad = 0;
	late String grade = '';
	late int star = 0;

	StealPlayerReteEntity();

	factory StealPlayerReteEntity.fromJson(Map<String, dynamic> json) => $StealPlayerReteEntityFromJson(json);

	Map<String, dynamic> toJson() => $StealPlayerReteEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}