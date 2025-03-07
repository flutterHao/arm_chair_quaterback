import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/game_result_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';

import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';

import 'package:arm_chair_quaterback/pages/league/team_detail/widgets/log_tab.dart';


GameResultInfoEntity $GameResultInfoEntityFromJson(Map<String, dynamic> json) {
  final GameResultInfoEntity gameResultInfoEntity = GameResultInfoEntity();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameResultInfoEntity.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    gameResultInfoEntity.gameType = gameType;
  }
  final GameResultInfoHomeTeamResult? homeTeamResult = jsonConvert.convert<
      GameResultInfoHomeTeamResult>(json['homeTeamResult']);
  if (homeTeamResult != null) {
    gameResultInfoEntity.homeTeamResult = homeTeamResult;
  }
  final GameResultInfoHomeTeamResult? awayTeamResult = jsonConvert.convert<
      GameResultInfoHomeTeamResult>(json['awayTeamResult']);
  if (awayTeamResult != null) {
    gameResultInfoEntity.awayTeamResult = awayTeamResult;
  }
  final List<
      GameResultInfoGameScoreBoard>? gameScoreBoard = (json['gameScoreBoard'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GameResultInfoGameScoreBoard>(
          e) as GameResultInfoGameScoreBoard).toList();
  if (gameScoreBoard != null) {
    gameResultInfoEntity.gameScoreBoard = gameScoreBoard;
  }
  final List<
      GameResultInfoPlayerResults>? playerResults = (json['playerResults'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GameResultInfoPlayerResults>(
          e) as GameResultInfoPlayerResults).toList();
  if (playerResults != null) {
    gameResultInfoEntity.playerResults = playerResults;
  }
  final List<
      ScoreBoardDetailList>? gameScoreBoardDetail = (json['gameScoreBoardDetail'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ScoreBoardDetailList>(e) as ScoreBoardDetailList)
      .toList();
  if (gameScoreBoardDetail != null) {
    gameResultInfoEntity.gameScoreBoardDetail = gameScoreBoardDetail;
  }
  final GameResultInfoGsGameSchedule? gsGameSchedule = jsonConvert.convert<
      GameResultInfoGsGameSchedule>(json['gsGameSchedule']);
  if (gsGameSchedule != null) {
    gameResultInfoEntity.gsGameSchedule = gsGameSchedule;
  }
  return gameResultInfoEntity;
}

Map<String, dynamic> $GameResultInfoEntityToJson(GameResultInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['homeTeamResult'] = entity.homeTeamResult.toJson();
  data['awayTeamResult'] = entity.awayTeamResult.toJson();
  data['gameScoreBoard'] =
      entity.gameScoreBoard.map((v) => v.toJson()).toList();
  data['playerResults'] = entity.playerResults.map((v) => v.toJson()).toList();
  data['gameScoreBoardDetail'] =
      entity.gameScoreBoardDetail.map((v) => v.toJson()).toList();
  data['gsGameSchedule'] = entity.gsGameSchedule.toJson();
  return data;
}

extension GameResultInfoEntityExtension on GameResultInfoEntity {
  GameResultInfoEntity copyWith({
    int? gameId,
    int? gameType,
    GameResultInfoHomeTeamResult? homeTeamResult,
    GameResultInfoHomeTeamResult? awayTeamResult,
    List<GameResultInfoGameScoreBoard>? gameScoreBoard,
    List<GameResultInfoPlayerResults>? playerResults,
    List<ScoreBoardDetailList>? gameScoreBoardDetail,
    GameResultInfoGsGameSchedule? gsGameSchedule,
  }) {
    return GameResultInfoEntity()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..homeTeamResult = homeTeamResult ?? this.homeTeamResult
      ..awayTeamResult = awayTeamResult ?? this.awayTeamResult
      ..gameScoreBoard = gameScoreBoard ?? this.gameScoreBoard
      ..playerResults = playerResults ?? this.playerResults
      ..gameScoreBoardDetail = gameScoreBoardDetail ?? this.gameScoreBoardDetail
      ..gsGameSchedule = gsGameSchedule ?? this.gsGameSchedule;
  }
}

GameResultInfoHomeTeamResult $GameResultInfoHomeTeamResultFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoHomeTeamResult gameResultInfoHomeTeamResult = GameResultInfoHomeTeamResult();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameResultInfoHomeTeamResult.gameId = gameId;
  }
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    gameResultInfoHomeTeamResult.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    gameResultInfoHomeTeamResult.teamName = teamName;
  }
  final List<dynamic>? otherAwardData = (json['otherAwardData'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (otherAwardData != null) {
    gameResultInfoHomeTeamResult.otherAwardData = otherAwardData;
  }
  final bool? ast = jsonConvert.convert<bool>(json['ast']);
  if (ast != null) {
    gameResultInfoHomeTeamResult.ast = ast;
  }
  final List<TeamPlayerInfoEntity>? teamPlayers = (json['teamPlayers'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<TeamPlayerInfoEntity>(e) as TeamPlayerInfoEntity)
      .toList();
  if (teamPlayers != null) {
    gameResultInfoHomeTeamResult.teamPlayers = teamPlayers;
  }
  final double? strength = jsonConvert.convert<double>(json['strength']);
  if (strength != null) {
    gameResultInfoHomeTeamResult.strength = strength;
  }
  final bool? mvp = jsonConvert.convert<bool>(json['mvp']);
  if (mvp != null) {
    gameResultInfoHomeTeamResult.mvp = mvp;
  }
  final bool? cardBoxIsFull = jsonConvert.convert<bool>(json['cardBoxIsFull']);
  if (cardBoxIsFull != null) {
    gameResultInfoHomeTeamResult.cardBoxIsFull = cardBoxIsFull;
  }
  final List<dynamic>? vipAwardData = (json['vipAwardData'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (vipAwardData != null) {
    gameResultInfoHomeTeamResult.vipAwardData = vipAwardData;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameResultInfoHomeTeamResult.updateTime = updateTime;
  }
  final String? serverId = jsonConvert.convert<String>(json['serverId']);
  if (serverId != null) {
    gameResultInfoHomeTeamResult.serverId = serverId;
  }
  final bool? pts = jsonConvert.convert<bool>(json['pts']);
  if (pts != null) {
    gameResultInfoHomeTeamResult.pts = pts;
  }
  final bool? reb = jsonConvert.convert<bool>(json['reb']);
  if (reb != null) {
    gameResultInfoHomeTeamResult.reb = reb;
  }
  final int? score = jsonConvert.convert<int>(json['score']);
  if (score != null) {
    gameResultInfoHomeTeamResult.score = score;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameResultInfoHomeTeamResult.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    gameResultInfoHomeTeamResult.teamId = teamId;
  }
  final int? cupDiff = jsonConvert.convert<int>(json['cupDiff']);
  if (cupDiff != null) {
    gameResultInfoHomeTeamResult.cupDiff = cupDiff;
  }
  final int? cardBoxId = jsonConvert.convert<int>(json['cardBoxId']);
  if (cardBoxId != null) {
    gameResultInfoHomeTeamResult.cardBoxId = cardBoxId;
  }
  final bool? win = jsonConvert.convert<bool>(json['win']);
  if (win != null) {
    gameResultInfoHomeTeamResult.win = win;
  }
  final int? cup = jsonConvert.convert<int>(json['cup']);
  if (cup != null) {
    gameResultInfoHomeTeamResult.cup = cup;
  }
  final List<
      GameResultInfoHomeTeamResultDropAwardData>? dropAwardData = (json['dropAwardData'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GameResultInfoHomeTeamResultDropAwardData>(
          e) as GameResultInfoHomeTeamResultDropAwardData).toList();
  if (dropAwardData != null) {
    gameResultInfoHomeTeamResult.dropAwardData = dropAwardData;
  }
  return gameResultInfoHomeTeamResult;
}

Map<String, dynamic> $GameResultInfoHomeTeamResultToJson(
    GameResultInfoHomeTeamResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['otherAwardData'] = entity.otherAwardData;
  data['ast'] = entity.ast;
  data['teamPlayers'] = entity.teamPlayers.map((v) => v.toJson()).toList();
  data['strength'] = entity.strength;
  data['mvp'] = entity.mvp;
  data['cardBoxIsFull'] = entity.cardBoxIsFull;
  data['vipAwardData'] = entity.vipAwardData;
  data['updateTime'] = entity.updateTime;
  data['serverId'] = entity.serverId;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['score'] = entity.score;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['cupDiff'] = entity.cupDiff;
  data['cardBoxId'] = entity.cardBoxId;
  data['win'] = entity.win;
  data['cup'] = entity.cup;
  data['dropAwardData'] = entity.dropAwardData.map((v) => v.toJson()).toList();
  return data;
}

extension GameResultInfoHomeTeamResultExtension on GameResultInfoHomeTeamResult {
  GameResultInfoHomeTeamResult copyWith({
    int? gameId,
    int? teamLogo,
    String? teamName,
    List<dynamic>? otherAwardData,
    bool? ast,
    List<TeamPlayerInfoEntity>? teamPlayers,
    double? strength,
    bool? mvp,
    bool? cardBoxIsFull,
    List<dynamic>? vipAwardData,
    int? updateTime,
    String? serverId,
    bool? pts,
    bool? reb,
    int? score,
    int? createTime,
    int? teamId,
    int? cupDiff,
    int? cardBoxId,
    bool? win,
    int? cup,
    List<GameResultInfoHomeTeamResultDropAwardData>? dropAwardData,
  }) {
    return GameResultInfoHomeTeamResult()
      ..gameId = gameId ?? this.gameId
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..otherAwardData = otherAwardData ?? this.otherAwardData
      ..ast = ast ?? this.ast
      ..teamPlayers = teamPlayers ?? this.teamPlayers
      ..strength = strength ?? this.strength
      ..mvp = mvp ?? this.mvp
      ..cardBoxIsFull = cardBoxIsFull ?? this.cardBoxIsFull
      ..vipAwardData = vipAwardData ?? this.vipAwardData
      ..updateTime = updateTime ?? this.updateTime
      ..serverId = serverId ?? this.serverId
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..score = score ?? this.score
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..cupDiff = cupDiff ?? this.cupDiff
      ..cardBoxId = cardBoxId ?? this.cardBoxId
      ..win = win ?? this.win
      ..cup = cup ?? this.cup
      ..dropAwardData = dropAwardData ?? this.dropAwardData;
  }
}

GameResultInfoHomeTeamResultTeamPlayers $GameResultInfoHomeTeamResultTeamPlayersFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoHomeTeamResultTeamPlayers gameResultInfoHomeTeamResultTeamPlayers = GameResultInfoHomeTeamResultTeamPlayers();
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    gameResultInfoHomeTeamResultTeamPlayers.buyPrice = buyPrice;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    gameResultInfoHomeTeamResultTeamPlayers.buyPlayerScore = buyPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameResultInfoHomeTeamResultTeamPlayers.updateTime = updateTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    gameResultInfoHomeTeamResultTeamPlayers.playerStrength = playerStrength;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    gameResultInfoHomeTeamResultTeamPlayers.uuid = uuid;
  }
  final double? playerReadiness = jsonConvert.convert<double>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    gameResultInfoHomeTeamResultTeamPlayers.playerReadiness = playerReadiness;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    gameResultInfoHomeTeamResultTeamPlayers.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    gameResultInfoHomeTeamResultTeamPlayers.fromType = fromType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameResultInfoHomeTeamResultTeamPlayers.createTime = createTime;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    gameResultInfoHomeTeamResultTeamPlayers.playerGrade = playerGrade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    gameResultInfoHomeTeamResultTeamPlayers.teamId = teamId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    gameResultInfoHomeTeamResultTeamPlayers.id = id;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    gameResultInfoHomeTeamResultTeamPlayers.position = position;
  }
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    gameResultInfoHomeTeamResultTeamPlayers.power = power;
  }
  final int? playerStatus = jsonConvert.convert<int>(json['playerStatus']);
  if (playerStatus != null) {
    gameResultInfoHomeTeamResultTeamPlayers.playerStatus = playerStatus;
  }
  final int? playerStatusValue = jsonConvert.convert<int>(
      json['playerStatusValue']);
  if (playerStatusValue != null) {
    gameResultInfoHomeTeamResultTeamPlayers.playerStatusValue =
        playerStatusValue;
  }
  final GameResultInfoHomeTeamResultTeamPlayersPotential? potential = jsonConvert
      .convert<GameResultInfoHomeTeamResultTeamPlayersPotential>(
      json['potential']);
  if (potential != null) {
    gameResultInfoHomeTeamResultTeamPlayers.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    gameResultInfoHomeTeamResultTeamPlayers.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    gameResultInfoHomeTeamResultTeamPlayers.breakThroughGrade =
        breakThroughGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    gameResultInfoHomeTeamResultTeamPlayers.playerId = playerId;
  }
  final GameResultInfoHomeTeamResultTeamPlayersUpStarBase? upStarBase = jsonConvert
      .convert<GameResultInfoHomeTeamResultTeamPlayersUpStarBase>(
      json['upStarBase']);
  if (upStarBase != null) {
    gameResultInfoHomeTeamResultTeamPlayers.upStarBase = upStarBase;
  }
  return gameResultInfoHomeTeamResultTeamPlayers;
}

Map<String, dynamic> $GameResultInfoHomeTeamResultTeamPlayersToJson(
    GameResultInfoHomeTeamResultTeamPlayers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buyPrice'] = entity.buyPrice;
  data['buyPlayerScore'] = entity.buyPlayerScore;
  data['updateTime'] = entity.updateTime;
  data['playerStrength'] = entity.playerStrength;
  data['uuid'] = entity.uuid;
  data['playerReadiness'] = entity.playerReadiness;
  data['gradeExp'] = entity.gradeExp;
  data['fromType'] = entity.fromType;
  data['createTime'] = entity.createTime;
  data['playerGrade'] = entity.playerGrade;
  data['teamId'] = entity.teamId;
  data['id'] = entity.id;
  data['position'] = entity.position;
  data['power'] = entity.power;
  data['playerStatus'] = entity.playerStatus;
  data['playerStatusValue'] = entity.playerStatusValue;
  data['potential'] = entity.potential.toJson();
  data['bindStatus'] = entity.bindStatus;
  data['breakThroughGrade'] = entity.breakThroughGrade;
  data['playerId'] = entity.playerId;
  data['upStarBase'] = entity.upStarBase.toJson();
  return data;
}

extension GameResultInfoHomeTeamResultTeamPlayersExtension on GameResultInfoHomeTeamResultTeamPlayers {
  GameResultInfoHomeTeamResultTeamPlayers copyWith({
    int? buyPrice,
    int? buyPlayerScore,
    int? updateTime,
    int? playerStrength,
    String? uuid,
    double? playerReadiness,
    int? gradeExp,
    int? fromType,
    int? createTime,
    int? playerGrade,
    int? teamId,
    int? id,
    int? position,
    double? power,
    int? playerStatus,
    int? playerStatusValue,
    GameResultInfoHomeTeamResultTeamPlayersPotential? potential,
    bool? bindStatus,
    int? breakThroughGrade,
    int? playerId,
    GameResultInfoHomeTeamResultTeamPlayersUpStarBase? upStarBase,
  }) {
    return GameResultInfoHomeTeamResultTeamPlayers()
      ..buyPrice = buyPrice ?? this.buyPrice
      ..buyPlayerScore = buyPlayerScore ?? this.buyPlayerScore
      ..updateTime = updateTime ?? this.updateTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..uuid = uuid ?? this.uuid
      ..playerReadiness = playerReadiness ?? this.playerReadiness
      ..gradeExp = gradeExp ?? this.gradeExp
      ..fromType = fromType ?? this.fromType
      ..createTime = createTime ?? this.createTime
      ..playerGrade = playerGrade ?? this.playerGrade
      ..teamId = teamId ?? this.teamId
      ..id = id ?? this.id
      ..position = position ?? this.position
      ..power = power ?? this.power
      ..playerStatus = playerStatus ?? this.playerStatus
      ..playerStatusValue = playerStatusValue ?? this.playerStatusValue
      ..potential = potential ?? this.potential
      ..bindStatus = bindStatus ?? this.bindStatus
      ..breakThroughGrade = breakThroughGrade ?? this.breakThroughGrade
      ..playerId = playerId ?? this.playerId
      ..upStarBase = upStarBase ?? this.upStarBase;
  }
}

GameResultInfoHomeTeamResultTeamPlayersPotential $GameResultInfoHomeTeamResultTeamPlayersPotentialFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoHomeTeamResultTeamPlayersPotential gameResultInfoHomeTeamResultTeamPlayersPotential = GameResultInfoHomeTeamResultTeamPlayersPotential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    gameResultInfoHomeTeamResultTeamPlayersPotential.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    gameResultInfoHomeTeamResultTeamPlayersPotential.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    gameResultInfoHomeTeamResultTeamPlayersPotential.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    gameResultInfoHomeTeamResultTeamPlayersPotential.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    gameResultInfoHomeTeamResultTeamPlayersPotential.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    gameResultInfoHomeTeamResultTeamPlayersPotential.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    gameResultInfoHomeTeamResultTeamPlayersPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    gameResultInfoHomeTeamResultTeamPlayersPotential.reb = reb;
  }
  return gameResultInfoHomeTeamResultTeamPlayersPotential;
}

Map<String, dynamic> $GameResultInfoHomeTeamResultTeamPlayersPotentialToJson(
    GameResultInfoHomeTeamResultTeamPlayersPotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['tech'] = entity.tech;
  data['pass'] = entity.pass;
  data['stl'] = entity.stl;
  data['threePm'] = entity.threePm;
  data['ftm'] = entity.ftm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension GameResultInfoHomeTeamResultTeamPlayersPotentialExtension on GameResultInfoHomeTeamResultTeamPlayersPotential {
  GameResultInfoHomeTeamResultTeamPlayersPotential copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return GameResultInfoHomeTeamResultTeamPlayersPotential()
      ..blk = blk ?? this.blk
      ..tech = tech ?? this.tech
      ..pass = pass ?? this.pass
      ..stl = stl ?? this.stl
      ..threePm = threePm ?? this.threePm
      ..ftm = ftm ?? this.ftm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

GameResultInfoHomeTeamResultTeamPlayersUpStarBase $GameResultInfoHomeTeamResultTeamPlayersUpStarBaseFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoHomeTeamResultTeamPlayersUpStarBase gameResultInfoHomeTeamResultTeamPlayersUpStarBase = GameResultInfoHomeTeamResultTeamPlayersUpStarBase();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    gameResultInfoHomeTeamResultTeamPlayersUpStarBase.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    gameResultInfoHomeTeamResultTeamPlayersUpStarBase.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    gameResultInfoHomeTeamResultTeamPlayersUpStarBase.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    gameResultInfoHomeTeamResultTeamPlayersUpStarBase.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    gameResultInfoHomeTeamResultTeamPlayersUpStarBase.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    gameResultInfoHomeTeamResultTeamPlayersUpStarBase.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    gameResultInfoHomeTeamResultTeamPlayersUpStarBase.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    gameResultInfoHomeTeamResultTeamPlayersUpStarBase.reb = reb;
  }
  return gameResultInfoHomeTeamResultTeamPlayersUpStarBase;
}

Map<String, dynamic> $GameResultInfoHomeTeamResultTeamPlayersUpStarBaseToJson(
    GameResultInfoHomeTeamResultTeamPlayersUpStarBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['tech'] = entity.tech;
  data['pass'] = entity.pass;
  data['stl'] = entity.stl;
  data['threePm'] = entity.threePm;
  data['ftm'] = entity.ftm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension GameResultInfoHomeTeamResultTeamPlayersUpStarBaseExtension on GameResultInfoHomeTeamResultTeamPlayersUpStarBase {
  GameResultInfoHomeTeamResultTeamPlayersUpStarBase copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return GameResultInfoHomeTeamResultTeamPlayersUpStarBase()
      ..blk = blk ?? this.blk
      ..tech = tech ?? this.tech
      ..pass = pass ?? this.pass
      ..stl = stl ?? this.stl
      ..threePm = threePm ?? this.threePm
      ..ftm = ftm ?? this.ftm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

GameResultInfoHomeTeamResultDropAwardData $GameResultInfoHomeTeamResultDropAwardDataFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoHomeTeamResultDropAwardData gameResultInfoHomeTeamResultDropAwardData = GameResultInfoHomeTeamResultDropAwardData();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    gameResultInfoHomeTeamResultDropAwardData.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    gameResultInfoHomeTeamResultDropAwardData.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    gameResultInfoHomeTeamResultDropAwardData.type = type;
  }
  return gameResultInfoHomeTeamResultDropAwardData;
}

Map<String, dynamic> $GameResultInfoHomeTeamResultDropAwardDataToJson(
    GameResultInfoHomeTeamResultDropAwardData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension GameResultInfoHomeTeamResultDropAwardDataExtension on GameResultInfoHomeTeamResultDropAwardData {
  GameResultInfoHomeTeamResultDropAwardData copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return GameResultInfoHomeTeamResultDropAwardData()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}

GameResultInfoAwayTeamResult $GameResultInfoAwayTeamResultFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoAwayTeamResult gameResultInfoAwayTeamResult = GameResultInfoAwayTeamResult();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameResultInfoAwayTeamResult.gameId = gameId;
  }
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    gameResultInfoAwayTeamResult.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    gameResultInfoAwayTeamResult.teamName = teamName;
  }
  final List<dynamic>? otherAwardData = (json['otherAwardData'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (otherAwardData != null) {
    gameResultInfoAwayTeamResult.otherAwardData = otherAwardData;
  }
  final bool? ast = jsonConvert.convert<bool>(json['ast']);
  if (ast != null) {
    gameResultInfoAwayTeamResult.ast = ast;
  }
  final List<
      GameResultInfoAwayTeamResultTeamPlayers>? teamPlayers = (json['teamPlayers'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GameResultInfoAwayTeamResultTeamPlayers>(
          e) as GameResultInfoAwayTeamResultTeamPlayers).toList();
  if (teamPlayers != null) {
    gameResultInfoAwayTeamResult.teamPlayers = teamPlayers;
  }
  final int? strength = jsonConvert.convert<int>(json['strength']);
  if (strength != null) {
    gameResultInfoAwayTeamResult.strength = strength;
  }
  final bool? mvp = jsonConvert.convert<bool>(json['mvp']);
  if (mvp != null) {
    gameResultInfoAwayTeamResult.mvp = mvp;
  }
  final bool? cardBoxIsFull = jsonConvert.convert<bool>(json['cardBoxIsFull']);
  if (cardBoxIsFull != null) {
    gameResultInfoAwayTeamResult.cardBoxIsFull = cardBoxIsFull;
  }
  final List<dynamic>? vipAwardData = (json['vipAwardData'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (vipAwardData != null) {
    gameResultInfoAwayTeamResult.vipAwardData = vipAwardData;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameResultInfoAwayTeamResult.updateTime = updateTime;
  }
  final String? serverId = jsonConvert.convert<String>(json['serverId']);
  if (serverId != null) {
    gameResultInfoAwayTeamResult.serverId = serverId;
  }
  final bool? pts = jsonConvert.convert<bool>(json['pts']);
  if (pts != null) {
    gameResultInfoAwayTeamResult.pts = pts;
  }
  final bool? reb = jsonConvert.convert<bool>(json['reb']);
  if (reb != null) {
    gameResultInfoAwayTeamResult.reb = reb;
  }
  final int? score = jsonConvert.convert<int>(json['score']);
  if (score != null) {
    gameResultInfoAwayTeamResult.score = score;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameResultInfoAwayTeamResult.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    gameResultInfoAwayTeamResult.teamId = teamId;
  }
  final int? cupDiff = jsonConvert.convert<int>(json['cupDiff']);
  if (cupDiff != null) {
    gameResultInfoAwayTeamResult.cupDiff = cupDiff;
  }
  final int? cardBoxId = jsonConvert.convert<int>(json['cardBoxId']);
  if (cardBoxId != null) {
    gameResultInfoAwayTeamResult.cardBoxId = cardBoxId;
  }
  final bool? win = jsonConvert.convert<bool>(json['win']);
  if (win != null) {
    gameResultInfoAwayTeamResult.win = win;
  }
  final int? cup = jsonConvert.convert<int>(json['cup']);
  if (cup != null) {
    gameResultInfoAwayTeamResult.cup = cup;
  }
  final List<
      GameResultInfoAwayTeamResultDropAwardData>? dropAwardData = (json['dropAwardData'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GameResultInfoAwayTeamResultDropAwardData>(
          e) as GameResultInfoAwayTeamResultDropAwardData).toList();
  if (dropAwardData != null) {
    gameResultInfoAwayTeamResult.dropAwardData = dropAwardData;
  }
  return gameResultInfoAwayTeamResult;
}

Map<String, dynamic> $GameResultInfoAwayTeamResultToJson(
    GameResultInfoAwayTeamResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['otherAwardData'] = entity.otherAwardData;
  data['ast'] = entity.ast;
  data['teamPlayers'] = entity.teamPlayers.map((v) => v.toJson()).toList();
  data['strength'] = entity.strength;
  data['mvp'] = entity.mvp;
  data['cardBoxIsFull'] = entity.cardBoxIsFull;
  data['vipAwardData'] = entity.vipAwardData;
  data['updateTime'] = entity.updateTime;
  data['serverId'] = entity.serverId;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['score'] = entity.score;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['cupDiff'] = entity.cupDiff;
  data['cardBoxId'] = entity.cardBoxId;
  data['win'] = entity.win;
  data['cup'] = entity.cup;
  data['dropAwardData'] = entity.dropAwardData.map((v) => v.toJson()).toList();
  return data;
}

extension GameResultInfoAwayTeamResultExtension on GameResultInfoAwayTeamResult {
  GameResultInfoAwayTeamResult copyWith({
    int? gameId,
    int? teamLogo,
    String? teamName,
    List<dynamic>? otherAwardData,
    bool? ast,
    List<GameResultInfoAwayTeamResultTeamPlayers>? teamPlayers,
    int? strength,
    bool? mvp,
    bool? cardBoxIsFull,
    List<dynamic>? vipAwardData,
    int? updateTime,
    String? serverId,
    bool? pts,
    bool? reb,
    int? score,
    int? createTime,
    int? teamId,
    int? cupDiff,
    int? cardBoxId,
    bool? win,
    int? cup,
    List<GameResultInfoAwayTeamResultDropAwardData>? dropAwardData,
  }) {
    return GameResultInfoAwayTeamResult()
      ..gameId = gameId ?? this.gameId
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..otherAwardData = otherAwardData ?? this.otherAwardData
      ..ast = ast ?? this.ast
      ..teamPlayers = teamPlayers ?? this.teamPlayers
      ..strength = strength ?? this.strength
      ..mvp = mvp ?? this.mvp
      ..cardBoxIsFull = cardBoxIsFull ?? this.cardBoxIsFull
      ..vipAwardData = vipAwardData ?? this.vipAwardData
      ..updateTime = updateTime ?? this.updateTime
      ..serverId = serverId ?? this.serverId
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..score = score ?? this.score
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..cupDiff = cupDiff ?? this.cupDiff
      ..cardBoxId = cardBoxId ?? this.cardBoxId
      ..win = win ?? this.win
      ..cup = cup ?? this.cup
      ..dropAwardData = dropAwardData ?? this.dropAwardData;
  }
}

GameResultInfoAwayTeamResultTeamPlayers $GameResultInfoAwayTeamResultTeamPlayersFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoAwayTeamResultTeamPlayers gameResultInfoAwayTeamResultTeamPlayers = GameResultInfoAwayTeamResultTeamPlayers();
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    gameResultInfoAwayTeamResultTeamPlayers.buyPrice = buyPrice;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    gameResultInfoAwayTeamResultTeamPlayers.buyPlayerScore = buyPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameResultInfoAwayTeamResultTeamPlayers.updateTime = updateTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    gameResultInfoAwayTeamResultTeamPlayers.playerStrength = playerStrength;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    gameResultInfoAwayTeamResultTeamPlayers.uuid = uuid;
  }
  final double? playerReadiness = jsonConvert.convert<double>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    gameResultInfoAwayTeamResultTeamPlayers.playerReadiness = playerReadiness;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    gameResultInfoAwayTeamResultTeamPlayers.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    gameResultInfoAwayTeamResultTeamPlayers.fromType = fromType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameResultInfoAwayTeamResultTeamPlayers.createTime = createTime;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    gameResultInfoAwayTeamResultTeamPlayers.playerGrade = playerGrade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    gameResultInfoAwayTeamResultTeamPlayers.teamId = teamId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    gameResultInfoAwayTeamResultTeamPlayers.id = id;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    gameResultInfoAwayTeamResultTeamPlayers.position = position;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    gameResultInfoAwayTeamResultTeamPlayers.power = power;
  }
  final int? playerStatus = jsonConvert.convert<int>(json['playerStatus']);
  if (playerStatus != null) {
    gameResultInfoAwayTeamResultTeamPlayers.playerStatus = playerStatus;
  }
  final int? playerStatusValue = jsonConvert.convert<int>(
      json['playerStatusValue']);
  if (playerStatusValue != null) {
    gameResultInfoAwayTeamResultTeamPlayers.playerStatusValue =
        playerStatusValue;
  }
  final GameResultInfoAwayTeamResultTeamPlayersPotential? potential = jsonConvert
      .convert<GameResultInfoAwayTeamResultTeamPlayersPotential>(
      json['potential']);
  if (potential != null) {
    gameResultInfoAwayTeamResultTeamPlayers.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    gameResultInfoAwayTeamResultTeamPlayers.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    gameResultInfoAwayTeamResultTeamPlayers.breakThroughGrade =
        breakThroughGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    gameResultInfoAwayTeamResultTeamPlayers.playerId = playerId;
  }
  final GameResultInfoAwayTeamResultTeamPlayersUpStarBase? upStarBase = jsonConvert
      .convert<GameResultInfoAwayTeamResultTeamPlayersUpStarBase>(
      json['upStarBase']);
  if (upStarBase != null) {
    gameResultInfoAwayTeamResultTeamPlayers.upStarBase = upStarBase;
  }
  return gameResultInfoAwayTeamResultTeamPlayers;
}

Map<String, dynamic> $GameResultInfoAwayTeamResultTeamPlayersToJson(
    GameResultInfoAwayTeamResultTeamPlayers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buyPrice'] = entity.buyPrice;
  data['buyPlayerScore'] = entity.buyPlayerScore;
  data['updateTime'] = entity.updateTime;
  data['playerStrength'] = entity.playerStrength;
  data['uuid'] = entity.uuid;
  data['playerReadiness'] = entity.playerReadiness;
  data['gradeExp'] = entity.gradeExp;
  data['fromType'] = entity.fromType;
  data['createTime'] = entity.createTime;
  data['playerGrade'] = entity.playerGrade;
  data['teamId'] = entity.teamId;
  data['id'] = entity.id;
  data['position'] = entity.position;
  data['power'] = entity.power;
  data['playerStatus'] = entity.playerStatus;
  data['playerStatusValue'] = entity.playerStatusValue;
  data['potential'] = entity.potential.toJson();
  data['bindStatus'] = entity.bindStatus;
  data['breakThroughGrade'] = entity.breakThroughGrade;
  data['playerId'] = entity.playerId;
  data['upStarBase'] = entity.upStarBase.toJson();
  return data;
}

extension GameResultInfoAwayTeamResultTeamPlayersExtension on GameResultInfoAwayTeamResultTeamPlayers {
  GameResultInfoAwayTeamResultTeamPlayers copyWith({
    int? buyPrice,
    int? buyPlayerScore,
    int? updateTime,
    int? playerStrength,
    String? uuid,
    double? playerReadiness,
    int? gradeExp,
    int? fromType,
    int? createTime,
    int? playerGrade,
    int? teamId,
    int? id,
    int? position,
    int? power,
    int? playerStatus,
    int? playerStatusValue,
    GameResultInfoAwayTeamResultTeamPlayersPotential? potential,
    bool? bindStatus,
    int? breakThroughGrade,
    int? playerId,
    GameResultInfoAwayTeamResultTeamPlayersUpStarBase? upStarBase,
  }) {
    return GameResultInfoAwayTeamResultTeamPlayers()
      ..buyPrice = buyPrice ?? this.buyPrice
      ..buyPlayerScore = buyPlayerScore ?? this.buyPlayerScore
      ..updateTime = updateTime ?? this.updateTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..uuid = uuid ?? this.uuid
      ..playerReadiness = playerReadiness ?? this.playerReadiness
      ..gradeExp = gradeExp ?? this.gradeExp
      ..fromType = fromType ?? this.fromType
      ..createTime = createTime ?? this.createTime
      ..playerGrade = playerGrade ?? this.playerGrade
      ..teamId = teamId ?? this.teamId
      ..id = id ?? this.id
      ..position = position ?? this.position
      ..power = power ?? this.power
      ..playerStatus = playerStatus ?? this.playerStatus
      ..playerStatusValue = playerStatusValue ?? this.playerStatusValue
      ..potential = potential ?? this.potential
      ..bindStatus = bindStatus ?? this.bindStatus
      ..breakThroughGrade = breakThroughGrade ?? this.breakThroughGrade
      ..playerId = playerId ?? this.playerId
      ..upStarBase = upStarBase ?? this.upStarBase;
  }
}

GameResultInfoAwayTeamResultTeamPlayersPotential $GameResultInfoAwayTeamResultTeamPlayersPotentialFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoAwayTeamResultTeamPlayersPotential gameResultInfoAwayTeamResultTeamPlayersPotential = GameResultInfoAwayTeamResultTeamPlayersPotential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    gameResultInfoAwayTeamResultTeamPlayersPotential.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    gameResultInfoAwayTeamResultTeamPlayersPotential.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    gameResultInfoAwayTeamResultTeamPlayersPotential.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    gameResultInfoAwayTeamResultTeamPlayersPotential.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    gameResultInfoAwayTeamResultTeamPlayersPotential.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    gameResultInfoAwayTeamResultTeamPlayersPotential.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    gameResultInfoAwayTeamResultTeamPlayersPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    gameResultInfoAwayTeamResultTeamPlayersPotential.reb = reb;
  }
  return gameResultInfoAwayTeamResultTeamPlayersPotential;
}

Map<String, dynamic> $GameResultInfoAwayTeamResultTeamPlayersPotentialToJson(
    GameResultInfoAwayTeamResultTeamPlayersPotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['tech'] = entity.tech;
  data['pass'] = entity.pass;
  data['stl'] = entity.stl;
  data['threePm'] = entity.threePm;
  data['ftm'] = entity.ftm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension GameResultInfoAwayTeamResultTeamPlayersPotentialExtension on GameResultInfoAwayTeamResultTeamPlayersPotential {
  GameResultInfoAwayTeamResultTeamPlayersPotential copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return GameResultInfoAwayTeamResultTeamPlayersPotential()
      ..blk = blk ?? this.blk
      ..tech = tech ?? this.tech
      ..pass = pass ?? this.pass
      ..stl = stl ?? this.stl
      ..threePm = threePm ?? this.threePm
      ..ftm = ftm ?? this.ftm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

GameResultInfoAwayTeamResultTeamPlayersUpStarBase $GameResultInfoAwayTeamResultTeamPlayersUpStarBaseFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoAwayTeamResultTeamPlayersUpStarBase gameResultInfoAwayTeamResultTeamPlayersUpStarBase = GameResultInfoAwayTeamResultTeamPlayersUpStarBase();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    gameResultInfoAwayTeamResultTeamPlayersUpStarBase.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    gameResultInfoAwayTeamResultTeamPlayersUpStarBase.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    gameResultInfoAwayTeamResultTeamPlayersUpStarBase.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    gameResultInfoAwayTeamResultTeamPlayersUpStarBase.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    gameResultInfoAwayTeamResultTeamPlayersUpStarBase.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    gameResultInfoAwayTeamResultTeamPlayersUpStarBase.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    gameResultInfoAwayTeamResultTeamPlayersUpStarBase.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    gameResultInfoAwayTeamResultTeamPlayersUpStarBase.reb = reb;
  }
  return gameResultInfoAwayTeamResultTeamPlayersUpStarBase;
}

Map<String, dynamic> $GameResultInfoAwayTeamResultTeamPlayersUpStarBaseToJson(
    GameResultInfoAwayTeamResultTeamPlayersUpStarBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['tech'] = entity.tech;
  data['pass'] = entity.pass;
  data['stl'] = entity.stl;
  data['threePm'] = entity.threePm;
  data['ftm'] = entity.ftm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension GameResultInfoAwayTeamResultTeamPlayersUpStarBaseExtension on GameResultInfoAwayTeamResultTeamPlayersUpStarBase {
  GameResultInfoAwayTeamResultTeamPlayersUpStarBase copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return GameResultInfoAwayTeamResultTeamPlayersUpStarBase()
      ..blk = blk ?? this.blk
      ..tech = tech ?? this.tech
      ..pass = pass ?? this.pass
      ..stl = stl ?? this.stl
      ..threePm = threePm ?? this.threePm
      ..ftm = ftm ?? this.ftm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

GameResultInfoAwayTeamResultDropAwardData $GameResultInfoAwayTeamResultDropAwardDataFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoAwayTeamResultDropAwardData gameResultInfoAwayTeamResultDropAwardData = GameResultInfoAwayTeamResultDropAwardData();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    gameResultInfoAwayTeamResultDropAwardData.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    gameResultInfoAwayTeamResultDropAwardData.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    gameResultInfoAwayTeamResultDropAwardData.type = type;
  }
  return gameResultInfoAwayTeamResultDropAwardData;
}

Map<String, dynamic> $GameResultInfoAwayTeamResultDropAwardDataToJson(
    GameResultInfoAwayTeamResultDropAwardData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension GameResultInfoAwayTeamResultDropAwardDataExtension on GameResultInfoAwayTeamResultDropAwardData {
  GameResultInfoAwayTeamResultDropAwardData copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return GameResultInfoAwayTeamResultDropAwardData()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}

GameResultInfoGameScoreBoard $GameResultInfoGameScoreBoardFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoGameScoreBoard gameResultInfoGameScoreBoard = GameResultInfoGameScoreBoard();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameResultInfoGameScoreBoard.gameId = gameId;
  }
  final int? quarter1 = jsonConvert.convert<int>(json['quarter1']);
  if (quarter1 != null) {
    gameResultInfoGameScoreBoard.quarter1 = quarter1;
  }
  final int? quarter2 = jsonConvert.convert<int>(json['quarter2']);
  if (quarter2 != null) {
    gameResultInfoGameScoreBoard.quarter2 = quarter2;
  }
  final int? quarter3 = jsonConvert.convert<int>(json['quarter3']);
  if (quarter3 != null) {
    gameResultInfoGameScoreBoard.quarter3 = quarter3;
  }
  final int? quarter4 = jsonConvert.convert<int>(json['quarter4']);
  if (quarter4 != null) {
    gameResultInfoGameScoreBoard.quarter4 = quarter4;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameResultInfoGameScoreBoard.updateTime = updateTime;
  }
  final int? ot2 = jsonConvert.convert<int>(json['ot2']);
  if (ot2 != null) {
    gameResultInfoGameScoreBoard.ot2 = ot2;
  }
  final int? ot1 = jsonConvert.convert<int>(json['ot1']);
  if (ot1 != null) {
    gameResultInfoGameScoreBoard.ot1 = ot1;
  }
  final int? ot4 = jsonConvert.convert<int>(json['ot4']);
  if (ot4 != null) {
    gameResultInfoGameScoreBoard.ot4 = ot4;
  }
  final int? ot3 = jsonConvert.convert<int>(json['ot3']);
  if (ot3 != null) {
    gameResultInfoGameScoreBoard.ot3 = ot3;
  }
  final int? ot6 = jsonConvert.convert<int>(json['ot6']);
  if (ot6 != null) {
    gameResultInfoGameScoreBoard.ot6 = ot6;
  }
  final int? ot5 = jsonConvert.convert<int>(json['ot5']);
  if (ot5 != null) {
    gameResultInfoGameScoreBoard.ot5 = ot5;
  }
  final int? ot8 = jsonConvert.convert<int>(json['ot8']);
  if (ot8 != null) {
    gameResultInfoGameScoreBoard.ot8 = ot8;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    gameResultInfoGameScoreBoard.total = total;
  }
  final int? ot7 = jsonConvert.convert<int>(json['ot7']);
  if (ot7 != null) {
    gameResultInfoGameScoreBoard.ot7 = ot7;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameResultInfoGameScoreBoard.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    gameResultInfoGameScoreBoard.teamId = teamId;
  }
  return gameResultInfoGameScoreBoard;
}

Map<String, dynamic> $GameResultInfoGameScoreBoardToJson(
    GameResultInfoGameScoreBoard entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['quarter1'] = entity.quarter1;
  data['quarter2'] = entity.quarter2;
  data['quarter3'] = entity.quarter3;
  data['quarter4'] = entity.quarter4;
  data['updateTime'] = entity.updateTime;
  data['ot2'] = entity.ot2;
  data['ot1'] = entity.ot1;
  data['ot4'] = entity.ot4;
  data['ot3'] = entity.ot3;
  data['ot6'] = entity.ot6;
  data['ot5'] = entity.ot5;
  data['ot8'] = entity.ot8;
  data['total'] = entity.total;
  data['ot7'] = entity.ot7;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  return data;
}

extension GameResultInfoGameScoreBoardExtension on GameResultInfoGameScoreBoard {
  GameResultInfoGameScoreBoard copyWith({
    int? gameId,
    int? quarter1,
    int? quarter2,
    int? quarter3,
    int? quarter4,
    int? updateTime,
    int? ot2,
    int? ot1,
    int? ot4,
    int? ot3,
    int? ot6,
    int? ot5,
    int? ot8,
    int? total,
    int? ot7,
    int? createTime,
    int? teamId,
  }) {
    return GameResultInfoGameScoreBoard()
      ..gameId = gameId ?? this.gameId
      ..quarter1 = quarter1 ?? this.quarter1
      ..quarter2 = quarter2 ?? this.quarter2
      ..quarter3 = quarter3 ?? this.quarter3
      ..quarter4 = quarter4 ?? this.quarter4
      ..updateTime = updateTime ?? this.updateTime
      ..ot2 = ot2 ?? this.ot2
      ..ot1 = ot1 ?? this.ot1
      ..ot4 = ot4 ?? this.ot4
      ..ot3 = ot3 ?? this.ot3
      ..ot6 = ot6 ?? this.ot6
      ..ot5 = ot5 ?? this.ot5
      ..ot8 = ot8 ?? this.ot8
      ..total = total ?? this.total
      ..ot7 = ot7 ?? this.ot7
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId;
  }
}

GameResultInfoPlayerResults $GameResultInfoPlayerResultsFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoPlayerResults gameResultInfoPlayerResults = GameResultInfoPlayerResults();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    gameResultInfoPlayerResults.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameResultInfoPlayerResults.gameId = gameId;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    gameResultInfoPlayerResults.ast = ast;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameResultInfoPlayerResults.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    gameResultInfoPlayerResults.teamId = teamId;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    gameResultInfoPlayerResults.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameResultInfoPlayerResults.updateTime = updateTime;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    gameResultInfoPlayerResults.type = type;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    gameResultInfoPlayerResults.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    gameResultInfoPlayerResults.reb = reb;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    gameResultInfoPlayerResults.playerId = playerId;
  }
  return gameResultInfoPlayerResults;
}

Map<String, dynamic> $GameResultInfoPlayerResultsToJson(
    GameResultInfoPlayerResults entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['ast'] = entity.ast;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['type'] = entity.type;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['playerId'] = entity.playerId;
  return data;
}

extension GameResultInfoPlayerResultsExtension on GameResultInfoPlayerResults {
  GameResultInfoPlayerResults copyWith({
    int? blk,
    int? gameId,
    int? ast,
    int? createTime,
    int? teamId,
    int? stl,
    int? updateTime,
    int? type,
    int? pts,
    int? reb,
    int? playerId,
  }) {
    return GameResultInfoPlayerResults()
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..ast = ast ?? this.ast
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..type = type ?? this.type
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..playerId = playerId ?? this.playerId;
  }
}

GameResultInfoGameScoreBoardDetail $GameResultInfoGameScoreBoardDetailFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoGameScoreBoardDetail gameResultInfoGameScoreBoardDetail = GameResultInfoGameScoreBoardDetail();
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    gameResultInfoGameScoreBoardDetail.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    gameResultInfoGameScoreBoardDetail.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    gameResultInfoGameScoreBoardDetail.dreb = dreb;
  }
  final int? starterPos = jsonConvert.convert<int>(json['starterPos']);
  if (starterPos != null) {
    gameResultInfoGameScoreBoardDetail.starterPos = starterPos;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    gameResultInfoGameScoreBoardDetail.fgm = fgm;
  }
  final int? ptsPoint = jsonConvert.convert<int>(json['ptsPoint']);
  if (ptsPoint != null) {
    gameResultInfoGameScoreBoardDetail.ptsPoint = ptsPoint;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    gameResultInfoGameScoreBoardDetail.reb = reb;
  }
  final int? mvpPoint = jsonConvert.convert<int>(json['mvpPoint']);
  if (mvpPoint != null) {
    gameResultInfoGameScoreBoardDetail.mvpPoint = mvpPoint;
  }
  final double? score = jsonConvert.convert<double>(json['score']);
  if (score != null) {
    gameResultInfoGameScoreBoardDetail.score = score;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    gameResultInfoGameScoreBoardDetail.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    gameResultInfoGameScoreBoardDetail.min = min;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    gameResultInfoGameScoreBoardDetail.property = property;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    gameResultInfoGameScoreBoardDetail.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    gameResultInfoGameScoreBoardDetail.playerId = playerId;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    gameResultInfoGameScoreBoardDetail.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameResultInfoGameScoreBoardDetail.gameId = gameId;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    gameResultInfoGameScoreBoardDetail.tech = tech;
  }
  final int? astPoint = jsonConvert.convert<int>(json['astPoint']);
  if (astPoint != null) {
    gameResultInfoGameScoreBoardDetail.astPoint = astPoint;
  }
  final bool? starter = jsonConvert.convert<bool>(json['starter']);
  if (starter != null) {
    gameResultInfoGameScoreBoardDetail.starter = starter;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    gameResultInfoGameScoreBoardDetail.pass = pass;
  }
  final int? blkPoint = jsonConvert.convert<int>(json['blkPoint']);
  if (blkPoint != null) {
    gameResultInfoGameScoreBoardDetail.blkPoint = blkPoint;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    gameResultInfoGameScoreBoardDetail.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameResultInfoGameScoreBoardDetail.updateTime = updateTime;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    gameResultInfoGameScoreBoardDetail.pts = pts;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    gameResultInfoGameScoreBoardDetail.threePa = threePa;
  }
  final int? rebPoint = jsonConvert.convert<int>(json['rebPoint']);
  if (rebPoint != null) {
    gameResultInfoGameScoreBoardDetail.rebPoint = rebPoint;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    gameResultInfoGameScoreBoardDetail.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameResultInfoGameScoreBoardDetail.createTime = createTime;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    gameResultInfoGameScoreBoardDetail.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    gameResultInfoGameScoreBoardDetail.teamId = teamId;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    gameResultInfoGameScoreBoardDetail.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    gameResultInfoGameScoreBoardDetail.to = to;
  }
  return gameResultInfoGameScoreBoardDetail;
}

Map<String, dynamic> $GameResultInfoGameScoreBoardDetailToJson(
    GameResultInfoGameScoreBoardDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['starterPos'] = entity.starterPos;
  data['fgm'] = entity.fgm;
  data['ptsPoint'] = entity.ptsPoint;
  data['reb'] = entity.reb;
  data['mvpPoint'] = entity.mvpPoint;
  data['score'] = entity.score;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['property'] = entity.property;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['tech'] = entity.tech;
  data['astPoint'] = entity.astPoint;
  data['starter'] = entity.starter;
  data['pass'] = entity.pass;
  data['blkPoint'] = entity.blkPoint;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['rebPoint'] = entity.rebPoint;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  return data;
}

extension GameResultInfoGameScoreBoardDetailExtension on GameResultInfoGameScoreBoardDetail {
  GameResultInfoGameScoreBoardDetail copyWith({
    int? fga,
    int? ast,
    int? dreb,
    int? starterPos,
    int? fgm,
    int? ptsPoint,
    int? reb,
    int? mvpPoint,
    double? score,
    int? fta,
    int? min,
    int? property,
    int? ftm,
    int? playerId,
    int? blk,
    int? gameId,
    int? tech,
    int? astPoint,
    bool? starter,
    int? pass,
    int? blkPoint,
    int? stl,
    int? updateTime,
    int? pts,
    int? threePa,
    int? rebPoint,
    int? oreb,
    int? createTime,
    int? pf,
    int? teamId,
    int? threePm,
    int? to,
  }) {
    return GameResultInfoGameScoreBoardDetail()
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..starterPos = starterPos ?? this.starterPos
      ..fgm = fgm ?? this.fgm
      ..ptsPoint = ptsPoint ?? this.ptsPoint
      ..reb = reb ?? this.reb
      ..mvpPoint = mvpPoint ?? this.mvpPoint
      ..score = score ?? this.score
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..property = property ?? this.property
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..tech = tech ?? this.tech
      ..astPoint = astPoint ?? this.astPoint
      ..starter = starter ?? this.starter
      ..pass = pass ?? this.pass
      ..blkPoint = blkPoint ?? this.blkPoint
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..rebPoint = rebPoint ?? this.rebPoint
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to;
  }
}

GameResultInfoGsGameSchedule $GameResultInfoGsGameScheduleFromJson(
    Map<String, dynamic> json) {
  final GameResultInfoGsGameSchedule gameResultInfoGsGameSchedule = GameResultInfoGsGameSchedule();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    gameResultInfoGsGameSchedule.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    gameResultInfoGsGameSchedule.gameType = gameType;
  }
  final int? finishTime = jsonConvert.convert<int>(json['finishTime']);
  if (finishTime != null) {
    gameResultInfoGsGameSchedule.finishTime = finishTime;
  }
  final int? homeScore = jsonConvert.convert<int>(json['homeScore']);
  if (homeScore != null) {
    gameResultInfoGsGameSchedule.homeScore = homeScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    gameResultInfoGsGameSchedule.updateTime = updateTime;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    gameResultInfoGsGameSchedule.gameTime = gameTime;
  }
  final int? awayScore = jsonConvert.convert<int>(json['awayScore']);
  if (awayScore != null) {
    gameResultInfoGsGameSchedule.awayScore = awayScore;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    gameResultInfoGsGameSchedule.createTime = createTime;
  }
  final String? awayTeamName = jsonConvert.convert<String>(
      json['awayTeamName']);
  if (awayTeamName != null) {
    gameResultInfoGsGameSchedule.awayTeamName = awayTeamName;
  }
  final int? homeLeagueId = jsonConvert.convert<int>(json['homeLeagueId']);
  if (homeLeagueId != null) {
    gameResultInfoGsGameSchedule.homeLeagueId = homeLeagueId;
  }
  final int? awayLeagueId = jsonConvert.convert<int>(json['awayLeagueId']);
  if (awayLeagueId != null) {
    gameResultInfoGsGameSchedule.awayLeagueId = awayLeagueId;
  }
  final int? startTime = jsonConvert.convert<int>(json['startTime']);
  if (startTime != null) {
    gameResultInfoGsGameSchedule.startTime = startTime;
  }
  final int? awayTeamLogo = jsonConvert.convert<int>(json['awayTeamLogo']);
  if (awayTeamLogo != null) {
    gameResultInfoGsGameSchedule.awayTeamLogo = awayTeamLogo;
  }
  final int? homeTeamLogo = jsonConvert.convert<int>(json['homeTeamLogo']);
  if (homeTeamLogo != null) {
    gameResultInfoGsGameSchedule.homeTeamLogo = homeTeamLogo;
  }
  final String? homeTeamName = jsonConvert.convert<String>(
      json['homeTeamName']);
  if (homeTeamName != null) {
    gameResultInfoGsGameSchedule.homeTeamName = homeTeamName;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    gameResultInfoGsGameSchedule.homeTeamId = homeTeamId;
  }
  final String? awayLeagueName = jsonConvert.convert<String>(
      json['awayLeagueName']);
  if (awayLeagueName != null) {
    gameResultInfoGsGameSchedule.awayLeagueName = awayLeagueName;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    gameResultInfoGsGameSchedule.awayTeamId = awayTeamId;
  }
  final String? homeLeagueName = jsonConvert.convert<String>(
      json['homeLeagueName']);
  if (homeLeagueName != null) {
    gameResultInfoGsGameSchedule.homeLeagueName = homeLeagueName;
  }
  return gameResultInfoGsGameSchedule;
}

Map<String, dynamic> $GameResultInfoGsGameScheduleToJson(
    GameResultInfoGsGameSchedule entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['finishTime'] = entity.finishTime;
  data['homeScore'] = entity.homeScore;
  data['updateTime'] = entity.updateTime;
  data['gameTime'] = entity.gameTime;
  data['awayScore'] = entity.awayScore;
  data['createTime'] = entity.createTime;
  data['awayTeamName'] = entity.awayTeamName;
  data['homeLeagueId'] = entity.homeLeagueId;
  data['awayLeagueId'] = entity.awayLeagueId;
  data['startTime'] = entity.startTime;
  data['awayTeamLogo'] = entity.awayTeamLogo;
  data['homeTeamLogo'] = entity.homeTeamLogo;
  data['homeTeamName'] = entity.homeTeamName;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayLeagueName'] = entity.awayLeagueName;
  data['awayTeamId'] = entity.awayTeamId;
  data['homeLeagueName'] = entity.homeLeagueName;
  return data;
}

extension GameResultInfoGsGameScheduleExtension on GameResultInfoGsGameSchedule {
  GameResultInfoGsGameSchedule copyWith({
    int? gameId,
    int? gameType,
    int? finishTime,
    int? homeScore,
    int? updateTime,
    int? gameTime,
    int? awayScore,
    int? createTime,
    String? awayTeamName,
    int? homeLeagueId,
    int? awayLeagueId,
    int? startTime,
    int? awayTeamLogo,
    int? homeTeamLogo,
    String? homeTeamName,
    int? homeTeamId,
    String? awayLeagueName,
    int? awayTeamId,
    String? homeLeagueName,
  }) {
    return GameResultInfoGsGameSchedule()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..finishTime = finishTime ?? this.finishTime
      ..homeScore = homeScore ?? this.homeScore
      ..updateTime = updateTime ?? this.updateTime
      ..gameTime = gameTime ?? this.gameTime
      ..awayScore = awayScore ?? this.awayScore
      ..createTime = createTime ?? this.createTime
      ..awayTeamName = awayTeamName ?? this.awayTeamName
      ..homeLeagueId = homeLeagueId ?? this.homeLeagueId
      ..awayLeagueId = awayLeagueId ?? this.awayLeagueId
      ..startTime = startTime ?? this.startTime
      ..awayTeamLogo = awayTeamLogo ?? this.awayTeamLogo
      ..homeTeamLogo = homeTeamLogo ?? this.homeTeamLogo
      ..homeTeamName = homeTeamName ?? this.homeTeamName
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayLeagueName = awayLeagueName ?? this.awayLeagueName
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..homeLeagueName = homeLeagueName ?? this.homeLeagueName;
  }
}