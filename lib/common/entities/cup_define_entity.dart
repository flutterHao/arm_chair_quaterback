import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/cup_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/cup_define_entity.g.dart';

@JsonSerializable()
class CupDefineEntity {
	late String backUp;
	late double cupDailyReward;
	late List<double> cupNum;
	late int cupNumId;
	late int cupPicId ;
	late String desc;
	late double loseCup ;
	late List<double> loserMoney;
	late double winCup;
	late List<double> winMoney;

	CupDefineEntity();

	factory CupDefineEntity.fromJson(Map<String, dynamic> json) => $CupDefineEntityFromJson(json);

	Map<String, dynamic> toJson() => $CupDefineEntityToJson(this);

	double getCupMax(){
		return cupNum[1];
	}

	double getCupMin(){
		return cupNum[0];
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}