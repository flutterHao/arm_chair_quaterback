import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/help_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/help_entity.g.dart';

@JsonSerializable()
class HelpEntity {
  late String desc = '';
  late String helpDesc = '';
  late int helpId = 0;
  late String helpName = '';

  HelpEntity();

  factory HelpEntity.fromJson(Map<String, dynamic> json) =>
      $HelpEntityFromJson(json);

  Map<String, dynamic> toJson() => $HelpEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
