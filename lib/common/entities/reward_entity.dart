import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'dart:convert';
import 'package:arm_chair_quaterback/generated/json/reward_entity.g.dart';

@JsonSerializable()
class RewardEntity {
  late int num = 0;
  late int id = 0;
  late int type = 0;

  RewardEntity();

  factory RewardEntity.fromJson(Map<String, dynamic> json) =>
      $RewardEntityFromJson(json);

  Map<String, dynamic> toJson() => $RewardEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
