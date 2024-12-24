import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/grade_in_star_define_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/grade_in_star_define_entity.g.dart';

@JsonSerializable()
class GradeInStarDefineEntity {
  late List<double> gradeAddWeight;
  late int gradeId;
  late List<double> gradeWeight;
  late String playerGrade;
  late List<double> starPotentialNum;
  late List<double> starUpBase;
  late List<double> starUpGradeCost;

  GradeInStarDefineEntity();

  factory GradeInStarDefineEntity.fromJson(Map<String, dynamic> json) =>
      $GradeInStarDefineEntityFromJson(json);

  Map<String, dynamic> toJson() => $GradeInStarDefineEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
