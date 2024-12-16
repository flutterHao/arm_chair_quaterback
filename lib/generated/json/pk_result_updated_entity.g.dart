import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/pk_result_updated_entity.dart';

PkResultUpdatedEntity $PkResultUpdatedEntityFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedEntity pkResultUpdatedEntity = PkResultUpdatedEntity();
  final PkResultUpdatedTeamResult? awayTeamResult = jsonConvert.convert<
      PkResultUpdatedTeamResult>(json['awayTeamResult']);
  if (awayTeamResult != null) {
    pkResultUpdatedEntity.awayTeamResult = awayTeamResult;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    pkResultUpdatedEntity.gameType = gameType;
  }
  final PkResultUpdatedTeamResult? homeTeamResult = jsonConvert.convert<
      PkResultUpdatedTeamResult>(json['homeTeamResult']);
  if (homeTeamResult != null) {
    pkResultUpdatedEntity.homeTeamResult = homeTeamResult;
  }
  final List<
      PkResultUpdatedPlayerResults>? playerResults = (json['playerResults'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PkResultUpdatedPlayerResults>(
          e) as PkResultUpdatedPlayerResults).toList();
  if (playerResults != null) {
    pkResultUpdatedEntity.playerResults = playerResults;
  }
  return pkResultUpdatedEntity;
}

Map<String, dynamic> $PkResultUpdatedEntityToJson(
    PkResultUpdatedEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awayTeamResult'] = entity.awayTeamResult.toJson();
  data['gameType'] = entity.gameType;
  data['homeTeamResult'] = entity.homeTeamResult.toJson();
  data['playerResults'] = entity.playerResults.map((v) => v.toJson()).toList();
  return data;
}

extension PkResultUpdatedEntityExtension on PkResultUpdatedEntity {
  PkResultUpdatedEntity copyWith({
    PkResultUpdatedTeamResult? awayTeamResult,
    int? gameType,
    PkResultUpdatedTeamResult? homeTeamResult,
    List<PkResultUpdatedPlayerResults>? playerResults,
  }) {
    return PkResultUpdatedEntity()
      ..awayTeamResult = awayTeamResult ?? this.awayTeamResult
      ..gameType = gameType ?? this.gameType
      ..homeTeamResult = homeTeamResult ?? this.homeTeamResult
      ..playerResults = playerResults ?? this.playerResults;
  }
}

PkResultUpdatedTeamResult $PkResultUpdatedTeamResultFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedTeamResult pkResultUpdatedTeamResult = PkResultUpdatedTeamResult();
  final bool? ast = jsonConvert.convert<bool>(json['ast']);
  if (ast != null) {
    pkResultUpdatedTeamResult.ast = ast;
  }
  final int? cardBoxId = jsonConvert.convert<int>(json['cardBoxId']);
  if (cardBoxId != null) {
    pkResultUpdatedTeamResult.cardBoxId = cardBoxId;
  }
  final bool? cardBoxIsFull = jsonConvert.convert<bool>(json['cardBoxIsFull']);
  if (cardBoxIsFull != null) {
    pkResultUpdatedTeamResult.cardBoxIsFull = cardBoxIsFull;
  }
  final int? cup = jsonConvert.convert<int>(json['cup']);
  if (cup != null) {
    pkResultUpdatedTeamResult.cup = cup;
  }
  final List<DropAwardData>? dropAwardData = (json['dropAwardData'] as List<
      dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<DropAwardData>(e) as DropAwardData)
      .toList();
  if (dropAwardData != null) {
    pkResultUpdatedTeamResult.dropAwardData = dropAwardData;
  }
  final bool? mvp = jsonConvert.convert<bool>(json['mvp']);
  if (mvp != null) {
    pkResultUpdatedTeamResult.mvp = mvp;
  }
  final List<dynamic>? otherAwardData = (json['otherAwardData'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (otherAwardData != null) {
    pkResultUpdatedTeamResult.otherAwardData = otherAwardData;
  }
  final String? parameter = jsonConvert.convert<String>(json['parameter']);
  if (parameter != null) {
    pkResultUpdatedTeamResult.parameter = parameter;
  }
  final bool? pts = jsonConvert.convert<bool>(json['pts']);
  if (pts != null) {
    pkResultUpdatedTeamResult.pts = pts;
  }
  final bool? reb = jsonConvert.convert<bool>(json['reb']);
  if (reb != null) {
    pkResultUpdatedTeamResult.reb = reb;
  }
  final int? score = jsonConvert.convert<int>(json['score']);
  if (score != null) {
    pkResultUpdatedTeamResult.score = score;
  }
  final List<
      PkResultUpdatedAwayTeamResultScoreBoardDetailList>? scoreBoardDetailList = (json['scoreBoardDetailList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<
          PkResultUpdatedAwayTeamResultScoreBoardDetailList>(
          e) as PkResultUpdatedAwayTeamResultScoreBoardDetailList).toList();
  if (scoreBoardDetailList != null) {
    pkResultUpdatedTeamResult.scoreBoardDetailList = scoreBoardDetailList;
  }
  final PkResultUpdatedAwayTeamResultScoreBoards? scoreBoards = jsonConvert
      .convert<PkResultUpdatedAwayTeamResultScoreBoards>(json['scoreBoards']);
  if (scoreBoards != null) {
    pkResultUpdatedTeamResult.scoreBoards = scoreBoards;
  }
  final String? serverId = jsonConvert.convert<String>(json['serverId']);
  if (serverId != null) {
    pkResultUpdatedTeamResult.serverId = serverId;
  }
  final int? starNum = jsonConvert.convert<int>(json['starNum']);
  if (starNum != null) {
    pkResultUpdatedTeamResult.starNum = starNum;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    pkResultUpdatedTeamResult.teamId = teamId;
  }
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    pkResultUpdatedTeamResult.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    pkResultUpdatedTeamResult.teamName = teamName;
  }
  final List<
      PkResultUpdatedAwayTeamResultTeamPlayers>? teamPlayers = (json['teamPlayers'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PkResultUpdatedAwayTeamResultTeamPlayers>(
          e) as PkResultUpdatedAwayTeamResultTeamPlayers).toList();
  if (teamPlayers != null) {
    pkResultUpdatedTeamResult.teamPlayers = teamPlayers;
  }
  final List<dynamic>? vipAwardData = (json['vipAwardData'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (vipAwardData != null) {
    pkResultUpdatedTeamResult.vipAwardData = vipAwardData;
  }
  final bool? win = jsonConvert.convert<bool>(json['win']);
  if (win != null) {
    pkResultUpdatedTeamResult.win = win;
  }
  return pkResultUpdatedTeamResult;
}

Map<String, dynamic> $PkResultUpdatedTeamResultToJson(
    PkResultUpdatedTeamResult entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['cardBoxId'] = entity.cardBoxId;
  data['cardBoxIsFull'] = entity.cardBoxIsFull;
  data['cup'] = entity.cup;
  data['dropAwardData'] = entity.dropAwardData.map((v) => v.toJson()).toList();
  data['mvp'] = entity.mvp;
  data['otherAwardData'] = entity.otherAwardData;
  data['parameter'] = entity.parameter;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['score'] = entity.score;
  data['scoreBoardDetailList'] =
      entity.scoreBoardDetailList.map((v) => v.toJson()).toList();
  data['scoreBoards'] = entity.scoreBoards.toJson();
  data['serverId'] = entity.serverId;
  data['starNum'] = entity.starNum;
  data['teamId'] = entity.teamId;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['teamPlayers'] = entity.teamPlayers.map((v) => v.toJson()).toList();
  data['vipAwardData'] = entity.vipAwardData;
  data['win'] = entity.win;
  return data;
}

extension PkResultUpdatedTeamResultExtension on PkResultUpdatedTeamResult {
  PkResultUpdatedTeamResult copyWith({
    bool? ast,
    int? cardBoxId,
    bool? cardBoxIsFull,
    int? cup,
    List<DropAwardData>? dropAwardData,
    bool? mvp,
    List<dynamic>? otherAwardData,
    String? parameter,
    bool? pts,
    bool? reb,
    int? score,
    List<
        PkResultUpdatedAwayTeamResultScoreBoardDetailList>? scoreBoardDetailList,
    PkResultUpdatedAwayTeamResultScoreBoards? scoreBoards,
    String? serverId,
    int? starNum,
    int? teamId,
    int? teamLogo,
    String? teamName,
    List<PkResultUpdatedAwayTeamResultTeamPlayers>? teamPlayers,
    List<dynamic>? vipAwardData,
    bool? win,
  }) {
    return PkResultUpdatedTeamResult()
      ..ast = ast ?? this.ast
      ..cardBoxId = cardBoxId ?? this.cardBoxId
      ..cardBoxIsFull = cardBoxIsFull ?? this.cardBoxIsFull
      ..cup = cup ?? this.cup
      ..dropAwardData = dropAwardData ?? this.dropAwardData
      ..mvp = mvp ?? this.mvp
      ..otherAwardData = otherAwardData ?? this.otherAwardData
      ..parameter = parameter ?? this.parameter
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..score = score ?? this.score
      ..scoreBoardDetailList = scoreBoardDetailList ?? this.scoreBoardDetailList
      ..scoreBoards = scoreBoards ?? this.scoreBoards
      ..serverId = serverId ?? this.serverId
      ..starNum = starNum ?? this.starNum
      ..teamId = teamId ?? this.teamId
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..teamPlayers = teamPlayers ?? this.teamPlayers
      ..vipAwardData = vipAwardData ?? this.vipAwardData
      ..win = win ?? this.win;
  }
}

PkResultUpdatedAwayTeamResultScoreBoardDetailList $PkResultUpdatedAwayTeamResultScoreBoardDetailListFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedAwayTeamResultScoreBoardDetailList pkResultUpdatedAwayTeamResultScoreBoardDetailList = PkResultUpdatedAwayTeamResultScoreBoardDetailList();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.ast = ast;
  }
  final int? astPoint = jsonConvert.convert<int>(json['astPoint']);
  if (astPoint != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.astPoint = astPoint;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.blk = blk;
  }
  final int? blkPoint = jsonConvert.convert<int>(json['blkPoint']);
  if (blkPoint != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.blkPoint = blkPoint;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.createTime = createTime;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.dreb = dreb;
  }
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.fga = fga;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.fgm = fgm;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.fta = fta;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.ftm = ftm;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.gameId = gameId;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.min = min;
  }
  final int? mvpPoint = jsonConvert.convert<int>(json['mvpPoint']);
  if (mvpPoint != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.mvpPoint = mvpPoint;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.oreb = oreb;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.pass = pass;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.pf = pf;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.playerId = playerId;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.property = property;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.pts = pts;
  }
  final int? ptsPoint = jsonConvert.convert<int>(json['ptsPoint']);
  if (ptsPoint != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.ptsPoint = ptsPoint;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.reb = reb;
  }
  final int? rebPoint = jsonConvert.convert<int>(json['rebPoint']);
  if (rebPoint != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.rebPoint = rebPoint;
  }
  final double? score = jsonConvert.convert<double>(json['score']);
  if (score != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.score = score;
  }
  final bool? starter = jsonConvert.convert<bool>(json['starter']);
  if (starter != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.starter = starter;
  }
  final int? starterPos = jsonConvert.convert<int>(json['starterPos']);
  if (starterPos != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.starterPos = starterPos;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.stl = stl;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.teamId = teamId;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.tech = tech;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.threePa = threePa;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.to = to;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    pkResultUpdatedAwayTeamResultScoreBoardDetailList.updateTime = updateTime;
  }
  return pkResultUpdatedAwayTeamResultScoreBoardDetailList;
}

Map<String, dynamic> $PkResultUpdatedAwayTeamResultScoreBoardDetailListToJson(
    PkResultUpdatedAwayTeamResultScoreBoardDetailList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['astPoint'] = entity.astPoint;
  data['blk'] = entity.blk;
  data['blkPoint'] = entity.blkPoint;
  data['createTime'] = entity.createTime;
  data['dreb'] = entity.dreb;
  data['fga'] = entity.fga;
  data['fgm'] = entity.fgm;
  data['fta'] = entity.fta;
  data['ftm'] = entity.ftm;
  data['gameId'] = entity.gameId;
  data['min'] = entity.min;
  data['mvpPoint'] = entity.mvpPoint;
  data['oreb'] = entity.oreb;
  data['pass'] = entity.pass;
  data['pf'] = entity.pf;
  data['playerId'] = entity.playerId;
  data['property'] = entity.property;
  data['pts'] = entity.pts;
  data['ptsPoint'] = entity.ptsPoint;
  data['reb'] = entity.reb;
  data['rebPoint'] = entity.rebPoint;
  data['score'] = entity.score;
  data['starter'] = entity.starter;
  data['starterPos'] = entity.starterPos;
  data['stl'] = entity.stl;
  data['teamId'] = entity.teamId;
  data['tech'] = entity.tech;
  data['threePa'] = entity.threePa;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension PkResultUpdatedAwayTeamResultScoreBoardDetailListExtension on PkResultUpdatedAwayTeamResultScoreBoardDetailList {
  PkResultUpdatedAwayTeamResultScoreBoardDetailList copyWith({
    int? ast,
    int? astPoint,
    int? blk,
    int? blkPoint,
    int? createTime,
    int? dreb,
    int? fga,
    int? fgm,
    int? fta,
    int? ftm,
    int? gameId,
    int? min,
    int? mvpPoint,
    int? oreb,
    int? pass,
    int? pf,
    int? playerId,
    int? property,
    int? pts,
    int? ptsPoint,
    int? reb,
    int? rebPoint,
    double? score,
    bool? starter,
    int? starterPos,
    int? stl,
    int? teamId,
    int? tech,
    int? threePa,
    int? threePm,
    int? to,
    int? updateTime,
  }) {
    return PkResultUpdatedAwayTeamResultScoreBoardDetailList()
      ..ast = ast ?? this.ast
      ..astPoint = astPoint ?? this.astPoint
      ..blk = blk ?? this.blk
      ..blkPoint = blkPoint ?? this.blkPoint
      ..createTime = createTime ?? this.createTime
      ..dreb = dreb ?? this.dreb
      ..fga = fga ?? this.fga
      ..fgm = fgm ?? this.fgm
      ..fta = fta ?? this.fta
      ..ftm = ftm ?? this.ftm
      ..gameId = gameId ?? this.gameId
      ..min = min ?? this.min
      ..mvpPoint = mvpPoint ?? this.mvpPoint
      ..oreb = oreb ?? this.oreb
      ..pass = pass ?? this.pass
      ..pf = pf ?? this.pf
      ..playerId = playerId ?? this.playerId
      ..property = property ?? this.property
      ..pts = pts ?? this.pts
      ..ptsPoint = ptsPoint ?? this.ptsPoint
      ..reb = reb ?? this.reb
      ..rebPoint = rebPoint ?? this.rebPoint
      ..score = score ?? this.score
      ..starter = starter ?? this.starter
      ..starterPos = starterPos ?? this.starterPos
      ..stl = stl ?? this.stl
      ..teamId = teamId ?? this.teamId
      ..tech = tech ?? this.tech
      ..threePa = threePa ?? this.threePa
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..updateTime = updateTime ?? this.updateTime;
  }
}

PkResultUpdatedAwayTeamResultScoreBoards $PkResultUpdatedAwayTeamResultScoreBoardsFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedAwayTeamResultScoreBoards pkResultUpdatedAwayTeamResultScoreBoards = PkResultUpdatedAwayTeamResultScoreBoards();
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.createTime = createTime;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.gameId = gameId;
  }
  final int? ot1 = jsonConvert.convert<int>(json['ot1']);
  if (ot1 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.ot1 = ot1;
  }
  final int? ot2 = jsonConvert.convert<int>(json['ot2']);
  if (ot2 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.ot2 = ot2;
  }
  final int? ot3 = jsonConvert.convert<int>(json['ot3']);
  if (ot3 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.ot3 = ot3;
  }
  final int? ot4 = jsonConvert.convert<int>(json['ot4']);
  if (ot4 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.ot4 = ot4;
  }
  final int? ot5 = jsonConvert.convert<int>(json['ot5']);
  if (ot5 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.ot5 = ot5;
  }
  final int? ot6 = jsonConvert.convert<int>(json['ot6']);
  if (ot6 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.ot6 = ot6;
  }
  final int? ot7 = jsonConvert.convert<int>(json['ot7']);
  if (ot7 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.ot7 = ot7;
  }
  final int? ot8 = jsonConvert.convert<int>(json['ot8']);
  if (ot8 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.ot8 = ot8;
  }
  final int? quarter1 = jsonConvert.convert<int>(json['quarter1']);
  if (quarter1 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.quarter1 = quarter1;
  }
  final int? quarter2 = jsonConvert.convert<int>(json['quarter2']);
  if (quarter2 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.quarter2 = quarter2;
  }
  final int? quarter3 = jsonConvert.convert<int>(json['quarter3']);
  if (quarter3 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.quarter3 = quarter3;
  }
  final int? quarter4 = jsonConvert.convert<int>(json['quarter4']);
  if (quarter4 != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.quarter4 = quarter4;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.teamId = teamId;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.total = total;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    pkResultUpdatedAwayTeamResultScoreBoards.updateTime = updateTime;
  }
  return pkResultUpdatedAwayTeamResultScoreBoards;
}

Map<String, dynamic> $PkResultUpdatedAwayTeamResultScoreBoardsToJson(
    PkResultUpdatedAwayTeamResultScoreBoards entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createTime'] = entity.createTime;
  data['gameId'] = entity.gameId;
  data['ot1'] = entity.ot1;
  data['ot2'] = entity.ot2;
  data['ot3'] = entity.ot3;
  data['ot4'] = entity.ot4;
  data['ot5'] = entity.ot5;
  data['ot6'] = entity.ot6;
  data['ot7'] = entity.ot7;
  data['ot8'] = entity.ot8;
  data['quarter1'] = entity.quarter1;
  data['quarter2'] = entity.quarter2;
  data['quarter3'] = entity.quarter3;
  data['quarter4'] = entity.quarter4;
  data['teamId'] = entity.teamId;
  data['total'] = entity.total;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension PkResultUpdatedAwayTeamResultScoreBoardsExtension on PkResultUpdatedAwayTeamResultScoreBoards {
  PkResultUpdatedAwayTeamResultScoreBoards copyWith({
    int? createTime,
    int? gameId,
    int? ot1,
    int? ot2,
    int? ot3,
    int? ot4,
    int? ot5,
    int? ot6,
    int? ot7,
    int? ot8,
    int? quarter1,
    int? quarter2,
    int? quarter3,
    int? quarter4,
    int? teamId,
    int? total,
    int? updateTime,
  }) {
    return PkResultUpdatedAwayTeamResultScoreBoards()
      ..createTime = createTime ?? this.createTime
      ..gameId = gameId ?? this.gameId
      ..ot1 = ot1 ?? this.ot1
      ..ot2 = ot2 ?? this.ot2
      ..ot3 = ot3 ?? this.ot3
      ..ot4 = ot4 ?? this.ot4
      ..ot5 = ot5 ?? this.ot5
      ..ot6 = ot6 ?? this.ot6
      ..ot7 = ot7 ?? this.ot7
      ..ot8 = ot8 ?? this.ot8
      ..quarter1 = quarter1 ?? this.quarter1
      ..quarter2 = quarter2 ?? this.quarter2
      ..quarter3 = quarter3 ?? this.quarter3
      ..quarter4 = quarter4 ?? this.quarter4
      ..teamId = teamId ?? this.teamId
      ..total = total ?? this.total
      ..updateTime = updateTime ?? this.updateTime;
  }
}

PkResultUpdatedAwayTeamResultTeamPlayers $PkResultUpdatedAwayTeamResultTeamPlayersFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedAwayTeamResultTeamPlayers pkResultUpdatedAwayTeamResultTeamPlayers = PkResultUpdatedAwayTeamResultTeamPlayers();
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.breakThroughGrade =
        breakThroughGrade;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.buyPlayerScore = buyPlayerScore;
  }
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.buyPrice = buyPrice;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.createTime = createTime;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.fromType = fromType;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.gradeExp = gradeExp;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.id = id;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.playerGrade = playerGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.playerId = playerId;
  }
  final double? playerReadiness = jsonConvert.convert<double>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.playerReadiness = playerReadiness;
  }
  final int? playerStatus = jsonConvert.convert<int>(json['playerStatus']);
  if (playerStatus != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.playerStatus = playerStatus;
  }
  final int? playerStatusValue = jsonConvert.convert<int>(
      json['playerStatusValue']);
  if (playerStatusValue != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.playerStatusValue =
        playerStatusValue;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.position = position;
  }
  final PkResultUpdatedAwayTeamResultTeamPlayersPotential? potential = jsonConvert
      .convert<PkResultUpdatedAwayTeamResultTeamPlayersPotential>(
      json['potential']);
  if (potential != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.potential = potential;
  }
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.power = power;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.teamId = teamId;
  }
  final PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase? upStarBase = jsonConvert
      .convert<PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase>(
      json['upStarBase']);
  if (upStarBase != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.upStarBase = upStarBase;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.updateTime = updateTime;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    pkResultUpdatedAwayTeamResultTeamPlayers.uuid = uuid;
  }
  return pkResultUpdatedAwayTeamResultTeamPlayers;
}

Map<String, dynamic> $PkResultUpdatedAwayTeamResultTeamPlayersToJson(
    PkResultUpdatedAwayTeamResultTeamPlayers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bindStatus'] = entity.bindStatus;
  data['breakThroughGrade'] = entity.breakThroughGrade;
  data['buyPlayerScore'] = entity.buyPlayerScore;
  data['buyPrice'] = entity.buyPrice;
  data['createTime'] = entity.createTime;
  data['fromType'] = entity.fromType;
  data['gradeExp'] = entity.gradeExp;
  data['id'] = entity.id;
  data['playerGrade'] = entity.playerGrade;
  data['playerId'] = entity.playerId;
  data['playerReadiness'] = entity.playerReadiness;
  data['playerStatus'] = entity.playerStatus;
  data['playerStatusValue'] = entity.playerStatusValue;
  data['position'] = entity.position;
  data['potential'] = entity.potential.toJson();
  data['power'] = entity.power;
  data['teamId'] = entity.teamId;
  data['upStarBase'] = entity.upStarBase.toJson();
  data['updateTime'] = entity.updateTime;
  data['uuid'] = entity.uuid;
  return data;
}

extension PkResultUpdatedAwayTeamResultTeamPlayersExtension on PkResultUpdatedAwayTeamResultTeamPlayers {
  PkResultUpdatedAwayTeamResultTeamPlayers copyWith({
    bool? bindStatus,
    int? breakThroughGrade,
    int? buyPlayerScore,
    int? buyPrice,
    int? createTime,
    int? fromType,
    int? gradeExp,
    int? id,
    int? playerGrade,
    int? playerId,
    double? playerReadiness,
    int? playerStatus,
    int? playerStatusValue,
    int? position,
    PkResultUpdatedAwayTeamResultTeamPlayersPotential? potential,
    double? power,
    int? teamId,
    PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase? upStarBase,
    int? updateTime,
    String? uuid,
  }) {
    return PkResultUpdatedAwayTeamResultTeamPlayers()
      ..bindStatus = bindStatus ?? this.bindStatus
      ..breakThroughGrade = breakThroughGrade ?? this.breakThroughGrade
      ..buyPlayerScore = buyPlayerScore ?? this.buyPlayerScore
      ..buyPrice = buyPrice ?? this.buyPrice
      ..createTime = createTime ?? this.createTime
      ..fromType = fromType ?? this.fromType
      ..gradeExp = gradeExp ?? this.gradeExp
      ..id = id ?? this.id
      ..playerGrade = playerGrade ?? this.playerGrade
      ..playerId = playerId ?? this.playerId
      ..playerReadiness = playerReadiness ?? this.playerReadiness
      ..playerStatus = playerStatus ?? this.playerStatus
      ..playerStatusValue = playerStatusValue ?? this.playerStatusValue
      ..position = position ?? this.position
      ..potential = potential ?? this.potential
      ..power = power ?? this.power
      ..teamId = teamId ?? this.teamId
      ..upStarBase = upStarBase ?? this.upStarBase
      ..updateTime = updateTime ?? this.updateTime
      ..uuid = uuid ?? this.uuid;
  }
}

PkResultUpdatedAwayTeamResultTeamPlayersPotential $PkResultUpdatedAwayTeamResultTeamPlayersPotentialFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedAwayTeamResultTeamPlayersPotential pkResultUpdatedAwayTeamResultTeamPlayersPotential = PkResultUpdatedAwayTeamResultTeamPlayersPotential();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersPotential.ast = ast;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersPotential.blk = blk;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersPotential.pass = pass;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersPotential.reb = reb;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersPotential.stl = stl;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersPotential.tech = tech;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersPotential.threePm = threePm;
  }
  return pkResultUpdatedAwayTeamResultTeamPlayersPotential;
}

Map<String, dynamic> $PkResultUpdatedAwayTeamResultTeamPlayersPotentialToJson(
    PkResultUpdatedAwayTeamResultTeamPlayersPotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['blk'] = entity.blk;
  data['pass'] = entity.pass;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['stl'] = entity.stl;
  data['tech'] = entity.tech;
  data['threePm'] = entity.threePm;
  return data;
}

extension PkResultUpdatedAwayTeamResultTeamPlayersPotentialExtension on PkResultUpdatedAwayTeamResultTeamPlayersPotential {
  PkResultUpdatedAwayTeamResultTeamPlayersPotential copyWith({
    int? ast,
    int? blk,
    int? pass,
    int? pts,
    int? reb,
    int? stl,
    int? tech,
    int? threePm,
  }) {
    return PkResultUpdatedAwayTeamResultTeamPlayersPotential()
      ..ast = ast ?? this.ast
      ..blk = blk ?? this.blk
      ..pass = pass ?? this.pass
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..stl = stl ?? this.stl
      ..tech = tech ?? this.tech
      ..threePm = threePm ?? this.threePm;
  }
}

PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase $PkResultUpdatedAwayTeamResultTeamPlayersUpStarBaseFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase = PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.ast = ast;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.blk = blk;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.pass = pass;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.reb = reb;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.stl = stl;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.tech = tech;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase.threePm = threePm;
  }
  return pkResultUpdatedAwayTeamResultTeamPlayersUpStarBase;
}

Map<String, dynamic> $PkResultUpdatedAwayTeamResultTeamPlayersUpStarBaseToJson(
    PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['blk'] = entity.blk;
  data['pass'] = entity.pass;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['stl'] = entity.stl;
  data['tech'] = entity.tech;
  data['threePm'] = entity.threePm;
  return data;
}

extension PkResultUpdatedAwayTeamResultTeamPlayersUpStarBaseExtension on PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase {
  PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase copyWith({
    int? ast,
    int? blk,
    int? pass,
    int? pts,
    int? reb,
    int? stl,
    int? tech,
    int? threePm,
  }) {
    return PkResultUpdatedAwayTeamResultTeamPlayersUpStarBase()
      ..ast = ast ?? this.ast
      ..blk = blk ?? this.blk
      ..pass = pass ?? this.pass
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..stl = stl ?? this.stl
      ..tech = tech ?? this.tech
      ..threePm = threePm ?? this.threePm;
  }
}

PkResultUpdatedPlayerResults $PkResultUpdatedPlayerResultsFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedPlayerResults pkResultUpdatedPlayerResults = PkResultUpdatedPlayerResults();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    pkResultUpdatedPlayerResults.ast = ast;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    pkResultUpdatedPlayerResults.blk = blk;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    pkResultUpdatedPlayerResults.playerId = playerId;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    pkResultUpdatedPlayerResults.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    pkResultUpdatedPlayerResults.reb = reb;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    pkResultUpdatedPlayerResults.stl = stl;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    pkResultUpdatedPlayerResults.teamId = teamId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    pkResultUpdatedPlayerResults.type = type;
  }
  return pkResultUpdatedPlayerResults;
}

Map<String, dynamic> $PkResultUpdatedPlayerResultsToJson(
    PkResultUpdatedPlayerResults entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['blk'] = entity.blk;
  data['playerId'] = entity.playerId;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['stl'] = entity.stl;
  data['teamId'] = entity.teamId;
  data['type'] = entity.type;
  return data;
}

extension PkResultUpdatedPlayerResultsExtension on PkResultUpdatedPlayerResults {
  PkResultUpdatedPlayerResults copyWith({
    int? ast,
    int? blk,
    int? playerId,
    int? pts,
    int? reb,
    int? stl,
    int? teamId,
    int? type,
  }) {
    return PkResultUpdatedPlayerResults()
      ..ast = ast ?? this.ast
      ..blk = blk ?? this.blk
      ..playerId = playerId ?? this.playerId
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..stl = stl ?? this.stl
      ..teamId = teamId ?? this.teamId
      ..type = type ?? this.type;
  }
}

DropAwardData $DropAwardDataFromJson(Map<String, dynamic> json) {
  final DropAwardData dropAwardData = DropAwardData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    dropAwardData.id = id;
  }
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    dropAwardData.num = num;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    dropAwardData.type = type;
  }
  return dropAwardData;
}

Map<String, dynamic> $DropAwardDataToJson(DropAwardData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['num'] = entity.num;
  data['type'] = entity.type;
  return data;
}

extension DropAwardDataExtension on DropAwardData {
  DropAwardData copyWith({
    int? id,
    int? num,
    int? type,
  }) {
    return DropAwardData()
      ..id = id ?? this.id
      ..num = num ?? this.num
      ..type = type ?? this.type;
  }
}