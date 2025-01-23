/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-20 19:46:30
 * @LastEditTime: 2025-01-23 19:31:57
 */
import 'package:arm_chair_quaterback/common/entities/battle_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/pk_start_updated_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/pk_start_updated_entity.g.dart';

@JsonSerializable()
class PkStartUpdatedEntity {
  late int pokerWinner = 0;
  late List<TrainingInfoBuff> homeTeamWinPokers = [];
  late List<TrainingInfoBuff> awayTeamWinPokers = [];
  late double pokerRate = 0;
  late double homeTeamStrength = 0;
  late double awayTeamStrength = 0;

  PkStartUpdatedEntity();

  factory PkStartUpdatedEntity.fromJson(Map<String, dynamic> json) =>
      $PkStartUpdatedEntityFromJson(json);

  Map<String, dynamic> toJson() => $PkStartUpdatedEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
