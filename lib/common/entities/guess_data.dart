import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_data.g.dart';

///
///@auther gejiahui
///created at 2024/10/24/16:53

@JsonSerializable()
class GuessData {
  late String guessAttr;
  late int guessChoice;
  late int guessTime;
  late List<Awards> awards;
  late bool success;
  late int guessReferenceValue;
  late int guessGameAttrValue;
  late int winPro;
  /// 1：未结算 2：已结算未领取奖励 3：已结算已领取奖励
  late int status;

  GuessData();

  factory GuessData.fromJson(Map<String, dynamic> json) =>
      $GuessDataFromJson(json);

  Map<String, dynamic> toJson() => $GuessDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class Awards {
  late int id;
  late int num;
  late int type;

  Awards();

  factory Awards.fromJson(Map<String, dynamic> json) => $AwardsFromJson(json);

  Map<String, dynamic> toJson() => $AwardsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
