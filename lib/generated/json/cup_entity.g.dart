import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/cup_entity.dart';

CupEntity $CupEntityFromJson(Map<String, dynamic> json) {
  final CupEntity cupEntity = CupEntity();
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    cupEntity.createTime = createTime;
  }
  final int? cup = jsonConvert.convert<int>(json['cup']);
  if (cup != null) {
    cupEntity.cup = cup;
  }
  final int? cupRankId = jsonConvert.convert<int>(json['cupRankId']);
  if (cupRankId != null) {
    cupEntity.cupRankId = cupRankId;
  }
  final int? currentContinuousLoss = jsonConvert.convert<int>(
      json['currentContinuousLoss']);
  if (currentContinuousLoss != null) {
    cupEntity.currentContinuousLoss = currentContinuousLoss;
  }
  final int? currentGameWinningStreak = jsonConvert.convert<int>(
      json['currentGameWinningStreak']);
  if (currentGameWinningStreak != null) {
    cupEntity.currentGameWinningStreak = currentGameWinningStreak;
  }
  final int? currentWinGames = jsonConvert.convert<int>(
      json['currentWinGames']);
  if (currentWinGames != null) {
    cupEntity.currentWinGames = currentWinGames;
  }
  final int? maxCup = jsonConvert.convert<int>(json['maxCup']);
  if (maxCup != null) {
    cupEntity.maxCup = maxCup;
  }
  final int? maxGameWinningStreak = jsonConvert.convert<int>(
      json['maxGameWinningStreak']);
  if (maxGameWinningStreak != null) {
    cupEntity.maxGameWinningStreak = maxGameWinningStreak;
  }
  final int? rankProtect = jsonConvert.convert<int>(json['rankProtect']);
  if (rankProtect != null) {
    cupEntity.rankProtect = rankProtect;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    cupEntity.seasonId = seasonId;
  }
  final int? seasonTotalGames = jsonConvert.convert<int>(
      json['seasonTotalGames']);
  if (seasonTotalGames != null) {
    cupEntity.seasonTotalGames = seasonTotalGames;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    cupEntity.teamId = teamId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    cupEntity.updateTime = updateTime;
  }
  return cupEntity;
}

Map<String, dynamic> $CupEntityToJson(CupEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createTime'] = entity.createTime;
  data['cup'] = entity.cup;
  data['cupRankId'] = entity.cupRankId;
  data['currentContinuousLoss'] = entity.currentContinuousLoss;
  data['currentGameWinningStreak'] = entity.currentGameWinningStreak;
  data['currentWinGames'] = entity.currentWinGames;
  data['maxCup'] = entity.maxCup;
  data['maxGameWinningStreak'] = entity.maxGameWinningStreak;
  data['rankProtect'] = entity.rankProtect;
  data['seasonId'] = entity.seasonId;
  data['seasonTotalGames'] = entity.seasonTotalGames;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension CupEntityExtension on CupEntity {
  CupEntity copyWith({
    int? createTime,
    int? cup,
    int? cupRankId,
    int? currentContinuousLoss,
    int? currentGameWinningStreak,
    int? currentWinGames,
    int? maxCup,
    int? maxGameWinningStreak,
    int? rankProtect,
    int? seasonId,
    int? seasonTotalGames,
    int? teamId,
    int? updateTime,
  }) {
    return CupEntity()
      ..createTime = createTime ?? this.createTime
      ..cup = cup ?? this.cup
      ..cupRankId = cupRankId ?? this.cupRankId
      ..currentContinuousLoss = currentContinuousLoss ??
          this.currentContinuousLoss
      ..currentGameWinningStreak = currentGameWinningStreak ??
          this.currentGameWinningStreak
      ..currentWinGames = currentWinGames ?? this.currentWinGames
      ..maxCup = maxCup ?? this.maxCup
      ..maxGameWinningStreak = maxGameWinningStreak ?? this.maxGameWinningStreak
      ..rankProtect = rankProtect ?? this.rankProtect
      ..seasonId = seasonId ?? this.seasonId
      ..seasonTotalGames = seasonTotalGames ?? this.seasonTotalGames
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime;
  }
}