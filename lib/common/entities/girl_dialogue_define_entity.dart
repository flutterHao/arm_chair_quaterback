/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-27 16:30:28
 * @LastEditTime: 2025-03-03 17:44:56
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/girl_dialogue_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/girl_dialogue_define_entity.g.dart';

@JsonSerializable()
class GirlDialogueDefineEntity {
  late List<String> choices = [];
  @JSONField(name: 'choices')
  late String choicesStr = "";
  late String dialogue = '';
  late int girlId = 0;
  late int id = 0;
  late List<int> nextDialogue = [];
  late int storyLineId = 0;
  late int textType = 0;
  late int type = 2;
  late int updateTime = 0;
  late String context = "";
  @JSONField(name: 'storyId')
  late int myStoryId = 1;
  late int messageDefineId = 101001;
  late String award = "1_103_4";

  GirlDialogueDefineEntity();

  factory GirlDialogueDefineEntity.fromJson(Map<String, dynamic> json) =>
      $GirlDialogueDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $GirlDialogueDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
