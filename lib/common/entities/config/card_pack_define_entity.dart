/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-23 16:59:43
 * @LastEditTime: 2025-01-10 10:30:58
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/card_pack_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/card_pack_define_entity.g.dart';

@JsonSerializable()
class CardPackDefineEntity {
  late List<int> cardMoneyRange = [];
  late int cardPackID = 0;
  late int cardPackOpenNow = 0;
  late int cardPackOpenTime = 0;
  late int cardPackPlayerNum = 0;
  late int cardPackSelectNum = 0;
  late List<int> cardPackWeight = [];
  late List<int> cardPlayerNum = [];
  late List<int> cupConWeight = [];
  late int hideOpenNow = 0;
  late String cardPackName = "";

  CardPackDefineEntity();

  factory CardPackDefineEntity.fromJson(Map<String, dynamic> json) =>
      $CardPackDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $CardPackDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
