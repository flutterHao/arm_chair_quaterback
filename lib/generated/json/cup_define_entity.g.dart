import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/cup_define_entity.dart';

CupDefineEntity $CupDefineEntityFromJson(Map<String, dynamic> json) {
  final CupDefineEntity cupDefineEntity = CupDefineEntity();
  final String? backUp = jsonConvert.convert<String>(json['backUp']);
  if (backUp != null) {
    cupDefineEntity.backUp = backUp;
  }
  final double? cupDailyReward = jsonConvert.convert<double>(
      json['cupDailyReward']);
  if (cupDailyReward != null) {
    cupDefineEntity.cupDailyReward = cupDailyReward;
  }
  final List<double>? cupNum = (json['cupNum'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (cupNum != null) {
    cupDefineEntity.cupNum = cupNum;
  }
  final int? cupNumId = jsonConvert.convert<int>(json['cupNumId']);
  if (cupNumId != null) {
    cupDefineEntity.cupNumId = cupNumId;
  }
  final int? cupPicId = jsonConvert.convert<int>(json['cupPicId']);
  if (cupPicId != null) {
    cupDefineEntity.cupPicId = cupPicId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    cupDefineEntity.desc = desc;
  }
  final double? loseCup = jsonConvert.convert<double>(json['loseCup']);
  if (loseCup != null) {
    cupDefineEntity.loseCup = loseCup;
  }
  final List<double>? loserMoney = (json['loserMoney'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (loserMoney != null) {
    cupDefineEntity.loserMoney = loserMoney;
  }
  final double? winCup = jsonConvert.convert<double>(json['winCup']);
  if (winCup != null) {
    cupDefineEntity.winCup = winCup;
  }
  final List<double>? winMoney = (json['winMoney'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (winMoney != null) {
    cupDefineEntity.winMoney = winMoney;
  }
  return cupDefineEntity;
}

Map<String, dynamic> $CupDefineEntityToJson(CupDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['backUp'] = entity.backUp;
  data['cupDailyReward'] = entity.cupDailyReward;
  data['cupNum'] = entity.cupNum;
  data['cupNumId'] = entity.cupNumId;
  data['cupPicId'] = entity.cupPicId;
  data['desc'] = entity.desc;
  data['loseCup'] = entity.loseCup;
  data['loserMoney'] = entity.loserMoney;
  data['winCup'] = entity.winCup;
  data['winMoney'] = entity.winMoney;
  return data;
}

extension CupDefineEntityExtension on CupDefineEntity {
  CupDefineEntity copyWith({
    String? backUp,
    double? cupDailyReward,
    List<double>? cupNum,
    int? cupNumId,
    int? cupPicId,
    String? desc,
    double? loseCup,
    List<double>? loserMoney,
    double? winCup,
    List<double>? winMoney,
  }) {
    return CupDefineEntity()
      ..backUp = backUp ?? this.backUp
      ..cupDailyReward = cupDailyReward ?? this.cupDailyReward
      ..cupNum = cupNum ?? this.cupNum
      ..cupNumId = cupNumId ?? this.cupNumId
      ..cupPicId = cupPicId ?? this.cupPicId
      ..desc = desc ?? this.desc
      ..loseCup = loseCup ?? this.loseCup
      ..loserMoney = loserMoney ?? this.loserMoney
      ..winCup = winCup ?? this.winCup
      ..winMoney = winMoney ?? this.winMoney;
  }
}