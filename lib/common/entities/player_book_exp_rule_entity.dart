import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_book_exp_rule_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/player_book_exp_rule_entity.g.dart';

@JsonSerializable()
class PlayerBookExpRuleEntity {
	late int addSalaryCap = 0;
	late int bookId = 0;
	late int currExp = 0;
	late int grade = 0;
	late int totalExp = 0;

	PlayerBookExpRuleEntity();

	factory PlayerBookExpRuleEntity.fromJson(Map<String, dynamic> json) => $PlayerBookExpRuleEntityFromJson(json);

	Map<String, dynamic> toJson() => $PlayerBookExpRuleEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}