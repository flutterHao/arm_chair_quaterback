/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-27 15:51:57
 * @LastEditTime: 2025-02-28 15:05:05
 */
import 'package:arm_chair_quaterback/common/entities/girl_dialogue_define_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/girl_chat_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/girl_chat_entity.g.dart';

@JsonSerializable()
class GirlChatEntity {
  late int currentMessageId = 0;
  late List<GirlDialogueDefineEntity> historicalChatRecords = [];
  // @JSONField(deserialize: false, serialize: false)
  // late List<GirlDialogueDefineEntity> chatList = [];
  late GirlChatGirl girl = GirlChatGirl();

  GirlChatEntity();

  factory GirlChatEntity.fromJson(Map<String, dynamic> json) =>
      $GirlChatEntityFromJson(json);

  Map<String, dynamic> toJson() => $GirlChatEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GirlChatGirl {
  late int currentPlotId = 0;
  late int currentSuit = 0;
  late int charm = 0;
  late int currentChatId = 0;
  late int signTime = 0;
  late int girlId = 0;
  late int teamId = 0;
  late int sign = 0;
  late List<dynamic> suitList = [];
  late int exchange = 0;
  late int intimacyLevel = 0;
  late int id = 0;

  GirlChatGirl();

  factory GirlChatGirl.fromJson(Map<String, dynamic> json) =>
      $GirlChatGirlFromJson(json);

  Map<String, dynamic> toJson() => $GirlChatGirlToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
