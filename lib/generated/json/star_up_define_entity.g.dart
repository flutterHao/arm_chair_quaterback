import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/star_up_define_entity.dart';

StarUpDefineEntity $StarUpDefineEntityFromJson(Map<String, dynamic> json) {
  final StarUpDefineEntity starUpDefineEntity = StarUpDefineEntity();
  final double? starUpRange = jsonConvert.convert<double>(json['starUpRange']);
  if (starUpRange != null) {
    starUpDefineEntity.starUpRange = starUpRange;
  }
  final String? potantialRang = jsonConvert.convert<String>(
      json['potantialRang']);
  if (potantialRang != null) {
    starUpDefineEntity.potantialRang = potantialRang;
  }
  final int? starUp = jsonConvert.convert<int>(json['starUp']);
  if (starUp != null) {
    starUpDefineEntity.starUp = starUp;
  }
  final double? starUpSell = jsonConvert.convert<double>(json['starUpSell']);
  if (starUpSell != null) {
    starUpDefineEntity.starUpSell = starUpSell;
  }
  final double? starUpline = jsonConvert.convert<double>(json['starUpline']);
  if (starUpline != null) {
    starUpDefineEntity.starUpline = starUpline;
  }
  final double? starRatingCoefficient = jsonConvert.convert<double>(
      json['starRatingCoefficient']);
  if (starRatingCoefficient != null) {
    starUpDefineEntity.starRatingCoefficient = starRatingCoefficient;
  }
  final int? starPlayerNum = jsonConvert.convert<int>(json['starPlayerNum']);
  if (starPlayerNum != null) {
    starUpDefineEntity.starPlayerNum = starPlayerNum;
  }
  return starUpDefineEntity;
}

Map<String, dynamic> $StarUpDefineEntityToJson(StarUpDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['starUpRange'] = entity.starUpRange;
  data['potantialRang'] = entity.potantialRang;
  data['starUp'] = entity.starUp;
  data['starUpSell'] = entity.starUpSell;
  data['starUpline'] = entity.starUpline;
  data['starRatingCoefficient'] = entity.starRatingCoefficient;
  data['starPlayerNum'] = entity.starPlayerNum;
  return data;
}

extension StarUpDefineEntityExtension on StarUpDefineEntity {
  StarUpDefineEntity copyWith({
    double? starUpRange,
    String? potantialRang,
    int? starUp,
    double? starUpSell,
    double? starUpline,
    double? starRatingCoefficient,
    int? starPlayerNum,
  }) {
    return StarUpDefineEntity()
      ..starUpRange = starUpRange ?? this.starUpRange
      ..potantialRang = potantialRang ?? this.potantialRang
      ..starUp = starUp ?? this.starUp
      ..starUpSell = starUpSell ?? this.starUpSell
      ..starUpline = starUpline ?? this.starUpline
      ..starRatingCoefficient = starRatingCoefficient ??
          this.starRatingCoefficient
      ..starPlayerNum = starPlayerNum ?? this.starPlayerNum;
  }
}