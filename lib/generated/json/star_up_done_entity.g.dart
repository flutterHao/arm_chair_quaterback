import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_done_entity.dart';

StarUpDoneEntity $StarUpDoneEntityFromJson(Map<String, dynamic> json) {
  final StarUpDoneEntity starUpDoneEntity = StarUpDoneEntity();
  final StarUpDoneAddPotential? addPotential = jsonConvert.convert<
      StarUpDoneAddPotential>(json['addPotential']);
  if (addPotential != null) {
    starUpDoneEntity.addPotential = addPotential;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    starUpDoneEntity.success = success;
  }
  final StarUpDoneTeamPlayerVO? teamPlayerVO = jsonConvert.convert<
      StarUpDoneTeamPlayerVO>(json['teamPlayerVO']);
  if (teamPlayerVO != null) {
    starUpDoneEntity.teamPlayerVO = teamPlayerVO;
  }
  final StarUpDoneRandomCount? randomCount = jsonConvert.convert<
      StarUpDoneRandomCount>(json['randomCount']);
  if (randomCount != null) {
    starUpDoneEntity.randomCount = randomCount;
  }
  return starUpDoneEntity;
}

Map<String, dynamic> $StarUpDoneEntityToJson(StarUpDoneEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addPotential'] = entity.addPotential.toJson();
  data['success'] = entity.success;
  data['teamPlayerVO'] = entity.teamPlayerVO.toJson();
  data['randomCount'] = entity.randomCount.toJson();
  return data;
}

extension StarUpDoneEntityExtension on StarUpDoneEntity {
  StarUpDoneEntity copyWith({
    StarUpDoneAddPotential? addPotential,
    bool? success,
    StarUpDoneTeamPlayerVO? teamPlayerVO,
    StarUpDoneRandomCount? randomCount,
  }) {
    return StarUpDoneEntity()
      ..addPotential = addPotential ?? this.addPotential
      ..success = success ?? this.success
      ..teamPlayerVO = teamPlayerVO ?? this.teamPlayerVO
      ..randomCount = randomCount ?? this.randomCount;
  }
}

StarUpDoneAddPotential $StarUpDoneAddPotentialFromJson(
    Map<String, dynamic> json) {
  final StarUpDoneAddPotential starUpDoneAddPotential = StarUpDoneAddPotential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    starUpDoneAddPotential.blk = blk;
  }
  final double? tech = jsonConvert.convert<double>(json['tech']);
  if (tech != null) {
    starUpDoneAddPotential.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    starUpDoneAddPotential.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    starUpDoneAddPotential.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    starUpDoneAddPotential.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    starUpDoneAddPotential.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    starUpDoneAddPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    starUpDoneAddPotential.reb = reb;
  }
  return starUpDoneAddPotential;
}

Map<String, dynamic> $StarUpDoneAddPotentialToJson(
    StarUpDoneAddPotential entity) {
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

extension StarUpDoneAddPotentialExtension on StarUpDoneAddPotential {
  StarUpDoneAddPotential copyWith({
    int? blk,
    double? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return StarUpDoneAddPotential()
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

StarUpDoneTeamPlayerVO $StarUpDoneTeamPlayerVOFromJson(
    Map<String, dynamic> json) {
  final StarUpDoneTeamPlayerVO starUpDoneTeamPlayerVO = StarUpDoneTeamPlayerVO();
  final double? playerStrength = jsonConvert.convert<double>(
      json['playerStrength']);
  if (playerStrength != null) {
    starUpDoneTeamPlayerVO.playerStrength = playerStrength;
  }
  final StarUpDoneTeamPlayerVOMaxAbility? maxAbility = jsonConvert.convert<
      StarUpDoneTeamPlayerVOMaxAbility>(json['maxAbility']);
  if (maxAbility != null) {
    starUpDoneTeamPlayerVO.maxAbility = maxAbility;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    starUpDoneTeamPlayerVO.uuid = uuid;
  }
  final double? jumpShot = jsonConvert.convert<double>(json['jumpShot']);
  if (jumpShot != null) {
    starUpDoneTeamPlayerVO.jumpShot = jumpShot;
  }
  final double? gradeExp = jsonConvert.convert<double>(json['gradeExp']);
  if (gradeExp != null) {
    starUpDoneTeamPlayerVO.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    starUpDoneTeamPlayerVO.fromType = fromType;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    starUpDoneTeamPlayerVO.playerGrade = playerGrade;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    starUpDoneTeamPlayerVO.id = id;
  }
  final double? power = jsonConvert.convert<double>(json['power']);
  if (power != null) {
    starUpDoneTeamPlayerVO.power = power;
  }
  final double? midlineDefense = jsonConvert.convert<double>(
      json['midlineDefense']);
  if (midlineDefense != null) {
    starUpDoneTeamPlayerVO.midlineDefense = midlineDefense;
  }
  final double? outsideDefense = jsonConvert.convert<double>(
      json['outsideDefense']);
  if (outsideDefense != null) {
    starUpDoneTeamPlayerVO.outsideDefense = outsideDefense;
  }
  final int? playerStatus = jsonConvert.convert<int>(json['playerStatus']);
  if (playerStatus != null) {
    starUpDoneTeamPlayerVO.playerStatus = playerStatus;
  }
  final int? playerStatusValue = jsonConvert.convert<int>(
      json['playerStatusValue']);
  if (playerStatusValue != null) {
    starUpDoneTeamPlayerVO.playerStatusValue = playerStatusValue;
  }
  final StarUpDoneTeamPlayerVOPotential? potential = jsonConvert.convert<
      StarUpDoneTeamPlayerVOPotential>(json['potential']);
  if (potential != null) {
    starUpDoneTeamPlayerVO.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    starUpDoneTeamPlayerVO.bindStatus = bindStatus;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    starUpDoneTeamPlayerVO.playerId = playerId;
  }
  final double? buyPrice = jsonConvert.convert<double>(json['buyPrice']);
  if (buyPrice != null) {
    starUpDoneTeamPlayerVO.buyPrice = buyPrice;
  }
  final double? layup = jsonConvert.convert<double>(json['layup']);
  if (layup != null) {
    starUpDoneTeamPlayerVO.layup = layup;
  }
  final double? buyPlayerScore = jsonConvert.convert<double>(
      json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    starUpDoneTeamPlayerVO.buyPlayerScore = buyPlayerScore;
  }
  final double? insideDefense = jsonConvert.convert<double>(
      json['insideDefense']);
  if (insideDefense != null) {
    starUpDoneTeamPlayerVO.insideDefense = insideDefense;
  }
  final double? threeShot = jsonConvert.convert<double>(json['threeShot']);
  if (threeShot != null) {
    starUpDoneTeamPlayerVO.threeShot = threeShot;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    starUpDoneTeamPlayerVO.updateTime = updateTime;
  }
  final double? playerReadiness = jsonConvert.convert<double>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    starUpDoneTeamPlayerVO.playerReadiness = playerReadiness;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    starUpDoneTeamPlayerVO.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    starUpDoneTeamPlayerVO.teamId = teamId;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    starUpDoneTeamPlayerVO.position = position;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    starUpDoneTeamPlayerVO.breakThroughGrade = breakThroughGrade;
  }
  return starUpDoneTeamPlayerVO;
}

Map<String, dynamic> $StarUpDoneTeamPlayerVOToJson(
    StarUpDoneTeamPlayerVO entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerStrength'] = entity.playerStrength;
  data['maxAbility'] = entity.maxAbility.toJson();
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
  return data;
}

extension StarUpDoneTeamPlayerVOExtension on StarUpDoneTeamPlayerVO {
  StarUpDoneTeamPlayerVO copyWith({
    double? playerStrength,
    StarUpDoneTeamPlayerVOMaxAbility? maxAbility,
    String? uuid,
    double? jumpShot,
    double? gradeExp,
    int? fromType,
    int? playerGrade,
    int? id,
    double? power,
    double? midlineDefense,
    double? outsideDefense,
    int? playerStatus,
    int? playerStatusValue,
    StarUpDoneTeamPlayerVOPotential? potential,
    bool? bindStatus,
    int? playerId,
    double? buyPrice,
    double? layup,
    double? buyPlayerScore,
    double? insideDefense,
    double? threeShot,
    int? updateTime,
    double? playerReadiness,
    int? createTime,
    int? teamId,
    int? position,
    int? breakThroughGrade,
  }) {
    return StarUpDoneTeamPlayerVO()
      ..playerStrength = playerStrength ?? this.playerStrength
      ..maxAbility = maxAbility ?? this.maxAbility
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
      ..breakThroughGrade = breakThroughGrade ?? this.breakThroughGrade;
  }
}

StarUpDoneTeamPlayerVOMaxAbility $StarUpDoneTeamPlayerVOMaxAbilityFromJson(
    Map<String, dynamic> json) {
  final StarUpDoneTeamPlayerVOMaxAbility starUpDoneTeamPlayerVOMaxAbility = StarUpDoneTeamPlayerVOMaxAbility();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    starUpDoneTeamPlayerVOMaxAbility.blk = blk;
  }
  final double? tech = jsonConvert.convert<double>(json['tech']);
  if (tech != null) {
    starUpDoneTeamPlayerVOMaxAbility.tech = tech;
  }
  final double? pass = jsonConvert.convert<double>(json['pass']);
  if (pass != null) {
    starUpDoneTeamPlayerVOMaxAbility.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    starUpDoneTeamPlayerVOMaxAbility.stl = stl;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    starUpDoneTeamPlayerVOMaxAbility.threePm = threePm;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    starUpDoneTeamPlayerVOMaxAbility.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    starUpDoneTeamPlayerVOMaxAbility.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    starUpDoneTeamPlayerVOMaxAbility.reb = reb;
  }
  return starUpDoneTeamPlayerVOMaxAbility;
}

Map<String, dynamic> $StarUpDoneTeamPlayerVOMaxAbilityToJson(
    StarUpDoneTeamPlayerVOMaxAbility entity) {
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

extension StarUpDoneTeamPlayerVOMaxAbilityExtension on StarUpDoneTeamPlayerVOMaxAbility {
  StarUpDoneTeamPlayerVOMaxAbility copyWith({
    double? blk,
    double? tech,
    double? pass,
    int? stl,
    double? threePm,
    double? ftm,
    int? pts,
    int? reb,
  }) {
    return StarUpDoneTeamPlayerVOMaxAbility()
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

StarUpDoneTeamPlayerVOPotential $StarUpDoneTeamPlayerVOPotentialFromJson(
    Map<String, dynamic> json) {
  final StarUpDoneTeamPlayerVOPotential starUpDoneTeamPlayerVOPotential = StarUpDoneTeamPlayerVOPotential();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    starUpDoneTeamPlayerVOPotential.blk = blk;
  }
  final double? tech = jsonConvert.convert<double>(json['tech']);
  if (tech != null) {
    starUpDoneTeamPlayerVOPotential.tech = tech;
  }
  final double? pass = jsonConvert.convert<double>(json['pass']);
  if (pass != null) {
    starUpDoneTeamPlayerVOPotential.pass = pass;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    starUpDoneTeamPlayerVOPotential.stl = stl;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    starUpDoneTeamPlayerVOPotential.threePm = threePm;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    starUpDoneTeamPlayerVOPotential.ftm = ftm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    starUpDoneTeamPlayerVOPotential.pts = pts;
  }
  final double? reb = jsonConvert.convert<double>(json['reb']);
  if (reb != null) {
    starUpDoneTeamPlayerVOPotential.reb = reb;
  }
  return starUpDoneTeamPlayerVOPotential;
}

Map<String, dynamic> $StarUpDoneTeamPlayerVOPotentialToJson(
    StarUpDoneTeamPlayerVOPotential entity) {
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

extension StarUpDoneTeamPlayerVOPotentialExtension on StarUpDoneTeamPlayerVOPotential {
  StarUpDoneTeamPlayerVOPotential copyWith({
    double? blk,
    double? tech,
    double? pass,
    double? stl,
    double? threePm,
    double? ftm,
    double? pts,
    double? reb,
  }) {
    return StarUpDoneTeamPlayerVOPotential()
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

StarUpDoneRandomCount $StarUpDoneRandomCountFromJson(
    Map<String, dynamic> json) {
  final StarUpDoneRandomCount starUpDoneRandomCount = StarUpDoneRandomCount();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    starUpDoneRandomCount.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    starUpDoneRandomCount.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    starUpDoneRandomCount.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    starUpDoneRandomCount.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    starUpDoneRandomCount.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    starUpDoneRandomCount.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    starUpDoneRandomCount.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    starUpDoneRandomCount.reb = reb;
  }
  return starUpDoneRandomCount;
}

Map<String, dynamic> $StarUpDoneRandomCountToJson(
    StarUpDoneRandomCount entity) {
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

extension StarUpDoneRandomCountExtension on StarUpDoneRandomCount {
  StarUpDoneRandomCount copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return StarUpDoneRandomCount()
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