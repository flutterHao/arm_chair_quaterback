import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/steal_team_entity.dart';

StealTeamEntity $StealTeamEntityFromJson(Map<String, dynamic> json) {
  final StealTeamEntity stealTeamEntity = StealTeamEntity();
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    stealTeamEntity.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    stealTeamEntity.teamName = teamName;
  }
  final List<StealTeamPlayers>? players = (json['players'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<StealTeamPlayers>(e) as StealTeamPlayers)
      .toList();
  if (players != null) {
    stealTeamEntity.players = players;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    stealTeamEntity.teamId = teamId;
  }
  final int? currTeamStrength = jsonConvert.convert<int>(
      json['currTeamStrength']);
  if (currTeamStrength != null) {
    stealTeamEntity.currTeamStrength = currTeamStrength;
  }
  final int? logoBoxId = jsonConvert.convert<int>(json['logoBoxId']);
  if (logoBoxId != null) {
    stealTeamEntity.logoBoxId = logoBoxId;
  }
  final bool? online = jsonConvert.convert<bool>(json['online']);
  if (online != null) {
    stealTeamEntity.online = online;
  }
  final int? teamGrade = jsonConvert.convert<int>(json['teamGrade']);
  if (teamGrade != null) {
    stealTeamEntity.teamGrade = teamGrade;
  }
  final bool? isRevenge = jsonConvert.convert<bool>(json['isRevenge']);
  if (isRevenge != null) {
    stealTeamEntity.isRevenge = isRevenge;
  }
  return stealTeamEntity;
}

Map<String, dynamic> $StealTeamEntityToJson(StealTeamEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['players'] = entity.players.map((v) => v.toJson()).toList();
  data['teamId'] = entity.teamId;
  data['currTeamStrength'] = entity.currTeamStrength;
  data['logoBoxId'] = entity.logoBoxId;
  data['online'] = entity.online;
  data['teamGrade'] = entity.teamGrade;
  data['isRevenge'] = entity.isRevenge;
  return data;
}

extension StealTeamEntityExtension on StealTeamEntity {
  StealTeamEntity copyWith({
    int? teamLogo,
    String? teamName,
    List<StealTeamPlayers>? players,
    int? teamId,
    int? currTeamStrength,
    int? logoBoxId,
    bool? online,
    int? teamGrade,
    bool? isRevenge,
  }) {
    return StealTeamEntity()
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..players = players ?? this.players
      ..teamId = teamId ?? this.teamId
      ..currTeamStrength = currTeamStrength ?? this.currTeamStrength
      ..logoBoxId = logoBoxId ?? this.logoBoxId
      ..online = online ?? this.online
      ..teamGrade = teamGrade ?? this.teamGrade
      ..isRevenge = isRevenge ?? this.isRevenge;
  }
}

StealTeamPlayers $StealTeamPlayersFromJson(Map<String, dynamic> json) {
  final StealTeamPlayers stealTeamPlayers = StealTeamPlayers();
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    stealTeamPlayers.buyPrice = buyPrice;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    stealTeamPlayers.buyPlayerScore = buyPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    stealTeamPlayers.updateTime = updateTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    stealTeamPlayers.playerStrength = playerStrength;
  }
  final int? playerStarAddRate = jsonConvert.convert<int>(
      json['playerStarAddRate']);
  if (playerStarAddRate != null) {
    stealTeamPlayers.playerStarAddRate = playerStarAddRate;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    stealTeamPlayers.uuid = uuid;
  }
  final int? playerReadiness = jsonConvert.convert<int>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    stealTeamPlayers.playerReadiness = playerReadiness;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    stealTeamPlayers.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    stealTeamPlayers.fromType = fromType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    stealTeamPlayers.createTime = createTime;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    stealTeamPlayers.playerGrade = playerGrade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    stealTeamPlayers.teamId = teamId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    stealTeamPlayers.id = id;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    stealTeamPlayers.position = position;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    stealTeamPlayers.power = power;
  }
  final int? playerStatus = jsonConvert.convert<int>(json['playerStatus']);
  if (playerStatus != null) {
    stealTeamPlayers.playerStatus = playerStatus;
  }
  final int? playerStatusValue = jsonConvert.convert<int>(
      json['playerStatusValue']);
  if (playerStatusValue != null) {
    stealTeamPlayers.playerStatusValue = playerStatusValue;
  }
  final StealTeamPlayersPotential? potential = jsonConvert.convert<
      StealTeamPlayersPotential>(json['potential']);
  if (potential != null) {
    stealTeamPlayers.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    stealTeamPlayers.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    stealTeamPlayers.breakThroughGrade = breakThroughGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    stealTeamPlayers.playerId = playerId;
  }
  final StealTeamPlayersUpStarBase? upStarBase = jsonConvert.convert<
      StealTeamPlayersUpStarBase>(json['upStarBase']);
  if (upStarBase != null) {
    stealTeamPlayers.upStarBase = upStarBase;
  }
  return stealTeamPlayers;
}

Map<String, dynamic> $StealTeamPlayersToJson(StealTeamPlayers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buyPrice'] = entity.buyPrice;
  data['buyPlayerScore'] = entity.buyPlayerScore;
  data['updateTime'] = entity.updateTime;
  data['playerStrength'] = entity.playerStrength;
  data['playerStarAddRate'] = entity.playerStarAddRate;
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

extension StealTeamPlayersExtension on StealTeamPlayers {
  StealTeamPlayers copyWith({
    int? buyPrice,
    int? buyPlayerScore,
    int? updateTime,
    int? playerStrength,
    int? playerStarAddRate,
    String? uuid,
    int? playerReadiness,
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
    StealTeamPlayersPotential? potential,
    bool? bindStatus,
    int? breakThroughGrade,
    int? playerId,
    StealTeamPlayersUpStarBase? upStarBase,
  }) {
    return StealTeamPlayers()
      ..buyPrice = buyPrice ?? this.buyPrice
      ..buyPlayerScore = buyPlayerScore ?? this.buyPlayerScore
      ..updateTime = updateTime ?? this.updateTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..playerStarAddRate = playerStarAddRate ?? this.playerStarAddRate
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

StealTeamPlayersPotential $StealTeamPlayersPotentialFromJson(
    Map<String, dynamic> json) {
  final StealTeamPlayersPotential stealTeamPlayersPotential = StealTeamPlayersPotential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    stealTeamPlayersPotential.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    stealTeamPlayersPotential.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    stealTeamPlayersPotential.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    stealTeamPlayersPotential.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    stealTeamPlayersPotential.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    stealTeamPlayersPotential.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    stealTeamPlayersPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    stealTeamPlayersPotential.reb = reb;
  }
  return stealTeamPlayersPotential;
}

Map<String, dynamic> $StealTeamPlayersPotentialToJson(
    StealTeamPlayersPotential entity) {
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

extension StealTeamPlayersPotentialExtension on StealTeamPlayersPotential {
  StealTeamPlayersPotential copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return StealTeamPlayersPotential()
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

StealTeamPlayersUpStarBase $StealTeamPlayersUpStarBaseFromJson(
    Map<String, dynamic> json) {
  final StealTeamPlayersUpStarBase stealTeamPlayersUpStarBase = StealTeamPlayersUpStarBase();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    stealTeamPlayersUpStarBase.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    stealTeamPlayersUpStarBase.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    stealTeamPlayersUpStarBase.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    stealTeamPlayersUpStarBase.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    stealTeamPlayersUpStarBase.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    stealTeamPlayersUpStarBase.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    stealTeamPlayersUpStarBase.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    stealTeamPlayersUpStarBase.reb = reb;
  }
  return stealTeamPlayersUpStarBase;
}

Map<String, dynamic> $StealTeamPlayersUpStarBaseToJson(
    StealTeamPlayersUpStarBase entity) {
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

extension StealTeamPlayersUpStarBaseExtension on StealTeamPlayersUpStarBase {
  StealTeamPlayersUpStarBase copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return StealTeamPlayersUpStarBase()
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