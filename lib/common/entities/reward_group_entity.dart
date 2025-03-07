import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/reward_group_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/reward_group_entity.g.dart';

@JsonSerializable()
class RewardGroupEntity {
  late String cnBack = '';
  late int groupId = 0;
  late List<int> propOrder = [];

  RewardGroupEntity();

  factory RewardGroupEntity.fromJson(Map<String, dynamic> json) =>
      $RewardGroupEntityFromJson(json);

  Map<String, dynamic> toJson() => $RewardGroupEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
