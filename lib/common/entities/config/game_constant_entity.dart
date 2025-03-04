import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/game_constant_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/game_constant_entity.g.dart';

@JsonSerializable()
class GameConstantEntity {
	 int constantId = 0;
	 String constantStrVal = '';
	 double constantValue = 0;
	 List<String> constantValues = [];
	 String desc = '';

	GameConstantEntity();

	factory GameConstantEntity.fromJson(Map<String, dynamic> json) => $GameConstantEntityFromJson(json);

	Map<String, dynamic> toJson() => $GameConstantEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}