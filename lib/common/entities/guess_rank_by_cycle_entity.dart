import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_rank_by_cycle_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_rank_by_cycle_entity.g.dart';

@JsonSerializable()
class GuessRankByCycleEntity {
  late int nowCycleEndTime = 0;
  late List<RankInfoEntity> ranks = [];
  late int lastRankTime = 0;
  late RankListMyRank myRank;
  late int nowCycleStartTime = 0;
  late int firstRankTime = 0;

  GuessRankByCycleEntity();

  factory GuessRankByCycleEntity.fromJson(Map<String, dynamic> json) =>
      $GuessRankByCycleEntityFromJson(json);

  Map<String, dynamic> toJson() => $GuessRankByCycleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
