import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/week_lucky_count_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/week_lucky_count_entity.g.dart';

@JsonSerializable()
class WeekLuckyCountEntity {
  int value5 = 0;
  int value2 = 0;
  /// luckyCoin 周消耗
  int value1 = 0;
  int catalogs = 0;
  int value4 = 0;
  int teamId = 0;
  int resetTime = 0;

  WeekLuckyCountEntity();

  factory WeekLuckyCountEntity.fromJson(Map<String, dynamic> json) =>
      $WeekLuckyCountEntityFromJson(json);

  Map<String, dynamic> toJson() => $WeekLuckyCountEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
