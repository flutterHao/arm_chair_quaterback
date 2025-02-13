import 'package:arm_chair_quaterback/common/entities/week_lucky_count_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/turn_table_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/turn_table_entity.g.dart';

@JsonSerializable()
class TurnTableEntity {
  String? currentAward;
  int cardProgress = 0;
  int createTime = 0;
  int currentId = 0;
  int currentLife = 0;
  String functionAward = '';
  int reLifeCount = 0;
  int teamId = 0;
  int vgCount = 0;
  int updateTime = 0;
  int circle = 0;

  /// 类型_id_数量 ，用 ｜ 分割；
  String awardPool = '';

  /// 0 初始状态 1 上次未结束
  int isStart = 0;

  /// 比赛比分
  String? matchScore;

  /// 随机奖励中奖id（抽中问号后要展示的中奖id）
  int unKnowRewardId = 0;

  WeekLuckyCountEntity turntableRecord = WeekLuckyCountEntity();

  TurnTableEntity();

  factory TurnTableEntity.fromJson(Map<String, dynamic> json) =>
      $TurnTableEntityFromJson(json);

  Map<String, dynamic> toJson() => $TurnTableEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
