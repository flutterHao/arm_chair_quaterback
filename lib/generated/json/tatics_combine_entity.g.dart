import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/tatics_combine_entity.dart';

TaticsCombineEntity $TaticsCombineEntityFromJson(Map<String, dynamic> json) {
  final TaticsCombineEntity taticsCombineEntity = TaticsCombineEntity();
  final int? suit = jsonConvert.convert<int>(json['suit']);
  if (suit != null) {
    taticsCombineEntity.suit = suit;
  }
  final List<double>? suitAdd = (json['suitAdd'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (suitAdd != null) {
    taticsCombineEntity.suitAdd = suitAdd;
  }
  final String? taticsuit = jsonConvert.convert<String>(json['taticsuit']);
  if (taticsuit != null) {
    taticsCombineEntity.taticsuit = taticsuit;
  }
  return taticsCombineEntity;
}

Map<String, dynamic> $TaticsCombineEntityToJson(TaticsCombineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['suit'] = entity.suit;
  data['suitAdd'] = entity.suitAdd;
  data['taticsuit'] = entity.taticsuit;
  return data;
}

extension TaticsCombineEntityExtension on TaticsCombineEntity {
  TaticsCombineEntity copyWith({
    int? suit,
    List<double>? suitAdd,
    String? taticsuit,
  }) {
    return TaticsCombineEntity()
      ..suit = suit ?? this.suit
      ..suitAdd = suitAdd ?? this.suitAdd
      ..taticsuit = taticsuit ?? this.taticsuit;
  }
}