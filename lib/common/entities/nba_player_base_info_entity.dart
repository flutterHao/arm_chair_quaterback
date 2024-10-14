import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_player_base_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_player_base_info_entity.g.dart';

@JsonSerializable()
class NbaPlayerBaseInfoEntity {
	late NbaPlayerBaseInfoPlayerBaseInfo playerBaseInfo;
	late NbaPlayerBaseInfoPlayerRegularMap? playerRegularMap;
	late NbaPlayerBaseInfoPlayerPlayoffsMap? playerPlayoffsMap;
	late List<NbaPlayerBaseInfoPlayerTrends> playerTrends;
	late List<NbaPlayerBaseInfoPlayerNews> playerNews;

	NbaPlayerBaseInfoEntity();

	factory NbaPlayerBaseInfoEntity.fromJson(Map<String, dynamic> json) => $NbaPlayerBaseInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerBaseInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerBaseInfoPlayerBaseInfo {
	late int marketPrice;
	late int espnId;
	late bool injuries;
	late int birthTime;
	late int playerStrength;
	late String elname;
	late int salary;
	late int minPlayerScore;
	late int pos;
	late int property;
	late List<int> tag;
	late int beforeMarketPrice;
	late int playerId;
	late int maxPlayerScore;
	late int updateTime;
	late int beforePlayerStrength;
	late String ename;
	late int createTime;
	late int playerScore;
	late String sname;
	late String grade;
	late int teamId;
	late String name;
	late int basicMarketPrice;
	late String position;

	NbaPlayerBaseInfoPlayerBaseInfo();

	factory NbaPlayerBaseInfoPlayerBaseInfo.fromJson(Map<String, dynamic> json) => $NbaPlayerBaseInfoPlayerBaseInfoFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerBaseInfoPlayerBaseInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerBaseInfoPlayerRegularMap {
	@JSONField(name: "PFD_RANK")
	late int pfdRank;
	@JSONField(name: "FG3_PCT")
	late double fg3Pct;
	@JSONField(name: "OREB_RANK")
	late int orebRank;
	@JSONField(name: "STL")
	late double sTL;
	@JSONField(name: "DREB")
	late double dREB;
	@JSONField(name: "FG_PCT_RANK")
	late int fgPctRank;
	@JSONField(name: "PLUS_MINUS_RANK")
	late int plusMinusRank;
	@JSONField(name: "PFD")
	late double pFD;
	@JSONField(name: "PF_RANK")
	late int pfRank;
	@JSONField(name: "DREB_RANK")
	late int drebRank;
	@JSONField(name: "TOV_RANK")
	late int tovRank;
	@JSONField(name: "FGA")
	late double fGA;
	@JSONField(name: "FG3_PCT_RANK")
	late int fg3PctRank;
	@JSONField(name: "BLK_RANK")
	late int blkRank;
	@JSONField(name: "TEAM_ABBREVIATION")
	late String teamAbbreviation;
	@JSONField(name: "NBA_FANTASY_PTS")
	late double nbaFantasyPts;
	@JSONField(name: "FGM")
	late double fGM;
	@JSONField(name: "L_RANK")
	late int lRank;
	@JSONField(name: "W_PCT")
	late double wPct;
	@JSONField(name: "FG3A_RANK")
	late int fg3aRank;
	@JSONField(name: "NICKNAME")
	late String nICKNAME;
	@JSONField(name: "FTA")
	late double fTA;
	@JSONField(name: "NBA_FANTASY_PTS_RANK")
	late int nbaFantasyPtsRank;
	@JSONField(name: "MIN")
	late double mIN;
	@JSONField(name: "DD2")
	late int dD2;
	@JSONField(name: "DD2_RANK")
	late int dd2Rank;
	@JSONField(name: "PLAYER_ID")
	late int playerId;
	@JSONField(name: "TOV")
	late double tOV;
	@JSONField(name: "FG3M_RANK")
	late int fg3mRank;
	@JSONField(name: "FTM")
	late double fTM;
	@JSONField(name: "TEAM_ID")
	late int teamId;
	@JSONField(name: "BLKA")
	late double bLKA;
	@JSONField(name: "BLK")
	late double bLK;
	@JSONField(name: "PLUS_MINUS")
	late double plusMinus;
	@JSONField(name: "TD3")
	late int tD3;
	@JSONField(name: "W_RANK")
	late int wRank;
	@JSONField(name: "MIN_RANK")
	late int minRank;
	@JSONField(name: "FG_PCT")
	late double fgPct;
	@JSONField(name: "L")
	late int l;
	@JSONField(name: "WNBA_FANTASY_PTS")
	late double wnbaFantasyPts;
	@JSONField(name: "PTS")
	late double pTS;
	@JSONField(name: "FG3A")
	late double fG3A;
	@JSONField(name: "FTM_RANK")
	late int ftmRank;
	@JSONField(name: "FTA_RANK")
	late int ftaRank;
	@JSONField(name: "FGA_RANK")
	late int fgaRank;
	@JSONField(name: "REB_RANK")
	late int rebRank;
	@JSONField(name: "BLKA_RANK")
	late int blkaRank;
	@JSONField(name: "W")
	late int w;
	@JSONField(name: "TD3_RANK")
	late int td3Rank;
	@JSONField(name: "FG3M")
	late double fG3M;
	@JSONField(name: "AGE")
	late double aGE;
	@JSONField(name: "W_PCT_RANK")
	late int wPctRank;
	@JSONField(name: "AST_RANK")
	late int astRank;
	@JSONField(name: "PLAYER_NAME")
	late String playerName;
	@JSONField(name: "AST")
	late double aST;
	@JSONField(name: "OREB")
	late double oREB;
	@JSONField(name: "FT_PCT_RANK")
	late int ftPctRank;
	@JSONField(name: "GP")
	late int gP;
	@JSONField(name: "FGM_RANK")
	late int fgmRank;
	@JSONField(name: "REB")
	late double rEB;
	@JSONField(name: "FT_PCT")
	late double ftPct;
	@JSONField(name: "WNBA_FANTASY_PTS_RANK")
	late int wnbaFantasyPtsRank;
	@JSONField(name: "PTS_RANK")
	late int ptsRank;
	@JSONField(name: "PF")
	late double pF;
	@JSONField(name: "GP_RANK")
	late int gpRank;
	@JSONField(name: "STL_RANK")
	late int stlRank;

	NbaPlayerBaseInfoPlayerRegularMap();

	factory NbaPlayerBaseInfoPlayerRegularMap.fromJson(Map<String, dynamic> json) => $NbaPlayerBaseInfoPlayerRegularMapFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerBaseInfoPlayerRegularMapToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerBaseInfoPlayerPlayoffsMap {
	@JSONField(name: "PFD_RANK")
	late int pfdRank;
	@JSONField(name: "FG3_PCT")
	late double fg3Pct;
	@JSONField(name: "OREB_RANK")
	late int orebRank;
	@JSONField(name: "STL")
	late double sTL;
	@JSONField(name: "DREB")
	late double dREB;
	@JSONField(name: "FG_PCT_RANK")
	late int fgPctRank;
	@JSONField(name: "PLUS_MINUS_RANK")
	late int plusMinusRank;
	@JSONField(name: "PFD")
	late double pFD;
	@JSONField(name: "PF_RANK")
	late int pfRank;
	@JSONField(name: "DREB_RANK")
	late int drebRank;
	@JSONField(name: "TOV_RANK")
	late int tovRank;
	@JSONField(name: "FGA")
	late double fGA;
	@JSONField(name: "FG3_PCT_RANK")
	late int fg3PctRank;
	@JSONField(name: "BLK_RANK")
	late int blkRank;
	@JSONField(name: "TEAM_ABBREVIATION")
	late String teamAbbreviation;
	@JSONField(name: "NBA_FANTASY_PTS")
	late double nbaFantasyPts;
	@JSONField(name: "FGM")
	late double fGM;
	@JSONField(name: "L_RANK")
	late int lRank;
	@JSONField(name: "W_PCT")
	late double wPct;
	@JSONField(name: "FG3A_RANK")
	late int fg3aRank;
	@JSONField(name: "NICKNAME")
	late String nICKNAME;
	@JSONField(name: "FTA")
	late double fTA;
	@JSONField(name: "NBA_FANTASY_PTS_RANK")
	late int nbaFantasyPtsRank;
	@JSONField(name: "MIN")
	late double mIN;
	@JSONField(name: "DD2")
	late int dD2;
	@JSONField(name: "DD2_RANK")
	late int dd2Rank;
	@JSONField(name: "PLAYER_ID")
	late int playerId;
	@JSONField(name: "TOV")
	late double tOV;
	@JSONField(name: "FG3M_RANK")
	late int fg3mRank;
	@JSONField(name: "FTM")
	late double fTM;
	@JSONField(name: "TEAM_ID")
	late int teamId;
	@JSONField(name: "BLKA")
	late double bLKA;
	@JSONField(name: "BLK")
	late double bLK;
	@JSONField(name: "PLUS_MINUS")
	late double plusMinus;
	@JSONField(name: "TD3")
	late int tD3;
	@JSONField(name: "W_RANK")
	late int wRank;
	@JSONField(name: "MIN_RANK")
	late int minRank;
	@JSONField(name: "FG_PCT")
	late double fgPct;
	@JSONField(name: "L")
	late int l;
	@JSONField(name: "WNBA_FANTASY_PTS")
	late double wnbaFantasyPts;
	@JSONField(name: "PTS")
	late double pTS;
	@JSONField(name: "FG3A")
	late double fG3A;
	@JSONField(name: "FTM_RANK")
	late int ftmRank;
	@JSONField(name: "FTA_RANK")
	late int ftaRank;
	@JSONField(name: "FGA_RANK")
	late int fgaRank;
	@JSONField(name: "REB_RANK")
	late int rebRank;
	@JSONField(name: "BLKA_RANK")
	late int blkaRank;
	@JSONField(name: "W")
	late int w;
	@JSONField(name: "TD3_RANK")
	late int td3Rank;
	@JSONField(name: "FG3M")
	late double fG3M;
	@JSONField(name: "AGE")
	late double aGE;
	@JSONField(name: "W_PCT_RANK")
	late int wPctRank;
	@JSONField(name: "AST_RANK")
	late int astRank;
	@JSONField(name: "PLAYER_NAME")
	late String playerName;
	@JSONField(name: "AST")
	late double aST;
	@JSONField(name: "OREB")
	late double oREB;
	@JSONField(name: "FT_PCT_RANK")
	late int ftPctRank;
	@JSONField(name: "GP")
	late int gP;
	@JSONField(name: "FGM_RANK")
	late int fgmRank;
	@JSONField(name: "REB")
	late double rEB;
	@JSONField(name: "FT_PCT")
	late double ftPct;
	@JSONField(name: "WNBA_FANTASY_PTS_RANK")
	late int wnbaFantasyPtsRank;
	@JSONField(name: "PTS_RANK")
	late int ptsRank;
	@JSONField(name: "PF")
	late double pF;
	@JSONField(name: "GP_RANK")
	late int gpRank;
	@JSONField(name: "STL_RANK")
	late int stlRank;

	NbaPlayerBaseInfoPlayerPlayoffsMap();

	factory NbaPlayerBaseInfoPlayerPlayoffsMap.fromJson(Map<String, dynamic> json) => $NbaPlayerBaseInfoPlayerPlayoffsMapFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerBaseInfoPlayerPlayoffsMapToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerBaseInfoPlayerTrends {
	late int playerMarketPrice;
	late int createTime;
	late int playerScore;
	late int updateTime;
	late int playerStrength;
	late int playerId;

	NbaPlayerBaseInfoPlayerTrends();

	factory NbaPlayerBaseInfoPlayerTrends.fromJson(Map<String, dynamic> json) => $NbaPlayerBaseInfoPlayerTrendsFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerBaseInfoPlayerTrendsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NbaPlayerBaseInfoPlayerNews {
	late int isLike;
	late int isView;
	late String dataLabel;
	late int updateTime;
	late int reviewsCount;
	late String source;
	late String title;
	late int unLikes;
	late String content;
	late List<dynamic> reviewsList;
	late int postTime;
	late int award;
	late int createTime;
	late int id;
	late int views;
	late int likes;

	NbaPlayerBaseInfoPlayerNews();

	factory NbaPlayerBaseInfoPlayerNews.fromJson(Map<String, dynamic> json) => $NbaPlayerBaseInfoPlayerNewsFromJson(json);

	Map<String, dynamic> toJson() => $NbaPlayerBaseInfoPlayerNewsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}