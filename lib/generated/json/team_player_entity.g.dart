import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_entity.dart';

TeamPlayerEntity $TeamPlayerEntityFromJson(Map<String, dynamic> json) {
  final TeamPlayerEntity teamPlayerEntity = TeamPlayerEntity();
  final double? buyPrice = jsonConvert.convert<double>(json['buyPrice']);
  if (buyPrice != null) {
    teamPlayerEntity.buyPrice = buyPrice;
  }
  final double? buyPlayerScore = jsonConvert.convert<double>(
      json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    teamPlayerEntity.buyPlayerScore = buyPlayerScore;
  }
  final double? updateTime = jsonConvert.convert<double>(json['updateTime']);
  if (updateTime != null) {
    teamPlayerEntity.updateTime = updateTime;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    teamPlayerEntity.uuid = uuid;
  }
  final double? gradeExp = jsonConvert.convert<double>(json['gradeExp']);
  if (gradeExp != null) {
    teamPlayerEntity.gradeExp = gradeExp;
  }
  final double? fromType = jsonConvert.convert<double>(json['fromType']);
  if (fromType != null) {
    teamPlayerEntity.fromType = fromType;
  }
  final double? createTime = jsonConvert.convert<double>(json['createTime']);
  if (createTime != null) {
    teamPlayerEntity.createTime = createTime;
  }
  final double? playerGrade = jsonConvert.convert<double>(json['playerGrade']);
  if (playerGrade != null) {
    teamPlayerEntity.playerGrade = playerGrade;
  }
  final double? teamId = jsonConvert.convert<double>(json['teamId']);
  if (teamId != null) {
    teamPlayerEntity.teamId = teamId;
  }
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    teamPlayerEntity.id = id;
  }
  final double? position = jsonConvert.convert<double>(json['position']);
  if (position != null) {
    teamPlayerEntity.position = position;
  }
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    teamPlayerEntity.power = power;
  }
  final TeamPlayerPotential? potential = jsonConvert.convert<
      TeamPlayerPotential>(json['potential']);
  if (potential != null) {
    teamPlayerEntity.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    teamPlayerEntity.bindStatus = bindStatus;
  }
  final double? breakThroughGrade = jsonConvert.convert<double>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    teamPlayerEntity.breakThroughGrade = breakThroughGrade;
  }
  final double? playerId = jsonConvert.convert<double>(json['playerId']);
  if (playerId != null) {
    teamPlayerEntity.playerId = playerId;
  }
  return teamPlayerEntity;
}

Map<String, dynamic> $TeamPlayerEntityToJson(TeamPlayerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buyPrice'] = entity.buyPrice;
  data['buyPlayerScore'] = entity.buyPlayerScore;
  data['updateTime'] = entity.updateTime;
  data['uuid'] = entity.uuid;
  data['gradeExp'] = entity.gradeExp;
  data['fromType'] = entity.fromType;
  data['createTime'] = entity.createTime;
  data['playerGrade'] = entity.playerGrade;
  data['teamId'] = entity.teamId;
  data['id'] = entity.id;
  data['position'] = entity.position;
  data['power'] = entity.power;
  data['potential'] = entity.potential.toJson();
  data['bindStatus'] = entity.bindStatus;
  data['breakThroughGrade'] = entity.breakThroughGrade;
  data['playerId'] = entity.playerId;
  return data;
}

extension TeamPlayerEntityExtension on TeamPlayerEntity {
  TeamPlayerEntity copyWith({
    double? buyPrice,
    double? buyPlayerScore,
    double? updateTime,
    String? uuid,
    double? gradeExp,
    double? fromType,
    double? createTime,
    double? playerGrade,
    double? teamId,
    double? id,
    double? position,
    double? power,
    TeamPlayerPotential? potential,
    bool? bindStatus,
    double? breakThroughGrade,
    double? playerId,
  }) {
    return TeamPlayerEntity()
      ..buyPrice = buyPrice ?? this.buyPrice
      ..buyPlayerScore = buyPlayerScore ?? this.buyPlayerScore
      ..updateTime = updateTime ?? this.updateTime
      ..uuid = uuid ?? this.uuid
      ..gradeExp = gradeExp ?? this.gradeExp
      ..fromType = fromType ?? this.fromType
      ..createTime = createTime ?? this.createTime
      ..playerGrade = playerGrade ?? this.playerGrade
      ..teamId = teamId ?? this.teamId
      ..id = id ?? this.id
      ..position = position ?? this.position
      ..power = power ?? this.power
      ..potential = potential ?? this.potential
      ..bindStatus = bindStatus ?? this.bindStatus
      ..breakThroughGrade = breakThroughGrade ?? this.breakThroughGrade
      ..playerId = playerId ?? this.playerId;
  }
}

TeamPlayerPotential $TeamPlayerPotentialFromJson(Map<String, dynamic> json) {
  final TeamPlayerPotential teamPlayerPotential = TeamPlayerPotential();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    teamPlayerPotential.blk = blk;
  }
  final double? threePt = jsonConvert.convert<double>(json['threePt']);
  if (threePt != null) {
    teamPlayerPotential.threePt = threePt;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    teamPlayerPotential.ast = ast;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    teamPlayerPotential.stl = stl;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    teamPlayerPotential.pts = pts;
  }
  final double? reb = jsonConvert.convert<double>(json['reb']);
  if (reb != null) {
    teamPlayerPotential.reb = reb;
  }
  return teamPlayerPotential;
}

Map<String, dynamic> $TeamPlayerPotentialToJson(TeamPlayerPotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension TeamPlayerPotentialExtension on TeamPlayerPotential {
  TeamPlayerPotential copyWith({
    double? blk,
    double? threePt,
    double? ast,
    double? stl,
    double? pts,
    double? reb,
  }) {
    return TeamPlayerPotential()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}