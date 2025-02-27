import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/girl_define_entity.g.dart';

export 'package:arm_chair_quaterback/generated/json/girl_define_entity.g.dart';

@JsonSerializable()
class GirlDefineEntity {
  late String age = '';
  late int buffTime = 0;
  late String eName = '';
  late String height = '';
  late String icon = '';
  late int id = 0;
  late String initialCharm = '';
  late double intimacyLevelRate = .0;
  @JSONField(name: 'intl‌')
  late String intl = '';
  late int maxIntimacyLevel = 1;
  late String name = '';
  late String quality = '';
  late List<String> signCondition = [];
  late List<String> switchCondition = [];
  late String threeDimensions = '';
  late int type = 1;
  late String weight = '';
  late String loveDesc = '';
  GirlDefineEntity();

  factory GirlDefineEntity.fromJson(Map<String, dynamic> json) => $GirlDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $GirlDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
