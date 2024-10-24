import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_data.dart';

import 'package:arm_chair_quaterback/common/entities/guess_reference_value.dart';


GuessGameInfoEntity $GuessGameInfoEntityFromJson(Map<String, dynamic> json) {
  final GuessGameInfoEntity guessGameInfoEntity = GuessGameInfoEntity();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    guessGameInfoEntity.gameId = gameId;
  }
  final double? newsId = jsonConvert.convert<double>(json['newsId']);
  if (newsId != null) {
    guessGameInfoEntity.newsId = newsId;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    guessGameInfoEntity.gameStartTime = gameStartTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    guessGameInfoEntity.teamId = teamId;
  }
  final List<GuessData>? guessData = (json['guessData'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<GuessData>(e) as GuessData).toList();
  if (guessData != null) {
    guessGameInfoEntity.guessData = guessData;
  }
  final GuessReferenceValue? guessReferenceValue = jsonConvert.convert<
      GuessReferenceValue>(json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessGameInfoEntity.guessReferenceValue = guessReferenceValue;
  }
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    guessGameInfoEntity.id = id;
  }
  final double? type = jsonConvert.convert<double>(json['type']);
  if (type != null) {
    guessGameInfoEntity.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    guessGameInfoEntity.awayTeamId = awayTeamId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    guessGameInfoEntity.playerId = playerId;
  }
  return guessGameInfoEntity;
}

Map<String, dynamic> $GuessGameInfoEntityToJson(GuessGameInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['newsId'] = entity.newsId;
  data['gameStartTime'] = entity.gameStartTime;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData.map((v) => v.toJson()).toList();
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  return data;
}

extension GuessGameInfoEntityExtension on GuessGameInfoEntity {
  GuessGameInfoEntity copyWith({
    int? gameId,
    double? newsId,
    int? gameStartTime,
    int? teamId,
    List<GuessData>? guessData,
    GuessReferenceValue? guessReferenceValue,
    double? id,
    double? type,
    int? awayTeamId,
    int? playerId,
  }) {
    return GuessGameInfoEntity()
      ..gameId = gameId ?? this.gameId
      ..newsId = newsId ?? this.newsId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId;
  }
}