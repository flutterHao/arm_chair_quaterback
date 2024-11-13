import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';

CardPackInfoEntity $CardPackInfoEntityFromJson(Map<String, dynamic> json) {
  final CardPackInfoEntity cardPackInfoEntity = CardPackInfoEntity();
  final int? rankIndex = jsonConvert.convert<int>(json['rankIndex']);
  if (rankIndex != null) {
    cardPackInfoEntity.rankIndex = rankIndex;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    cardPackInfoEntity.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    cardPackInfoEntity.teamId = teamId;
  }
  final int? cardPackGrade = jsonConvert.convert<int>(json['cardPackGrade']);
  if (cardPackGrade != null) {
    cardPackInfoEntity.cardPackGrade = cardPackGrade;
  }
  final int? freeGiftTime = jsonConvert.convert<int>(json['freeGiftTime']);
  if (freeGiftTime != null) {
    cardPackInfoEntity.freeGiftTime = freeGiftTime;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    cardPackInfoEntity.updateTime = updateTime;
  }
  final List<CardPackInfoCard>? card = (json['card'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CardPackInfoCard>(e) as CardPackInfoCard)
      .toList();
  if (card != null) {
    cardPackInfoEntity.card = card;
  }
  return cardPackInfoEntity;
}

Map<String, dynamic> $CardPackInfoEntityToJson(CardPackInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rankIndex'] = entity.rankIndex;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['cardPackGrade'] = entity.cardPackGrade;
  data['freeGiftTime'] = entity.freeGiftTime;
  data['updateTime'] = entity.updateTime;
  data['card'] = entity.card.map((v) => v.toJson()).toList();
  return data;
}

extension CardPackInfoEntityExtension on CardPackInfoEntity {
  CardPackInfoEntity copyWith({
    int? rankIndex,
    int? createTime,
    int? teamId,
    int? cardPackGrade,
    int? freeGiftTime,
    int? updateTime,
    List<CardPackInfoCard>? card,
  }) {
    return CardPackInfoEntity()
      ..rankIndex = rankIndex ?? this.rankIndex
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..cardPackGrade = cardPackGrade ?? this.cardPackGrade
      ..freeGiftTime = freeGiftTime ?? this.freeGiftTime
      ..updateTime = updateTime ?? this.updateTime
      ..card = card ?? this.card;
  }
}

CardPackInfoCard $CardPackInfoCardFromJson(Map<String, dynamic> json) {
  final CardPackInfoCard cardPackInfoCard = CardPackInfoCard();
  final int? cardId = jsonConvert.convert<int>(json['cardId']);
  if (cardId != null) {
    cardPackInfoCard.cardId = cardId;
  }
  final int? openTime = jsonConvert.convert<int>(json['openTime']);
  if (openTime != null) {
    cardPackInfoCard.openTime = openTime;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    cardPackInfoCard.status = status;
  }
  return cardPackInfoCard;
}

Map<String, dynamic> $CardPackInfoCardToJson(CardPackInfoCard entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cardId'] = entity.cardId;
  data['openTime'] = entity.openTime;
  data['status'] = entity.status;
  return data;
}

extension CardPackInfoCardExtension on CardPackInfoCard {
  CardPackInfoCard copyWith({
    int? cardId,
    int? openTime,
    int? status,
  }) {
    return CardPackInfoCard()
      ..cardId = cardId ?? this.cardId
      ..openTime = openTime ?? this.openTime
      ..status = status ?? this.status;
  }
}