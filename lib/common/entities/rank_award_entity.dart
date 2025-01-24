import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/rank_award_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/rank_award_entity.g.dart';

@JsonSerializable()
class RankAwardEntity {
  late String awardData;
  late String disc;
  late String id;
  late String maxRank;
  late String minRank;
  late String paramValue;
  late String rankAwardType;

  RankAwardEntity();

  factory RankAwardEntity.fromJson(Map<String, dynamic> json) =>
      $RankAwardEntityFromJson(json);

  Map<String, dynamic> toJson() => $RankAwardEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
