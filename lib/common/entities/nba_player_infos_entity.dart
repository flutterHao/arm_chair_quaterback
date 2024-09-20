import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_player_infos_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_player_infos_entity.g.dart';

@JsonSerializable()
class NbaPlayerInfosEntity {
	@JSONField(name: "NBAPlayerInfos")
	late NbaPlayerInfosNBAPlayerInfos nBAPlayerInfos;

	NbaPlayerInfosEntity();

	factory NbaPlayerInfosEntity.fromJson(Map<String, dynamic> json) => $NbaPlayerInfosEntityFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerInfosEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerInfosNBAPlayerInfos {
	late List<NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList> playerBaseInfoList;
	late List<NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList> playerDataAvgList;
	late List<NbaPlayerInfosNBAPlayerInfosPlayerDataCapList> playerDataCapList;

	NbaPlayerInfosNBAPlayerInfos();

	factory NbaPlayerInfosNBAPlayerInfos.fromJson(Map<String, dynamic> json) => $NbaPlayerInfosNBAPlayerInfosFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerInfosNBAPlayerInfosToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList {
	late int beforeMarketPrice;
	late int beforePlayerStrength;
	late int birthTime;
	late int createTime;
	late String ename;
	late int espnId;
	late String grade;
	late bool injuries;
	late int marketPrice;
	late int maxPlayerScore;
	late int minPlayerScore;
	late String name;
	late int playerId;
	late int playerScore;
	late int playerStrength;
	late int pos;
	late String position;
	late int property;
	late int salary;
	late String sname;
	late List<int> tag;
	late int teamId;
	late int updateTime;

	NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList();

	factory NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoList.fromJson(Map<String, dynamic> json) => $NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoListFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerInfosNBAPlayerInfosPlayerBaseInfoListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList {
	late double ast;
	late double blk;
	late int createTime;
	late double dreb;
	late double fga;
	late double fgm;
	late double fta;
	late double ftm;
	late double min;
	late double oreb;
	late double pf;
	late int playCount;
	late int playerId;
	late double pts;
	late int seasonId;
	late int starterCount;
	late double stl;
	late double threePa;
	late double threePm;
	late double to;
	late int updateTime;

	NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList();

	factory NbaPlayerInfosNBAPlayerInfosPlayerDataAvgList.fromJson(Map<String, dynamic> json) => $NbaPlayerInfosNBAPlayerInfosPlayerDataAvgListFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerInfosNBAPlayerInfosPlayerDataAvgListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerInfosNBAPlayerInfosPlayerDataCapList {
	late int ast;
	late int attackCap;
	late int beforeAst;
	late int beforeBlk;
	late int beforeDreb;
	late int beforeOreb;
	late int beforePts;
	late int beforeStl;
	late int beforeThreePm;
	late int blk;
	late int createTime;
	late int defenseCap;
	late int dreb;
	late int fga;
	late int fgm;
	late int fta;
	late int ftm;
	late int min;
	late int oreb;
	late int pf;
	late int playerId;
	late int pts;
	late int slamDunk;
	late int stl;
	late int threePa;
	late int threePm;
	late int threePts;
	late int to;
	late int twoPts;
	late int updateTime;

	NbaPlayerInfosNBAPlayerInfosPlayerDataCapList();

	factory NbaPlayerInfosNBAPlayerInfosPlayerDataCapList.fromJson(Map<String, dynamic> json) => $NbaPlayerInfosNBAPlayerInfosPlayerDataCapListFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerInfosNBAPlayerInfosPlayerDataCapListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}