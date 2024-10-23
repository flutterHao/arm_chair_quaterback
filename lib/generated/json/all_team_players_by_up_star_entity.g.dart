import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/all_team_players_by_up_star_entity.dart';

AllTeamPlayersByUpStarEntity $AllTeamPlayersByUpStarEntityFromJson(
    Map<String, dynamic> json) {
  final AllTeamPlayersByUpStarEntity allTeamPlayersByUpStarEntity = AllTeamPlayersByUpStarEntity();
  final double? buyPrice = jsonConvert.convert<double>(json['buyPrice']);
  if (buyPrice != null) {
    allTeamPlayersByUpStarEntity.buyPrice = buyPrice;
  }
  final double? buyPlayerScore = jsonConvert.convert<double>(
      json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    allTeamPlayersByUpStarEntity.buyPlayerScore = buyPlayerScore;
  }
  final double? probability = jsonConvert.convert<double>(json['probability']);
  if (probability != null) {
    allTeamPlayersByUpStarEntity.probability = probability;
  }
  final double? cost = jsonConvert.convert<double>(json['cost']);
  if (cost != null) {
    allTeamPlayersByUpStarEntity.cost = cost;
  }
  final double? updateTime = jsonConvert.convert<double>(json['updateTime']);
  if (updateTime != null) {
    allTeamPlayersByUpStarEntity.updateTime = updateTime;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    allTeamPlayersByUpStarEntity.uuid = uuid;
  }
  final double? gradeExp = jsonConvert.convert<double>(json['gradeExp']);
  if (gradeExp != null) {
    allTeamPlayersByUpStarEntity.gradeExp = gradeExp;
  }
  final double? fromType = jsonConvert.convert<double>(json['fromType']);
  if (fromType != null) {
    allTeamPlayersByUpStarEntity.fromType = fromType;
  }
  final double? createTime = jsonConvert.convert<double>(json['createTime']);
  if (createTime != null) {
    allTeamPlayersByUpStarEntity.createTime = createTime;
  }
  final double? playerGrade = jsonConvert.convert<double>(json['playerGrade']);
  if (playerGrade != null) {
    allTeamPlayersByUpStarEntity.playerGrade = playerGrade;
  }
  final double? teamId = jsonConvert.convert<double>(json['teamId']);
  if (teamId != null) {
    allTeamPlayersByUpStarEntity.teamId = teamId;
  }
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    allTeamPlayersByUpStarEntity.id = id;
  }
  final double? position = jsonConvert.convert<double>(json['position']);
  if (position != null) {
    allTeamPlayersByUpStarEntity.position = position;
  }
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    allTeamPlayersByUpStarEntity.power = power;
  }
  final AllTeamPlayersByUpStarPotential? potential = jsonConvert.convert<
      AllTeamPlayersByUpStarPotential>(json['potential']);
  if (potential != null) {
    allTeamPlayersByUpStarEntity.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    allTeamPlayersByUpStarEntity.bindStatus = bindStatus;
  }
  final double? breakThroughGrade = jsonConvert.convert<double>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    allTeamPlayersByUpStarEntity.breakThroughGrade = breakThroughGrade;
  }
  final double? playerId = jsonConvert.convert<double>(json['playerId']);
  if (playerId != null) {
    allTeamPlayersByUpStarEntity.playerId = playerId;
  }
  final AllTeamPlayersByUpStarUpStarBase? upStarBase = jsonConvert.convert<
      AllTeamPlayersByUpStarUpStarBase>(json['upStarBase']);
  if (upStarBase != null) {
    allTeamPlayersByUpStarEntity.upStarBase = upStarBase;
  }
  return allTeamPlayersByUpStarEntity;
}

Map<String, dynamic> $AllTeamPlayersByUpStarEntityToJson(
    AllTeamPlayersByUpStarEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buyPrice'] = entity.buyPrice;
  data['buyPlayerScore'] = entity.buyPlayerScore;
  data['probability'] = entity.probability;
  data['cost'] = entity.cost;
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
  data['upStarBase'] = entity.upStarBase.toJson();
  return data;
}

extension AllTeamPlayersByUpStarEntityExtension on AllTeamPlayersByUpStarEntity {
  AllTeamPlayersByUpStarEntity copyWith({
    double? buyPrice,
    double? buyPlayerScore,
    double? probability,
    double? cost,
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
    AllTeamPlayersByUpStarPotential? potential,
    bool? bindStatus,
    double? breakThroughGrade,
    double? playerId,
    AllTeamPlayersByUpStarUpStarBase? upStarBase,
  }) {
    return AllTeamPlayersByUpStarEntity()
      ..buyPrice = buyPrice ?? this.buyPrice
      ..buyPlayerScore = buyPlayerScore ?? this.buyPlayerScore
      ..probability = probability ?? this.probability
      ..cost = cost ?? this.cost
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
      ..playerId = playerId ?? this.playerId
      ..upStarBase = upStarBase ?? this.upStarBase;
  }
}

AllTeamPlayersByUpStarPotential $AllTeamPlayersByUpStarPotentialFromJson(
    Map<String, dynamic> json) {
  final AllTeamPlayersByUpStarPotential allTeamPlayersByUpStarPotential = AllTeamPlayersByUpStarPotential();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    allTeamPlayersByUpStarPotential.blk = blk;
  }
  final double? threePt = jsonConvert.convert<double>(json['threePt']);
  if (threePt != null) {
    allTeamPlayersByUpStarPotential.threePt = threePt;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    allTeamPlayersByUpStarPotential.ast = ast;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    allTeamPlayersByUpStarPotential.stl = stl;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    allTeamPlayersByUpStarPotential.pts = pts;
  }
  final double? reb = jsonConvert.convert<double>(json['reb']);
  if (reb != null) {
    allTeamPlayersByUpStarPotential.reb = reb;
  }
  return allTeamPlayersByUpStarPotential;
}

Map<String, dynamic> $AllTeamPlayersByUpStarPotentialToJson(
    AllTeamPlayersByUpStarPotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension AllTeamPlayersByUpStarPotentialExtension on AllTeamPlayersByUpStarPotential {
  AllTeamPlayersByUpStarPotential copyWith({
    double? blk,
    double? threePt,
    double? ast,
    double? stl,
    double? pts,
    double? reb,
  }) {
    return AllTeamPlayersByUpStarPotential()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

AllTeamPlayersByUpStarUpStarBase $AllTeamPlayersByUpStarUpStarBaseFromJson(
    Map<String, dynamic> json) {
  final AllTeamPlayersByUpStarUpStarBase allTeamPlayersByUpStarUpStarBase = AllTeamPlayersByUpStarUpStarBase();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    allTeamPlayersByUpStarUpStarBase.blk = blk;
  }
  final double? threePt = jsonConvert.convert<double>(json['threePt']);
  if (threePt != null) {
    allTeamPlayersByUpStarUpStarBase.threePt = threePt;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    allTeamPlayersByUpStarUpStarBase.ast = ast;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    allTeamPlayersByUpStarUpStarBase.stl = stl;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    allTeamPlayersByUpStarUpStarBase.pts = pts;
  }
  final double? reb = jsonConvert.convert<double>(json['reb']);
  if (reb != null) {
    allTeamPlayersByUpStarUpStarBase.reb = reb;
  }
  return allTeamPlayersByUpStarUpStarBase;
}

Map<String, dynamic> $AllTeamPlayersByUpStarUpStarBaseToJson(
    AllTeamPlayersByUpStarUpStarBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension AllTeamPlayersByUpStarUpStarBaseExtension on AllTeamPlayersByUpStarUpStarBase {
  AllTeamPlayersByUpStarUpStarBase copyWith({
    double? blk,
    double? threePt,
    double? ast,
    double? stl,
    double? pts,
    double? reb,
  }) {
    return AllTeamPlayersByUpStarUpStarBase()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}