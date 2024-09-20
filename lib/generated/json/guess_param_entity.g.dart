import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';

GuessParamEntity $GuessParamEntityFromJson(Map<String, dynamic> json) {
  final GuessParamEntity guessParamEntity = GuessParamEntity();
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    guessParamEntity.awayTeamId = awayTeamId;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    guessParamEntity.gameId = gameId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    guessParamEntity.playerId = playerId;
  }
  final int? gameStartTime = jsonConvert.convert<int>(
      json['gameStartTime']);
  if (gameStartTime != null) {
    guessParamEntity.gameStartTime = gameStartTime;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    guessParamEntity.type = type;
  }
  final List<GuessParamGuessData>? guessData = (json['guessData'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GuessParamGuessData>(e) as GuessParamGuessData)
      .toList();
  if (guessData != null) {
    guessParamEntity.guessData = guessData;
  }
  return guessParamEntity;
}

Map<String, dynamic> $GuessParamEntityToJson(GuessParamEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awayTeamId'] = entity.awayTeamId;
  data['gameId'] = entity.gameId;
  data['playerId'] = entity.playerId;
  data['gameStartTime'] = entity.gameStartTime;
  data['type'] = entity.type;
  data['guessData'] = entity.guessData.map((v) => v.toJson()).toList();
  return data;
}

extension GuessParamEntityExtension on GuessParamEntity {
  GuessParamEntity copyWith({
    int? awayTeamId,
    int? gameId,
    int? playerId,
    int? gameStartTime,
    int? type,
    List<GuessParamGuessData>? guessData,
  }) {
    return GuessParamEntity()
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..gameId = gameId ?? this.gameId
      ..playerId = playerId ?? this.playerId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..type = type ?? this.type
      ..guessData = guessData ?? this.guessData;
  }
}

GuessParamGuessData $GuessParamGuessDataFromJson(Map<String, dynamic> json) {
  final GuessParamGuessData guessParamGuessData = GuessParamGuessData();
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    guessParamGuessData.guessAttr = guessAttr;
  }
  final int? guessChoice = jsonConvert.convert<int>(json['guessChoice']);
  if (guessChoice != null) {
    guessParamGuessData.guessChoice = guessChoice;
  }
  final double? guessReferenceValue = jsonConvert.convert<double>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessParamGuessData.guessReferenceValue = guessReferenceValue;
  }
  return guessParamGuessData;
}

Map<String, dynamic> $GuessParamGuessDataToJson(GuessParamGuessData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessAttr'] = entity.guessAttr;
  data['guessChoice'] = entity.guessChoice;
  data['guessReferenceValue'] = entity.guessReferenceValue;
  return data;
}

extension GuessParamGuessDataExtension on GuessParamGuessData {
  GuessParamGuessData copyWith({
    String? guessAttr,
    int? guessChoice,
    double? guessReferenceValue,
  }) {
    return GuessParamGuessData()
      ..guessAttr = guessAttr ?? this.guessAttr
      ..guessChoice = guessChoice ?? this.guessChoice
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue;
  }
}