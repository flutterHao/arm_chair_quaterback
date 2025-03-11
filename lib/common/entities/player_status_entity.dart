import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_status_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/player_status_entity.g.dart';

@JsonSerializable()
class PlayerStatusEntity {
	late String statsBackUp = '';
	late int statsId = 0;
	late int statsPictureName = 0;
	late double statsTransformPower;

	PlayerStatusEntity();

	factory PlayerStatusEntity.fromJson(Map<String, dynamic> json) => $PlayerStatusEntityFromJson(json);

	Map<String, dynamic> toJson() => $PlayerStatusEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}