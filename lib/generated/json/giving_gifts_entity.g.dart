import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/giving_gifts_entity.dart';

GivingGiftsEntity $GivingGiftsEntityFromJson(Map<String, dynamic> json) {
  final GivingGiftsEntity givingGiftsEntity = GivingGiftsEntity();
  final int? signTime = jsonConvert.convert<int>(json['signTime']);
  if (signTime != null) {
    givingGiftsEntity.signTime = signTime;
  }
  final int? sign = jsonConvert.convert<int>(json['sign']);
  if (sign != null) {
    givingGiftsEntity.sign = sign;
  }
  final int? intimacyLevel = jsonConvert.convert<int>(json['intimacyLevel']);
  if (intimacyLevel != null) {
    givingGiftsEntity.intimacyLevel = intimacyLevel;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    givingGiftsEntity.updateTime = updateTime;
  }
  final int? buffEndTime = jsonConvert.convert<int>(json['buffEndTime']);
  if (buffEndTime != null) {
    givingGiftsEntity.buffEndTime = buffEndTime;
  }
  final int? currentPlotId = jsonConvert.convert<int>(json['currentPlotId']);
  if (currentPlotId != null) {
    givingGiftsEntity.currentPlotId = currentPlotId;
  }
  final int? currentSuit = jsonConvert.convert<int>(json['currentSuit']);
  if (currentSuit != null) {
    givingGiftsEntity.currentSuit = currentSuit;
  }
  final int? charm = jsonConvert.convert<int>(json['charm']);
  if (charm != null) {
    givingGiftsEntity.charm = charm;
  }
  final int? currentChatId = jsonConvert.convert<int>(json['currentChatId']);
  if (currentChatId != null) {
    givingGiftsEntity.currentChatId = currentChatId;
  }
  final int? girlId = jsonConvert.convert<int>(json['girlId']);
  if (girlId != null) {
    givingGiftsEntity.girlId = girlId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    givingGiftsEntity.teamId = teamId;
  }
  final List<dynamic>? suitList = (json['suitList'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (suitList != null) {
    givingGiftsEntity.suitList = suitList;
  }
  final int? exchange = jsonConvert.convert<int>(json['exchange']);
  if (exchange != null) {
    givingGiftsEntity.exchange = exchange;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    givingGiftsEntity.id = id;
  }
  return givingGiftsEntity;
}

Map<String, dynamic> $GivingGiftsEntityToJson(GivingGiftsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['signTime'] = entity.signTime;
  data['sign'] = entity.sign;
  data['intimacyLevel'] = entity.intimacyLevel;
  data['updateTime'] = entity.updateTime;
  data['buffEndTime'] = entity.buffEndTime;
  data['currentPlotId'] = entity.currentPlotId;
  data['currentSuit'] = entity.currentSuit;
  data['charm'] = entity.charm;
  data['currentChatId'] = entity.currentChatId;
  data['girlId'] = entity.girlId;
  data['teamId'] = entity.teamId;
  data['suitList'] = entity.suitList;
  data['exchange'] = entity.exchange;
  data['id'] = entity.id;
  return data;
}

extension GivingGiftsEntityExtension on GivingGiftsEntity {
  GivingGiftsEntity copyWith({
    int? signTime,
    int? sign,
    int? intimacyLevel,
    int? updateTime,
    int? buffEndTime,
    int? currentPlotId,
    int? currentSuit,
    int? charm,
    int? currentChatId,
    int? girlId,
    int? teamId,
    List<dynamic>? suitList,
    int? exchange,
    int? id,
  }) {
    return GivingGiftsEntity()
      ..signTime = signTime ?? this.signTime
      ..sign = sign ?? this.sign
      ..intimacyLevel = intimacyLevel ?? this.intimacyLevel
      ..updateTime = updateTime ?? this.updateTime
      ..buffEndTime = buffEndTime ?? this.buffEndTime
      ..currentPlotId = currentPlotId ?? this.currentPlotId
      ..currentSuit = currentSuit ?? this.currentSuit
      ..charm = charm ?? this.charm
      ..currentChatId = currentChatId ?? this.currentChatId
      ..girlId = girlId ?? this.girlId
      ..teamId = teamId ?? this.teamId
      ..suitList = suitList ?? this.suitList
      ..exchange = exchange ?? this.exchange
      ..id = id ?? this.id;
  }
}