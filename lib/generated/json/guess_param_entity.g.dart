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
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    guessParamEntity.gameStartTime = gameStartTime;
  }
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    guessParamEntity.guessAttr = guessAttr;
  }
  final int? guessChoice = jsonConvert.convert<int>(json['guessChoice']);
  if (guessChoice != null) {
    guessParamEntity.guessChoice = guessChoice;
  }
  final double? guessReferenceValue = jsonConvert.convert<double>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessParamEntity.guessReferenceValue = guessReferenceValue;
  }
  return guessParamEntity;
}

Map<String, dynamic> $GuessParamEntityToJson(GuessParamEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awayTeamId'] = entity.awayTeamId;
  data['gameId'] = entity.gameId;
  data['playerId'] = entity.playerId;
  data['gameStartTime'] = entity.gameStartTime;
  data['guessAttr'] = entity.guessAttr;
  data['guessChoice'] = entity.guessChoice;
  data['guessReferenceValue'] = entity.guessReferenceValue;
  return data;
}

extension GuessParamEntityExtension on GuessParamEntity {
  GuessParamEntity copyWith({
    int? awayTeamId,
    int? gameId,
    int? playerId,
    int? gameStartTime,
    String? guessAttr,
    int? guessChoice,
    double? guessReferenceValue,
  }) {
    return GuessParamEntity()
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..gameId = gameId ?? this.gameId
      ..playerId = playerId ?? this.playerId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..guessAttr = guessAttr ?? this.guessAttr
      ..guessChoice = guessChoice ?? this.guessChoice
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue;
  }
}