import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/star_up_define_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class StarUpDefineEntity {
  @JSONField(name: "StarUpRange")
  late double starUpRange;
  late String potantialRang;
  late double starUp;
  late double starUpSell;
  late double starUpline;

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
