/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-11 20:50:24
 * @LastEditTime: 2024-12-09 17:09:50
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/star_up_define_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class StarUpDefineEntity {
  late double starUpRange = 0;
  late String potantialRang = "";
  late int starUp = 0;
  late double starUpSell = 0;
  late double starUpline = 0;
  late double starRatingCoefficient = 0.0;
  late int starPlayerNum = 0;

  StarUpDefineEntity();

  factory StarUpDefineEntity.fromJson(Map<String, dynamic> json) =>
      $StarUpDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $StarUpDefineEntityToJson(this);

  double getPotantialMin() {
    return double.parse(potantialRang.split(",")[0]) * 100;
  }

  double getPotantialMax() {
    return double.parse(
            potantialRang.split(",")[potantialRang.length == 1 ? 0 : 1]) *
        100;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
