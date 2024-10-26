import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/trade_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/trade_info_entity.g.dart';

@JsonSerializable()
class TradeInfoEntity {
	late TradeInfoTotalSalary totalSalary;
	late List<TradeInfoTradePlayers> tradePlayers;
	late Map<String,double> tradeLogs;

	TradeInfoEntity();

	factory TradeInfoEntity.fromJson(Map<String, dynamic> json) => $TradeInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $TradeInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TradeInfoTotalSalary {
	@JSONField(name: "else")
	late double other;
	late double main;
	late double substitute;

	TradeInfoTotalSalary();

	factory TradeInfoTotalSalary.fromJson(Map<String, dynamic> json) => $TradeInfoTotalSalaryFromJson(json);

	Map<String, dynamic> toJson() => $TradeInfoTotalSalaryToJson(this);

	double getTotal(){
		return main+substitute+other;
	}
	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TradeInfoTradePlayers {
	int? marketPrice;
	late int espnId;
	late bool injuries;
	late int beforeMarketPriceUpdateTime;
	late int birthTime;
	late int playerStrength;
	late String elname;
	late int salary;
	late int minPlayerScore;
	late int nbaId;
	late int pos;
	late int property;
	late List<int> tag;
	late int beforeMarketPrice;
	late int playerId;
	late List<TradeInfoTradePlayersTrend> trend;
	late int maxPlayerScore;
	late int updateTime;
	late int beforePlayerStrength;
	late String ename;
	late int createTime;
	late int playerScore;
	late String sname;
	late String grade;
	late int teamId;
	late String name;
	int? basicMarketPrice;
	late String position;
	String? uuid;
	int? buyPrice;
	late int removalTime;
	late bool top;

	TradeInfoTradePlayers();

	factory TradeInfoTradePlayers.fromJson(Map<String, dynamic> json) => $TradeInfoTradePlayersFromJson(json);

	Map<String, dynamic> toJson() => $TradeInfoTradePlayersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TradeInfoTradePlayersTrend {
	late int playerMarketPrice;
	late int createTime;
	late int playerScore;
	late int updateTime;
	late int playerStrength;
	late int playerId;

	TradeInfoTradePlayersTrend();

	factory TradeInfoTradePlayersTrend.fromJson(Map<String, dynamic> json) => $TradeInfoTradePlayersTrendFromJson(json);

	Map<String, dynamic> toJson() => $TradeInfoTradePlayersTrendToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
