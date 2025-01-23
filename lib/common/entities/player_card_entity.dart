/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-12-17 21:56:49
 * @LastEditTime: 2025-01-23 12:14:48
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_card_entity.g.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/player_card_entity.g.dart';

@JsonSerializable()
class PlayerCardEntity {
  @JSONField(serialize: false, deserialize: false)
  late RxBool isSelect = false.obs;
  @JSONField(serialize: false, deserialize: false)
  late RxBool isOpen = true.obs;
  late int playerId = 0;
  @JSONField(serialize: false, deserialize: false)
  late Rx<Offset> offset = Offset(0, 0).obs;
  @JSONField(serialize: false, deserialize: false)
  late Rx<double> rotation = 0.0.obs;

  PlayerCardEntity({this.playerId = 0});

  factory PlayerCardEntity.fromJson(Map<String, dynamic> json) =>
      $PlayerCardEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlayerCardEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
