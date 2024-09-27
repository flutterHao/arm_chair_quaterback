import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_player_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_player_info_entity.g.dart';

@JsonSerializable()
class TeamPlayerInfoEntity {
	@JSONField(name: "PlayerTrend")
	late List<TeamPlayerInfoPlayerTrend> playerTrend;
	@JSONField(name: "TeamPlayer")
	late TeamPlayerInfoTeamPlayer teamPlayer;

	TeamPlayerInfoEntity();

	factory TeamPlayerInfoEntity.fromJson(Map<String, dynamic> json) => $TeamPlayerInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TeamPlayerInfoPlayerTrend {
	late int createTime;
	late int playerId;
	late int playerMarketPrice;
	late int playerScore;
	late int playerStrength;
	late int updateTime;

	TeamPlayerInfoPlayerTrend();

	factory TeamPlayerInfoPlayerTrend.fromJson(Map<String, dynamic> json) => $TeamPlayerInfoPlayerTrendFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerInfoPlayerTrendToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TeamPlayerInfoTeamPlayer {
	late bool bindStatus;
	late int breakThroughGrade;
	late int buyPlayerScore;
	late int buyPrice;
	late int createTime;
	late int fromType;
	late int gradeExp;
	late int id;
	late int playerGrade;
	late int playerId;
	late int position;
	late TeamPlayerInfoTeamPlayerPotential potential;
	late int power;
	late int teamId;
	late int updateTime;
	late String uuid;

	TeamPlayerInfoTeamPlayer();

	factory TeamPlayerInfoTeamPlayer.fromJson(Map<String, dynamic> json) => $TeamPlayerInfoTeamPlayerFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerInfoTeamPlayerToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TeamPlayerInfoTeamPlayerPotential {
	late int ast;
	late int blk;
	late int pts;
	late int reb;
	late int stl;
	late int threePts;

	TeamPlayerInfoTeamPlayerPotential();

	factory TeamPlayerInfoTeamPlayerPotential.fromJson(Map<String, dynamic> json) => $TeamPlayerInfoTeamPlayerPotentialFromJson(json);

	Map<String, dynamic> toJson() => $TeamPlayerInfoTeamPlayerPotentialToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}