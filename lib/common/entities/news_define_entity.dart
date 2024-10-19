import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/news_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/news_define_entity.g.dart';

@JsonSerializable()
class NewsDefineEntity {
	@JSONField(name: "ID")
	late num iD;
	late String betCost;
	late num betNearDouble;
	late num betOddsPoint;
	late List<num> betPlayerNum;
	late num betRewardRank;
	late num betSuccessPoint;
	late num betSuccessTimes;
	late num betSuccessTimesPoint;
	late List<String> btRankClose;
	late List<String> btRankOpen;
	late num dailyCoins;
	late List<num> flexBet3;
	late List<num> flexBet4;
	late List<num> flexBet5;
	late List<num> flexBet6;
	late num gamePlay;
	late num gamePlayRecent;
	late List<num> newsBaseRead;
	late num newsCreatePickMax;
	late num newsCreatePlayerMax;
	late num newsPickOdds;
	late List<num> newsRefresh;
	late num newsRefreshNum;
	late int newsReviewOpenNum;
	late num pfBetData;
	late List<num> powerBetWin;
	late num professorMax;
	late num ptsGuessLine;
	late double sfBetData;
	late double sgBetData;
	late num winCoinPoint;

	NewsDefineEntity();

	factory NewsDefineEntity.fromJson(Map<String, dynamic> json) => $NewsDefineEntityFromJson(json);

	Map<String, dynamic> toJson() => $NewsDefineEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}