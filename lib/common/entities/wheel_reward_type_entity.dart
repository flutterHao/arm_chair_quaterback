import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/wheel_reward_type_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/wheel_reward_type_entity.g.dart';

@JsonSerializable()
class WheelRewardTypeEntity {
	 String wheelRewardIcon = '';
	 int wheelRewardId = 0;
	 List<double> wheelRewardInPack = [];
	 String wheelRewardMark = '';
	 double wheelRewardNum = 0;

	WheelRewardTypeEntity();

	factory WheelRewardTypeEntity.fromJson(Map<String, dynamic> json) => $WheelRewardTypeEntityFromJson(json);

	Map<String, dynamic> toJson() => $WheelRewardTypeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}