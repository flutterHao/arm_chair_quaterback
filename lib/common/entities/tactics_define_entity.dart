/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-28 17:29:21
 * @LastEditTime: 2024-11-28 17:30:46
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/tactics_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/tactics_define_entity.g.dart';

@JsonSerializable()
class TacticsDefineEntity {
  late int degreeAdd = 0;
  late String tacticStruct = '';
  late int tacticTypeGrade = 0;
  late int tacticTypeId = 0;

  TacticsDefineEntity();

  factory TacticsDefineEntity.fromJson(Map<String, dynamic> json) =>
      $TacticsDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $TacticsDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
