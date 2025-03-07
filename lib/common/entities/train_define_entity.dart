/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-11-14 11:47:53
 * @LastEditTime: 2025-02-25 17:23:49
 */
import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/train_define_entity.g.dart';

export 'package:arm_chair_quaterback/generated/json/train_define_entity.g.dart';

@JsonSerializable()
class TrainDefineEntity {
  late int coinBuySlot = 0;
  late int ballMaxNum = 0;
  late int ballRecoverNum = 0;
  late int ballRecoverTime = 0;
  late int coinChangeBall = 0;
  late int id = 0;
  late List<int> lineOrder = [];
  late double shootInWeight = 0;
  late List<int> taskCollect = [];
  late int taskRefresh = 0;
  late int taskTrigger = 0;
  late List<int> trainBuffAdd = [];
  late List<int> trainLessMoney = [];
  late List<int> trainMoneyCon = [];
  late List<int> trainCoinNum = [];
  late List<int> trainNormalMoney = [];
  late List<int> trainRecoverStats = [];
  late List<int> trainRewardBall = [];
  @JSONField(name: 'giveUpTatics')
  late List<int> giveUpTactics = [];
  late String refreshPlayerCost = "1_103_10";

  TrainDefineEntity();

  factory TrainDefineEntity.fromJson(Map<String, dynamic> json) =>
      $TrainDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $TrainDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
