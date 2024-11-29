/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-28 16:51:02
 * @LastEditTime: 2024-11-29 09:46:49
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/tactic_grade_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/tactic_grade_entity.g.dart';

@JsonSerializable()
class TacticGradeEntity {
  late int id = 0;
  late String name = '';
  late List<TacticGradeCards> cards = [];
  late int percent = 0;

  TacticGradeEntity();

  factory TacticGradeEntity.fromJson(Map<String, dynamic> json) =>
      $TacticGradeEntityFromJson(json);

  Map<String, dynamic> toJson() => $TacticGradeEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TacticGradeCards {
  late int color = 0;
  late int value = 0;

  TacticGradeCards();

  factory TacticGradeCards.fromJson(Map<String, dynamic> json) =>
      $TacticGradeCardsFromJson(json);

  Map<String, dynamic> toJson() => $TacticGradeCardsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
