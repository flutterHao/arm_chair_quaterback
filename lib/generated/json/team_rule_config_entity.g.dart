import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_rule_config_entity.dart';

TeamRuleConfigEntity $TeamRuleConfigEntityFromJson(Map<String, dynamic> json) {
  final TeamRuleConfigEntity teamRuleConfigEntity = TeamRuleConfigEntity();
  final String? benchCount = jsonConvert.convert<String>(json['benchCount']);
  if (benchCount != null) {
    teamRuleConfigEntity.benchCount = benchCount;
  }
  final String? dailyCoins = jsonConvert.convert<String>(json['dailyCoins']);
  if (dailyCoins != null) {
    teamRuleConfigEntity.dailyCoins = dailyCoins;
  }
  final String? draftSignList = jsonConvert.convert<String>(
      json['draftSignList']);
  if (draftSignList != null) {
    teamRuleConfigEntity.draftSignList = draftSignList;
  }
  final String? grade = jsonConvert.convert<String>(json['grade']);
  if (grade != null) {
    teamRuleConfigEntity.grade = grade;
  }
  final String? idleSlot = jsonConvert.convert<String>(json['idleSlot']);
  if (idleSlot != null) {
    teamRuleConfigEntity.idleSlot = idleSlot;
  }
  final String? playerExp = jsonConvert.convert<String>(json['playerExp']);
  if (playerExp != null) {
    teamRuleConfigEntity.playerExp = playerExp;
  }
  final String? playerSupportCount = jsonConvert.convert<String>(
      json['playerSupportCount']);
  if (playerSupportCount != null) {
    teamRuleConfigEntity.playerSupportCount = playerSupportCount;
  }
  final String? salaryCap = jsonConvert.convert<String>(json['salaryCap']);
  if (salaryCap != null) {
    teamRuleConfigEntity.salaryCap = salaryCap;
  }
  final String? scoutFavorPlayer = jsonConvert.convert<String>(
      json['scoutFavorPlayer']);
  if (scoutFavorPlayer != null) {
    teamRuleConfigEntity.scoutFavorPlayer = scoutFavorPlayer;
  }
  final String? totalPlayerExp = jsonConvert.convert<String>(
      json['totalPlayerExp']);
  if (totalPlayerExp != null) {
    teamRuleConfigEntity.totalPlayerExp = totalPlayerExp;
  }
  final String? totalTeamExp = jsonConvert.convert<String>(
      json['totalTeamExp']);
  if (totalTeamExp != null) {
    teamRuleConfigEntity.totalTeamExp = totalTeamExp;
  }
  return teamRuleConfigEntity;
}

Map<String, dynamic> $TeamRuleConfigEntityToJson(TeamRuleConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['benchCount'] = entity.benchCount;
  data['dailyCoins'] = entity.dailyCoins;
  data['draftSignList'] = entity.draftSignList;
  data['grade'] = entity.grade;
  data['idleSlot'] = entity.idleSlot;
  data['playerExp'] = entity.playerExp;
  data['playerSupportCount'] = entity.playerSupportCount;
  data['salaryCap'] = entity.salaryCap;
  data['scoutFavorPlayer'] = entity.scoutFavorPlayer;
  data['totalPlayerExp'] = entity.totalPlayerExp;
  data['totalTeamExp'] = entity.totalTeamExp;
  return data;
}

extension TeamRuleConfigEntityExtension on TeamRuleConfigEntity {
  TeamRuleConfigEntity copyWith({
    String? benchCount,
    String? dailyCoins,
    String? draftSignList,
    String? grade,
    String? idleSlot,
    String? playerExp,
    String? playerSupportCount,
    String? salaryCap,
    String? scoutFavorPlayer,
    String? totalPlayerExp,
    String? totalTeamExp,
  }) {
    return TeamRuleConfigEntity()
      ..benchCount = benchCount ?? this.benchCount
      ..dailyCoins = dailyCoins ?? this.dailyCoins
      ..draftSignList = draftSignList ?? this.draftSignList
      ..grade = grade ?? this.grade
      ..idleSlot = idleSlot ?? this.idleSlot
      ..playerExp = playerExp ?? this.playerExp
      ..playerSupportCount = playerSupportCount ?? this.playerSupportCount
      ..salaryCap = salaryCap ?? this.salaryCap
      ..scoutFavorPlayer = scoutFavorPlayer ?? this.scoutFavorPlayer
      ..totalPlayerExp = totalPlayerExp ?? this.totalPlayerExp
      ..totalTeamExp = totalTeamExp ?? this.totalTeamExp;
  }
}