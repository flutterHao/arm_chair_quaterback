import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/player_book_exp_rule_entity.dart';

PlayerBookExpRuleEntity $PlayerBookExpRuleEntityFromJson(
    Map<String, dynamic> json) {
  final PlayerBookExpRuleEntity playerBookExpRuleEntity = PlayerBookExpRuleEntity();
  final int? addSalaryCap = jsonConvert.convert<int>(json['addSalaryCap']);
  if (addSalaryCap != null) {
    playerBookExpRuleEntity.addSalaryCap = addSalaryCap;
  }
  final int? bookId = jsonConvert.convert<int>(json['bookId']);
  if (bookId != null) {
    playerBookExpRuleEntity.bookId = bookId;
  }
  final int? currExp = jsonConvert.convert<int>(json['currExp']);
  if (currExp != null) {
    playerBookExpRuleEntity.currExp = currExp;
  }
  final int? grade = jsonConvert.convert<int>(json['grade']);
  if (grade != null) {
    playerBookExpRuleEntity.grade = grade;
  }
  final int? totalExp = jsonConvert.convert<int>(json['totalExp']);
  if (totalExp != null) {
    playerBookExpRuleEntity.totalExp = totalExp;
  }
  return playerBookExpRuleEntity;
}

Map<String, dynamic> $PlayerBookExpRuleEntityToJson(
    PlayerBookExpRuleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addSalaryCap'] = entity.addSalaryCap;
  data['bookId'] = entity.bookId;
  data['currExp'] = entity.currExp;
  data['grade'] = entity.grade;
  data['totalExp'] = entity.totalExp;
  return data;
}

extension PlayerBookExpRuleEntityExtension on PlayerBookExpRuleEntity {
  PlayerBookExpRuleEntity copyWith({
    int? addSalaryCap,
    int? bookId,
    int? currExp,
    int? grade,
    int? totalExp,
  }) {
    return PlayerBookExpRuleEntity()
      ..addSalaryCap = addSalaryCap ?? this.addSalaryCap
      ..bookId = bookId ?? this.bookId
      ..currExp = currExp ?? this.currExp
      ..grade = grade ?? this.grade
      ..totalExp = totalExp ?? this.totalExp;
  }
}