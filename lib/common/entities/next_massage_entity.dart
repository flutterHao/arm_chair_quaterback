import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/next_massage_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/next_massage_entity.g.dart';

@JsonSerializable()
class NextMessageEntity {
  late int storyId = 0;
  late int messageDefineId = 0;
  late int girlId = 0;
  late int teamId = 0;
  late String context = '';
  late int id = 0;
  late int type = 0;
  late bool receiveReward = false;

  NextMessageEntity();

  factory NextMessageEntity.fromJson(Map<String, dynamic> json) =>
      $NextMessageEntityFromJson(json);

  Map<String, dynamic> toJson() => $NextMessageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
