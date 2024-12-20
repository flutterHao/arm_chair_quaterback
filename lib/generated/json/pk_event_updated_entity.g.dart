import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/pk_event_updated_entity.dart';

PkEventUpdatedEntity $PkEventUpdatedEntityFromJson(Map<String, dynamic> json) {
  final PkEventUpdatedEntity pkEventUpdatedEntity = PkEventUpdatedEntity();
  final List<dynamic>? alertList = (json['alertList'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (alertList != null) {
    pkEventUpdatedEntity.alertList = alertList;
  }
  final int? allGameRound = jsonConvert.convert<int>(json['allGameRound']);
  if (allGameRound != null) {
    pkEventUpdatedEntity.allGameRound = allGameRound;
  }
  final int? awayFuryValue = jsonConvert.convert<int>(json['awayFuryValue']);
  if (awayFuryValue != null) {
    pkEventUpdatedEntity.awayFuryValue = awayFuryValue;
  }
  final PkEventUpdatedTeamInfo? awayInfo = jsonConvert.convert<
      PkEventUpdatedTeamInfo>(json['awayInfo']);
  if (awayInfo != null) {
    pkEventUpdatedEntity.awayInfo = awayInfo;
  }
  final List<
      PkEventUpdatedPlayerInfos>? awayPlayerInfos = (json['awayPlayerInfos'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PkEventUpdatedPlayerInfos>(
          e) as PkEventUpdatedPlayerInfos).toList();
  if (awayPlayerInfos != null) {
    pkEventUpdatedEntity.awayPlayerInfos = awayPlayerInfos;
  }
  final int? awayScore = jsonConvert.convert<int>(json['awayScore']);
  if (awayScore != null) {
    pkEventUpdatedEntity.awayScore = awayScore;
  }
  final int? awayStrength = jsonConvert.convert<int>(json['awayStrength']);
  if (awayStrength != null) {
    pkEventUpdatedEntity.awayStrength = awayStrength;
  }
  final int? currRound = jsonConvert.convert<int>(json['currRound']);
  if (currRound != null) {
    pkEventUpdatedEntity.currRound = currRound;
  }
  final int? eventId = jsonConvert.convert<int>(json['eventId']);
  if (eventId != null) {
    pkEventUpdatedEntity.eventId = eventId;
  }
  final int? homeFuryValue = jsonConvert.convert<int>(json['homeFuryValue']);
  if (homeFuryValue != null) {
    pkEventUpdatedEntity.homeFuryValue = homeFuryValue;
  }
  final PkEventUpdatedTeamInfo? homeInfo = jsonConvert.convert<
      PkEventUpdatedTeamInfo>(json['homeInfo']);
  if (homeInfo != null) {
    pkEventUpdatedEntity.homeInfo = homeInfo;
  }
  final List<
      PkEventUpdatedPlayerInfos>? homePlayerInfos = (json['homePlayerInfos'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PkEventUpdatedPlayerInfos>(
          e) as PkEventUpdatedPlayerInfos).toList();
  if (homePlayerInfos != null) {
    pkEventUpdatedEntity.homePlayerInfos = homePlayerInfos;
  }
  final int? homeScore = jsonConvert.convert<int>(json['homeScore']);
  if (homeScore != null) {
    pkEventUpdatedEntity.homeScore = homeScore;
  }
  final int? homeStrength = jsonConvert.convert<int>(json['homeStrength']);
  if (homeStrength != null) {
    pkEventUpdatedEntity.homeStrength = homeStrength;
  }
  final String? parameter = jsonConvert.convert<String>(json['parameter']);
  if (parameter != null) {
    pkEventUpdatedEntity.parameter = parameter;
  }
  final int? receivePlayerId = jsonConvert.convert<int>(
      json['receivePlayerId']);
  if (receivePlayerId != null) {
    pkEventUpdatedEntity.receivePlayerId = receivePlayerId;
  }
  final int? receiveTeamId = jsonConvert.convert<int>(json['receiveTeamId']);
  if (receiveTeamId != null) {
    pkEventUpdatedEntity.receiveTeamId = receiveTeamId;
  }
  final int? senderOtherPlayerId = jsonConvert.convert<int>(
      json['senderOtherPlayerId']);
  if (senderOtherPlayerId != null) {
    pkEventUpdatedEntity.senderOtherPlayerId = senderOtherPlayerId;
  }
  final int? senderPlayerId = jsonConvert.convert<int>(json['senderPlayerId']);
  if (senderPlayerId != null) {
    pkEventUpdatedEntity.senderPlayerId = senderPlayerId;
  }
  final int? senderTeamId = jsonConvert.convert<int>(json['senderTeamId']);
  if (senderTeamId != null) {
    pkEventUpdatedEntity.senderTeamId = senderTeamId;
  }
  final int? state = jsonConvert.convert<int>(json['state']);
  if (state != null) {
    pkEventUpdatedEntity.state = state;
  }
  final int? stepAwayScore = jsonConvert.convert<int>(json['stepAwayScore']);
  if (stepAwayScore != null) {
    pkEventUpdatedEntity.stepAwayScore = stepAwayScore;
  }
  final int? stepHomeScore = jsonConvert.convert<int>(json['stepHomeScore']);
  if (stepHomeScore != null) {
    pkEventUpdatedEntity.stepHomeScore = stepHomeScore;
  }
  final int? stepId = jsonConvert.convert<int>(json['stepId']);
  if (stepId != null) {
    pkEventUpdatedEntity.stepId = stepId;
  }
  final bool? useSkillSuccess = jsonConvert.convert<bool>(
      json['useSkillSuccess']);
  if (useSkillSuccess != null) {
    pkEventUpdatedEntity.useSkillSuccess = useSkillSuccess;
  }
  final double? awayPreparationLevel = jsonConvert.convert<double>(
      json['awayPreparationLevel']);
  if (awayPreparationLevel != null) {
    pkEventUpdatedEntity.awayPreparationLevel = awayPreparationLevel;
  }
  final double? homePreparationLevel = jsonConvert.convert<double>(
      json['homePreparationLevel']);
  if (homePreparationLevel != null) {
    pkEventUpdatedEntity.homePreparationLevel = homePreparationLevel;
  }
  final double? awayCurrentStrength = jsonConvert.convert<double>(
      json['awayCurrentStrength']);
  if (awayCurrentStrength != null) {
    pkEventUpdatedEntity.awayCurrentStrength = awayCurrentStrength;
  }
  final double? homeCurrentStrength = jsonConvert.convert<double>(
      json['homeCurrentStrength']);
  if (homeCurrentStrength != null) {
    pkEventUpdatedEntity.homeCurrentStrength = homeCurrentStrength;
  }
  return pkEventUpdatedEntity;
}

Map<String, dynamic> $PkEventUpdatedEntityToJson(PkEventUpdatedEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alertList'] = entity.alertList;
  data['allGameRound'] = entity.allGameRound;
  data['awayFuryValue'] = entity.awayFuryValue;
  data['awayInfo'] = entity.awayInfo.toJson();
  data['awayPlayerInfos'] =
      entity.awayPlayerInfos.map((v) => v.toJson()).toList();
  data['awayScore'] = entity.awayScore;
  data['awayStrength'] = entity.awayStrength;
  data['currRound'] = entity.currRound;
  data['eventId'] = entity.eventId;
  data['homeFuryValue'] = entity.homeFuryValue;
  data['homeInfo'] = entity.homeInfo.toJson();
  data['homePlayerInfos'] =
      entity.homePlayerInfos.map((v) => v.toJson()).toList();
  data['homeScore'] = entity.homeScore;
  data['homeStrength'] = entity.homeStrength;
  data['parameter'] = entity.parameter;
  data['receivePlayerId'] = entity.receivePlayerId;
  data['receiveTeamId'] = entity.receiveTeamId;
  data['senderOtherPlayerId'] = entity.senderOtherPlayerId;
  data['senderPlayerId'] = entity.senderPlayerId;
  data['senderTeamId'] = entity.senderTeamId;
  data['state'] = entity.state;
  data['stepAwayScore'] = entity.stepAwayScore;
  data['stepHomeScore'] = entity.stepHomeScore;
  data['stepId'] = entity.stepId;
  data['useSkillSuccess'] = entity.useSkillSuccess;
  data['awayPreparationLevel'] = entity.awayPreparationLevel;
  data['homePreparationLevel'] = entity.homePreparationLevel;
  data['awayCurrentStrength'] = entity.awayCurrentStrength;
  data['homeCurrentStrength'] = entity.homeCurrentStrength;
  return data;
}

extension PkEventUpdatedEntityExtension on PkEventUpdatedEntity {
  PkEventUpdatedEntity copyWith({
    List<dynamic>? alertList,
    int? allGameRound,
    int? awayFuryValue,
    PkEventUpdatedTeamInfo? awayInfo,
    List<PkEventUpdatedPlayerInfos>? awayPlayerInfos,
    int? awayScore,
    int? awayStrength,
    int? currRound,
    int? eventId,
    int? homeFuryValue,
    PkEventUpdatedTeamInfo? homeInfo,
    List<PkEventUpdatedPlayerInfos>? homePlayerInfos,
    int? homeScore,
    int? homeStrength,
    String? parameter,
    int? receivePlayerId,
    int? receiveTeamId,
    int? senderOtherPlayerId,
    int? senderPlayerId,
    int? senderTeamId,
    int? state,
    int? stepAwayScore,
    int? stepHomeScore,
    int? stepId,
    bool? useSkillSuccess,
    double? awayPreparationLevel,
    double? homePreparationLevel,
    double? awayCurrentStrength,
    double? homeCurrentStrength,
  }) {
    return PkEventUpdatedEntity()
      ..alertList = alertList ?? this.alertList
      ..allGameRound = allGameRound ?? this.allGameRound
      ..awayFuryValue = awayFuryValue ?? this.awayFuryValue
      ..awayInfo = awayInfo ?? this.awayInfo
      ..awayPlayerInfos = awayPlayerInfos ?? this.awayPlayerInfos
      ..awayScore = awayScore ?? this.awayScore
      ..awayStrength = awayStrength ?? this.awayStrength
      ..currRound = currRound ?? this.currRound
      ..eventId = eventId ?? this.eventId
      ..homeFuryValue = homeFuryValue ?? this.homeFuryValue
      ..homeInfo = homeInfo ?? this.homeInfo
      ..homePlayerInfos = homePlayerInfos ?? this.homePlayerInfos
      ..homeScore = homeScore ?? this.homeScore
      ..homeStrength = homeStrength ?? this.homeStrength
      ..parameter = parameter ?? this.parameter
      ..receivePlayerId = receivePlayerId ?? this.receivePlayerId
      ..receiveTeamId = receiveTeamId ?? this.receiveTeamId
      ..senderOtherPlayerId = senderOtherPlayerId ?? this.senderOtherPlayerId
      ..senderPlayerId = senderPlayerId ?? this.senderPlayerId
      ..senderTeamId = senderTeamId ?? this.senderTeamId
      ..state = state ?? this.state
      ..stepAwayScore = stepAwayScore ?? this.stepAwayScore
      ..stepHomeScore = stepHomeScore ?? this.stepHomeScore
      ..stepId = stepId ?? this.stepId
      ..useSkillSuccess = useSkillSuccess ?? this.useSkillSuccess
      ..awayPreparationLevel = awayPreparationLevel ?? this.awayPreparationLevel
      ..homePreparationLevel = homePreparationLevel ?? this.homePreparationLevel
      ..awayCurrentStrength = awayCurrentStrength ?? this.awayCurrentStrength
      ..homeCurrentStrength = homeCurrentStrength ?? this.homeCurrentStrength;
  }
}

PkEventUpdatedTeamInfo $PkEventUpdatedTeamInfoFromJson(
    Map<String, dynamic> json) {
  final PkEventUpdatedTeamInfo pkEventUpdatedTeamInfo = PkEventUpdatedTeamInfo();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    pkEventUpdatedTeamInfo.ast = ast;
  }
  final int? astPoint = jsonConvert.convert<int>(json['astPoint']);
  if (astPoint != null) {
    pkEventUpdatedTeamInfo.astPoint = astPoint;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    pkEventUpdatedTeamInfo.blk = blk;
  }
  final int? blkPoint = jsonConvert.convert<int>(json['blkPoint']);
  if (blkPoint != null) {
    pkEventUpdatedTeamInfo.blkPoint = blkPoint;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    pkEventUpdatedTeamInfo.dreb = dreb;
  }
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    pkEventUpdatedTeamInfo.fga = fga;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    pkEventUpdatedTeamInfo.fgm = fgm;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    pkEventUpdatedTeamInfo.fta = fta;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    pkEventUpdatedTeamInfo.ftm = ftm;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    pkEventUpdatedTeamInfo.gameId = gameId;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    pkEventUpdatedTeamInfo.min = min;
  }
  final int? mvpPoint = jsonConvert.convert<int>(json['mvpPoint']);
  if (mvpPoint != null) {
    pkEventUpdatedTeamInfo.mvpPoint = mvpPoint;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    pkEventUpdatedTeamInfo.oreb = oreb;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    pkEventUpdatedTeamInfo.pass = pass;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    pkEventUpdatedTeamInfo.pf = pf;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    pkEventUpdatedTeamInfo.playerId = playerId;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    pkEventUpdatedTeamInfo.property = property;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    pkEventUpdatedTeamInfo.pts = pts;
  }
  final int? ptsPoint = jsonConvert.convert<int>(json['ptsPoint']);
  if (ptsPoint != null) {
    pkEventUpdatedTeamInfo.ptsPoint = ptsPoint;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    pkEventUpdatedTeamInfo.reb = reb;
  }
  final int? rebPoint = jsonConvert.convert<int>(json['rebPoint']);
  if (rebPoint != null) {
    pkEventUpdatedTeamInfo.rebPoint = rebPoint;
  }
  final bool? starter = jsonConvert.convert<bool>(json['starter']);
  if (starter != null) {
    pkEventUpdatedTeamInfo.starter = starter;
  }
  final int? starterPos = jsonConvert.convert<int>(json['starterPos']);
  if (starterPos != null) {
    pkEventUpdatedTeamInfo.starterPos = starterPos;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    pkEventUpdatedTeamInfo.stl = stl;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    pkEventUpdatedTeamInfo.teamId = teamId;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    pkEventUpdatedTeamInfo.tech = tech;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    pkEventUpdatedTeamInfo.threePa = threePa;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    pkEventUpdatedTeamInfo.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    pkEventUpdatedTeamInfo.to = to;
  }
  return pkEventUpdatedTeamInfo;
}

Map<String, dynamic> $PkEventUpdatedTeamInfoToJson(
    PkEventUpdatedTeamInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['astPoint'] = entity.astPoint;
  data['blk'] = entity.blk;
  data['blkPoint'] = entity.blkPoint;
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
  return data;
}

extension PkEventUpdatedTeamInfoExtension on PkEventUpdatedTeamInfo {
  PkEventUpdatedTeamInfo copyWith({
    int? ast,
    int? astPoint,
    int? blk,
    int? blkPoint,
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
  }) {
    return PkEventUpdatedTeamInfo()
      ..ast = ast ?? this.ast
      ..astPoint = astPoint ?? this.astPoint
      ..blk = blk ?? this.blk
      ..blkPoint = blkPoint ?? this.blkPoint
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
      ..to = to ?? this.to;
  }
}

PkEventUpdatedPlayerInfos $PkEventUpdatedPlayerInfosFromJson(
    Map<String, dynamic> json) {
  final PkEventUpdatedPlayerInfos pkEventUpdatedPlayerInfos = PkEventUpdatedPlayerInfos();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    pkEventUpdatedPlayerInfos.ast = ast;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    pkEventUpdatedPlayerInfos.blk = blk;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    pkEventUpdatedPlayerInfos.dreb = dreb;
  }
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    pkEventUpdatedPlayerInfos.fga = fga;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    pkEventUpdatedPlayerInfos.fgm = fgm;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    pkEventUpdatedPlayerInfos.fta = fta;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    pkEventUpdatedPlayerInfos.ftm = ftm;
  }
  final int? furyValue = jsonConvert.convert<int>(json['furyValue']);
  if (furyValue != null) {
    pkEventUpdatedPlayerInfos.furyValue = furyValue;
  }
  final int? maxPower = jsonConvert.convert<int>(json['maxPower']);
  if (maxPower != null) {
    pkEventUpdatedPlayerInfos.maxPower = maxPower;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    pkEventUpdatedPlayerInfos.min = min;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    pkEventUpdatedPlayerInfos.oreb = oreb;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    pkEventUpdatedPlayerInfos.pass = pass;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    pkEventUpdatedPlayerInfos.pf = pf;
  }
  final int? pkPlayerStrength = jsonConvert.convert<int>(
      json['pkPlayerStrength']);
  if (pkPlayerStrength != null) {
    pkEventUpdatedPlayerInfos.pkPlayerStrength = pkPlayerStrength;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    pkEventUpdatedPlayerInfos.playerId = playerId;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    pkEventUpdatedPlayerInfos.power = power;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    pkEventUpdatedPlayerInfos.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    pkEventUpdatedPlayerInfos.reb = reb;
  }
  final int? skillEffectRound = jsonConvert.convert<int>(
      json['skillEffectRound']);
  if (skillEffectRound != null) {
    pkEventUpdatedPlayerInfos.skillEffectRound = skillEffectRound;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    pkEventUpdatedPlayerInfos.stl = stl;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    pkEventUpdatedPlayerInfos.tech = tech;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    pkEventUpdatedPlayerInfos.threePa = threePa;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    pkEventUpdatedPlayerInfos.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    pkEventUpdatedPlayerInfos.to = to;
  }
  return pkEventUpdatedPlayerInfos;
}

Map<String, dynamic> $PkEventUpdatedPlayerInfosToJson(
    PkEventUpdatedPlayerInfos entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['blk'] = entity.blk;
  data['dreb'] = entity.dreb;
  data['fga'] = entity.fga;
  data['fgm'] = entity.fgm;
  data['fta'] = entity.fta;
  data['ftm'] = entity.ftm;
  data['furyValue'] = entity.furyValue;
  data['maxPower'] = entity.maxPower;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['pass'] = entity.pass;
  data['pf'] = entity.pf;
  data['pkPlayerStrength'] = entity.pkPlayerStrength;
  data['playerId'] = entity.playerId;
  data['power'] = entity.power;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['skillEffectRound'] = entity.skillEffectRound;
  data['stl'] = entity.stl;
  data['tech'] = entity.tech;
  data['threePa'] = entity.threePa;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  return data;
}

extension PkEventUpdatedPlayerInfosExtension on PkEventUpdatedPlayerInfos {
  PkEventUpdatedPlayerInfos copyWith({
    int? ast,
    int? blk,
    int? dreb,
    int? fga,
    int? fgm,
    int? fta,
    int? ftm,
    int? furyValue,
    int? maxPower,
    int? min,
    int? oreb,
    int? pass,
    int? pf,
    int? pkPlayerStrength,
    int? playerId,
    int? power,
    int? pts,
    int? reb,
    int? skillEffectRound,
    int? stl,
    int? tech,
    int? threePa,
    int? threePm,
    int? to,
  }) {
    return PkEventUpdatedPlayerInfos()
      ..ast = ast ?? this.ast
      ..blk = blk ?? this.blk
      ..dreb = dreb ?? this.dreb
      ..fga = fga ?? this.fga
      ..fgm = fgm ?? this.fgm
      ..fta = fta ?? this.fta
      ..ftm = ftm ?? this.ftm
      ..furyValue = furyValue ?? this.furyValue
      ..maxPower = maxPower ?? this.maxPower
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..pass = pass ?? this.pass
      ..pf = pf ?? this.pf
      ..pkPlayerStrength = pkPlayerStrength ?? this.pkPlayerStrength
      ..playerId = playerId ?? this.playerId
      ..power = power ?? this.power
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..skillEffectRound = skillEffectRound ?? this.skillEffectRound
      ..stl = stl ?? this.stl
      ..tech = tech ?? this.tech
      ..threePa = threePa ?? this.threePa
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to;
  }
}