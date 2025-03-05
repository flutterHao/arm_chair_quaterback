/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-26 18:22:37
 * @LastEditTime: 2025-03-03 15:23:53
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/girls_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/girls_define_entity.g.dart';

@JsonSerializable()
class GirlsDefineEntity {
  late int age = 1;
  late int buffTime = 1;
  late String eName = "";
  late int height = 1;
  late String icon = "";
  late int id = 1;
  late int initialCharm = 1;
  late int intimacyLevelRate = 1;
  @JSONField(name: "intl1")
  late String intl = "";
  late int maxIntimacyLevel = 1;
  late String name = "";
  late int quality = 1;
  late List<int> signCondition = [];
  late List<int> switchCondition = [];
  late String threeDimensions = '';
  late int type = 1;
  late int weight = 1;

  GirlsDefineEntity();

  factory GirlsDefineEntity.fromJson(Map<String, dynamic> json) =>
      $GirlsDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $GirlsDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
