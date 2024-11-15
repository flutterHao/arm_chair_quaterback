import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';

GuessPlayerParamEntity $GuessPlayerParamEntityFromJson(
    Map<String, dynamic> json) {
  final GuessPlayerParamEntity guessPlayerParamEntity = GuessPlayerParamEntity();
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    guessPlayerParamEntity.awayTeamId = awayTeamId;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    guessPlayerParamEntity.gameId = gameId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    guessPlayerParamEntity.playerId = playerId;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    guessPlayerParamEntity.gameStartTime = gameStartTime;
  }
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    guessPlayerParamEntity.guessAttr = guessAttr;
  }
  final int? guessChoice = jsonConvert.convert<int>(json['guessChoice']);
  if (guessChoice != null) {
    guessPlayerParamEntity.guessChoice = guessChoice;
  }
  final double? guessReferenceValue = jsonConvert.convert<double>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessPlayerParamEntity.guessReferenceValue = guessReferenceValue;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    guessPlayerParamEntity.type = type;
  }
  return guessPlayerParamEntity;
}

Map<String, dynamic> $GuessPlayerParamEntityToJson(
    GuessPlayerParamEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awayTeamId'] = entity.awayTeamId;
  data['gameId'] = entity.gameId;
  data['playerId'] = entity.playerId;
  data['gameStartTime'] = entity.gameStartTime;
  data['guessAttr'] = entity.guessAttr;
  data['guessChoice'] = entity.guessChoice;
  data['guessReferenceValue'] = entity.guessReferenceValue;
  data['type'] = entity.type;
  return data;
}

extension GuessPlayerParamEntityExtension on GuessPlayerParamEntity {
  GuessPlayerParamEntity copyWith({
    int? awayTeamId,
    int? gameId,
    int? playerId,
    int? gameStartTime,
    String? guessAttr,
    int? guessChoice,
    double? guessReferenceValue,
    int? type,
  }) {
    return GuessPlayerParamEntity()
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..gameId = gameId ?? this.gameId
      ..playerId = playerId ?? this.playerId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..guessAttr = guessAttr ?? this.guessAttr
      ..guessChoice = guessChoice ?? this.guessChoice
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..type = type ?? this.type;
  }
}

GuessGameParamEntity $GuessGameParamEntityFromJson(Map<String, dynamic> json) {
  final GuessGameParamEntity guessGameParamEntity = GuessGameParamEntity();
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    guessGameParamEntity.awayTeamId = awayTeamId;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    guessGameParamEntity.homeTeamId = homeTeamId;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    guessGameParamEntity.gameId = gameId;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    guessGameParamEntity.gameStartTime = gameStartTime;
  }
  final int? guessChoice = jsonConvert.convert<int>(json['guessChoice']);
  if (guessChoice != null) {
    guessGameParamEntity.guessChoice = guessChoice;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    guessGameParamEntity.type = type;
  }
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    guessGameParamEntity.guessAttr = guessAttr;
  }
  return guessGameParamEntity;
}

Map<String, dynamic> $GuessGameParamEntityToJson(GuessGameParamEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awayTeamId'] = entity.awayTeamId;
  data['homeTeamId'] = entity.homeTeamId;
  data['gameId'] = entity.gameId;
  data['gameStartTime'] = entity.gameStartTime;
  data['guessChoice'] = entity.guessChoice;
  data['type'] = entity.type;
  data['guessAttr'] = entity.guessAttr;
  return data;
}

extension GuessGameParamEntityExtension on GuessGameParamEntity {
  GuessGameParamEntity copyWith({
    int? awayTeamId,
    int? homeTeamId,
    int? gameId,
    int? gameStartTime,
    int? guessChoice,
    int? type,
    String? guessAttr,
  }) {
    return GuessGameParamEntity()
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..gameId = gameId ?? this.gameId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..guessChoice = guessChoice ?? this.guessChoice
      ..type = type ?? this.type
      ..guessAttr = guessAttr ?? this.guessAttr;
  }
}