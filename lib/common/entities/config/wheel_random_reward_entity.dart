import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/wheel_random_reward_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/wheel_random_reward_entity.g.dart';

@JsonSerializable()
class WheelRandomRewardEntity {
	late int randomId = 0;
	late String randomReward = '';
	late String randomRewardBack = '';
	late int randomRewardWeight = 0;

	WheelRandomRewardEntity();

	factory WheelRandomRewardEntity.fromJson(Map<String, dynamic> json) => $WheelRandomRewardEntityFromJson(json);

	Map<String, dynamic> toJson() => $WheelRandomRewardEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}