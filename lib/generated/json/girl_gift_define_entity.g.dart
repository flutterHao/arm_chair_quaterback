import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/girl_gift_define_entity.dart';

GirlGiftDefineEntity $GirlGiftDefineEntityFromJson(Map<String, dynamic> json) {
  final GirlGiftDefineEntity girlGiftDefineEntity = GirlGiftDefineEntity();
  final List<String>? addIntimacy = (json['addIntimacy'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (addIntimacy != null) {
    girlGiftDefineEntity.addIntimacy = addIntimacy;
  }
  final List<String>? addRate = (json['addRate'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (addRate != null) {
    girlGiftDefineEntity.addRate = addRate;
  }
  final String? cost = jsonConvert.convert<String>(json['cost']);
  if (cost != null) {
    girlGiftDefineEntity.cost = cost;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    girlGiftDefineEntity.desc = desc;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    girlGiftDefineEntity.id = id;
  }
  final String? girlDesc = jsonConvert.convert<String>(json['girlDesc']);
  if (girlDesc != null) {
    girlGiftDefineEntity.girlDesc = girlDesc;
  }
  return girlGiftDefineEntity;
}

Map<String, dynamic> $GirlGiftDefineEntityToJson(GirlGiftDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['addIntimacy'] = entity.addIntimacy;
  data['addRate'] = entity.addRate;
  data['cost'] = entity.cost;
  data['desc'] = entity.desc;
  data['id'] = entity.id;
  data['girlDesc'] = entity.girlDesc;
  return data;
}

extension GirlGiftDefineEntityExtension on GirlGiftDefineEntity {
  GirlGiftDefineEntity copyWith({
    List<String>? addIntimacy,
    List<String>? addRate,
    String? cost,
    String? desc,
    String? id,
    String? girlDesc,
  }) {
    return GirlGiftDefineEntity()
      ..addIntimacy = addIntimacy ?? this.addIntimacy
      ..addRate = addRate ?? this.addRate
      ..cost = cost ?? this.cost
      ..desc = desc ?? this.desc
      ..id = id ?? this.id
      ..girlDesc = girlDesc ?? this.girlDesc;
  }
}