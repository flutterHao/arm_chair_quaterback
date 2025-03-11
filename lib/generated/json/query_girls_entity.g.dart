import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/query_girls_entity.dart';

QueryGirlsEntity $QueryGirlsEntityFromJson(Map<String, dynamic> json) {
  final QueryGirlsEntity queryGirlsEntity = QueryGirlsEntity();
  final int? currentPlotId = jsonConvert.convert<int>(json['currentPlotId']);
  if (currentPlotId != null) {
    queryGirlsEntity.currentPlotId = currentPlotId;
  }
  final int? currentSuit = jsonConvert.convert<int>(json['currentSuit']);
  if (currentSuit != null) {
    queryGirlsEntity.currentSuit = currentSuit;
  }
  final int? charm = jsonConvert.convert<int>(json['charm']);
  if (charm != null) {
    queryGirlsEntity.charm = charm;
  }
  final int? currentChatId = jsonConvert.convert<int>(json['currentChatId']);
  if (currentChatId != null) {
    queryGirlsEntity.currentChatId = currentChatId;
  }
  final int? signTime = jsonConvert.convert<int>(json['signTime']);
  if (signTime != null) {
    queryGirlsEntity.signTime = signTime;
  }
  final int? girlId = jsonConvert.convert<int>(json['girlId']);
  if (girlId != null) {
    queryGirlsEntity.girlId = girlId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    queryGirlsEntity.teamId = teamId;
  }
  final int? sign = jsonConvert.convert<int>(json['sign']);
  if (sign != null) {
    queryGirlsEntity.sign = sign;
  }
  final List<dynamic>? suitList = (json['suitList'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (suitList != null) {
    queryGirlsEntity.suitList = suitList;
  }
  final int? exchange = jsonConvert.convert<int>(json['exchange']);
  if (exchange != null) {
    queryGirlsEntity.exchange = exchange;
  }
  final int? intimacyLevel = jsonConvert.convert<int>(json['intimacyLevel']);
  if (intimacyLevel != null) {
    queryGirlsEntity.intimacyLevel = intimacyLevel;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    queryGirlsEntity.id = id;
  }
  return queryGirlsEntity;
}

Map<String, dynamic> $QueryGirlsEntityToJson(QueryGirlsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['currentPlotId'] = entity.currentPlotId;
  data['currentSuit'] = entity.currentSuit;
  data['charm'] = entity.charm;
  data['currentChatId'] = entity.currentChatId;
  data['signTime'] = entity.signTime;
  data['girlId'] = entity.girlId;
  data['teamId'] = entity.teamId;
  data['sign'] = entity.sign;
  data['suitList'] = entity.suitList;
  data['exchange'] = entity.exchange;
  data['intimacyLevel'] = entity.intimacyLevel;
  data['id'] = entity.id;
  return data;
}

extension QueryGirlsEntityExtension on QueryGirlsEntity {
  QueryGirlsEntity copyWith({
    int? currentPlotId,
    int? currentSuit,
    int? charm,
    int? currentChatId,
    int? signTime,
    int? girlId,
    int? teamId,
    int? sign,
    List<dynamic>? suitList,
    int? exchange,
    int? intimacyLevel,
    int? id,
  }) {
    return QueryGirlsEntity()
      ..currentPlotId = currentPlotId ?? this.currentPlotId
      ..currentSuit = currentSuit ?? this.currentSuit
      ..charm = charm ?? this.charm
      ..currentChatId = currentChatId ?? this.currentChatId
      ..signTime = signTime ?? this.signTime
      ..girlId = girlId ?? this.girlId
      ..teamId = teamId ?? this.teamId
      ..sign = sign ?? this.sign
      ..suitList = suitList ?? this.suitList
      ..exchange = exchange ?? this.exchange
      ..intimacyLevel = intimacyLevel ?? this.intimacyLevel
      ..id = id ?? this.id;
  }
}