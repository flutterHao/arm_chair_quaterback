import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_game_info_v2_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_game_info_v2_entity.g.dart';

@JsonSerializable()
class GuessGameInfoV2Entity {
  late Map<String,List<GuessGameInfoEntity>?> guessInfo;
  late double streakReward;
  late int guessWinningStreak;

  GuessGameInfoV2Entity();

  factory GuessGameInfoV2Entity.fromJson(Map<String, dynamic> json) =>
      $GuessGameInfoV2EntityFromJson(json);

  Map<String, dynamic> toJson() => $GuessGameInfoV2EntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

