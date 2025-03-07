import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/gilr_entity.dart';

GirlEntity $GirlEntityFromJson(Map<String, dynamic> json) {
  final GirlEntity girlEntity = GirlEntity();
  final List<int>? textColor = (json['textColor'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (textColor != null) {
    girlEntity.textColor = textColor;
  }
  final List<int>? backGroundColor = (json['backGroundColor'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (backGroundColor != null) {
    girlEntity.backGroundColor = backGroundColor;
  }
  final int? lightColor = jsonConvert.convert<int>(json['lightColor']);
  if (lightColor != null) {
    girlEntity.lightColor = lightColor;
  }
  final String? girlImg = jsonConvert.convert<String>(json['girlImg']);
  if (girlImg != null) {
    girlEntity.girlImg = girlImg;
  }
  final String? grade = jsonConvert.convert<String>(json['grade']);
  if (grade != null) {
    girlEntity.grade = grade;
  }
  final int? bgColor = jsonConvert.convert<int>(json['bgColor']);
  if (bgColor != null) {
    girlEntity.bgColor = bgColor;
  }
  return girlEntity;
}

Map<String, dynamic> $GirlEntityToJson(GirlEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['textColor'] = entity.textColor;
  data['backGroundColor'] = entity.backGroundColor;
  data['lightColor'] = entity.lightColor;
  data['girlImg'] = entity.girlImg;
  data['grade'] = entity.grade;
  data['bgColor'] = entity.bgColor;
  return data;
}

extension GirlEntityExtension on GirlEntity {
  GirlEntity copyWith({
    List<int>? textColor,
    List<int>? backGroundColor,
    int? lightColor,
    String? girlImg,
    String? grade,
    int? bgColor,
  }) {
    return GirlEntity()
      ..textColor = textColor ?? this.textColor
      ..backGroundColor = backGroundColor ?? this.backGroundColor
      ..lightColor = lightColor ?? this.lightColor
      ..girlImg = girlImg ?? this.girlImg
      ..grade = grade ?? this.grade
      ..bgColor = bgColor ?? this.bgColor;
  }
}