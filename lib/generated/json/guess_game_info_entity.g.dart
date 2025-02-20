import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_data.dart';

import 'package:arm_chair_quaterback/common/utils/utils.dart';


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
  final int? gst = jsonConvert.convert<int>(json['gameStartTime']);
  if (gst != null) {
    guessGameInfoEntity.gst = gst;
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
  final Map<String, double>? guessReferenceValue =
  (json['guessReferenceValue'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, jsonConvert.convert<double>(e) as double));
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
  final int? moreCount = jsonConvert.convert<int>(json['moreCount']);
  if (moreCount != null) {
    guessGameInfoEntity.moreCount = moreCount;
  }
  final int? lessCount = jsonConvert.convert<int>(json['lessCount']);
  if (lessCount != null) {
    guessGameInfoEntity.lessCount = lessCount;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    guessGameInfoEntity.success = success;
  }
  return guessGameInfoEntity;
}

Map<String, dynamic> $GuessGameInfoEntityToJson(GuessGameInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['newsId'] = entity.newsId;
  data['gameStartTime'] = entity.gst;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData.map((v) => v.toJson()).toList();
  data['guessReferenceValue'] = entity.guessReferenceValue;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  data['moreCount'] = entity.moreCount;
  data['lessCount'] = entity.lessCount;
  data['success'] = entity.success;
  return data;
}

extension GuessGameInfoEntityExtension on GuessGameInfoEntity {
  GuessGameInfoEntity copyWith({
    int? gameId,
    double? newsId,
    int? gst,
    int? teamId,
    List<GuessData>? guessData,
    Map<String, double>? guessReferenceValue,
    double? id,
    double? type,
    int? awayTeamId,
    int? playerId,
    int? moreCount,
    int? lessCount,
    bool? success,
  }) {
    return GuessGameInfoEntity()
      ..gameId = gameId ?? this.gameId
      ..newsId = newsId ?? this.newsId
      ..gst = gst ?? this.gst
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId
      ..moreCount = moreCount ?? this.moreCount
      ..lessCount = lessCount ?? this.lessCount
      ..success = success ?? this.success;
  }
}