import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/config/card_pack_define_entity.dart';

CardPackDefineEntity $CardPackDefineEntityFromJson(Map<String, dynamic> json) {
  final CardPackDefineEntity cardPackDefineEntity = CardPackDefineEntity();
  final List<int>? cardMoneyRange = (json['cardMoneyRange'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (cardMoneyRange != null) {
    cardPackDefineEntity.cardMoneyRange = cardMoneyRange;
  }
  final int? cardPackID = jsonConvert.convert<int>(json['cardPackID']);
  if (cardPackID != null) {
    cardPackDefineEntity.cardPackID = cardPackID;
  }
  final int? cardPackOpenNow = jsonConvert.convert<int>(
      json['cardPackOpenNow']);
  if (cardPackOpenNow != null) {
    cardPackDefineEntity.cardPackOpenNow = cardPackOpenNow;
  }
  final int? cardPackOpenTime = jsonConvert.convert<int>(
      json['cardPackOpenTime']);
  if (cardPackOpenTime != null) {
    cardPackDefineEntity.cardPackOpenTime = cardPackOpenTime;
  }
  final int? cardPackPlayerNum = jsonConvert.convert<int>(
      json['cardPackPlayerNum']);
  if (cardPackPlayerNum != null) {
    cardPackDefineEntity.cardPackPlayerNum = cardPackPlayerNum;
  }
  final int? cardPackSelectNum = jsonConvert.convert<int>(
      json['cardPackSelectNum']);
  if (cardPackSelectNum != null) {
    cardPackDefineEntity.cardPackSelectNum = cardPackSelectNum;
  }
  final List<int>? cardPackWeight = (json['cardPackWeight'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (cardPackWeight != null) {
    cardPackDefineEntity.cardPackWeight = cardPackWeight;
  }
  final List<int>? cardPlayerNum = (json['cardPlayerNum'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (cardPlayerNum != null) {
    cardPackDefineEntity.cardPlayerNum = cardPlayerNum;
  }
  final List<int>? cupConWeight = (json['cupConWeight'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (cupConWeight != null) {
    cardPackDefineEntity.cupConWeight = cupConWeight;
  }
  final int? hideOpenNow = jsonConvert.convert<int>(json['hideOpenNow']);
  if (hideOpenNow != null) {
    cardPackDefineEntity.hideOpenNow = hideOpenNow;
  }
  final String? cardPackIcon = jsonConvert.convert<String>(
      json['cardPackIcon']);
  if (cardPackIcon != null) {
    cardPackDefineEntity.cardPackIcon = cardPackIcon;
  }
  final String? cardPackName = jsonConvert.convert<String>(
      json['cardPackName']);
  if (cardPackName != null) {
    cardPackDefineEntity.cardPackName = cardPackName;
  }
  final String? cardPackDesc = jsonConvert.convert<String>(
      json['cardPackDesc']);
  if (cardPackDesc != null) {
    cardPackDefineEntity.cardPackDesc = cardPackDesc;
  }
  return cardPackDefineEntity;
}

Map<String, dynamic> $CardPackDefineEntityToJson(CardPackDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cardMoneyRange'] = entity.cardMoneyRange;
  data['cardPackID'] = entity.cardPackID;
  data['cardPackOpenNow'] = entity.cardPackOpenNow;
  data['cardPackOpenTime'] = entity.cardPackOpenTime;
  data['cardPackPlayerNum'] = entity.cardPackPlayerNum;
  data['cardPackSelectNum'] = entity.cardPackSelectNum;
  data['cardPackWeight'] = entity.cardPackWeight;
  data['cardPlayerNum'] = entity.cardPlayerNum;
  data['cupConWeight'] = entity.cupConWeight;
  data['hideOpenNow'] = entity.hideOpenNow;
  data['cardPackIcon'] = entity.cardPackIcon;
  data['cardPackName'] = entity.cardPackName;
  data['cardPackDesc'] = entity.cardPackDesc;
  return data;
}

extension CardPackDefineEntityExtension on CardPackDefineEntity {
  CardPackDefineEntity copyWith({
    List<int>? cardMoneyRange,
    int? cardPackID,
    int? cardPackOpenNow,
    int? cardPackOpenTime,
    int? cardPackPlayerNum,
    int? cardPackSelectNum,
    List<int>? cardPackWeight,
    List<int>? cardPlayerNum,
    List<int>? cupConWeight,
    int? hideOpenNow,
    String? cardPackIcon,
    String? cardPackName,
    String? cardPackDesc,
  }) {
    return CardPackDefineEntity()
      ..cardMoneyRange = cardMoneyRange ?? this.cardMoneyRange
      ..cardPackID = cardPackID ?? this.cardPackID
      ..cardPackOpenNow = cardPackOpenNow ?? this.cardPackOpenNow
      ..cardPackOpenTime = cardPackOpenTime ?? this.cardPackOpenTime
      ..cardPackPlayerNum = cardPackPlayerNum ?? this.cardPackPlayerNum
      ..cardPackSelectNum = cardPackSelectNum ?? this.cardPackSelectNum
      ..cardPackWeight = cardPackWeight ?? this.cardPackWeight
      ..cardPlayerNum = cardPlayerNum ?? this.cardPlayerNum
      ..cupConWeight = cupConWeight ?? this.cupConWeight
      ..hideOpenNow = hideOpenNow ?? this.hideOpenNow
      ..cardPackIcon = cardPackIcon ?? this.cardPackIcon
      ..cardPackName = cardPackName ?? this.cardPackName
      ..cardPackDesc = cardPackDesc ?? this.cardPackDesc;
  }
}