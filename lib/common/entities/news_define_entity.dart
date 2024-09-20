import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/news_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/news_define_entity.g.dart';

@JsonSerializable()
class NewsDefineEntity {
	@JSONField(name: "BetMutMax")
	late String betMutMax;
	@JSONField(name: "BetMutOdds")
	late String betMutOdds;
	@JSONField(name: "ID")
	late String iD;
	late String betCost;
	late String betOdds;
	late String betPlayerNum;
	late String betRankrefresh;
	late String betRewardRank;
	late List<String> btRankClose;
	late List<String> btRankOpen;
	late List<String> cBetData;
	late String dailyCoins;
	late String gamePlay;
	late String gamePlayRecent;
	late List<String> newsRefresh;
	late String newsRefreshNum;
	late List<String> pfBetData;
	late List<String> pgBetDate;
	late List<String> sfBetData;
	late List<String> sgBetData;

	NewsDefineEntity();

	factory NewsDefineEntity.fromJson(Map<String, dynamic> json) => $NewsDefineEntityFromJson(json);

	Map<String, dynamic> toJson() => $NewsDefineEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}