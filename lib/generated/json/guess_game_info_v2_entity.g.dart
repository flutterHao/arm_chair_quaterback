import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';


GuessGameInfoV2Entity $GuessGameInfoV2EntityFromJson(
    Map<String, dynamic> json) {
  final GuessGameInfoV2Entity guessGameInfoV2Entity = GuessGameInfoV2Entity();
  final Map<String, List<GuessGameInfoEntity>?>? guessInfo =
  (json['guessInfo'] as Map<String, dynamic>).map(
          (k, e) =>
          MapEntry(k, e == null ? null : (e as List<dynamic>?)?.map(
                  (e) =>
              jsonConvert.convert<GuessGameInfoEntity>(
                  e) as GuessGameInfoEntity).toList()));
  if (guessInfo != null) {
    guessGameInfoV2Entity.guessInfo = guessInfo;
  }
  final double? streakReward = jsonConvert.convert<double>(
      json['streakReward']);
  if (streakReward != null) {
    guessGameInfoV2Entity.streakReward = streakReward;
  }
  final int? guessWinningStreak = jsonConvert.convert<int>(
      json['guessWinningStreak']);
  if (guessWinningStreak != null) {
    guessGameInfoV2Entity.guessWinningStreak = guessWinningStreak;
  }
  return guessGameInfoV2Entity;
}

Map<String, dynamic> $GuessGameInfoV2EntityToJson(
    GuessGameInfoV2Entity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessInfo'] = entity.guessInfo;
  data['streakReward'] = entity.streakReward;
  data['guessWinningStreak'] = entity.guessWinningStreak;
  return data;
}

extension GuessGameInfoV2EntityExtension on GuessGameInfoV2Entity {
  GuessGameInfoV2Entity copyWith({
    Map<String, List<GuessGameInfoEntity>?>? guessInfo,
    double? streakReward,
    int? guessWinningStreak,
  }) {
    return GuessGameInfoV2Entity()
      ..guessInfo = guessInfo ?? this.guessInfo
      ..streakReward = streakReward ?? this.streakReward
      ..guessWinningStreak = guessWinningStreak ?? this.guessWinningStreak;
  }
}