import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/cup_define_entity.dart';

CupDefineEntity $CupDefineEntityFromJson(Map<String, dynamic> json) {
  final CupDefineEntity cupDefineEntity = CupDefineEntity();
  final String? backUp = jsonConvert.convert<String>(json['backUp']);
  if (backUp != null) {
    cupDefineEntity.backUp = backUp;
  }
  final int? cupDailyReward = jsonConvert.convert<int>(json['cupDailyReward']);
  if (cupDailyReward != null) {
    cupDefineEntity.cupDailyReward = cupDailyReward;
  }
  final List<int>? cupNum = (json['cupNum'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
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
  final String? cupReward = jsonConvert.convert<String>(json['cupReward']);
  if (cupReward != null) {
    cupDefineEntity.cupReward = cupReward;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    cupDefineEntity.desc = desc;
  }
  final int? loseCup = jsonConvert.convert<int>(json['loseCup']);
  if (loseCup != null) {
    cupDefineEntity.loseCup = loseCup;
  }
  final List<int>? loserMoney = (json['loserMoney'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (loserMoney != null) {
    cupDefineEntity.loserMoney = loserMoney;
  }
  final int? substituteSum = jsonConvert.convert<int>(json['substituteSum']);
  if (substituteSum != null) {
    cupDefineEntity.substituteSum = substituteSum;
  }
  final int? winCup = jsonConvert.convert<int>(json['winCup']);
  if (winCup != null) {
    cupDefineEntity.winCup = winCup;
  }
  final List<int>? winMoney = (json['winMoney'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
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
  data['cupReward'] = entity.cupReward;
  data['desc'] = entity.desc;
  data['loseCup'] = entity.loseCup;
  data['loserMoney'] = entity.loserMoney;
  data['substituteSum'] = entity.substituteSum;
  data['winCup'] = entity.winCup;
  data['winMoney'] = entity.winMoney;
  return data;
}

extension CupDefineEntityExtension on CupDefineEntity {
  CupDefineEntity copyWith({
    String? backUp,
    int? cupDailyReward,
    List<int>? cupNum,
    int? cupNumId,
    int? cupPicId,
    String? cupReward,
    String? desc,
    int? loseCup,
    List<int>? loserMoney,
    int? substituteSum,
    int? winCup,
    List<int>? winMoney,
  }) {
    return CupDefineEntity()
      ..backUp = backUp ?? this.backUp
      ..cupDailyReward = cupDailyReward ?? this.cupDailyReward
      ..cupNum = cupNum ?? this.cupNum
      ..cupNumId = cupNumId ?? this.cupNumId
      ..cupPicId = cupPicId ?? this.cupPicId
      ..cupReward = cupReward ?? this.cupReward
      ..desc = desc ?? this.desc
      ..loseCup = loseCup ?? this.loseCup
      ..loserMoney = loserMoney ?? this.loserMoney
      ..substituteSum = substituteSum ?? this.substituteSum
      ..winCup = winCup ?? this.winCup
      ..winMoney = winMoney ?? this.winMoney;
  }
}