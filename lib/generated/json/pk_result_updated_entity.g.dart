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
  final List<dynamic>? dropAwardData = (json['dropAwardData'] as List<dynamic>?)
      ?.map(
          (e) => e)
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
  data['dropAwardData'] = entity.dropAwardData;
  data['mvp'] = entity.mvp;
  data['otherAwardData'] = entity.otherAwardData;
  data['parameter'] = entity.parameter;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['score'] = entity.score;
  data['scoreBoardDetailList'] =
      entity.scoreBoardDetailList.map((v) => v.toJson()).toList();
  data['starNum'] = entity.starNum;
  data['teamId'] = entity.teamId;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['vipAwardData'] = entity.vipAwardData;
  data['win'] = entity.win;
  return data;
}

extension PkResultUpdatedTeamResultExtension on PkResultUpdatedTeamResult {
  PkResultUpdatedTeamResult copyWith({
    bool? ast,
    int? cardBoxId,
    List<dynamic>? dropAwardData,
    bool? mvp,
    List<dynamic>? otherAwardData,
    String? parameter,
    bool? pts,
    bool? reb,
    int? score,
    List<
        PkResultUpdatedAwayTeamResultScoreBoardDetailList>? scoreBoardDetailList,
    int? starNum,
    int? teamId,
    int? teamLogo,
    String? teamName,
    List<dynamic>? vipAwardData,
    bool? win,
  }) {
    return PkResultUpdatedTeamResult()
      ..ast = ast ?? this.ast
      ..cardBoxId = cardBoxId ?? this.cardBoxId
      ..dropAwardData = dropAwardData ?? this.dropAwardData
      ..mvp = mvp ?? this.mvp
      ..otherAwardData = otherAwardData ?? this.otherAwardData
      ..parameter = parameter ?? this.parameter
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..score = score ?? this.score
      ..scoreBoardDetailList = scoreBoardDetailList ?? this.scoreBoardDetailList
      ..starNum = starNum ?? this.starNum
      ..teamId = teamId ?? this.teamId
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
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

PkResultUpdatedHomeTeamResultScoreBoardDetailList $PkResultUpdatedHomeTeamResultScoreBoardDetailListFromJson(
    Map<String, dynamic> json) {
  final PkResultUpdatedHomeTeamResultScoreBoardDetailList pkResultUpdatedHomeTeamResultScoreBoardDetailList = PkResultUpdatedHomeTeamResultScoreBoardDetailList();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.ast = ast;
  }
  final int? astPoint = jsonConvert.convert<int>(json['astPoint']);
  if (astPoint != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.astPoint = astPoint;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.blk = blk;
  }
  final int? blkPoint = jsonConvert.convert<int>(json['blkPoint']);
  if (blkPoint != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.blkPoint = blkPoint;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.createTime = createTime;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.dreb = dreb;
  }
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.fga = fga;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.fgm = fgm;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.fta = fta;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.ftm = ftm;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.gameId = gameId;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.min = min;
  }
  final int? mvpPoint = jsonConvert.convert<int>(json['mvpPoint']);
  if (mvpPoint != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.mvpPoint = mvpPoint;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.oreb = oreb;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.pass = pass;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.pf = pf;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.playerId = playerId;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.property = property;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.pts = pts;
  }
  final int? ptsPoint = jsonConvert.convert<int>(json['ptsPoint']);
  if (ptsPoint != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.ptsPoint = ptsPoint;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.reb = reb;
  }
  final int? rebPoint = jsonConvert.convert<int>(json['rebPoint']);
  if (rebPoint != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.rebPoint = rebPoint;
  }
  final bool? starter = jsonConvert.convert<bool>(json['starter']);
  if (starter != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.starter = starter;
  }
  final int? starterPos = jsonConvert.convert<int>(json['starterPos']);
  if (starterPos != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.starterPos = starterPos;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.stl = stl;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.teamId = teamId;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.tech = tech;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.threePa = threePa;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.to = to;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    pkResultUpdatedHomeTeamResultScoreBoardDetailList.updateTime = updateTime;
  }
  return pkResultUpdatedHomeTeamResultScoreBoardDetailList;
}

Map<String, dynamic> $PkResultUpdatedHomeTeamResultScoreBoardDetailListToJson(
    PkResultUpdatedHomeTeamResultScoreBoardDetailList entity) {
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

extension PkResultUpdatedHomeTeamResultScoreBoardDetailListExtension on PkResultUpdatedHomeTeamResultScoreBoardDetailList {
  PkResultUpdatedHomeTeamResultScoreBoardDetailList copyWith({
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
    return PkResultUpdatedHomeTeamResultScoreBoardDetailList()
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