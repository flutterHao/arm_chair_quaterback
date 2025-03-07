/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-14 21:42:18
 * @LastEditTime: 2024-12-23 11:43:11
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
  List<int> reward = [];
  late int taskRound = 0;
  late int propId = 0;
  late int propNum = 0;

  TrainTaskEntity();

  factory TrainTaskEntity.fromJson(Map<String, dynamic> json) {
    var item = $TrainTaskEntityFromJson(json);
    var list =
        item.taskReward.split("_").map((e) => int.tryParse(e) ?? 1).toList();
    if (list.length == 3) {
      item.propId = list[1];
      item.propNum = list[2];
    }
    return item;
  }

  Map<String, dynamic> toJson() => $TrainTaskEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
