import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/season_rank_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/season_rank_info_entity.g.dart';

@JsonSerializable()
class SeasonRankInfoEntity {
	late List<SeasonRankInfoRanks> ranks = [];
	late SeasonRankInfoMyRank myRank;

	SeasonRankInfoEntity();

	factory SeasonRankInfoEntity.fromJson(Map<String, dynamic> json) => $SeasonRankInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $SeasonRankInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SeasonRankInfoRanks {
	late int teamLogo = 0;
	late String teamName = '';
	late String receivedRewards = '';
	late int createTime = 0;
	late int rankId = 0;
	late int seasonId = 0;
	late int teamId = 0;
	late int rank = 0;
	late int updateTime = 0;
	late double winPro;
	late int id = 0;
	late int cup = 0;

	SeasonRankInfoRanks();

	factory SeasonRankInfoRanks.fromJson(Map<String, dynamic> json) => $SeasonRankInfoRanksFromJson(json);

	Map<String, dynamic> toJson() => $SeasonRankInfoRanksToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class SeasonRankInfoMyRank {
	late int guessCount = 0;
	late int teamLogo = 0;
	late int chip = 0;
	late int success = 0;
	late int teamId = 0;
	late int rank = 0;
	late int id = 0;
	late int cycle = 0;
	late int win = 0;

	SeasonRankInfoMyRank();

	factory SeasonRankInfoMyRank.fromJson(Map<String, dynamic> json) => $SeasonRankInfoMyRankFromJson(json);

	Map<String, dynamic> toJson() => $SeasonRankInfoMyRankToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}