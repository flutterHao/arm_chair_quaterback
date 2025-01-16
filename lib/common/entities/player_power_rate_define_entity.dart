/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-15 16:38:41
 * @LastEditTime: 2025-01-15 17:02:13
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_power_rate_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/player_power_rate_define_entity.g.dart';

@JsonSerializable()
class PlayerPowerRateDefineEntity {
  late String backUp = "";
  late int blk = 1;
  late int ftm = 1;
  late int pass = 1;
  late int powerId = 1;
  late int pts = 1;
  late int reb = 1;
  late int stl = 1;
  late int tech = 1;
  late int threePm = 1;

  PlayerPowerRateDefineEntity();

  factory PlayerPowerRateDefineEntity.fromJson(Map<String, dynamic> json) =>
      $PlayerPowerRateDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlayerPowerRateDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
