/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-14 21:42:18
 * @LastEditTime: 2024-10-15 10:44:11
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/train_task_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/train_task_entity.g.dart';

@JsonSerializable()
class TrainTaskEntity {
  late int taskLevel = 0;
  late int taskNeed = 0;
  late String taskReward = '';
  late int taskRound = 0;

  TrainTaskEntity();

  factory TrainTaskEntity.fromJson(Map<String, dynamic> json) =>
      $TrainTaskEntityFromJson(json);

  Map<String, dynamic> toJson() => $TrainTaskEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
