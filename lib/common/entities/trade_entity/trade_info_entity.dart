import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/trade_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/trade_info_entity.g.dart';

@JsonSerializable()
class TradeInfoEntity {
	@JSONField(name: "PlayerTrends")
	late List<TradeInfoPlayerTrends> playerTrends;
	late TradeInfoTotalSalary totalSalary;
	late List<TradeInfoTradePlayers> tradePlayers;
	late TradeInfoTradeLogs tradeLogs;

	TradeInfoEntity();

	factory TradeInfoEntity.fromJson(Map<String, dynamic> json) => $TradeInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $TradeInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TradeInfoPlayerTrends {
	late int playerMarketPrice;
	late int createTime;
	late int playerScore;
	late int updateTime;
	late int playerStrength;
	late int playerId;

	TradeInfoPlayerTrends();

	factory TradeInfoPlayerTrends.fromJson(Map<String, dynamic> json) => $TradeInfoPlayerTrendsFromJson(json);

	Map<String, dynamic> toJson() => $TradeInfoPlayerTrendsToJson(this);

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
		return other+main+substitute;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TradeInfoTradePlayers {
	late int marketPrice;
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
	late int basicMarketPrice;
	late String position;

	TradeInfoTradePlayers();

	factory TradeInfoTradePlayers.fromJson(Map<String, dynamic> json) => $TradeInfoTradePlayersFromJson(json);

	Map<String, dynamic> toJson() => $TradeInfoTradePlayersToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TradeInfoTradeLogs {


	TradeInfoTradeLogs();

	factory TradeInfoTradeLogs.fromJson(Map<String, dynamic> json) => $TradeInfoTradeLogsFromJson(json);

	Map<String, dynamic> toJson() => $TradeInfoTradeLogsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}