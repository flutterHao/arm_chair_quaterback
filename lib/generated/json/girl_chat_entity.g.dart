import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/girl_chat_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_dialogue_define_entity.dart';


GirlChatEntity $GirlChatEntityFromJson(Map<String, dynamic> json) {
  final GirlChatEntity girlChatEntity = GirlChatEntity();
  final int? currentMessageId = jsonConvert.convert<int>(
      json['currentMessageId']);
  if (currentMessageId != null) {
    girlChatEntity.currentMessageId = currentMessageId;
  }
  final List<
      GirlDialogueDefineEntity>? historicalChatRecords = (json['historicalChatRecords'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GirlDialogueDefineEntity>(
          e) as GirlDialogueDefineEntity).toList();
  if (historicalChatRecords != null) {
    girlChatEntity.historicalChatRecords = historicalChatRecords;
  }
  final GirlChatGirl? girl = jsonConvert.convert<GirlChatGirl>(json['girl']);
  if (girl != null) {
    girlChatEntity.girl = girl;
  }
  return girlChatEntity;
}

Map<String, dynamic> $GirlChatEntityToJson(GirlChatEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['currentMessageId'] = entity.currentMessageId;
  data['historicalChatRecords'] =
      entity.historicalChatRecords.map((v) => v.toJson()).toList();
  data['girl'] = entity.girl.toJson();
  return data;
}

extension GirlChatEntityExtension on GirlChatEntity {
  GirlChatEntity copyWith({
    int? currentMessageId,
    List<GirlDialogueDefineEntity>? historicalChatRecords,
    GirlChatGirl? girl,
  }) {
    return GirlChatEntity()
      ..currentMessageId = currentMessageId ?? this.currentMessageId
      ..historicalChatRecords = historicalChatRecords ??
          this.historicalChatRecords
      ..girl = girl ?? this.girl;
  }
}

GirlChatGirl $GirlChatGirlFromJson(Map<String, dynamic> json) {
  final GirlChatGirl girlChatGirl = GirlChatGirl();
  final int? currentPlotId = jsonConvert.convert<int>(json['currentPlotId']);
  if (currentPlotId != null) {
    girlChatGirl.currentPlotId = currentPlotId;
  }
  final int? currentSuit = jsonConvert.convert<int>(json['currentSuit']);
  if (currentSuit != null) {
    girlChatGirl.currentSuit = currentSuit;
  }
  final int? charm = jsonConvert.convert<int>(json['charm']);
  if (charm != null) {
    girlChatGirl.charm = charm;
  }
  final int? currentChatId = jsonConvert.convert<int>(json['currentChatId']);
  if (currentChatId != null) {
    girlChatGirl.currentChatId = currentChatId;
  }
  final int? signTime = jsonConvert.convert<int>(json['signTime']);
  if (signTime != null) {
    girlChatGirl.signTime = signTime;
  }
  final int? girlId = jsonConvert.convert<int>(json['girlId']);
  if (girlId != null) {
    girlChatGirl.girlId = girlId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    girlChatGirl.teamId = teamId;
  }
  final int? sign = jsonConvert.convert<int>(json['sign']);
  if (sign != null) {
    girlChatGirl.sign = sign;
  }
  final List<dynamic>? suitList = (json['suitList'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (suitList != null) {
    girlChatGirl.suitList = suitList;
  }
  final int? exchange = jsonConvert.convert<int>(json['exchange']);
  if (exchange != null) {
    girlChatGirl.exchange = exchange;
  }
  final int? intimacyLevel = jsonConvert.convert<int>(json['intimacyLevel']);
  if (intimacyLevel != null) {
    girlChatGirl.intimacyLevel = intimacyLevel;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    girlChatGirl.id = id;
  }
  return girlChatGirl;
}

Map<String, dynamic> $GirlChatGirlToJson(GirlChatGirl entity) {
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

extension GirlChatGirlExtension on GirlChatGirl {
  GirlChatGirl copyWith({
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
    return GirlChatGirl()
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