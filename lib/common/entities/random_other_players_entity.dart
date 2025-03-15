import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/random_other_players_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/random_other_players_entity.g.dart';

@JsonSerializable()
class RandomOtherPlayersEntity {
	late int marketPrice = 0;
	late int espnId = 0;
	late bool injuries = false;
	late int beforeMarketPriceUpdateTime = 0;
	late int birthTime = 0;
	late int playerStrength = 0;
	late String elname = '';
	late int salary = 0;
	late int minPlayerScore = 0;
	late int number = 0;
	late int nbaId = 0;
	late int pos = 0;
	late double layupWeight;
	late int property = 0;
	late double threePointWeight;
	late List<int> tag = [];
	late int beforeMarketPrice = 0;
	late double perimeterShotWeight;
	late int playerId = 0;
	late int maxPlayerScore = 0;
	late int updateTime = 0;
	late int beforePlayerStrength = 0;
	late String ename = '';
	late int createTime = 0;
	late int playerScore = 0;
	late String sname = '';
	late String grade = '';
	late int teamId = 0;
	late String name = '';
	late int basicMarketPrice = 0;
	late String position = '';
	late int age = 0;

	RandomOtherPlayersEntity();

	factory RandomOtherPlayersEntity.fromJson(Map<String, dynamic> json) => $RandomOtherPlayersEntityFromJson(json);

	Map<String, dynamic> toJson() => $RandomOtherPlayersEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}