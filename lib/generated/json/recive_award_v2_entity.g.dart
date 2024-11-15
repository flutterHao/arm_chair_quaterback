import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_v2_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_data.dart';


ReciveAwardV2Entity $ReciveAwardV2EntityFromJson(Map<String, dynamic> json) {
  final ReciveAwardV2Entity reciveAwardV2Entity = ReciveAwardV2Entity();
  final List<
      ReciveAwardV2GuessInfo>? pointGuessing = (json['pointGuessing'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ReciveAwardV2GuessInfo>(e) as ReciveAwardV2GuessInfo)
      .toList();
  if (pointGuessing != null) {
    reciveAwardV2Entity.pointGuessing = pointGuessing;
  }
  final List<
      ReciveAwardV2GuessInfo>? newsGuessing = (json['newsGuessing'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ReciveAwardV2GuessInfo>(e) as ReciveAwardV2GuessInfo)
      .toList();
  if (newsGuessing != null) {
    reciveAwardV2Entity.newsGuessing = newsGuessing;
  }
  final int? lastWinningStreak = jsonConvert.convert<int>(
      json['lastWinningStreak']);
  if (lastWinningStreak != null) {
    reciveAwardV2Entity.lastWinningStreak = lastWinningStreak;
  }
  final int? guessWinningStreak = jsonConvert.convert<int>(
      json['guessWinningStreak']);
  if (guessWinningStreak != null) {
    reciveAwardV2Entity.guessWinningStreak = guessWinningStreak;
  }
  final int? streakReward = jsonConvert.convert<int>(json['streakReward']);
  if (streakReward != null) {
    reciveAwardV2Entity.streakReward = streakReward;
  }
  return reciveAwardV2Entity;
}

Map<String, dynamic> $ReciveAwardV2EntityToJson(ReciveAwardV2Entity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['pointGuessing'] = entity.pointGuessing.map((v) => v.toJson()).toList();
  data['newsGuessing'] = entity.newsGuessing.map((v) => v.toJson()).toList();
  data['lastWinningStreak'] = entity.lastWinningStreak;
  data['guessWinningStreak'] = entity.guessWinningStreak;
  data['streakReward'] = entity.streakReward;
  return data;
}

extension ReciveAwardV2EntityExtension on ReciveAwardV2Entity {
  ReciveAwardV2Entity copyWith({
    List<ReciveAwardV2GuessInfo>? pointGuessing,
    List<ReciveAwardV2GuessInfo>? newsGuessing,
    int? lastWinningStreak,
    int? guessWinningStreak,
    int? streakReward,
  }) {
    return ReciveAwardV2Entity()
      ..pointGuessing = pointGuessing ?? this.pointGuessing
      ..newsGuessing = newsGuessing ?? this.newsGuessing
      ..lastWinningStreak = lastWinningStreak ?? this.lastWinningStreak
      ..guessWinningStreak = guessWinningStreak ?? this.guessWinningStreak
      ..streakReward = streakReward ?? this.streakReward;
  }
}

ReciveAwardV2GuessInfo $ReciveAwardV2GuessInfoFromJson(
    Map<String, dynamic> json) {
  final ReciveAwardV2GuessInfo reciveAwardV2GuessInfo = ReciveAwardV2GuessInfo();
  final int? newsId = jsonConvert.convert<int>(json['newsId']);
  if (newsId != null) {
    reciveAwardV2GuessInfo.newsId = newsId;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    reciveAwardV2GuessInfo.createTime = createTime;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    reciveAwardV2GuessInfo.success = success;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    reciveAwardV2GuessInfo.teamId = teamId;
  }
  final List<
      ReciveAwardV2GuessInfoGuessData>? guessData = (json['guessData'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ReciveAwardV2GuessInfoGuessData>(
          e) as ReciveAwardV2GuessInfoGuessData).toList();
  if (guessData != null) {
    reciveAwardV2GuessInfo.guessData = guessData;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    reciveAwardV2GuessInfo.updateTime = updateTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    reciveAwardV2GuessInfo.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    reciveAwardV2GuessInfo.type = type;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    reciveAwardV2GuessInfo.status = status;
  }
  return reciveAwardV2GuessInfo;
}

Map<String, dynamic> $ReciveAwardV2GuessInfoToJson(
    ReciveAwardV2GuessInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['newsId'] = entity.newsId;
  data['createTime'] = entity.createTime;
  data['success'] = entity.success;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData.map((v) => v.toJson()).toList();
  data['updateTime'] = entity.updateTime;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['status'] = entity.status;
  return data;
}

extension ReciveAwardV2GuessInfoExtension on ReciveAwardV2GuessInfo {
  ReciveAwardV2GuessInfo copyWith({
    int? newsId,
    int? createTime,
    bool? success,
    int? teamId,
    List<ReciveAwardV2GuessInfoGuessData>? guessData,
    int? updateTime,
    int? id,
    int? type,
    int? status,
  }) {
    return ReciveAwardV2GuessInfo()
      ..newsId = newsId ?? this.newsId
      ..createTime = createTime ?? this.createTime
      ..success = success ?? this.success
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..updateTime = updateTime ?? this.updateTime
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..status = status ?? this.status;
  }
}

ReciveAwardV2GuessInfoGuessData $ReciveAwardV2GuessInfoGuessDataFromJson(
    Map<String, dynamic> json) {
  final ReciveAwardV2GuessInfoGuessData reciveAwardV2GuessInfoGuessData = ReciveAwardV2GuessInfoGuessData();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    reciveAwardV2GuessInfoGuessData.gameId = gameId;
  }
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    reciveAwardV2GuessInfoGuessData.guessAttr = guessAttr;
  }
  final int? guessChoice = jsonConvert.convert<int>(json['guessChoice']);
  if (guessChoice != null) {
    reciveAwardV2GuessInfoGuessData.guessChoice = guessChoice;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    reciveAwardV2GuessInfoGuessData.gameStartTime = gameStartTime;
  }
  final List<Awards>? awards = (json['awards'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<Awards>(e) as Awards).toList();
  if (awards != null) {
    reciveAwardV2GuessInfoGuessData.awards = awards;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    reciveAwardV2GuessInfoGuessData.success = success;
  }
  final int? guessGameAttrValue = jsonConvert.convert<int>(
      json['guessGameAttrValue']);
  if (guessGameAttrValue != null) {
    reciveAwardV2GuessInfoGuessData.guessGameAttrValue = guessGameAttrValue;
  }
  final double? guessReferenceValue = jsonConvert.convert<double>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    reciveAwardV2GuessInfoGuessData.guessReferenceValue = guessReferenceValue;
  }
  final int? winPro = jsonConvert.convert<int>(json['winPro']);
  if (winPro != null) {
    reciveAwardV2GuessInfoGuessData.winPro = winPro;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    reciveAwardV2GuessInfoGuessData.awayTeamId = awayTeamId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    reciveAwardV2GuessInfoGuessData.playerId = playerId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    reciveAwardV2GuessInfoGuessData.status = status;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    reciveAwardV2GuessInfoGuessData.type = type;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    reciveAwardV2GuessInfoGuessData.homeTeamScore = homeTeamScore;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    reciveAwardV2GuessInfoGuessData.awayTeamScore = awayTeamScore;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    reciveAwardV2GuessInfoGuessData.homeTeamId = homeTeamId;
  }
  return reciveAwardV2GuessInfoGuessData;
}

Map<String, dynamic> $ReciveAwardV2GuessInfoGuessDataToJson(
    ReciveAwardV2GuessInfoGuessData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['guessAttr'] = entity.guessAttr;
  data['guessChoice'] = entity.guessChoice;
  data['gameStartTime'] = entity.gameStartTime;
  data['awards'] = entity.awards.map((v) => v.toJson()).toList();
  data['success'] = entity.success;
  data['guessGameAttrValue'] = entity.guessGameAttrValue;
  data['guessReferenceValue'] = entity.guessReferenceValue;
  data['winPro'] = entity.winPro;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  data['status'] = entity.status;
  data['type'] = entity.type;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamId'] = entity.homeTeamId;
  return data;
}

extension ReciveAwardV2GuessInfoGuessDataExtension on ReciveAwardV2GuessInfoGuessData {
  ReciveAwardV2GuessInfoGuessData copyWith({
    int? gameId,
    String? guessAttr,
    int? guessChoice,
    int? gameStartTime,
    List<Awards>? awards,
    bool? success,
    int? guessGameAttrValue,
    double? guessReferenceValue,
    int? winPro,
    int? awayTeamId,
    int? playerId,
    int? status,
    int? type,
    int? homeTeamScore,
    int? awayTeamScore,
    int? homeTeamId,
  }) {
    return ReciveAwardV2GuessInfoGuessData()
      ..gameId = gameId ?? this.gameId
      ..guessAttr = guessAttr ?? this.guessAttr
      ..guessChoice = guessChoice ?? this.guessChoice
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..awards = awards ?? this.awards
      ..success = success ?? this.success
      ..guessGameAttrValue = guessGameAttrValue ?? this.guessGameAttrValue
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..winPro = winPro ?? this.winPro
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId
      ..status = status ?? this.status
      ..type = type ?? this.type
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamId = homeTeamId ?? this.homeTeamId;
  }
}