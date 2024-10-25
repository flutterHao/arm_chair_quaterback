import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/news_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/news_define_entity.g.dart';

@JsonSerializable()
class NewsDefineEntity {
  @JSONField(name: "ID")
  late int iD;
  late String betCost;
  late double betNearDouble;
  late double betOddsPoint;
  late List<double> betPlayerNum;
  late double betRewardRank;
  late double betSuccessPoint;
  late double betSuccessTimes;
  late double betSuccessTimesPoint;
  late List<String> btRankClose;
  late List<String> btRankOpen;
  late List<double> flexBet3;
  late List<double> flexBet4;
  late List<double> flexBet5;
  late List<double> flexBet6;
  late double gamePlay;
  late double gamePlayRecent;
  late List<double> newsBaseRead;
  late double newsCreatePickMax;
  late double newsCreatePlayerMax;
  late double newsPickOdds;
  late List<double> newsRefresh;
  late double newsRefreshNum;
  late int newsReviewOpenNum;
  late double pfBetData;
  late List<double> powerBetWin;
  late double professorMax;
  late double ptsGuessLine;
  late double sfBetData;
  late double sgBetData;
  late double winCoinPoint;

  NewsDefineEntity();

  factory NewsDefineEntity.fromJson(Map<String, dynamic> json) =>
      $NewsDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $NewsDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
