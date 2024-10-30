import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_player_base_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_player_base_info_entity.g.dart';

@JsonSerializable()
class NbaPlayerBaseInfoEntity {
  late NbaPlayerBaseInfoPlayerDataAvg playerDataAvg;
  late NbaPlayerBaseInfoGuessInfos guessInfos;
  late NbaPlayerBaseInfoPlayerBaseInfo playerBaseInfo;
  late List<NbaPlayerBaseInfoL5GameData> l5GameData;
  late NbaPlayerBaseInfoL5DataAvg l5DataAvg;
  late NbaPlayerBaseInfoPlayerRegularMap playerRegularMap;
  late NbaPlayerBaseInfoPlayerPlayoffsMap playerPlayoffsMap;
  late List<NbaPlayerBaseInfoPlayerTrends> playerTrends;
  late List<NbaPlayerBaseInfoPlayerNews> playerNews;

  NbaPlayerBaseInfoEntity();

  factory NbaPlayerBaseInfoEntity.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoPlayerDataAvg {
  late double blk;
  late double fga;
  late double ast;
  late double dreb;
  late int starterCount;
  late double stl;
  late int updateTime;
  late double fgm;
  late double pts;
  late double threePa;
  late int playCount;
  late double fta;
  late double min;
  late double oreb;
  late int createTime;
  late int seasonId;
  late double pf;
  late double threePm;
  late double to;
  late double ftm;
  late int playerId;

  NbaPlayerBaseInfoPlayerDataAvg();

  factory NbaPlayerBaseInfoPlayerDataAvg.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoPlayerDataAvgFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoPlayerDataAvgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfos {
  @JSONField(name: "3pm")
  late NbaPlayerBaseInfoGuessInfosProperty threePm;
  late NbaPlayerBaseInfoGuessInfosProperty ast;
  late NbaPlayerBaseInfoGuessInfosProperty reb;
  late NbaPlayerBaseInfoGuessInfosProperty pts;

  NbaPlayerBaseInfoGuessInfos();

  factory NbaPlayerBaseInfoGuessInfos.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoGuessInfosToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}


@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosAstCommunityPick {
  late int moreCount;
  late int lessCount;

  NbaPlayerBaseInfoGuessInfosAstCommunityPick();

  factory NbaPlayerBaseInfoGuessInfosAstCommunityPick.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosAstCommunityPickFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosAstCommunityPickToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosAstPicks {
  late int gameId;
  late int newsId;
  late int gameStartTime;
  late int teamId;
  late List<dynamic> guessData;
  late NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue
      guessReferenceValue;
  late int id;
  late int type;
  late int awayTeamId;
  late int playerId;

  NbaPlayerBaseInfoGuessInfosAstPicks();

  factory NbaPlayerBaseInfoGuessInfosAstPicks.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosAstPicksFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosAstPicksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue {
  late double ast;
  late double threePm;
  late int pts;
  late int reb;

  NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue();

  factory NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValueFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosAstTwoTeamGames {
  late int fga;
  late int ast;
  late int dreb;
  late int espnId;
  late int fgm;
  late int reb;
  late int fta;
  late int min;
  late bool isStarter;
  late int ftm;
  late int playerId;
  late int blk;
  late int gameId;
  late int stl;
  late int updateTime;
  late int pts;
  late int threePa;
  late String ename;
  late int oreb;
  late int createTime;
  late int pf;
  late int teamId;
  late int threePm;
  late int to;
  late int awayTeamId;

  NbaPlayerBaseInfoGuessInfosAstTwoTeamGames();

  factory NbaPlayerBaseInfoGuessInfosAstTwoTeamGames.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosAstTwoTeamGamesFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosAstTwoTeamGamesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosReb {
  late NbaPlayerBaseInfoGuessInfosRebCommunityPick communityPick;
  late NbaPlayerBaseInfoGuessInfosRebPicks picks;
  late List<NbaPlayerBaseInfoGuessInfosRebTwoTeamGames> twoTeamGames;

  NbaPlayerBaseInfoGuessInfosReb();

  factory NbaPlayerBaseInfoGuessInfosReb.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosRebFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoGuessInfosRebToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosRebCommunityPick {
  late int moreCount;
  late int lessCount;

  NbaPlayerBaseInfoGuessInfosRebCommunityPick();

  factory NbaPlayerBaseInfoGuessInfosRebCommunityPick.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosRebCommunityPickFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosRebCommunityPickToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosRebPicks {
  late int gameId;
  late int newsId;
  late int gameStartTime;
  late int teamId;
  late List<dynamic> guessData;
  late NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue
      guessReferenceValue;
  late int id;
  late int type;
  late int awayTeamId;
  late int playerId;

  NbaPlayerBaseInfoGuessInfosRebPicks();

  factory NbaPlayerBaseInfoGuessInfosRebPicks.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosRebPicksFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosRebPicksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue {
  late double ast;
  late double threePm;
  late int pts;
  late int reb;

  NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue();

  factory NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValueFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosRebTwoTeamGames {
  late int fga;
  late int ast;
  late int dreb;
  late int espnId;
  late int fgm;
  late int reb;
  late int fta;
  late int min;
  late bool isStarter;
  late int ftm;
  late int playerId;
  late int blk;
  late int gameId;
  late int stl;
  late int updateTime;
  late int pts;
  late int threePa;
  late String ename;
  late int oreb;
  late int createTime;
  late int pf;
  late int teamId;
  late int threePm;
  late int to;
  late int awayTeamId;

  NbaPlayerBaseInfoGuessInfosRebTwoTeamGames();

  factory NbaPlayerBaseInfoGuessInfosRebTwoTeamGames.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosRebTwoTeamGamesFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosRebTwoTeamGamesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosProperty {
   NbaPlayerBaseInfoGuessInfosPtsCommunityPick? communityPick;
   NbaPlayerBaseInfoGuessInfosPtsPicks? picks;
   List<NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames>? twoTeamGames;

  NbaPlayerBaseInfoGuessInfosProperty();

  factory NbaPlayerBaseInfoGuessInfosProperty.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosPropertyFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoGuessInfosPropertyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosPtsCommunityPick {
  late int moreCount;
  late int lessCount;

  NbaPlayerBaseInfoGuessInfosPtsCommunityPick();

  factory NbaPlayerBaseInfoGuessInfosPtsCommunityPick.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosPtsCommunityPickFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosPtsCommunityPickToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosPtsPicks {
  late int gameId;
  late int newsId;
  late int gameStartTime;
  late int teamId;
  late List<dynamic> guessData;
  late NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue
      guessReferenceValue;
  late int id;
  late int type;
  late int awayTeamId;
  late int playerId;

  NbaPlayerBaseInfoGuessInfosPtsPicks();

  factory NbaPlayerBaseInfoGuessInfosPtsPicks.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosPtsPicksFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosPtsPicksToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue {
  late double ast;
  late double threePm;
  late int pts;
  late int reb;

  NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue();

  factory NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValueFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames {
  late int fga;
  late int ast;
  late int dreb;
  late int espnId;
  late int fgm;
  late int reb;
  late int fta;
  late int min;
  late bool isStarter;
  late int ftm;
  late int playerId;
  late int blk;
  late int gameId;
  late int stl;
  late int updateTime;
  late int pts;
  late int threePa;
  late String ename;
  late int oreb;
  late int createTime;
  late int pf;
  late int teamId;
  late int threePm;
  late int to;
  late int awayTeamId;

  NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames();

  factory NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoGuessInfosPtsTwoTeamGamesFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoGuessInfosPtsTwoTeamGamesToJson(this);

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
  late int beforeMarketPriceUpdateTime;
  late int birthTime;
  late int playerStrength;
  late String elname;
  late int salary;
  late int minPlayerScore;
  late int nbaId;
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

  factory NbaPlayerBaseInfoPlayerBaseInfo.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoPlayerBaseInfoFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoPlayerBaseInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoL5GameData {
  late int blk;
  late int fga;
  late int ast;
  late int dreb;
  late int starterCount;
  late int stl;
  late int updateTime;
  late int fgm;
  late int pts;
  late int threePa;
  late int playCount;
  late int fta;
  late int min;
  late int oreb;
  late int createTime;
  late int seasonId;
  late int pf;
  late int threePm;
  late int to;
  late int ftm;
  late int playerId;

  NbaPlayerBaseInfoL5GameData();

  factory NbaPlayerBaseInfoL5GameData.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoL5GameDataFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoL5GameDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoL5DataAvg {
   double? blk;
   double? fga;
   double? ast;
   double? dreb;
   double? starterCount;
   double? stl;
   double? updateTime;
   double? fgm;
   double? pts;
   double? threePa;
   double? playCount;
   double? fta;
   double? min;
   double? oreb;
   double? createTime;
   double? seasonId;
   double? pf;
   double? threePm;
   double? to;
   double? ftm;
   double? playerId;

  NbaPlayerBaseInfoL5DataAvg();

  factory NbaPlayerBaseInfoL5DataAvg.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoL5DataAvgFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoL5DataAvgToJson(this);

  double getValue(String key) {
    if ("3pm" == key.toLowerCase()) {
      return threePm??0;
    }
    if ("reb" == key.toLowerCase()) {
      return ((oreb??0) + (dreb??0)) / 2;
    }
    return toJson()[key.toLowerCase()];
  }

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

  factory NbaPlayerBaseInfoPlayerRegularMap.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoPlayerRegularMapFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoPlayerRegularMapToJson(this);

  bool isNotEmpty() {
    return toJson().isNotEmpty;
  }

  String getValue(String key) {
    return (toJson()[key] ?? 0).toString();
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NbaPlayerBaseInfoPlayerPlayoffsMap {
  @JSONField(name: "PFD_RANK")
  int? pfdRank;
  @JSONField(name: "FG3_PCT")
  double? fg3Pct;
  @JSONField(name: "OREB_RANK")
  int? orebRank;
  @JSONField(name: "STL")
  double? sTL;
  @JSONField(name: "DREB")
  double? dREB;
  @JSONField(name: "FG_PCT_RANK")
  int? fgPctRank;
  @JSONField(name: "PLUS_MINUS_RANK")
  int? plusMinusRank;
  @JSONField(name: "PFD")
  double? pFD;
  @JSONField(name: "PF_RANK")
  int? pfRank;
  @JSONField(name: "DREB_RANK")
  int? drebRank;
  @JSONField(name: "TOV_RANK")
  int? tovRank;
  @JSONField(name: "FGA")
  double? fGA;
  @JSONField(name: "FG3_PCT_RANK")
  int? fg3PctRank;
  @JSONField(name: "BLK_RANK")
  int? blkRank;
  @JSONField(name: "TEAM_ABBREVIATION")
  String? teamAbbreviation;
  @JSONField(name: "NBA_FANTASY_PTS")
  double? nbaFantasyPts;
  @JSONField(name: "FGM")
  double? fGM;
  @JSONField(name: "L_RANK")
  int? lRank;
  @JSONField(name: "W_PCT")
  double? wPct;
  @JSONField(name: "FG3A_RANK")
  int? fg3aRank;
  @JSONField(name: "NICKNAME")
  String? nICKNAME;
  @JSONField(name: "FTA")
  double? fTA;
  @JSONField(name: "NBA_FANTASY_PTS_RANK")
  int? nbaFantasyPtsRank;
  @JSONField(name: "MIN")
  double? mIN;
  @JSONField(name: "DD2")
  int? dD2;
  @JSONField(name: "DD2_RANK")
  int? dd2Rank;
  @JSONField(name: "PLAYER_ID")
  int? playerId;
  @JSONField(name: "TOV")
  double? tOV;
  @JSONField(name: "FG3M_RANK")
  int? fg3mRank;
  @JSONField(name: "FTM")
  double? fTM;
  @JSONField(name: "TEAM_ID")
  int? teamId;
  @JSONField(name: "BLKA")
  double? bLKA;
  @JSONField(name: "BLK")
  double? bLK;
  @JSONField(name: "PLUS_MINUS")
  double? plusMinus;
  @JSONField(name: "TD3")
  int? tD3;
  @JSONField(name: "W_RANK")
  int? wRank;
  @JSONField(name: "MIN_RANK")
  int? minRank;
  @JSONField(name: "FG_PCT")
  double? fgPct;
  @JSONField(name: "L")
  int? l;
  @JSONField(name: "WNBA_FANTASY_PTS")
  double? wnbaFantasyPts;
  @JSONField(name: "PTS")
  double? pTS;
  @JSONField(name: "FG3A")
  double? fG3A;
  @JSONField(name: "FTM_RANK")
  int? ftmRank;
  @JSONField(name: "FTA_RANK")
  int? ftaRank;
  @JSONField(name: "FGA_RANK")
  int? fgaRank;
  @JSONField(name: "REB_RANK")
  int? rebRank;
  @JSONField(name: "BLKA_RANK")
  int? blkaRank;
  @JSONField(name: "W")
  int? w;
  @JSONField(name: "TD3_RANK")
  int? td3Rank;
  @JSONField(name: "FG3M")
  double? fG3M;
  @JSONField(name: "AGE")
  double? aGE;
  @JSONField(name: "W_PCT_RANK")
  int? wPctRank;
  @JSONField(name: "AST_RANK")
  int? astRank;
  @JSONField(name: "PLAYER_NAME")
  String? playerName;
  @JSONField(name: "AST")
  double? aST;
  @JSONField(name: "OREB")
  double? oREB;
  @JSONField(name: "FT_PCT_RANK")
  int? ftPctRank;
  @JSONField(name: "GP")
  int? gP;
  @JSONField(name: "FGM_RANK")
  int? fgmRank;
  @JSONField(name: "REB")
  double? rEB;
  @JSONField(name: "FT_PCT")
  double? ftPct;
  @JSONField(name: "WNBA_FANTASY_PTS_RANK")
  int? wnbaFantasyPtsRank;
  @JSONField(name: "PTS_RANK")
  int? ptsRank;
  @JSONField(name: "PF")
  double? pF;
  @JSONField(name: "GP_RANK")
  int? gpRank;
  @JSONField(name: "STL_RANK")
  int? stlRank;

  NbaPlayerBaseInfoPlayerPlayoffsMap();

  factory NbaPlayerBaseInfoPlayerPlayoffsMap.fromJson(
          Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoPlayerPlayoffsMapFromJson(json);

  Map<String, dynamic> toJson() =>
      $NbaPlayerBaseInfoPlayerPlayoffsMapToJson(this);

  bool isNotEmpty() {
    return toJson().isNotEmpty;
  }

  String getValue(String key) {
    return (toJson()[key] ?? 0).toString();
  }

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

  factory NbaPlayerBaseInfoPlayerTrends.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoPlayerTrendsFromJson(json);

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

  factory NbaPlayerBaseInfoPlayerNews.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerBaseInfoPlayerNewsFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerBaseInfoPlayerNewsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
