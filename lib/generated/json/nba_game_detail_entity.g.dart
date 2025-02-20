import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nba_game_detail_entity.dart';
import 'package:arm_chair_quaterback/common/entities/game_schedules_info.dart';

import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';

import 'package:arm_chair_quaterback/common/utils/utils.dart';


NbaGameDetailEntity $NbaGameDetailEntityFromJson(Map<String, dynamic> json) {
  final NbaGameDetailEntity nbaGameDetailEntity = NbaGameDetailEntity();
  final List<
      NbaGameDetailScoreBoardDetails>? scoreBoardDetails = (json['scoreBoardDetails'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaGameDetailScoreBoardDetails>(
          e) as NbaGameDetailScoreBoardDetails).toList();
  if (scoreBoardDetails != null) {
    nbaGameDetailEntity.scoreBoardDetails = scoreBoardDetails;
  }
  final NbaGameDetailGameData? gameData = jsonConvert.convert<
      NbaGameDetailGameData>(json['gameData']);
  if (gameData != null) {
    nbaGameDetailEntity.gameData = gameData;
  }
  return nbaGameDetailEntity;
}

Map<String, dynamic> $NbaGameDetailEntityToJson(NbaGameDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['scoreBoardDetails'] =
      entity.scoreBoardDetails.map((v) => v.toJson()).toList();
  data['gameData'] = entity.gameData.toJson();
  return data;
}

extension NbaGameDetailEntityExtension on NbaGameDetailEntity {
  NbaGameDetailEntity copyWith({
    List<NbaGameDetailScoreBoardDetails>? scoreBoardDetails,
    NbaGameDetailGameData? gameData,
  }) {
    return NbaGameDetailEntity()
      ..scoreBoardDetails = scoreBoardDetails ?? this.scoreBoardDetails
      ..gameData = gameData ?? this.gameData;
  }
}

NbaGameDetailScoreBoardDetails $NbaGameDetailScoreBoardDetailsFromJson(
    Map<String, dynamic> json) {
  final NbaGameDetailScoreBoardDetails nbaGameDetailScoreBoardDetails = NbaGameDetailScoreBoardDetails();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    nbaGameDetailScoreBoardDetails.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaGameDetailScoreBoardDetails.gameId = gameId;
  }
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    nbaGameDetailScoreBoardDetails.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    nbaGameDetailScoreBoardDetails.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    nbaGameDetailScoreBoardDetails.dreb = dreb;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    nbaGameDetailScoreBoardDetails.espnId = espnId;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    nbaGameDetailScoreBoardDetails.stl = stl;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    nbaGameDetailScoreBoardDetails.fgm = fgm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaGameDetailScoreBoardDetails.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaGameDetailScoreBoardDetails.reb = reb;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    nbaGameDetailScoreBoardDetails.threePa = threePa;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    nbaGameDetailScoreBoardDetails.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    nbaGameDetailScoreBoardDetails.min = min;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    nbaGameDetailScoreBoardDetails.oreb = oreb;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    nbaGameDetailScoreBoardDetails.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaGameDetailScoreBoardDetails.teamId = teamId;
  }
  final bool? isStarter = jsonConvert.convert<bool>(json['isStarter']);
  if (isStarter != null) {
    nbaGameDetailScoreBoardDetails.isStarter = isStarter;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    nbaGameDetailScoreBoardDetails.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    nbaGameDetailScoreBoardDetails.to = to;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaGameDetailScoreBoardDetails.awayTeamId = awayTeamId;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    nbaGameDetailScoreBoardDetails.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaGameDetailScoreBoardDetails.playerId = playerId;
  }
  return nbaGameDetailScoreBoardDetails;
}

Map<String, dynamic> $NbaGameDetailScoreBoardDetailsToJson(
    NbaGameDetailScoreBoardDetails entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['espnId'] = entity.espnId;
  data['stl'] = entity.stl;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['threePa'] = entity.threePa;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['isStarter'] = entity.isStarter;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['awayTeamId'] = entity.awayTeamId;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  return data;
}

extension NbaGameDetailScoreBoardDetailsExtension on NbaGameDetailScoreBoardDetails {
  NbaGameDetailScoreBoardDetails copyWith({
    int? blk,
    int? gameId,
    int? fga,
    int? ast,
    int? dreb,
    int? espnId,
    int? stl,
    int? fgm,
    int? pts,
    int? reb,
    int? threePa,
    int? fta,
    int? min,
    int? oreb,
    int? pf,
    int? teamId,
    bool? isStarter,
    int? threePm,
    int? to,
    int? awayTeamId,
    int? ftm,
    int? playerId,
  }) {
    return NbaGameDetailScoreBoardDetails()
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..espnId = espnId ?? this.espnId
      ..stl = stl ?? this.stl
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..threePa = threePa ?? this.threePa
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..isStarter = isStarter ?? this.isStarter
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId;
  }
}

NbaGameDetailGameData $NbaGameDetailGameDataFromJson(
    Map<String, dynamic> json) {
  final NbaGameDetailGameData nbaGameDetailGameData = NbaGameDetailGameData();
  final GameSchedulesInfo? schedule = jsonConvert.convert<GameSchedulesInfo>(
      json['schedule']);
  if (schedule != null) {
    nbaGameDetailGameData.schedule = schedule;
  }
  final NbaGameDetailGameDataTeamScore? homeTeamScore = jsonConvert.convert<
      NbaGameDetailGameDataTeamScore>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    nbaGameDetailGameData.homeTeamScore = homeTeamScore;
  }
  final List<
      NbaGameDetailGameDataPlayerScores>? homePlayerScores = (json['homePlayerScores'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaGameDetailGameDataPlayerScores>(
          e) as NbaGameDetailGameDataPlayerScores).toList();
  if (homePlayerScores != null) {
    nbaGameDetailGameData.homePlayerScores = homePlayerScores;
  }
  final NbaGameDetailGameDataTeamScore? awayTeamScore = jsonConvert.convert<
      NbaGameDetailGameDataTeamScore>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    nbaGameDetailGameData.awayTeamScore = awayTeamScore;
  }
  final List<
      NbaGameDetailGameDataPlayerScores>? awayPlayerScores = (json['awayPlayerScores'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaGameDetailGameDataPlayerScores>(
          e) as NbaGameDetailGameDataPlayerScores).toList();
  if (awayPlayerScores != null) {
    nbaGameDetailGameData.awayPlayerScores = awayPlayerScores;
  }
  return nbaGameDetailGameData;
}

Map<String, dynamic> $NbaGameDetailGameDataToJson(
    NbaGameDetailGameData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['schedule'] = entity.schedule.toJson();
  data['homeTeamScore'] = entity.homeTeamScore?.toJson();
  data['homePlayerScores'] =
      entity.homePlayerScores.map((v) => v.toJson()).toList();
  data['awayTeamScore'] = entity.awayTeamScore?.toJson();
  data['awayPlayerScores'] =
      entity.awayPlayerScores.map((v) => v.toJson()).toList();
  return data;
}

extension NbaGameDetailGameDataExtension on NbaGameDetailGameData {
  NbaGameDetailGameData copyWith({
    GameSchedulesInfo? schedule,
    NbaGameDetailGameDataTeamScore? homeTeamScore,
    List<NbaGameDetailGameDataPlayerScores>? homePlayerScores,
    NbaGameDetailGameDataTeamScore? awayTeamScore,
    List<NbaGameDetailGameDataPlayerScores>? awayPlayerScores,
  }) {
    return NbaGameDetailGameData()
      ..schedule = schedule ?? this.schedule
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..homePlayerScores = homePlayerScores ?? this.homePlayerScores
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..awayPlayerScores = awayPlayerScores ?? this.awayPlayerScores;
  }
}

NbaGameDetailGameDataTeamScore $NbaGameDetailGameDataTeamScoreFromJson(
    Map<String, dynamic> json) {
  final NbaGameDetailGameDataTeamScore nbaGameDetailGameDataTeamScore = NbaGameDetailGameDataTeamScore();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaGameDetailGameDataTeamScore.gameId = gameId;
  }
  final int? quarter1 = jsonConvert.convert<int>(json['quarter1']);
  if (quarter1 != null) {
    nbaGameDetailGameDataTeamScore.quarter1 = quarter1;
  }
  final int? quarter2 = jsonConvert.convert<int>(json['quarter2']);
  if (quarter2 != null) {
    nbaGameDetailGameDataTeamScore.quarter2 = quarter2;
  }
  final int? quarter3 = jsonConvert.convert<int>(json['quarter3']);
  if (quarter3 != null) {
    nbaGameDetailGameDataTeamScore.quarter3 = quarter3;
  }
  final int? quarter4 = jsonConvert.convert<int>(json['quarter4']);
  if (quarter4 != null) {
    nbaGameDetailGameDataTeamScore.quarter4 = quarter4;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaGameDetailGameDataTeamScore.updateTime = updateTime;
  }
  final int? ot2 = jsonConvert.convert<int>(json['ot2']);
  if (ot2 != null) {
    nbaGameDetailGameDataTeamScore.ot2 = ot2;
  }
  final int? ot1 = jsonConvert.convert<int>(json['ot1']);
  if (ot1 != null) {
    nbaGameDetailGameDataTeamScore.ot1 = ot1;
  }
  final int? ot4 = jsonConvert.convert<int>(json['ot4']);
  if (ot4 != null) {
    nbaGameDetailGameDataTeamScore.ot4 = ot4;
  }
  final int? ot3 = jsonConvert.convert<int>(json['ot3']);
  if (ot3 != null) {
    nbaGameDetailGameDataTeamScore.ot3 = ot3;
  }
  final int? ot6 = jsonConvert.convert<int>(json['ot6']);
  if (ot6 != null) {
    nbaGameDetailGameDataTeamScore.ot6 = ot6;
  }
  final int? ot5 = jsonConvert.convert<int>(json['ot5']);
  if (ot5 != null) {
    nbaGameDetailGameDataTeamScore.ot5 = ot5;
  }
  final int? ot8 = jsonConvert.convert<int>(json['ot8']);
  if (ot8 != null) {
    nbaGameDetailGameDataTeamScore.ot8 = ot8;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    nbaGameDetailGameDataTeamScore.total = total;
  }
  final int? ot7 = jsonConvert.convert<int>(json['ot7']);
  if (ot7 != null) {
    nbaGameDetailGameDataTeamScore.ot7 = ot7;
  }
  final int? ct = jsonConvert.convert<int>(json['createTime']);
  if (ct != null) {
    nbaGameDetailGameDataTeamScore.ct = ct;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaGameDetailGameDataTeamScore.teamId = teamId;
  }
  return nbaGameDetailGameDataTeamScore;
}

Map<String, dynamic> $NbaGameDetailGameDataTeamScoreToJson(
    NbaGameDetailGameDataTeamScore entity) {
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
  data['createTime'] = entity.ct;
  data['teamId'] = entity.teamId;
  return data;
}

extension NbaGameDetailGameDataTeamScoreExtension on NbaGameDetailGameDataTeamScore {
  NbaGameDetailGameDataTeamScore copyWith({
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
    int? ct,
    int? teamId,
  }) {
    return NbaGameDetailGameDataTeamScore()
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
      ..ct = ct ?? this.ct
      ..teamId = teamId ?? this.teamId;
  }
}

NbaGameDetailGameDataPlayerScores $NbaGameDetailGameDataPlayerScoresFromJson(
    Map<String, dynamic> json) {
  final NbaGameDetailGameDataPlayerScores nbaGameDetailGameDataPlayerScores = NbaGameDetailGameDataPlayerScores();
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    nbaGameDetailGameDataPlayerScores.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    nbaGameDetailGameDataPlayerScores.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    nbaGameDetailGameDataPlayerScores.dreb = dreb;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    nbaGameDetailGameDataPlayerScores.espnId = espnId;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    nbaGameDetailGameDataPlayerScores.fgm = fgm;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaGameDetailGameDataPlayerScores.reb = reb;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    nbaGameDetailGameDataPlayerScores.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    nbaGameDetailGameDataPlayerScores.min = min;
  }
  final bool? isStarter = jsonConvert.convert<bool>(json['isStarter']);
  if (isStarter != null) {
    nbaGameDetailGameDataPlayerScores.isStarter = isStarter;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    nbaGameDetailGameDataPlayerScores.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaGameDetailGameDataPlayerScores.playerId = playerId;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    nbaGameDetailGameDataPlayerScores.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaGameDetailGameDataPlayerScores.gameId = gameId;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    nbaGameDetailGameDataPlayerScores.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaGameDetailGameDataPlayerScores.updateTime = updateTime;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaGameDetailGameDataPlayerScores.pts = pts;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    nbaGameDetailGameDataPlayerScores.threePa = threePa;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    nbaGameDetailGameDataPlayerScores.ename = ename;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    nbaGameDetailGameDataPlayerScores.oreb = oreb;
  }
  final int? ct = jsonConvert.convert<int>(json['createTime']);
  if (ct != null) {
    nbaGameDetailGameDataPlayerScores.ct = ct;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    nbaGameDetailGameDataPlayerScores.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaGameDetailGameDataPlayerScores.teamId = teamId;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    nbaGameDetailGameDataPlayerScores.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    nbaGameDetailGameDataPlayerScores.to = to;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaGameDetailGameDataPlayerScores.awayTeamId = awayTeamId;
  }
  return nbaGameDetailGameDataPlayerScores;
}

Map<String, dynamic> $NbaGameDetailGameDataPlayerScoresToJson(
    NbaGameDetailGameDataPlayerScores entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['espnId'] = entity.espnId;
  data['fgm'] = entity.fgm;
  data['reb'] = entity.reb;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['isStarter'] = entity.isStarter;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['ename'] = entity.ename;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.ct;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['awayTeamId'] = entity.awayTeamId;
  return data;
}

extension NbaGameDetailGameDataPlayerScoresExtension on NbaGameDetailGameDataPlayerScores {
  NbaGameDetailGameDataPlayerScores copyWith({
    int? fga,
    int? ast,
    int? dreb,
    int? espnId,
    int? fgm,
    int? reb,
    int? fta,
    int? min,
    bool? isStarter,
    int? ftm,
    int? playerId,
    int? blk,
    int? gameId,
    int? stl,
    int? updateTime,
    int? pts,
    int? threePa,
    String? ename,
    int? oreb,
    int? ct,
    int? pf,
    int? teamId,
    int? threePm,
    int? to,
    int? awayTeamId,
  }) {
    return NbaGameDetailGameDataPlayerScores()
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..espnId = espnId ?? this.espnId
      ..fgm = fgm ?? this.fgm
      ..reb = reb ?? this.reb
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..isStarter = isStarter ?? this.isStarter
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..ename = ename ?? this.ename
      ..oreb = oreb ?? this.oreb
      ..ct = ct ?? this.ct
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..awayTeamId = awayTeamId ?? this.awayTeamId;
  }
}