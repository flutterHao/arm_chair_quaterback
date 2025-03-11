import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_book_rule_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/player_book_rule_entity.g.dart';

@JsonSerializable()
class PlayerBookRuleEntity {
	late int bookId = 0;
	late int exp = 0;
	late int isActive = 0;
	late int needNum = 0;
	late int playerId = 0;
	late String playerNumber = '';

	PlayerBookRuleEntity();

	factory PlayerBookRuleEntity.fromJson(Map<String, dynamic> json) => $PlayerBookRuleEntityFromJson(json);

	Map<String, dynamic> toJson() => $PlayerBookRuleEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}