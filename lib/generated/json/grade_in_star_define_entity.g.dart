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
  final String? gradeId = jsonConvert.convert<String>(json['gradeId']);
  if (gradeId != null) {
    gradeInStarDefineEntity.gradeId = gradeId;
  }
  final double? gradeWeight = jsonConvert.convert<double>(json['gradeWeight']);
  if (gradeWeight != null) {
    gradeInStarDefineEntity.gradeWeight = gradeWeight;
  }
  final String? playerGrade = jsonConvert.convert<String>(json['playerGrade']);
  if (playerGrade != null) {
    gradeInStarDefineEntity.playerGrade = playerGrade;
  }
  final List<String>? starPotentialNum = (json['starPotentialNum'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (starPotentialNum != null) {
    gradeInStarDefineEntity.starPotentialNum = starPotentialNum;
  }
  final List<String>? starUpBase = (json['starUpBase'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (starUpBase != null) {
    gradeInStarDefineEntity.starUpBase = starUpBase;
  }
  final List<String>? starUpGradeCost = (json['starUpGradeCost'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (starUpGradeCost != null) {
    gradeInStarDefineEntity.starUpGradeCost = starUpGradeCost;
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
  return data;
}

extension GradeInStarDefineEntityExtension on GradeInStarDefineEntity {
  GradeInStarDefineEntity copyWith({
    List<double>? gradeAddWeight,
    String? gradeId,
    double? gradeWeight,
    String? playerGrade,
    List<String>? starPotentialNum,
    List<String>? starUpBase,
    List<String>? starUpGradeCost,
  }) {
    return GradeInStarDefineEntity()
      ..gradeAddWeight = gradeAddWeight ?? this.gradeAddWeight
      ..gradeId = gradeId ?? this.gradeId
      ..gradeWeight = gradeWeight ?? this.gradeWeight
      ..playerGrade = playerGrade ?? this.playerGrade
      ..starPotentialNum = starPotentialNum ?? this.starPotentialNum
      ..starUpBase = starUpBase ?? this.starUpBase
      ..starUpGradeCost = starUpGradeCost ?? this.starUpGradeCost;
  }
}