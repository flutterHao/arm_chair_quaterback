import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/grade_in_star_define_entity.dart';

GradeInStarDefineEntity $GradeInStarDefineEntityFromJson(
    Map<String, dynamic> json) {
  final GradeInStarDefineEntity gradeInStarDefineEntity = GradeInStarDefineEntity();
  final List<double>? gradeAddWeight = (json['gradeAddWeight'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (gradeAddWeight != null) {
    gradeInStarDefineEntity.gradeAddWeight = gradeAddWeight;
  }
  final int? gradeId = jsonConvert.convert<int>(json['gradeId']);
  if (gradeId != null) {
    gradeInStarDefineEntity.gradeId = gradeId;
  }
  final List<double>? gradeWeight = (json['gradeWeight'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<double>(e) as double)
      .toList();
  if (gradeWeight != null) {
    gradeInStarDefineEntity.gradeWeight = gradeWeight;
  }
  final String? playerGrade = jsonConvert.convert<String>(json['playerGrade']);
  if (playerGrade != null) {
    gradeInStarDefineEntity.playerGrade = playerGrade;
  }
  final List<double>? starPotentialNum = (json['starPotentialNum'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (starPotentialNum != null) {
    gradeInStarDefineEntity.starPotentialNum = starPotentialNum;
  }
  final List<double>? starUpBase = (json['starUpBase'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (starUpBase != null) {
    gradeInStarDefineEntity.starUpBase = starUpBase;
  }
  final List<double>? starUpGradeCost = (json['starUpGradeCost'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (starUpGradeCost != null) {
    gradeInStarDefineEntity.starUpGradeCost = starUpGradeCost;
  }
  final double? zeroStarRatio = jsonConvert.convert<double>(
      json['zeroStarRatio']);
  if (zeroStarRatio != null) {
    gradeInStarDefineEntity.zeroStarRatio = zeroStarRatio;
  }
  final double? maxStarRatio = jsonConvert.convert<double>(
      json['maxStarRatio']);
  if (maxStarRatio != null) {
    gradeInStarDefineEntity.maxStarRatio = maxStarRatio;
  }
  return gradeInStarDefineEntity;
}

Map<String, dynamic> $GradeInStarDefineEntityToJson(
    GradeInStarDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gradeAddWeight'] = entity.gradeAddWeight;
  data['gradeId'] = entity.gradeId;
  data['gradeWeight'] = entity.gradeWeight;
  data['playerGrade'] = entity.playerGrade;
  data['starPotentialNum'] = entity.starPotentialNum;
  data['starUpBase'] = entity.starUpBase;
  data['starUpGradeCost'] = entity.starUpGradeCost;
  data['zeroStarRatio'] = entity.zeroStarRatio;
  data['maxStarRatio'] = entity.maxStarRatio;
  return data;
}

extension GradeInStarDefineEntityExtension on GradeInStarDefineEntity {
  GradeInStarDefineEntity copyWith({
    List<double>? gradeAddWeight,
    int? gradeId,
    List<double>? gradeWeight,
    String? playerGrade,
    List<double>? starPotentialNum,
    List<double>? starUpBase,
    List<double>? starUpGradeCost,
    double? zeroStarRatio,
    double? maxStarRatio,
  }) {
    return GradeInStarDefineEntity()
      ..gradeAddWeight = gradeAddWeight ?? this.gradeAddWeight
      ..gradeId = gradeId ?? this.gradeId
      ..gradeWeight = gradeWeight ?? this.gradeWeight
      ..playerGrade = playerGrade ?? this.playerGrade
      ..starPotentialNum = starPotentialNum ?? this.starPotentialNum
      ..starUpBase = starUpBase ?? this.starUpBase
      ..starUpGradeCost = starUpGradeCost ?? this.starUpGradeCost
      ..zeroStarRatio = zeroStarRatio ?? this.zeroStarRatio
      ..maxStarRatio = maxStarRatio ?? this.maxStarRatio;
  }
}