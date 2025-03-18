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
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    stealTeamPlayers.uuid = uuid;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    stealTeamPlayers.playerId = playerId;
  }
  final bool? systemPlayer = jsonConvert.convert<bool>(json['systemPlayer']);
  if (systemPlayer != null) {
    stealTeamPlayers.systemPlayer = systemPlayer;
  }
  return stealTeamPlayers;
}

Map<String, dynamic> $StealTeamPlayersToJson(StealTeamPlayers entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['playerId'] = entity.playerId;
  data['systemPlayer'] = entity.systemPlayer;
  return data;
}

extension StealTeamPlayersExtension on StealTeamPlayers {
  StealTeamPlayers copyWith({
    String? uuid,
    int? playerId,
    bool? systemPlayer,
  }) {
    return StealTeamPlayers()
      ..uuid = uuid ?? this.uuid
      ..playerId = playerId ?? this.playerId
      ..systemPlayer = systemPlayer ?? this.systemPlayer;
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