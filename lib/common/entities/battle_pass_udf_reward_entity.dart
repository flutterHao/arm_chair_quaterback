import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/battle_pass_udf_reward_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/battle_pass_udf_reward_entity.g.dart';

@JsonSerializable()
class BattlePassUdfRewardEntity {
	late String comment = '';
	late int hostTeamId = 0;
	late int id = 0;
	late int poolId = 0;
	late List<String> reward = [];

	BattlePassUdfRewardEntity();

	factory BattlePassUdfRewardEntity.fromJson(Map<String, dynamic> json) => $BattlePassUdfRewardEntityFromJson(json);

	Map<String, dynamic> toJson() => $BattlePassUdfRewardEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}