import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/rank_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/rank_info_entity.g.dart';

@JsonSerializable()
class RankInfoEntity {
  late double guessCount;
  late double teamLogo;
  late String teamName;
  late double chip;
  late double createTime;
  late double success;
  late int teamId;
  late double updateTime;
  late double win;

  RankInfoEntity();

  factory RankInfoEntity.fromJson(Map<String, dynamic> json) =>
      $RankInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $RankInfoEntityToJson(this);

  String get getWin => win.toStringAsFixed(0);
  String get getSuccess => (success * 100).toStringAsFixed(0);
  @override
  String toString() {
    return jsonEncode(this);
  }
}
