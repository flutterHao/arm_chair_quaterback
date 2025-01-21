/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-20 18:20:02
 * @LastEditTime: 2025-01-20 18:30:49
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/gilr_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/gilr_entity.g.dart';

@JsonSerializable()
class GirlEntity {
  late List<int> textColor = [];
  late List<int> backGroundColor = [];
  late int lightColor = 0;
  late String girlImg = '';
  late String grade = '';
  late int bgColor = 0;

  GirlEntity();

  factory GirlEntity.fromJson(Map<String, dynamic> json) =>
      $GirlEntityFromJson(json);

  Map<String, dynamic> toJson() => $GirlEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
