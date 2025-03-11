import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/star_up_player_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/star_up_player_entity.g.dart';

@JsonSerializable()
class StarUpPlayerEntity {
	late List<TeamPlayerInfoEntity> starUpPlayers = [];
	late bool more = false;

	StarUpPlayerEntity();

	factory StarUpPlayerEntity.fromJson(Map<String, dynamic> json) => $StarUpPlayerEntityFromJson(json);

	Map<String, dynamic> toJson() => $StarUpPlayerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}