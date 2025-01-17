import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/cup_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/cup_define_entity.g.dart';

@JsonSerializable()
class CupDefineEntity {
  late String backUp = '';
  late int cupDailyReward = 0;
  late List<int> cupNum = [];
  late int cupNumId = 0;
  late int cupPicId = 0;
  late String cupReward = '';
  late String desc = '';
  late int loseCup = 0;
  late List<int> loserMoney = [];
  late int substituteSum = 1;
  late int winCup = 20;
  late List<int> winMoney = [];

  CupDefineEntity();

  factory CupDefineEntity.fromJson(Map<String, dynamic> json) =>
      $CupDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $CupDefineEntityToJson(this);
  int getCupMax() {
    return cupNum[1];
  }

  int getCupMin() {
    return cupNum[0];
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
