import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';


GuessGameInfoV2Entity $GuessGameInfoV2EntityFromJson(
    Map<String, dynamic> json) {
  final GuessGameInfoV2Entity guessGameInfoV2Entity = GuessGameInfoV2Entity();
  final GuessGameInfoV2GuessInfo? guessInfo = jsonConvert.convert<
      GuessGameInfoV2GuessInfo>(json['guessInfo']);
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
  data['guessInfo'] = entity.guessInfo.toJson();
  data['streakReward'] = entity.streakReward;
  data['guessWinningStreak'] = entity.guessWinningStreak;
  return data;
}

extension GuessGameInfoV2EntityExtension on GuessGameInfoV2Entity {
  GuessGameInfoV2Entity copyWith({
    GuessGameInfoV2GuessInfo? guessInfo,
    double? streakReward,
    int? guessWinningStreak,
  }) {
    return GuessGameInfoV2Entity()
      ..guessInfo = guessInfo ?? this.guessInfo
      ..streakReward = streakReward ?? this.streakReward
      ..guessWinningStreak = guessWinningStreak ?? this.guessWinningStreak;
  }
}

GuessGameInfoV2GuessInfo $GuessGameInfoV2GuessInfoFromJson(
    Map<String, dynamic> json) {
  final GuessGameInfoV2GuessInfo guessGameInfoV2GuessInfo = GuessGameInfoV2GuessInfo();
  final List<GuessGameInfoEntity>? threePm = (json['3pm'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GuessGameInfoEntity>(e) as GuessGameInfoEntity)
      .toList();
  if (threePm != null) {
    guessGameInfoV2GuessInfo.threePm = threePm;
  }
  final List<GuessGameInfoEntity>? ast = (json['ast'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GuessGameInfoEntity>(e) as GuessGameInfoEntity)
      .toList();
  if (ast != null) {
    guessGameInfoV2GuessInfo.ast = ast;
  }
  final List<GuessGameInfoEntity>? reb = (json['reb'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GuessGameInfoEntity>(e) as GuessGameInfoEntity)
      .toList();
  if (reb != null) {
    guessGameInfoV2GuessInfo.reb = reb;
  }
  final List<GuessGameInfoEntity>? pts = (json['pts'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GuessGameInfoEntity>(e) as GuessGameInfoEntity)
      .toList();
  if (pts != null) {
    guessGameInfoV2GuessInfo.pts = pts;
  }
  return guessGameInfoV2GuessInfo;
}

Map<String, dynamic> $GuessGameInfoV2GuessInfoToJson(
    GuessGameInfoV2GuessInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['3pm'] = entity.threePm.map((v) => v.toJson()).toList();
  data['ast'] = entity.ast.map((v) => v.toJson()).toList();
  data['reb'] = entity.reb.map((v) => v.toJson()).toList();
  data['pts'] = entity.pts.map((v) => v.toJson()).toList();
  return data;
}

extension GuessGameInfoV2GuessInfoExtension on GuessGameInfoV2GuessInfo {
  GuessGameInfoV2GuessInfo copyWith({
    List<GuessGameInfoEntity>? threePm,
    List<GuessGameInfoEntity>? ast,
    List<GuessGameInfoEntity>? reb,
    List<GuessGameInfoEntity>? pts,
  }) {
    return GuessGameInfoV2GuessInfo()
      ..threePm = threePm ?? this.threePm
      ..ast = ast ?? this.ast
      ..reb = reb ?? this.reb
      ..pts = pts ?? this.pts;
  }
}