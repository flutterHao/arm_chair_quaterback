import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_num_defined_entity.dart';

StarUpNumDefinedEntity $StarUpNumDefinedEntityFromJson(
    Map<String, dynamic> json) {
  final StarUpNumDefinedEntity starUpNumDefinedEntity = StarUpNumDefinedEntity();
  final List<String>? bonusGameAward = (json['BonusGameAward'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (bonusGameAward != null) {
    starUpNumDefinedEntity.bonusGameAward = bonusGameAward;
  }
  final List<int>? bonusGameWeight = (json['BonusGameWeight'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (bonusGameWeight != null) {
    starUpNumDefinedEntity.bonusGameWeight = bonusGameWeight;
  }
  final double? successRateDecays = jsonConvert.convert<double>(
      json['SuccessRateDecays']);
  if (successRateDecays != null) {
    starUpNumDefinedEntity.successRateDecays = successRateDecays;
  }
  final int? starUpBaseNum = jsonConvert.convert<int>(json['starUpBaseNum']);
  if (starUpBaseNum != null) {
    starUpNumDefinedEntity.starUpBaseNum = starUpBaseNum;
  }
  final int? starUpNum = jsonConvert.convert<int>(json['starUpNum']);
  if (starUpNum != null) {
    starUpNumDefinedEntity.starUpNum = starUpNum;
  }
  return starUpNumDefinedEntity;
}

Map<String, dynamic> $StarUpNumDefinedEntityToJson(
    StarUpNumDefinedEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['BonusGameAward'] = entity.bonusGameAward;
  data['BonusGameWeight'] = entity.bonusGameWeight;
  data['SuccessRateDecays'] = entity.successRateDecays;
  data['starUpBaseNum'] = entity.starUpBaseNum;
  data['starUpNum'] = entity.starUpNum;
  return data;
}

extension StarUpNumDefinedEntityExtension on StarUpNumDefinedEntity {
  StarUpNumDefinedEntity copyWith({
    List<String>? bonusGameAward,
    List<int>? bonusGameWeight,
    double? successRateDecays,
    int? starUpBaseNum,
    int? starUpNum,
  }) {
    return StarUpNumDefinedEntity()
      ..bonusGameAward = bonusGameAward ?? this.bonusGameAward
      ..bonusGameWeight = bonusGameWeight ?? this.bonusGameWeight
      ..successRateDecays = successRateDecays ?? this.successRateDecays
      ..starUpBaseNum = starUpBaseNum ?? this.starUpBaseNum
      ..starUpNum = starUpNum ?? this.starUpNum;
  }
}