import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_done_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_up_star_vo_entity.dart';


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
  final TeamPlayerUpStarVoEntity? teamPlayerVO = jsonConvert.convert<
      TeamPlayerUpStarVoEntity>(json['teamPlayerVO']);
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
    TeamPlayerUpStarVoEntity? teamPlayerVO,
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