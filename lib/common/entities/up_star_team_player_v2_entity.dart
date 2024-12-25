import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/up_star_team_player_v2_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/up_star_team_player_v2_entity.g.dart';

@JsonSerializable()
class UpStarTeamPlayerV2Entity {
	late int nowCount = 0;
	late int successRate = 0;
	late int teamId = 0;
	late double addRate;
	late List<UpStarTeamPlayerV2StarUpList> starUpList = [];
	late String uuid = '';
	late int playerId = 0;

	UpStarTeamPlayerV2Entity();

	factory UpStarTeamPlayerV2Entity.fromJson(Map<String, dynamic> json) => $UpStarTeamPlayerV2EntityFromJson(json);

	Map<String, dynamic> toJson() => $UpStarTeamPlayerV2EntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStarTeamPlayerV2StarUpList {
	late bool success = false;
	late UpStarTeamPlayerV2StarUpListAttrCount attrCount;
	late UpStarTeamPlayerV2StarUpListAttr attr;
	late int type = 0;
	late int starUpCount = 0;

	UpStarTeamPlayerV2StarUpList();

	factory UpStarTeamPlayerV2StarUpList.fromJson(Map<String, dynamic> json) => $UpStarTeamPlayerV2StarUpListFromJson(json);

	Map<String, dynamic> toJson() => $UpStarTeamPlayerV2StarUpListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStarTeamPlayerV2StarUpListAttrCount {
	late int blk = 0;
	late int tech = 0;
	late int pass = 0;
	late int stl = 0;
	late int threePm = 0;
	late int ftm = 0;
	late int pts = 0;
	late int reb = 0;

	UpStarTeamPlayerV2StarUpListAttrCount();

	factory UpStarTeamPlayerV2StarUpListAttrCount.fromJson(Map<String, dynamic> json) => $UpStarTeamPlayerV2StarUpListAttrCountFromJson(json);

	Map<String, dynamic> toJson() => $UpStarTeamPlayerV2StarUpListAttrCountToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UpStarTeamPlayerV2StarUpListAttr {
	late double blk;
	late double tech;
	late int pass = 0;
	late int stl = 0;
	late int threePm = 0;
	late int ftm = 0;
	late int pts = 0;
	late int reb = 0;

	UpStarTeamPlayerV2StarUpListAttr();

	factory UpStarTeamPlayerV2StarUpListAttr.fromJson(Map<String, dynamic> json) => $UpStarTeamPlayerV2StarUpListAttrFromJson(json);

	Map<String, dynamic> toJson() => $UpStarTeamPlayerV2StarUpListAttrToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}