/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-12 17:54:17
 * @LastEditTime: 2024-11-14 14:41:00
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/card_pack_info_entity.g.dart';
import 'dart:convert';

import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/card_pack_info_entity.g.dart';

@JsonSerializable()
class CardPackInfoEntity {
  late int rankIndex = 0;
  late int createTime = 0;
  late int teamId = 0;
  late int cardPackGrade = 0;
  late int freeGiftTime = 0;
  late int updateTime = 0;
  late List<CardPackInfoCard> card = [];
  late int freeGiftCount = 0;
  @JSONField(deserialize: false)
  RxString freeTimeString = "00:00:00".obs;

  CardPackInfoEntity();

  factory CardPackInfoEntity.fromJson(Map<String, dynamic> json) =>
      $CardPackInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $CardPackInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CardPackInfoCard {
  late int cardId = 0;
  late int openTime = 0;
  late int status = 0;
  @JSONField(deserialize: false)
  late RxString remainTime = "00:00".obs;
  @JSONField(deserialize: false)
  double progress = 0;

  CardPackInfoCard({this.status = 0});

  factory CardPackInfoCard.fromJson(Map<String, dynamic> json) =>
      $CardPackInfoCardFromJson(json);

  Map<String, dynamic> toJson() => $CardPackInfoCardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
