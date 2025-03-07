import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/player_strength_rank_entity.dart';

PlayerStrengthRankEntity $PlayerStrengthRankEntityFromJson(
    Map<String, dynamic> json) {
  final PlayerStrengthRankEntity playerStrengthRankEntity = PlayerStrengthRankEntity();
  final List<
      PlayerStrengthRankTrendList>? trendList = (json['trendList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PlayerStrengthRankTrendList>(
          e) as PlayerStrengthRankTrendList).toList();
  if (trendList != null) {
    playerStrengthRankEntity.trendList = trendList;
  }
  final int? strength = jsonConvert.convert<int>(json['strength']);
  if (strength != null) {
    playerStrengthRankEntity.strength = strength;
  }
  final int? rank = jsonConvert.convert<int>(json['rank']);
  if (rank != null) {
    playerStrengthRankEntity.rank = rank;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    playerStrengthRankEntity.playerId = playerId;
  }
  return playerStrengthRankEntity;
}

Map<String, dynamic> $PlayerStrengthRankEntityToJson(
    PlayerStrengthRankEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['trendList'] = entity.trendList.map((v) => v.toJson()).toList();
  data['strength'] = entity.strength;
  data['rank'] = entity.rank;
  data['playerId'] = entity.playerId;
  return data;
}

extension PlayerStrengthRankEntityExtension on PlayerStrengthRankEntity {
  PlayerStrengthRankEntity copyWith({
    List<PlayerStrengthRankTrendList>? trendList,
    int? strength,
    int? rank,
    int? playerId,
  }) {
    return PlayerStrengthRankEntity()
      ..trendList = trendList ?? this.trendList
      ..strength = strength ?? this.strength
      ..rank = rank ?? this.rank
      ..playerId = playerId ?? this.playerId;
  }
}

PlayerStrengthRankTrendList $PlayerStrengthRankTrendListFromJson(
    Map<String, dynamic> json) {
  final PlayerStrengthRankTrendList playerStrengthRankTrendList = PlayerStrengthRankTrendList();
  final int? playerMarketPrice = jsonConvert.convert<int>(
      json['playerMarketPrice']);
  if (playerMarketPrice != null) {
    playerStrengthRankTrendList.playerMarketPrice = playerMarketPrice;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    playerStrengthRankTrendList.createTime = createTime;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    playerStrengthRankTrendList.playerScore = playerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    playerStrengthRankTrendList.updateTime = updateTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    playerStrengthRankTrendList.playerStrength = playerStrength;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    playerStrengthRankTrendList.playerId = playerId;
  }
  return playerStrengthRankTrendList;
}

Map<String, dynamic> $PlayerStrengthRankTrendListToJson(
    PlayerStrengthRankTrendList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerMarketPrice'] = entity.playerMarketPrice;
  data['createTime'] = entity.createTime;
  data['playerScore'] = entity.playerScore;
  data['updateTime'] = entity.updateTime;
  data['playerStrength'] = entity.playerStrength;
  data['playerId'] = entity.playerId;
  return data;
}

extension PlayerStrengthRankTrendListExtension on PlayerStrengthRankTrendList {
  PlayerStrengthRankTrendList copyWith({
    int? playerMarketPrice,
    int? createTime,
    int? playerScore,
    int? updateTime,
    int? playerStrength,
    int? playerId,
  }) {
    return PlayerStrengthRankTrendList()
      ..playerMarketPrice = playerMarketPrice ?? this.playerMarketPrice
      ..createTime = createTime ?? this.createTime
      ..playerScore = playerScore ?? this.playerScore
      ..updateTime = updateTime ?? this.updateTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..playerId = playerId ?? this.playerId;
  }
}