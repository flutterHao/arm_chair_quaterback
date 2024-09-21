import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/rank_list_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/rank_list_entity.g.dart';

@JsonSerializable()
class RankListEntity {
	late List<RankInfoEntity> ranks;
	late RankListMyRank myRank;

	RankListEntity();

	factory RankListEntity.fromJson(Map<String, dynamic> json) => $RankListEntityFromJson(json);

	Map<String, dynamic> toJson() => $RankListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RankListMyRank {
	late int guessCount;
	late int teamLogo;
	late String teamName;
	late int chip;
	late int createTime;
	late double success;
	late int teamId;
	late int rank;
	late int updateTime;
	late int cycle;
	late int win;

	RankListMyRank();

	factory RankListMyRank.fromJson(Map<String, dynamic> json) => $RankListMyRankFromJson(json);

	Map<String, dynamic> toJson() => $RankListMyRankToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}