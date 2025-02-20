import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';


GameSchedulesInfo $GameSchedulesInfoFromJson(Map<String, dynamic> json) {
  final GameSchedulesInfo gameSchedulesInfo = GameSchedulesInfo();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameSchedulesInfo.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    gameSchedulesInfo.gameType = gameType;
  }
  final List<
      dynamic>? homePlayerScoreList = (json['homePlayerScoreList'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (homePlayerScoreList != null) {
    gameSchedulesInfo.homePlayerScoreList = homePlayerScoreList;
  }
  final List<
      dynamic>? awayPlayerScoreList = (json['awayPlayerScoreList'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (awayPlayerScoreList != null) {
    gameSchedulesInfo.awayPlayerScoreList = awayPlayerScoreList;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    gameSchedulesInfo.gameTime = gameTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameSchedulesInfo.createTime = createTime;
  }
  final int? gst = jsonConvert.convert<int>(json['gameStartTime']);
  if (gst != null) {
    gameSchedulesInfo.gst = gst;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    gameSchedulesInfo.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    gameSchedulesInfo.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    gameSchedulesInfo.awayTeamScore = awayTeamScore;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    gameSchedulesInfo.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    gameSchedulesInfo.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    gameSchedulesInfo.status = status;
  }
  return gameSchedulesInfo;
}

Map<String, dynamic> $GameSchedulesInfoToJson(GameSchedulesInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['homePlayerScoreList'] = entity.homePlayerScoreList;
  data['awayPlayerScoreList'] = entity.awayPlayerScoreList;
  data['gameTime'] = entity.gameTime;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gst;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension GameSchedulesInfoExtension on GameSchedulesInfo {
  GameSchedulesInfo copyWith({
    int? gameId,
    int? gameType,
    List<dynamic>? homePlayerScoreList,
    List<dynamic>? awayPlayerScoreList,
    int? gameTime,
    int? createTime,
    int? gst,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return GameSchedulesInfo()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..homePlayerScoreList = homePlayerScoreList ?? this.homePlayerScoreList
      ..awayPlayerScoreList = awayPlayerScoreList ?? this.awayPlayerScoreList
      ..gameTime = gameTime ?? this.gameTime
      ..createTime = createTime ?? this.createTime
      ..gst = gst ?? this.gst
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}