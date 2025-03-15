import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/card_pack_player_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/card_pack_player_entity.g.dart';

@JsonSerializable()
class CardPackPlayerEntity {
	late List<TradeInfoTradePlayersTrend> trendList = [];
	late int strength = 0;
	late int rank = 0;
	late int playerId = 0;

	CardPackPlayerEntity();

	factory CardPackPlayerEntity.fromJson(Map<String, dynamic> json) => $CardPackPlayerEntityFromJson(json);

	Map<String, dynamic> toJson() => $CardPackPlayerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

