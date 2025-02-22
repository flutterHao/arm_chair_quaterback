/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-18 17:21:25
 * @LastEditTime: 2025-02-21 11:07:46
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/cup_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/cup_define_entity.g.dart';

@JsonSerializable()
class CupDefineEntity {
  String backUp = '';
  int cupDailyReward = 0;
  List<int> cupNum = [1, 60];
  int cupNumId = 0;
  String cupPicId = '';
  String cupReward = '';
  String desc = '';
  int loseCup = 0;
  List<int> loserMoney = [];
  int substituteSum = 1;
  int winCup = 20;
  List<int> winMoney = [];
  int cupInTrainMoney = 0;
  int cupInBattleMoney = 0;

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
