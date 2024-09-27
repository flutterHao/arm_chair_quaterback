import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';

TeamPlayerInfoEntity $TeamPlayerInfoEntityFromJson(Map<String, dynamic> json) {
  final TeamPlayerInfoEntity teamPlayerInfoEntity = TeamPlayerInfoEntity();
  final List<
      TeamPlayerInfoPlayerTrend>? playerTrend = (json['PlayerTrend'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<TeamPlayerInfoPlayerTrend>(
          e) as TeamPlayerInfoPlayerTrend).toList();
  if (playerTrend != null) {
    teamPlayerInfoEntity.playerTrend = playerTrend;
  }
  final TeamPlayerInfoTeamPlayer? teamPlayer = jsonConvert.convert<
      TeamPlayerInfoTeamPlayer>(json['TeamPlayer']);
  if (teamPlayer != null) {
    teamPlayerInfoEntity.teamPlayer = teamPlayer;
  }
  return teamPlayerInfoEntity;
}

Map<String, dynamic> $TeamPlayerInfoEntityToJson(TeamPlayerInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['PlayerTrend'] = entity.playerTrend.map((v) => v.toJson()).toList();
  data['TeamPlayer'] = entity.teamPlayer.toJson();
  return data;
}

extension TeamPlayerInfoEntityExtension on TeamPlayerInfoEntity {
  TeamPlayerInfoEntity copyWith({
    List<TeamPlayerInfoPlayerTrend>? playerTrend,
    TeamPlayerInfoTeamPlayer? teamPlayer,
  }) {
    return TeamPlayerInfoEntity()
      ..playerTrend = playerTrend ?? this.playerTrend
      ..teamPlayer = teamPlayer ?? this.teamPlayer;
  }
}

TeamPlayerInfoPlayerTrend $TeamPlayerInfoPlayerTrendFromJson(
    Map<String, dynamic> json) {
  final TeamPlayerInfoPlayerTrend teamPlayerInfoPlayerTrend = TeamPlayerInfoPlayerTrend();
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamPlayerInfoPlayerTrend.createTime = createTime;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    teamPlayerInfoPlayerTrend.playerId = playerId;
  }
  final int? playerMarketPrice = jsonConvert.convert<int>(
      json['playerMarketPrice']);
  if (playerMarketPrice != null) {
    teamPlayerInfoPlayerTrend.playerMarketPrice = playerMarketPrice;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    teamPlayerInfoPlayerTrend.playerScore = playerScore;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    teamPlayerInfoPlayerTrend.playerStrength = playerStrength;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    teamPlayerInfoPlayerTrend.updateTime = updateTime;
  }
  return teamPlayerInfoPlayerTrend;
}

Map<String, dynamic> $TeamPlayerInfoPlayerTrendToJson(
    TeamPlayerInfoPlayerTrend entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createTime'] = entity.createTime;
  data['playerId'] = entity.playerId;
  data['playerMarketPrice'] = entity.playerMarketPrice;
  data['playerScore'] = entity.playerScore;
  data['playerStrength'] = entity.playerStrength;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension TeamPlayerInfoPlayerTrendExtension on TeamPlayerInfoPlayerTrend {
  TeamPlayerInfoPlayerTrend copyWith({
    int? createTime,
    int? playerId,
    int? playerMarketPrice,
    int? playerScore,
    int? playerStrength,
    int? updateTime,
  }) {
    return TeamPlayerInfoPlayerTrend()
      ..createTime = createTime ?? this.createTime
      ..playerId = playerId ?? this.playerId
      ..playerMarketPrice = playerMarketPrice ?? this.playerMarketPrice
      ..playerScore = playerScore ?? this.playerScore
      ..playerStrength = playerStrength ?? this.playerStrength
      ..updateTime = updateTime ?? this.updateTime;
  }
}

TeamPlayerInfoTeamPlayer $TeamPlayerInfoTeamPlayerFromJson(
    Map<String, dynamic> json) {
  final TeamPlayerInfoTeamPlayer teamPlayerInfoTeamPlayer = TeamPlayerInfoTeamPlayer();
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    teamPlayerInfoTeamPlayer.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    teamPlayerInfoTeamPlayer.breakThroughGrade = breakThroughGrade;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    teamPlayerInfoTeamPlayer.buyPlayerScore = buyPlayerScore;
  }
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    teamPlayerInfoTeamPlayer.buyPrice = buyPrice;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamPlayerInfoTeamPlayer.createTime = createTime;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    teamPlayerInfoTeamPlayer.fromType = fromType;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    teamPlayerInfoTeamPlayer.gradeExp = gradeExp;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    teamPlayerInfoTeamPlayer.id = id;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    teamPlayerInfoTeamPlayer.playerGrade = playerGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    teamPlayerInfoTeamPlayer.playerId = playerId;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    teamPlayerInfoTeamPlayer.position = position;
  }
  final TeamPlayerInfoTeamPlayerPotential? potential = jsonConvert.convert<
      TeamPlayerInfoTeamPlayerPotential>(json['potential']);
  if (potential != null) {
    teamPlayerInfoTeamPlayer.potential = potential;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    teamPlayerInfoTeamPlayer.power = power;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamPlayerInfoTeamPlayer.teamId = teamId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    teamPlayerInfoTeamPlayer.updateTime = updateTime;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    teamPlayerInfoTeamPlayer.uuid = uuid;
  }
  return teamPlayerInfoTeamPlayer;
}

Map<String, dynamic> $TeamPlayerInfoTeamPlayerToJson(
    TeamPlayerInfoTeamPlayer entity) {
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
  data['position'] = entity.position;
  data['potential'] = entity.potential.toJson();
  data['power'] = entity.power;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  data['uuid'] = entity.uuid;
  return data;
}

extension TeamPlayerInfoTeamPlayerExtension on TeamPlayerInfoTeamPlayer {
  TeamPlayerInfoTeamPlayer copyWith({
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
    int? position,
    TeamPlayerInfoTeamPlayerPotential? potential,
    int? power,
    int? teamId,
    int? updateTime,
    String? uuid,
  }) {
    return TeamPlayerInfoTeamPlayer()
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
      ..position = position ?? this.position
      ..potential = potential ?? this.potential
      ..power = power ?? this.power
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime
      ..uuid = uuid ?? this.uuid;
  }
}

TeamPlayerInfoTeamPlayerPotential $TeamPlayerInfoTeamPlayerPotentialFromJson(
    Map<String, dynamic> json) {
  final TeamPlayerInfoTeamPlayerPotential teamPlayerInfoTeamPlayerPotential = TeamPlayerInfoTeamPlayerPotential();
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    teamPlayerInfoTeamPlayerPotential.ast = ast;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    teamPlayerInfoTeamPlayerPotential.blk = blk;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    teamPlayerInfoTeamPlayerPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    teamPlayerInfoTeamPlayerPotential.reb = reb;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    teamPlayerInfoTeamPlayerPotential.stl = stl;
  }
  final int? threePts = jsonConvert.convert<int>(json['threePts']);
  if (threePts != null) {
    teamPlayerInfoTeamPlayerPotential.threePts = threePts;
  }
  return teamPlayerInfoTeamPlayerPotential;
}

Map<String, dynamic> $TeamPlayerInfoTeamPlayerPotentialToJson(
    TeamPlayerInfoTeamPlayerPotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['blk'] = entity.blk;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['stl'] = entity.stl;
  data['threePts'] = entity.threePts;
  return data;
}

extension TeamPlayerInfoTeamPlayerPotentialExtension on TeamPlayerInfoTeamPlayerPotential {
  TeamPlayerInfoTeamPlayerPotential copyWith({
    int? ast,
    int? blk,
    int? pts,
    int? reb,
    int? stl,
    int? threePts,
  }) {
    return TeamPlayerInfoTeamPlayerPotential()
      ..ast = ast ?? this.ast
      ..blk = blk ?? this.blk
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..stl = stl ?? this.stl
      ..threePts = threePts ?? this.threePts;
  }
}