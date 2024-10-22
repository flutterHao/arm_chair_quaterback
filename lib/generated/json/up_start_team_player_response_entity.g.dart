import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/up_start_team_player_response_entity.dart';

UpStartTeamPlayerResponseEntity $UpStartTeamPlayerResponseEntityFromJson(
    Map<String, dynamic> json) {
  final UpStartTeamPlayerResponseEntity upStartTeamPlayerResponseEntity = UpStartTeamPlayerResponseEntity();
  final UpStartTeamPlayerResponseDataBefore? before = jsonConvert.convert<
      UpStartTeamPlayerResponseDataBefore>(json['before']);
  if (before != null) {
    upStartTeamPlayerResponseEntity.before = before;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    upStartTeamPlayerResponseEntity.success = success;
  }
  final UpStartTeamPlayerResponseDataAfter? after = jsonConvert.convert<
      UpStartTeamPlayerResponseDataAfter>(json['after']);
  if (after != null) {
    upStartTeamPlayerResponseEntity.after = after;
  }
  return upStartTeamPlayerResponseEntity;
}

Map<String, dynamic> $UpStartTeamPlayerResponseEntityToJson(
    UpStartTeamPlayerResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['before'] = entity.before.toJson();
  data['success'] = entity.success;
  data['after'] = entity.after.toJson();
  return data;
}

extension UpStartTeamPlayerResponseEntityExtension on UpStartTeamPlayerResponseEntity {
  UpStartTeamPlayerResponseEntity copyWith({
    UpStartTeamPlayerResponseDataBefore? before,
    bool? success,
    UpStartTeamPlayerResponseDataAfter? after,
  }) {
    return UpStartTeamPlayerResponseEntity()
      ..before = before ?? this.before
      ..success = success ?? this.success
      ..after = after ?? this.after;
  }
}

UpStartTeamPlayerResponseDataBefore $UpStartTeamPlayerResponseDataBeforeFromJson(
    Map<String, dynamic> json) {
  final UpStartTeamPlayerResponseDataBefore upStartTeamPlayerResponseDataBefore = UpStartTeamPlayerResponseDataBefore();
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    upStartTeamPlayerResponseDataBefore.buyPrice = buyPrice;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    upStartTeamPlayerResponseDataBefore.buyPlayerScore = buyPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    upStartTeamPlayerResponseDataBefore.updateTime = updateTime;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    upStartTeamPlayerResponseDataBefore.uuid = uuid;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    upStartTeamPlayerResponseDataBefore.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    upStartTeamPlayerResponseDataBefore.fromType = fromType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    upStartTeamPlayerResponseDataBefore.createTime = createTime;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    upStartTeamPlayerResponseDataBefore.playerGrade = playerGrade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    upStartTeamPlayerResponseDataBefore.teamId = teamId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    upStartTeamPlayerResponseDataBefore.id = id;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    upStartTeamPlayerResponseDataBefore.position = position;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    upStartTeamPlayerResponseDataBefore.power = power;
  }
  final UpStartTeamPlayerResponseDataBeforePotential? potential = jsonConvert
      .convert<UpStartTeamPlayerResponseDataBeforePotential>(json['potential']);
  if (potential != null) {
    upStartTeamPlayerResponseDataBefore.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    upStartTeamPlayerResponseDataBefore.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    upStartTeamPlayerResponseDataBefore.breakThroughGrade = breakThroughGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    upStartTeamPlayerResponseDataBefore.playerId = playerId;
  }
  final UpStartTeamPlayerResponseDataBeforeUpStarBase? upStarBase = jsonConvert
      .convert<UpStartTeamPlayerResponseDataBeforeUpStarBase>(
      json['upStarBase']);
  if (upStarBase != null) {
    upStartTeamPlayerResponseDataBefore.upStarBase = upStarBase;
  }
  return upStartTeamPlayerResponseDataBefore;
}

Map<String, dynamic> $UpStartTeamPlayerResponseDataBeforeToJson(
    UpStartTeamPlayerResponseDataBefore entity) {
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
  data['upStarBase'] = entity.upStarBase.toJson();
  return data;
}

extension UpStartTeamPlayerResponseDataBeforeExtension on UpStartTeamPlayerResponseDataBefore {
  UpStartTeamPlayerResponseDataBefore copyWith({
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
    UpStartTeamPlayerResponseDataBeforePotential? potential,
    bool? bindStatus,
    int? breakThroughGrade,
    int? playerId,
    UpStartTeamPlayerResponseDataBeforeUpStarBase? upStarBase,
  }) {
    return UpStartTeamPlayerResponseDataBefore()
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
      ..playerId = playerId ?? this.playerId
      ..upStarBase = upStarBase ?? this.upStarBase;
  }
}

UpStartTeamPlayerResponseDataBeforePotential $UpStartTeamPlayerResponseDataBeforePotentialFromJson(
    Map<String, dynamic> json) {
  final UpStartTeamPlayerResponseDataBeforePotential upStartTeamPlayerResponseDataBeforePotential = UpStartTeamPlayerResponseDataBeforePotential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    upStartTeamPlayerResponseDataBeforePotential.blk = blk;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    upStartTeamPlayerResponseDataBeforePotential.threePt = threePt;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    upStartTeamPlayerResponseDataBeforePotential.ast = ast;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    upStartTeamPlayerResponseDataBeforePotential.stl = stl;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    upStartTeamPlayerResponseDataBeforePotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    upStartTeamPlayerResponseDataBeforePotential.reb = reb;
  }
  return upStartTeamPlayerResponseDataBeforePotential;
}

Map<String, dynamic> $UpStartTeamPlayerResponseDataBeforePotentialToJson(
    UpStartTeamPlayerResponseDataBeforePotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension UpStartTeamPlayerResponseDataBeforePotentialExtension on UpStartTeamPlayerResponseDataBeforePotential {
  UpStartTeamPlayerResponseDataBeforePotential copyWith({
    int? blk,
    int? threePt,
    int? ast,
    int? stl,
    int? pts,
    int? reb,
  }) {
    return UpStartTeamPlayerResponseDataBeforePotential()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

UpStartTeamPlayerResponseDataBeforeUpStarBase $UpStartTeamPlayerResponseDataBeforeUpStarBaseFromJson(
    Map<String, dynamic> json) {
  final UpStartTeamPlayerResponseDataBeforeUpStarBase upStartTeamPlayerResponseDataBeforeUpStarBase = UpStartTeamPlayerResponseDataBeforeUpStarBase();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    upStartTeamPlayerResponseDataBeforeUpStarBase.blk = blk;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    upStartTeamPlayerResponseDataBeforeUpStarBase.threePt = threePt;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    upStartTeamPlayerResponseDataBeforeUpStarBase.ast = ast;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    upStartTeamPlayerResponseDataBeforeUpStarBase.stl = stl;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    upStartTeamPlayerResponseDataBeforeUpStarBase.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    upStartTeamPlayerResponseDataBeforeUpStarBase.reb = reb;
  }
  return upStartTeamPlayerResponseDataBeforeUpStarBase;
}

Map<String, dynamic> $UpStartTeamPlayerResponseDataBeforeUpStarBaseToJson(
    UpStartTeamPlayerResponseDataBeforeUpStarBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension UpStartTeamPlayerResponseDataBeforeUpStarBaseExtension on UpStartTeamPlayerResponseDataBeforeUpStarBase {
  UpStartTeamPlayerResponseDataBeforeUpStarBase copyWith({
    int? blk,
    int? threePt,
    int? ast,
    int? stl,
    int? pts,
    int? reb,
  }) {
    return UpStartTeamPlayerResponseDataBeforeUpStarBase()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

UpStartTeamPlayerResponseDataAfter $UpStartTeamPlayerResponseDataAfterFromJson(
    Map<String, dynamic> json) {
  final UpStartTeamPlayerResponseDataAfter upStartTeamPlayerResponseDataAfter = UpStartTeamPlayerResponseDataAfter();
  final int? buyPrice = jsonConvert.convert<int>(json['buyPrice']);
  if (buyPrice != null) {
    upStartTeamPlayerResponseDataAfter.buyPrice = buyPrice;
  }
  final int? buyPlayerScore = jsonConvert.convert<int>(json['buyPlayerScore']);
  if (buyPlayerScore != null) {
    upStartTeamPlayerResponseDataAfter.buyPlayerScore = buyPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    upStartTeamPlayerResponseDataAfter.updateTime = updateTime;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    upStartTeamPlayerResponseDataAfter.uuid = uuid;
  }
  final int? gradeExp = jsonConvert.convert<int>(json['gradeExp']);
  if (gradeExp != null) {
    upStartTeamPlayerResponseDataAfter.gradeExp = gradeExp;
  }
  final int? fromType = jsonConvert.convert<int>(json['fromType']);
  if (fromType != null) {
    upStartTeamPlayerResponseDataAfter.fromType = fromType;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    upStartTeamPlayerResponseDataAfter.createTime = createTime;
  }
  final int? playerGrade = jsonConvert.convert<int>(json['playerGrade']);
  if (playerGrade != null) {
    upStartTeamPlayerResponseDataAfter.playerGrade = playerGrade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    upStartTeamPlayerResponseDataAfter.teamId = teamId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    upStartTeamPlayerResponseDataAfter.id = id;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    upStartTeamPlayerResponseDataAfter.position = position;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    upStartTeamPlayerResponseDataAfter.power = power;
  }
  final UpStartTeamPlayerResponseDataAfterPotential? potential = jsonConvert
      .convert<UpStartTeamPlayerResponseDataAfterPotential>(json['potential']);
  if (potential != null) {
    upStartTeamPlayerResponseDataAfter.potential = potential;
  }
  final bool? bindStatus = jsonConvert.convert<bool>(json['bindStatus']);
  if (bindStatus != null) {
    upStartTeamPlayerResponseDataAfter.bindStatus = bindStatus;
  }
  final int? breakThroughGrade = jsonConvert.convert<int>(
      json['breakThroughGrade']);
  if (breakThroughGrade != null) {
    upStartTeamPlayerResponseDataAfter.breakThroughGrade = breakThroughGrade;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    upStartTeamPlayerResponseDataAfter.playerId = playerId;
  }
  final UpStartTeamPlayerResponseDataAfterUpStarBase? upStarBase = jsonConvert
      .convert<UpStartTeamPlayerResponseDataAfterUpStarBase>(
      json['upStarBase']);
  if (upStarBase != null) {
    upStartTeamPlayerResponseDataAfter.upStarBase = upStarBase;
  }
  return upStartTeamPlayerResponseDataAfter;
}

Map<String, dynamic> $UpStartTeamPlayerResponseDataAfterToJson(
    UpStartTeamPlayerResponseDataAfter entity) {
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
  data['upStarBase'] = entity.upStarBase.toJson();
  return data;
}

extension UpStartTeamPlayerResponseDataAfterExtension on UpStartTeamPlayerResponseDataAfter {
  UpStartTeamPlayerResponseDataAfter copyWith({
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
    UpStartTeamPlayerResponseDataAfterPotential? potential,
    bool? bindStatus,
    int? breakThroughGrade,
    int? playerId,
    UpStartTeamPlayerResponseDataAfterUpStarBase? upStarBase,
  }) {
    return UpStartTeamPlayerResponseDataAfter()
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
      ..playerId = playerId ?? this.playerId
      ..upStarBase = upStarBase ?? this.upStarBase;
  }
}

UpStartTeamPlayerResponseDataAfterPotential $UpStartTeamPlayerResponseDataAfterPotentialFromJson(
    Map<String, dynamic> json) {
  final UpStartTeamPlayerResponseDataAfterPotential upStartTeamPlayerResponseDataAfterPotential = UpStartTeamPlayerResponseDataAfterPotential();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    upStartTeamPlayerResponseDataAfterPotential.blk = blk;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    upStartTeamPlayerResponseDataAfterPotential.threePt = threePt;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    upStartTeamPlayerResponseDataAfterPotential.ast = ast;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    upStartTeamPlayerResponseDataAfterPotential.stl = stl;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    upStartTeamPlayerResponseDataAfterPotential.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    upStartTeamPlayerResponseDataAfterPotential.reb = reb;
  }
  return upStartTeamPlayerResponseDataAfterPotential;
}

Map<String, dynamic> $UpStartTeamPlayerResponseDataAfterPotentialToJson(
    UpStartTeamPlayerResponseDataAfterPotential entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension UpStartTeamPlayerResponseDataAfterPotentialExtension on UpStartTeamPlayerResponseDataAfterPotential {
  UpStartTeamPlayerResponseDataAfterPotential copyWith({
    int? blk,
    int? threePt,
    int? ast,
    int? stl,
    int? pts,
    int? reb,
  }) {
    return UpStartTeamPlayerResponseDataAfterPotential()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

UpStartTeamPlayerResponseDataAfterUpStarBase $UpStartTeamPlayerResponseDataAfterUpStarBaseFromJson(
    Map<String, dynamic> json) {
  final UpStartTeamPlayerResponseDataAfterUpStarBase upStartTeamPlayerResponseDataAfterUpStarBase = UpStartTeamPlayerResponseDataAfterUpStarBase();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    upStartTeamPlayerResponseDataAfterUpStarBase.blk = blk;
  }
  final int? threePt = jsonConvert.convert<int>(json['threePt']);
  if (threePt != null) {
    upStartTeamPlayerResponseDataAfterUpStarBase.threePt = threePt;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    upStartTeamPlayerResponseDataAfterUpStarBase.ast = ast;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    upStartTeamPlayerResponseDataAfterUpStarBase.stl = stl;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    upStartTeamPlayerResponseDataAfterUpStarBase.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    upStartTeamPlayerResponseDataAfterUpStarBase.reb = reb;
  }
  return upStartTeamPlayerResponseDataAfterUpStarBase;
}

Map<String, dynamic> $UpStartTeamPlayerResponseDataAfterUpStarBaseToJson(
    UpStartTeamPlayerResponseDataAfterUpStarBase entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['threePt'] = entity.threePt;
  data['ast'] = entity.ast;
  data['stl'] = entity.stl;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension UpStartTeamPlayerResponseDataAfterUpStarBaseExtension on UpStartTeamPlayerResponseDataAfterUpStarBase {
  UpStartTeamPlayerResponseDataAfterUpStarBase copyWith({
    int? blk,
    int? threePt,
    int? ast,
    int? stl,
    int? pts,
    int? reb,
  }) {
    return UpStartTeamPlayerResponseDataAfterUpStarBase()
      ..blk = blk ?? this.blk
      ..threePt = threePt ?? this.threePt
      ..ast = ast ?? this.ast
      ..stl = stl ?? this.stl
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}