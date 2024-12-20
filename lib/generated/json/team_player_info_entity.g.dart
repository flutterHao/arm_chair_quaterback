import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'dart:math';

import 'package:get/get.dart';


TeamPlayerInfoEntity $TeamPlayerInfoEntityFromJson(Map<String, dynamic> json) {
  final TeamPlayerInfoEntity teamPlayerInfoEntity = TeamPlayerInfoEntity();
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    teamPlayerInfoEntity.buyPrice = buyPrice;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    teamPlayerInfoEntity.buyPlayerScore = buyPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    teamPlayerInfoEntity.updateTime = updateTime;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    teamPlayerInfoEntity.uuid = uuid;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    teamPlayerInfoEntity.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    teamPlayerInfoEntity.fromType = fromType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamPlayerInfoEntity.createTime = createTime;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    teamPlayerInfoEntity.playerGrade = playerGrade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamPlayerInfoEntity.teamId = teamId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    teamPlayerInfoEntity.id = id;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    teamPlayerInfoEntity.position = position;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    teamPlayerInfoEntity.power = power;
  }
  final int? playerStatus = jsonConvert.convert<int>(json['playerStatus']);
  if (playerStatus != null) {
    teamPlayerInfoEntity.playerStatus = playerStatus;
  }
  final TeamPlayerInfoPotential? potential = jsonConvert.convert<
      TeamPlayerInfoPotential>(json['potential']);
  if (potential != null) {
    teamPlayerInfoEntity.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    teamPlayerInfoEntity.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    teamPlayerInfoEntity.breakThroughGrade = breakThroughGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    teamPlayerInfoEntity.playerId = playerId;
  }
  final TeamPlayerInfoPotential? upStarBase = jsonConvert.convert<
      TeamPlayerInfoPotential>(json['upStarBase']);
  if (upStarBase != null) {
    teamPlayerInfoEntity.upStarBase = upStarBase;
  }
  return teamPlayerInfoEntity;
}

Map<String, dynamic> $TeamPlayerInfoEntityToJson(TeamPlayerInfoEntity entity) {
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
  data['playerStatus'] = entity.playerStatus;
  data['potential'] = entity.potential.toJson();
  data['bindStatus'] = entity.bindStatus;
  data['breakThroughGrade'] = entity.breakThroughGrade;
  data['playerId'] = entity.playerId;
  data['upStarBase'] = entity.upStarBase?.toJson();
  return data;
}

extension TeamPlayerInfoEntityExtension on TeamPlayerInfoEntity {
  TeamPlayerInfoEntity copyWith({
    int? buyPrice,
    int? buyPlayerScore,
    int? updateTime,
    String? uuid,
    int? gradeExp,
    int? fromType,
    int? createTime,
    int? playerGrade,
    int? teamId,
    int? id,
    int? position,
    int? power,
    int? playerStatus,
    TeamPlayerInfoPotential? potential,
    bool? bindStatus,
    int? breakThroughGrade,
    int? playerId,
    TeamPlayerInfoPotential? upStarBase,
    RxBool? isChange,
    int? recoverCost,
  }) {
    return TeamPlayerInfoEntity()
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
      ..playerStatus = playerStatus ?? this.playerStatus
      ..potential = potential ?? this.potential
      ..bindStatus = bindStatus ?? this.bindStatus
      ..breakThroughGrade = breakThroughGrade ?? this.breakThroughGrade
      ..playerId = playerId ?? this.playerId
      ..upStarBase = upStarBase ?? this.upStarBase
      ..isChange = isChange ?? this.isChange
      ..recoverCost = recoverCost ?? this.recoverCost;
  }
}

TeamPlayerInfoPotential $TeamPlayerInfoPotentialFromJson(
    Map<String, dynamic> json) {
  final TeamPlayerInfoPotential teamPlayerInfoPotential = TeamPlayerInfoPotential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    teamPlayerInfoPotential.blk = blk;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    teamPlayerInfoPotential.ast = ast;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    teamPlayerInfoPotential.threePt = threePt;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    teamPlayerInfoPotential.stl = stl;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    teamPlayerInfoPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    teamPlayerInfoPotential.reb = reb;
  }
  return teamPlayerInfoPotential;
}

Map<String, dynamic> $TeamPlayerInfoPotentialToJson(
    TeamPlayerInfoPotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['ast'] = entity.ast;
  data['threePt'] = entity.threePt;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension TeamPlayerInfoPotentialExtension on TeamPlayerInfoPotential {
  TeamPlayerInfoPotential copyWith({
    int? blk,
    int? ast,
    int? threePt,
    int? stl,
    int? pts,
    int? reb,
  }) {
    return TeamPlayerInfoPotential()
      ..blk = blk ?? this.blk
      ..ast = ast ?? this.ast
      ..threePt = threePt ?? this.threePt
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}