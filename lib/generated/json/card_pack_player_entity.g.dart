import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/card_pack_player_entity.dart';
import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';


CardPackPlayerEntity $CardPackPlayerEntityFromJson(Map<String, dynamic> json) {
  final CardPackPlayerEntity cardPackPlayerEntity = CardPackPlayerEntity();
  final List<
      TradeInfoTradePlayersTrend>? trendList = (json['trendList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<TradeInfoTradePlayersTrend>(
          e) as TradeInfoTradePlayersTrend).toList();
  if (trendList != null) {
    cardPackPlayerEntity.trendList = trendList;
  }
  final int? strength = jsonConvert.convert<int>(json['strength']);
  if (strength != null) {
    cardPackPlayerEntity.strength = strength;
  }
  final int? rank = jsonConvert.convert<int>(json['rank']);
  if (rank != null) {
    cardPackPlayerEntity.rank = rank;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    cardPackPlayerEntity.playerId = playerId;
  }
  return cardPackPlayerEntity;
}

Map<String, dynamic> $CardPackPlayerEntityToJson(CardPackPlayerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['trendList'] = entity.trendList.map((v) => v.toJson()).toList();
  data['strength'] = entity.strength;
  data['rank'] = entity.rank;
  data['playerId'] = entity.playerId;
  return data;
}

extension CardPackPlayerEntityExtension on CardPackPlayerEntity {
  CardPackPlayerEntity copyWith({
    List<TradeInfoTradePlayersTrend>? trendList,
    int? strength,
    int? rank,
    int? playerId,
  }) {
    return CardPackPlayerEntity()
      ..trendList = trendList ?? this.trendList
      ..strength = strength ?? this.strength
      ..rank = rank ?? this.rank
      ..playerId = playerId ?? this.playerId;
  }
}