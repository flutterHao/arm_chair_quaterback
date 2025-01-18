import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/prop_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/prop_define_entity.g.dart';

@JsonSerializable()
class PropDefineEntity {
  late int batchCount = 0;
  late int composeId = 0;
  late String desc = '';
  late int effectType = 0;
  late int effectValue = 0;
  late String getWayDesc = '';
  late int isBatchUse = 0;
  late int isSell = 0;
  late int isShow = 0;
  late int isUse = 0;
  late int limitUp = 0;
  late int linkId = 0;
  late int linkId2 = 0;
  late String propChn = '';
  late String propIcon = '';
  late int propId = 0;
  late String propName = '';
  late int propType = 0;
  late int quality = 0;
  late int sellPropId = 0;
  late int sellPropNum = 0;
  late int sortWeight = 0;

  PropDefineEntity();

  factory PropDefineEntity.fromJson(Map<String, dynamic> json) =>
      $PropDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $PropDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
