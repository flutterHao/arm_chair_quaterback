import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_rule_config_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_rule_config_entity.g.dart';

@JsonSerializable()
class TeamRuleConfigEntity {
  late String benchCount;
  late String dailyCoins;
  late String draftSignList;
  late String grade;
  late String idleSlot;
  late String playerExp;
  late String playerSupportCount;
  late String salaryCap;
  late String scoutFavorPlayer;
  late String totalPlayerExp;
  late String totalTeamExp;

  TeamRuleConfigEntity();

  factory TeamRuleConfigEntity.fromJson(Map<String, dynamic> json) =>
      $TeamRuleConfigEntityFromJson(json);

  Map<String, dynamic> toJson() => $TeamRuleConfigEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
