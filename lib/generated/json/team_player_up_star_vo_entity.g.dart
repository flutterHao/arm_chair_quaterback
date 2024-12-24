import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';

TeamPlayerUpStarVoEntity $TeamPlayerUpStarVoEntityFromJson(
    Map<String, dynamic> json) {
  final TeamPlayerUpStarVoEntity teamPlayerUpStarVoEntity = TeamPlayerUpStarVoEntity();
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    teamPlayerUpStarVoEntity.uuid = uuid;
  }
  final double? jumpShot = jsonConvert.convert<double>(json['jumpShot']);
  if (jumpShot != null) {
    teamPlayerUpStarVoEntity.jumpShot = jumpShot;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    teamPlayerUpStarVoEntity.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    teamPlayerUpStarVoEntity.fromType = fromType;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    teamPlayerUpStarVoEntity.playerGrade = playerGrade;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    teamPlayerUpStarVoEntity.id = id;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    teamPlayerUpStarVoEntity.power = power;
  }
  final double? midlineDefense = jsonConvert.convert<double>(
      json['midlineDefense']);
  if (midlineDefense != null) {
    teamPlayerUpStarVoEntity.midlineDefense = midlineDefense;
  }
  final double? outsideDefense = jsonConvert.convert<double>(
      json['outsideDefense']);
  if (outsideDefense != null) {
    teamPlayerUpStarVoEntity.outsideDefense = outsideDefense;
  }
  final int? playerStatus = jsonConvert.convert<int>(json['playerStatus']);
  if (playerStatus != null) {
    teamPlayerUpStarVoEntity.playerStatus = playerStatus;
  }
  final int? playerStatusValue = jsonConvert.convert<int>(
      json['playerStatusValue']);
  if (playerStatusValue != null) {
    teamPlayerUpStarVoEntity.playerStatusValue = playerStatusValue;
  }
  final TeamPlayerUpStarVoPotential? potential = jsonConvert.convert<
      TeamPlayerUpStarVoPotential>(json['potential']);
  if (potential != null) {
    teamPlayerUpStarVoEntity.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    teamPlayerUpStarVoEntity.bindStatus = bindStatus;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    teamPlayerUpStarVoEntity.playerId = playerId;
  }
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    teamPlayerUpStarVoEntity.buyPrice = buyPrice;
  }
  final double? layup = jsonConvert.convert<double>(json['layup']);
  if (layup != null) {
    teamPlayerUpStarVoEntity.layup = layup;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    teamPlayerUpStarVoEntity.buyPlayerScore = buyPlayerScore;
  }
  final double? insideDefense = jsonConvert.convert<double>(
      json['insideDefense']);
  if (insideDefense != null) {
    teamPlayerUpStarVoEntity.insideDefense = insideDefense;
  }
  final double? threeShot = jsonConvert.convert<double>(json['threeShot']);
  if (threeShot != null) {
    teamPlayerUpStarVoEntity.threeShot = threeShot;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    teamPlayerUpStarVoEntity.updateTime = updateTime;
  }
  final double? playerReadiness = jsonConvert.convert<double>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    teamPlayerUpStarVoEntity.playerReadiness = playerReadiness;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamPlayerUpStarVoEntity.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamPlayerUpStarVoEntity.teamId = teamId;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    teamPlayerUpStarVoEntity.position = position;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    teamPlayerUpStarVoEntity.breakThroughGrade = breakThroughGrade;
  }
  final TeamPlayerUpStarVoPotential? maxAbility = jsonConvert.convert<
      TeamPlayerUpStarVoPotential>(json['maxAbility']);
  if (maxAbility != null) {
    teamPlayerUpStarVoEntity.maxAbility = maxAbility;
  }
  return teamPlayerUpStarVoEntity;
}

Map<String, dynamic> $TeamPlayerUpStarVoEntityToJson(
    TeamPlayerUpStarVoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uuid'] = entity.uuid;
  data['jumpShot'] = entity.jumpShot;
  data['gradeExp'] = entity.gradeExp;
  data['fromType'] = entity.fromType;
  data['playerGrade'] = entity.playerGrade;
  data['id'] = entity.id;
  data['power'] = entity.power;
  data['midlineDefense'] = entity.midlineDefense;
  data['outsideDefense'] = entity.outsideDefense;
  data['playerStatus'] = entity.playerStatus;
  data['playerStatusValue'] = entity.playerStatusValue;
  data['potential'] = entity.potential.toJson();
  data['bindStatus'] = entity.bindStatus;
  data['playerId'] = entity.playerId;
  data['buyPrice'] = entity.buyPrice;
  data['layup'] = entity.layup;
  data['buyPlayerScore'] = entity.buyPlayerScore;
  data['insideDefense'] = entity.insideDefense;
  data['threeShot'] = entity.threeShot;
  data['updateTime'] = entity.updateTime;
  data['playerReadiness'] = entity.playerReadiness;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['position'] = entity.position;
  data['breakThroughGrade'] = entity.breakThroughGrade;
  data['maxAbility'] = entity.maxAbility.toJson();
  return data;
}

extension TeamPlayerUpStarVoEntityExtension on TeamPlayerUpStarVoEntity {
  TeamPlayerUpStarVoEntity copyWith({
    String? uuid,
    double? jumpShot,
    int? gradeExp,
    int? fromType,
    int? playerGrade,
    int? id,
    int? power,
    double? midlineDefense,
    double? outsideDefense,
    int? playerStatus,
    int? playerStatusValue,
    TeamPlayerUpStarVoPotential? potential,
    bool? bindStatus,
    int? playerId,
    int? buyPrice,
    double? layup,
    int? buyPlayerScore,
    double? insideDefense,
    double? threeShot,
    int? updateTime,
    double? playerReadiness,
    int? createTime,
    int? teamId,
    int? position,
    int? breakThroughGrade,
    TeamPlayerUpStarVoPotential? maxAbility,
  }) {
    return TeamPlayerUpStarVoEntity()
      ..uuid = uuid ?? this.uuid
      ..jumpShot = jumpShot ?? this.jumpShot
      ..gradeExp = gradeExp ?? this.gradeExp
      ..fromType = fromType ?? this.fromType
      ..playerGrade = playerGrade ?? this.playerGrade
      ..id = id ?? this.id
      ..power = power ?? this.power
      ..midlineDefense = midlineDefense ?? this.midlineDefense
      ..outsideDefense = outsideDefense ?? this.outsideDefense
      ..playerStatus = playerStatus ?? this.playerStatus
      ..playerStatusValue = playerStatusValue ?? this.playerStatusValue
      ..potential = potential ?? this.potential
      ..bindStatus = bindStatus ?? this.bindStatus
      ..playerId = playerId ?? this.playerId
      ..buyPrice = buyPrice ?? this.buyPrice
      ..layup = layup ?? this.layup
      ..buyPlayerScore = buyPlayerScore ?? this.buyPlayerScore
      ..insideDefense = insideDefense ?? this.insideDefense
      ..threeShot = threeShot ?? this.threeShot
      ..updateTime = updateTime ?? this.updateTime
      ..playerReadiness = playerReadiness ?? this.playerReadiness
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..position = position ?? this.position
      ..breakThroughGrade = breakThroughGrade ?? this.breakThroughGrade
      ..maxAbility = maxAbility ?? this.maxAbility;
  }
}

TeamPlayerUpStarVoPotential $TeamPlayerUpStarVoPotentialFromJson(
    Map<String, dynamic> json) {
  final TeamPlayerUpStarVoPotential teamPlayerUpStarVoPotential = TeamPlayerUpStarVoPotential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    teamPlayerUpStarVoPotential.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    teamPlayerUpStarVoPotential.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    teamPlayerUpStarVoPotential.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    teamPlayerUpStarVoPotential.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    teamPlayerUpStarVoPotential.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    teamPlayerUpStarVoPotential.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    teamPlayerUpStarVoPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    teamPlayerUpStarVoPotential.reb = reb;
  }
  return teamPlayerUpStarVoPotential;
}

Map<String, dynamic> $TeamPlayerUpStarVoPotentialToJson(
    TeamPlayerUpStarVoPotential entity) {
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

extension TeamPlayerUpStarVoPotentialExtension on TeamPlayerUpStarVoPotential {
  TeamPlayerUpStarVoPotential copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return TeamPlayerUpStarVoPotential()
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