import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/tactic_grade_entity.dart';

TacticGradeEntity $TacticGradeEntityFromJson(Map<String, dynamic> json) {
  final TacticGradeEntity tacticGradeEntity = TacticGradeEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    tacticGradeEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    tacticGradeEntity.name = name;
  }
  final List<TacticGradeCards>? cards = (json['cards'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TacticGradeCards>(e) as TacticGradeCards)
      .toList();
  if (cards != null) {
    tacticGradeEntity.cards = cards;
  }
  final int? percent = jsonConvert.convert<int>(json['percent']);
  if (percent != null) {
    tacticGradeEntity.percent = percent;
  }
  return tacticGradeEntity;
}

Map<String, dynamic> $TacticGradeEntityToJson(TacticGradeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['cards'] = entity.cards.map((v) => v.toJson()).toList();
  data['percent'] = entity.percent;
  return data;
}

extension TacticGradeEntityExtension on TacticGradeEntity {
  TacticGradeEntity copyWith({
    int? id,
    String? name,
    List<TacticGradeCards>? cards,
    int? percent,
  }) {
    return TacticGradeEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..cards = cards ?? this.cards
      ..percent = percent ?? this.percent;
  }
}

TacticGradeCards $TacticGradeCardsFromJson(Map<String, dynamic> json) {
  final TacticGradeCards tacticGradeCards = TacticGradeCards();
  final int? color = jsonConvert.convert<int>(json['color']);
  if (color != null) {
    tacticGradeCards.color = color;
  }
  final int? value = jsonConvert.convert<int>(json['value']);
  if (value != null) {
    tacticGradeCards.value = value;
  }
  return tacticGradeCards;
}

Map<String, dynamic> $TacticGradeCardsToJson(TacticGradeCards entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['color'] = entity.color;
  data['value'] = entity.value;
  return data;
}

extension TacticGradeCardsExtension on TacticGradeCards {
  TacticGradeCards copyWith({
    int? color,
    int? value,
  }) {
    return TacticGradeCards()
      ..color = color ?? this.color
      ..value = value ?? this.value;
  }
}