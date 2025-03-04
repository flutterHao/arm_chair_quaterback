import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/star_up_num_defined_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/star_up_num_defined_entity.g.dart';

@JsonSerializable()
class StarUpNumDefinedEntity {
	@JSONField(name: "BonusGameAward")
	late List<String> bonusGameAward = [];
	@JSONField(name: "BonusGameWeight")
	late List<int> bonusGameWeight = [];
	@JSONField(name: "SuccessRateDecays")
	late double successRateDecays = 0.0;
	late int starUpBaseNum = 0;
	late int starUpNum = 0;

	StarUpNumDefinedEntity();

	factory StarUpNumDefinedEntity.fromJson(Map<String, dynamic> json) => $StarUpNumDefinedEntityFromJson(json);

	Map<String, dynamic> toJson() => $StarUpNumDefinedEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}