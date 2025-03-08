import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/battle_pass_reward_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/battle_pass_reward_entity.g.dart';

@JsonSerializable()
class BattlePassRewardEntity {
	late String fixReward = '';
	late int id = 0;
	late int level = 0;
	late int poolId = 0;
	late int threshold = 0;

	BattlePassRewardEntity();

	factory BattlePassRewardEntity.fromJson(Map<String, dynamic> json) => $BattlePassRewardEntityFromJson(json);

	Map<String, dynamic> toJson() => $BattlePassRewardEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}