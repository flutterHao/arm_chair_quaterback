import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/game_schedules_entity.dart';

GameSchedulesEntity $GameSchedulesEntityFromJson(Map<String, dynamic> json) {
  final GameSchedulesEntity gameSchedulesEntity = GameSchedulesEntity();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameSchedulesEntity.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    gameSchedulesEntity.gameType = gameType;
  }
  final int? homeScore = jsonConvert.convert<int>(json['homeScore']);
  if (homeScore != null) {
    gameSchedulesEntity.homeScore = homeScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameSchedulesEntity.updateTime = updateTime;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    gameSchedulesEntity.gameTime = gameTime;
  }
  final int? awayScore = jsonConvert.convert<int>(json['awayScore']);
  if (awayScore != null) {
    gameSchedulesEntity.awayScore = awayScore;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameSchedulesEntity.createTime = createTime;
  }
  final String? awayTeamName = jsonConvert.convert<String>(
      json['awayTeamName']);
  if (awayTeamName != null) {
    gameSchedulesEntity.awayTeamName = awayTeamName;
  }
  final int? homeLeagueId = jsonConvert.convert<int>(json['homeLeagueId']);
  if (homeLeagueId != null) {
    gameSchedulesEntity.homeLeagueId = homeLeagueId;
  }
  final int? awayLeagueId = jsonConvert.convert<int>(json['awayLeagueId']);
  if (awayLeagueId != null) {
    gameSchedulesEntity.awayLeagueId = awayLeagueId;
  }
  final int? awayTeamLogo = jsonConvert.convert<int>(json['awayTeamLogo']);
  if (awayTeamLogo != null) {
    gameSchedulesEntity.awayTeamLogo = awayTeamLogo;
  }
  final int? homeTeamLogo = jsonConvert.convert<int>(json['homeTeamLogo']);
  if (homeTeamLogo != null) {
    gameSchedulesEntity.homeTeamLogo = homeTeamLogo;
  }
  final String? homeTeamName = jsonConvert.convert<String>(
      json['homeTeamName']);
  if (homeTeamName != null) {
    gameSchedulesEntity.homeTeamName = homeTeamName;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    gameSchedulesEntity.homeTeamId = homeTeamId;
  }
  final String? awayLeagueName = jsonConvert.convert<String>(
      json['awayLeagueName']);
  if (awayLeagueName != null) {
    gameSchedulesEntity.awayLeagueName = awayLeagueName;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    gameSchedulesEntity.awayTeamId = awayTeamId;
  }
  final String? homeLeagueName = jsonConvert.convert<String>(
      json['homeLeagueName']);
  if (homeLeagueName != null) {
    gameSchedulesEntity.homeLeagueName = homeLeagueName;
  }
  return gameSchedulesEntity;
}

Map<String, dynamic> $GameSchedulesEntityToJson(GameSchedulesEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['homeScore'] = entity.homeScore;
  data['updateTime'] = entity.updateTime;
  data['gameTime'] = entity.gameTime;
  data['awayScore'] = entity.awayScore;
  data['createTime'] = entity.createTime;
  data['awayTeamName'] = entity.awayTeamName;
  data['homeLeagueId'] = entity.homeLeagueId;
  data['awayLeagueId'] = entity.awayLeagueId;
  data['awayTeamLogo'] = entity.awayTeamLogo;
  data['homeTeamLogo'] = entity.homeTeamLogo;
  data['homeTeamName'] = entity.homeTeamName;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayLeagueName'] = entity.awayLeagueName;
  data['awayTeamId'] = entity.awayTeamId;
  data['homeLeagueName'] = entity.homeLeagueName;
  return data;
}

extension GameSchedulesEntityExtension on GameSchedulesEntity {
  GameSchedulesEntity copyWith({
    int? gameId,
    int? gameType,
    int? homeScore,
    int? updateTime,
    int? gameTime,
    int? awayScore,
    int? createTime,
    String? awayTeamName,
    int? homeLeagueId,
    int? awayLeagueId,
    int? awayTeamLogo,
    int? homeTeamLogo,
    String? homeTeamName,
    int? homeTeamId,
    String? awayLeagueName,
    int? awayTeamId,
    String? homeLeagueName,
  }) {
    return GameSchedulesEntity()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..homeScore = homeScore ?? this.homeScore
      ..updateTime = updateTime ?? this.updateTime
      ..gameTime = gameTime ?? this.gameTime
      ..awayScore = awayScore ?? this.awayScore
      ..createTime = createTime ?? this.createTime
      ..awayTeamName = awayTeamName ?? this.awayTeamName
      ..homeLeagueId = homeLeagueId ?? this.homeLeagueId
      ..awayLeagueId = awayLeagueId ?? this.awayLeagueId
      ..awayTeamLogo = awayTeamLogo ?? this.awayTeamLogo
      ..homeTeamLogo = homeTeamLogo ?? this.homeTeamLogo
      ..homeTeamName = homeTeamName ?? this.homeTeamName
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayLeagueName = awayLeagueName ?? this.awayLeagueName
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..homeLeagueName = homeLeagueName ?? this.homeLeagueName;
  }
}