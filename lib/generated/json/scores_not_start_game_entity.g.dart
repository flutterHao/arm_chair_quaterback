import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/scores_not_start_game_entity.dart';

ScoresNotStartGameEntity $ScoresNotStartGameEntityFromJson(
    Map<String, dynamic> json) {
  final ScoresNotStartGameEntity scoresNotStartGameEntity = ScoresNotStartGameEntity();
  final Map<String, List<TeamPlayer>>? teamPlayerMap =
  (json['teamPlayerMap'] as Map<String, dynamic>).map(
          (k, e) =>
          MapEntry(k, (e as List<dynamic>)
              .map(
                  (e) => jsonConvert.convert<TeamPlayer>(e) as TeamPlayer)
              .toList()));
  if (teamPlayerMap != null) {
    scoresNotStartGameEntity.teamPlayerMap = teamPlayerMap;
  }
  final Map<String, List<TeamHistory>>? teamHistoryMap =
  (json['teamHistoryMap'] as Map<String, dynamic>).map(
          (k, e) =>
          MapEntry(k, (e as List<dynamic>)
              .map(
                  (e) => jsonConvert.convert<TeamHistory>(e) as TeamHistory)
              .toList()));
  if (teamHistoryMap != null) {
    scoresNotStartGameEntity.teamHistoryMap = teamHistoryMap;
  }
  final List<
      TeamPlayer>? nbaTeamStatRankList = (json['nbaTeamStatRankList'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<TeamPlayer>(e) as TeamPlayer).toList();
  if (nbaTeamStatRankList != null) {
    scoresNotStartGameEntity.nbaTeamStatRankList = nbaTeamStatRankList;
  }
  final List<TeamHistory>? nbaGameSchedules = (json['nbaGameSchedules'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<TeamHistory>(e) as TeamHistory).toList();
  if (nbaGameSchedules != null) {
    scoresNotStartGameEntity.nbaGameSchedules = nbaGameSchedules;
  }
  return scoresNotStartGameEntity;
}

Map<String, dynamic> $ScoresNotStartGameEntityToJson(
    ScoresNotStartGameEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamPlayerMap'] = entity.teamPlayerMap;
  data['teamHistoryMap'] = entity.teamHistoryMap;
  data['nbaTeamStatRankList'] =
      entity.nbaTeamStatRankList.map((v) => v.toJson()).toList();
  data['nbaGameSchedules'] =
      entity.nbaGameSchedules.map((v) => v.toJson()).toList();
  return data;
}

extension ScoresNotStartGameEntityExtension on ScoresNotStartGameEntity {
  ScoresNotStartGameEntity copyWith({
    Map<String, List<TeamPlayer>>? teamPlayerMap,
    Map<String, List<TeamHistory>>? teamHistoryMap,
    List<TeamPlayer>? nbaTeamStatRankList,
    List<TeamHistory>? nbaGameSchedules,
  }) {
    return ScoresNotStartGameEntity()
      ..teamPlayerMap = teamPlayerMap ?? this.teamPlayerMap
      ..teamHistoryMap = teamHistoryMap ?? this.teamHistoryMap
      ..nbaTeamStatRankList = nbaTeamStatRankList ?? this.nbaTeamStatRankList
      ..nbaGameSchedules = nbaGameSchedules ?? this.nbaGameSchedules;
  }
}

TeamPlayer $TeamPlayerFromJson(Map<String, dynamic> json) {
  final TeamPlayer teamPlayer = TeamPlayer();
  final int? pfdRank = jsonConvert.convert<int>(json['PFD_RANK']);
  if (pfdRank != null) {
    teamPlayer.pfdRank = pfdRank;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    teamPlayer.fg3Pct = fg3Pct;
  }
  final int? orebRank = jsonConvert.convert<int>(json['OREB_RANK']);
  if (orebRank != null) {
    teamPlayer.orebRank = orebRank;
  }
  final double? stl = jsonConvert.convert<double>(json['STL']);
  if (stl != null) {
    teamPlayer.stl = stl;
  }
  final double? dreb = jsonConvert.convert<double>(json['DREB']);
  if (dreb != null) {
    teamPlayer.dreb = dreb;
  }
  final int? fgPctRank = jsonConvert.convert<int>(json['FG_PCT_RANK']);
  if (fgPctRank != null) {
    teamPlayer.fgPctRank = fgPctRank;
  }
  final int? plusMinusRank = jsonConvert.convert<int>(json['PLUS_MINUS_RANK']);
  if (plusMinusRank != null) {
    teamPlayer.plusMinusRank = plusMinusRank;
  }
  final double? pfd = jsonConvert.convert<double>(json['PFD']);
  if (pfd != null) {
    teamPlayer.pfd = pfd;
  }
  final int? pfRank = jsonConvert.convert<int>(json['PF_RANK']);
  if (pfRank != null) {
    teamPlayer.pfRank = pfRank;
  }
  final int? drebRank = jsonConvert.convert<int>(json['DREB_RANK']);
  if (drebRank != null) {
    teamPlayer.drebRank = drebRank;
  }
  final int? tovRank = jsonConvert.convert<int>(json['TOV_RANK']);
  if (tovRank != null) {
    teamPlayer.tovRank = tovRank;
  }
  final double? fga = jsonConvert.convert<double>(json['FGA']);
  if (fga != null) {
    teamPlayer.fga = fga;
  }
  final int? fg3PctRank = jsonConvert.convert<int>(json['FG3_PCT_RANK']);
  if (fg3PctRank != null) {
    teamPlayer.fg3PctRank = fg3PctRank;
  }
  final int? blkRank = jsonConvert.convert<int>(json['BLK_RANK']);
  if (blkRank != null) {
    teamPlayer.blkRank = blkRank;
  }
  final String? teamAbbreviation = jsonConvert.convert<String>(
      json['TEAM_ABBREVIATION']);
  if (teamAbbreviation != null) {
    teamPlayer.teamAbbreviation = teamAbbreviation;
  }
  final double? nbaFantasyPts = jsonConvert.convert<double>(
      json['NBA_FANTASY_PTS']);
  if (nbaFantasyPts != null) {
    teamPlayer.nbaFantasyPts = nbaFantasyPts;
  }
  final double? fgm = jsonConvert.convert<double>(json['FGM']);
  if (fgm != null) {
    teamPlayer.fgm = fgm;
  }
  final int? lRank = jsonConvert.convert<int>(json['L_RANK']);
  if (lRank != null) {
    teamPlayer.lRank = lRank;
  }
  final double? wPct = jsonConvert.convert<double>(json['W_PCT']);
  if (wPct != null) {
    teamPlayer.wPct = wPct;
  }
  final int? fg3aRank = jsonConvert.convert<int>(json['FG3A_RANK']);
  if (fg3aRank != null) {
    teamPlayer.fg3aRank = fg3aRank;
  }
  final String? nICKNAME = jsonConvert.convert<String>(json['NICKNAME']);
  if (nICKNAME != null) {
    teamPlayer.nICKNAME = nICKNAME;
  }
  final double? fta = jsonConvert.convert<double>(json['FTA']);
  if (fta != null) {
    teamPlayer.fta = fta;
  }
  final int? nbaFantasyPtsRank = jsonConvert.convert<int>(
      json['NBA_FANTASY_PTS_RANK']);
  if (nbaFantasyPtsRank != null) {
    teamPlayer.nbaFantasyPtsRank = nbaFantasyPtsRank;
  }
  final double? min = jsonConvert.convert<double>(json['MIN']);
  if (min != null) {
    teamPlayer.min = min;
  }
  final int? dD2 = jsonConvert.convert<int>(json['DD2']);
  if (dD2 != null) {
    teamPlayer.dD2 = dD2;
  }
  final int? dd2Rank = jsonConvert.convert<int>(json['DD2_RANK']);
  if (dd2Rank != null) {
    teamPlayer.dd2Rank = dd2Rank;
  }
  final int? playerId = jsonConvert.convert<int>(json['PLAYER_ID']);
  if (playerId != null) {
    teamPlayer.playerId = playerId;
  }
  final double? tov = jsonConvert.convert<double>(json['TOV']);
  if (tov != null) {
    teamPlayer.tov = tov;
  }
  final int? fg3mRank = jsonConvert.convert<int>(json['FG3M_RANK']);
  if (fg3mRank != null) {
    teamPlayer.fg3mRank = fg3mRank;
  }
  final double? ftm = jsonConvert.convert<double>(json['FTM']);
  if (ftm != null) {
    teamPlayer.ftm = ftm;
  }
  final int? teamId = jsonConvert.convert<int>(json['TEAM_ID']);
  if (teamId != null) {
    teamPlayer.teamId = teamId;
  }
  final double? blkA = jsonConvert.convert<double>(json['BLKA']);
  if (blkA != null) {
    teamPlayer.blkA = blkA;
  }
  final double? blk = jsonConvert.convert<double>(json['BLK']);
  if (blk != null) {
    teamPlayer.blk = blk;
  }
  final double? plusMinus = jsonConvert.convert<double>(json['PLUS_MINUS']);
  if (plusMinus != null) {
    teamPlayer.plusMinus = plusMinus;
  }
  final int? td3 = jsonConvert.convert<int>(json['TD3']);
  if (td3 != null) {
    teamPlayer.td3 = td3;
  }
  final int? wRank = jsonConvert.convert<int>(json['W_RANK']);
  if (wRank != null) {
    teamPlayer.wRank = wRank;
  }
  final int? minRank = jsonConvert.convert<int>(json['MIN_RANK']);
  if (minRank != null) {
    teamPlayer.minRank = minRank;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    teamPlayer.fgPct = fgPct;
  }
  final int? l = jsonConvert.convert<int>(json['L']);
  if (l != null) {
    teamPlayer.l = l;
  }
  final double? wnbaFantasyPts = jsonConvert.convert<double>(
      json['WNBA_FANTASY_PTS']);
  if (wnbaFantasyPts != null) {
    teamPlayer.wnbaFantasyPts = wnbaFantasyPts;
  }
  final double? pts = jsonConvert.convert<double>(json['PTS']);
  if (pts != null) {
    teamPlayer.pts = pts;
  }
  final double? fg3A = jsonConvert.convert<double>(json['FG3A']);
  if (fg3A != null) {
    teamPlayer.fg3A = fg3A;
  }
  final int? ftmRank = jsonConvert.convert<int>(json['FTM_RANK']);
  if (ftmRank != null) {
    teamPlayer.ftmRank = ftmRank;
  }
  final int? ftaRank = jsonConvert.convert<int>(json['FTA_RANK']);
  if (ftaRank != null) {
    teamPlayer.ftaRank = ftaRank;
  }
  final int? fgaRank = jsonConvert.convert<int>(json['FGA_RANK']);
  if (fgaRank != null) {
    teamPlayer.fgaRank = fgaRank;
  }
  final int? rebRank = jsonConvert.convert<int>(json['REB_RANK']);
  if (rebRank != null) {
    teamPlayer.rebRank = rebRank;
  }
  final int? blkaRank = jsonConvert.convert<int>(json['BLKA_RANK']);
  if (blkaRank != null) {
    teamPlayer.blkaRank = blkaRank;
  }
  final int? w = jsonConvert.convert<int>(json['W']);
  if (w != null) {
    teamPlayer.w = w;
  }
  final int? td3Rank = jsonConvert.convert<int>(json['TD3_RANK']);
  if (td3Rank != null) {
    teamPlayer.td3Rank = td3Rank;
  }
  final double? fg3M = jsonConvert.convert<double>(json['FG3M']);
  if (fg3M != null) {
    teamPlayer.fg3M = fg3M;
  }
  final double? age = jsonConvert.convert<double>(json['AGE']);
  if (age != null) {
    teamPlayer.age = age;
  }
  final int? wPctRank = jsonConvert.convert<int>(json['W_PCT_RANK']);
  if (wPctRank != null) {
    teamPlayer.wPctRank = wPctRank;
  }
  final int? astRank = jsonConvert.convert<int>(json['AST_RANK']);
  if (astRank != null) {
    teamPlayer.astRank = astRank;
  }
  final String? playerName = jsonConvert.convert<String>(json['PLAYER_NAME']);
  if (playerName != null) {
    teamPlayer.playerName = playerName;
  }
  final double? ast = jsonConvert.convert<double>(json['AST']);
  if (ast != null) {
    teamPlayer.ast = ast;
  }
  final double? oreb = jsonConvert.convert<double>(json['OREB']);
  if (oreb != null) {
    teamPlayer.oreb = oreb;
  }
  final int? ftPctRank = jsonConvert.convert<int>(json['FT_PCT_RANK']);
  if (ftPctRank != null) {
    teamPlayer.ftPctRank = ftPctRank;
  }
  final int? gp = jsonConvert.convert<int>(json['GP']);
  if (gp != null) {
    teamPlayer.gp = gp;
  }
  final int? fgmRank = jsonConvert.convert<int>(json['FGM_RANK']);
  if (fgmRank != null) {
    teamPlayer.fgmRank = fgmRank;
  }
  final double? reb = jsonConvert.convert<double>(json['REB']);
  if (reb != null) {
    teamPlayer.reb = reb;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    teamPlayer.ftPct = ftPct;
  }
  final int? wnbaFantasyPtsRank = jsonConvert.convert<int>(
      json['WNBA_FANTASY_PTS_RANK']);
  if (wnbaFantasyPtsRank != null) {
    teamPlayer.wnbaFantasyPtsRank = wnbaFantasyPtsRank;
  }
  final int? ptsRank = jsonConvert.convert<int>(json['PTS_RANK']);
  if (ptsRank != null) {
    teamPlayer.ptsRank = ptsRank;
  }
  final double? pf = jsonConvert.convert<double>(json['PF']);
  if (pf != null) {
    teamPlayer.pf = pf;
  }
  final int? gpRank = jsonConvert.convert<int>(json['GP_RANK']);
  if (gpRank != null) {
    teamPlayer.gpRank = gpRank;
  }
  final int? stlRank = jsonConvert.convert<int>(json['STL_RANK']);
  if (stlRank != null) {
    teamPlayer.stlRank = stlRank;
  }
  final String? conference = jsonConvert.convert<String>(json['CONFERENCE']);
  if (conference != null) {
    teamPlayer.conference = conference;
  }
  final int? division = jsonConvert.convert<int>(json['DIVISION_RANK']);
  if (division != null) {
    teamPlayer.division = division;
  }
  return teamPlayer;
}

Map<String, dynamic> $TeamPlayerToJson(TeamPlayer entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['PFD_RANK'] = entity.pfdRank;
  data['FG3_PCT'] = entity.fg3Pct;
  data['OREB_RANK'] = entity.orebRank;
  data['STL'] = entity.stl;
  data['DREB'] = entity.dreb;
  data['FG_PCT_RANK'] = entity.fgPctRank;
  data['PLUS_MINUS_RANK'] = entity.plusMinusRank;
  data['PFD'] = entity.pfd;
  data['PF_RANK'] = entity.pfRank;
  data['DREB_RANK'] = entity.drebRank;
  data['TOV_RANK'] = entity.tovRank;
  data['FGA'] = entity.fga;
  data['FG3_PCT_RANK'] = entity.fg3PctRank;
  data['BLK_RANK'] = entity.blkRank;
  data['TEAM_ABBREVIATION'] = entity.teamAbbreviation;
  data['NBA_FANTASY_PTS'] = entity.nbaFantasyPts;
  data['FGM'] = entity.fgm;
  data['L_RANK'] = entity.lRank;
  data['W_PCT'] = entity.wPct;
  data['FG3A_RANK'] = entity.fg3aRank;
  data['NICKNAME'] = entity.nICKNAME;
  data['FTA'] = entity.fta;
  data['NBA_FANTASY_PTS_RANK'] = entity.nbaFantasyPtsRank;
  data['MIN'] = entity.min;
  data['DD2'] = entity.dD2;
  data['DD2_RANK'] = entity.dd2Rank;
  data['PLAYER_ID'] = entity.playerId;
  data['TOV'] = entity.tov;
  data['FG3M_RANK'] = entity.fg3mRank;
  data['FTM'] = entity.ftm;
  data['TEAM_ID'] = entity.teamId;
  data['BLKA'] = entity.blkA;
  data['BLK'] = entity.blk;
  data['PLUS_MINUS'] = entity.plusMinus;
  data['TD3'] = entity.td3;
  data['W_RANK'] = entity.wRank;
  data['MIN_RANK'] = entity.minRank;
  data['FG_PCT'] = entity.fgPct;
  data['L'] = entity.l;
  data['WNBA_FANTASY_PTS'] = entity.wnbaFantasyPts;
  data['PTS'] = entity.pts;
  data['FG3A'] = entity.fg3A;
  data['FTM_RANK'] = entity.ftmRank;
  data['FTA_RANK'] = entity.ftaRank;
  data['FGA_RANK'] = entity.fgaRank;
  data['REB_RANK'] = entity.rebRank;
  data['BLKA_RANK'] = entity.blkaRank;
  data['W'] = entity.w;
  data['TD3_RANK'] = entity.td3Rank;
  data['FG3M'] = entity.fg3M;
  data['AGE'] = entity.age;
  data['W_PCT_RANK'] = entity.wPctRank;
  data['AST_RANK'] = entity.astRank;
  data['PLAYER_NAME'] = entity.playerName;
  data['AST'] = entity.ast;
  data['OREB'] = entity.oreb;
  data['FT_PCT_RANK'] = entity.ftPctRank;
  data['GP'] = entity.gp;
  data['FGM_RANK'] = entity.fgmRank;
  data['REB'] = entity.reb;
  data['FT_PCT'] = entity.ftPct;
  data['WNBA_FANTASY_PTS_RANK'] = entity.wnbaFantasyPtsRank;
  data['PTS_RANK'] = entity.ptsRank;
  data['PF'] = entity.pf;
  data['GP_RANK'] = entity.gpRank;
  data['STL_RANK'] = entity.stlRank;
  data['CONFERENCE'] = entity.conference;
  data['DIVISION_RANK'] = entity.division;
  return data;
}

extension TeamPlayerExtension on TeamPlayer {
  TeamPlayer copyWith({
    int? pfdRank,
    double? fg3Pct,
    int? orebRank,
    double? stl,
    double? dreb,
    int? fgPctRank,
    int? plusMinusRank,
    double? pfd,
    int? pfRank,
    int? drebRank,
    int? tovRank,
    double? fga,
    int? fg3PctRank,
    int? blkRank,
    String? teamAbbreviation,
    double? nbaFantasyPts,
    double? fgm,
    int? lRank,
    double? wPct,
    int? fg3aRank,
    String? nICKNAME,
    double? fta,
    int? nbaFantasyPtsRank,
    double? min,
    int? dD2,
    int? dd2Rank,
    int? playerId,
    double? tov,
    int? fg3mRank,
    double? ftm,
    int? teamId,
    double? blkA,
    double? blk,
    double? plusMinus,
    int? td3,
    int? wRank,
    int? minRank,
    double? fgPct,
    int? l,
    double? wnbaFantasyPts,
    double? pts,
    double? fg3A,
    int? ftmRank,
    int? ftaRank,
    int? fgaRank,
    int? rebRank,
    int? blkaRank,
    int? w,
    int? td3Rank,
    double? fg3M,
    double? age,
    int? wPctRank,
    int? astRank,
    String? playerName,
    double? ast,
    double? oreb,
    int? ftPctRank,
    int? gp,
    int? fgmRank,
    double? reb,
    double? ftPct,
    int? wnbaFantasyPtsRank,
    int? ptsRank,
    double? pf,
    int? gpRank,
    int? stlRank,
    String? conference,
    int? division,
  }) {
    return TeamPlayer()
      ..pfdRank = pfdRank ?? this.pfdRank
      ..fg3Pct = fg3Pct ?? this.fg3Pct
      ..orebRank = orebRank ?? this.orebRank
      ..stl = stl ?? this.stl
      ..dreb = dreb ?? this.dreb
      ..fgPctRank = fgPctRank ?? this.fgPctRank
      ..plusMinusRank = plusMinusRank ?? this.plusMinusRank
      ..pfd = pfd ?? this.pfd
      ..pfRank = pfRank ?? this.pfRank
      ..drebRank = drebRank ?? this.drebRank
      ..tovRank = tovRank ?? this.tovRank
      ..fga = fga ?? this.fga
      ..fg3PctRank = fg3PctRank ?? this.fg3PctRank
      ..blkRank = blkRank ?? this.blkRank
      ..teamAbbreviation = teamAbbreviation ?? this.teamAbbreviation
      ..nbaFantasyPts = nbaFantasyPts ?? this.nbaFantasyPts
      ..fgm = fgm ?? this.fgm
      ..lRank = lRank ?? this.lRank
      ..wPct = wPct ?? this.wPct
      ..fg3aRank = fg3aRank ?? this.fg3aRank
      ..nICKNAME = nICKNAME ?? this.nICKNAME
      ..fta = fta ?? this.fta
      ..nbaFantasyPtsRank = nbaFantasyPtsRank ?? this.nbaFantasyPtsRank
      ..min = min ?? this.min
      ..dD2 = dD2 ?? this.dD2
      ..dd2Rank = dd2Rank ?? this.dd2Rank
      ..playerId = playerId ?? this.playerId
      ..tov = tov ?? this.tov
      ..fg3mRank = fg3mRank ?? this.fg3mRank
      ..ftm = ftm ?? this.ftm
      ..teamId = teamId ?? this.teamId
      ..blkA = blkA ?? this.blkA
      ..blk = blk ?? this.blk
      ..plusMinus = plusMinus ?? this.plusMinus
      ..td3 = td3 ?? this.td3
      ..wRank = wRank ?? this.wRank
      ..minRank = minRank ?? this.minRank
      ..fgPct = fgPct ?? this.fgPct
      ..l = l ?? this.l
      ..wnbaFantasyPts = wnbaFantasyPts ?? this.wnbaFantasyPts
      ..pts = pts ?? this.pts
      ..fg3A = fg3A ?? this.fg3A
      ..ftmRank = ftmRank ?? this.ftmRank
      ..ftaRank = ftaRank ?? this.ftaRank
      ..fgaRank = fgaRank ?? this.fgaRank
      ..rebRank = rebRank ?? this.rebRank
      ..blkaRank = blkaRank ?? this.blkaRank
      ..w = w ?? this.w
      ..td3Rank = td3Rank ?? this.td3Rank
      ..fg3M = fg3M ?? this.fg3M
      ..age = age ?? this.age
      ..wPctRank = wPctRank ?? this.wPctRank
      ..astRank = astRank ?? this.astRank
      ..playerName = playerName ?? this.playerName
      ..ast = ast ?? this.ast
      ..oreb = oreb ?? this.oreb
      ..ftPctRank = ftPctRank ?? this.ftPctRank
      ..gp = gp ?? this.gp
      ..fgmRank = fgmRank ?? this.fgmRank
      ..reb = reb ?? this.reb
      ..ftPct = ftPct ?? this.ftPct
      ..wnbaFantasyPtsRank = wnbaFantasyPtsRank ?? this.wnbaFantasyPtsRank
      ..ptsRank = ptsRank ?? this.ptsRank
      ..pf = pf ?? this.pf
      ..gpRank = gpRank ?? this.gpRank
      ..stlRank = stlRank ?? this.stlRank
      ..conference = conference ?? this.conference
      ..division = division ?? this.division;
  }
}

TeamHistory $TeamHistoryFromJson(Map<String, dynamic> json) {
  final TeamHistory teamHistory = TeamHistory();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamHistory.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    teamHistory.gameType = gameType;
  }
  final List<
      dynamic>? homePlayerScoreList = (json['homePlayerScoreList'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (homePlayerScoreList != null) {
    teamHistory.homePlayerScoreList = homePlayerScoreList;
  }
  final List<
      dynamic>? awayPlayerScoreList = (json['awayPlayerScoreList'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (awayPlayerScoreList != null) {
    teamHistory.awayPlayerScoreList = awayPlayerScoreList;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    teamHistory.gameTime = gameTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamHistory.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    teamHistory.gameStartTime = gameStartTime;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    teamHistory.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    teamHistory.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    teamHistory.awayTeamScore = awayTeamScore;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    teamHistory.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    teamHistory.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    teamHistory.status = status;
  }
  return teamHistory;
}

Map<String, dynamic> $TeamHistoryToJson(TeamHistory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['homePlayerScoreList'] = entity.homePlayerScoreList;
  data['awayPlayerScoreList'] = entity.awayPlayerScoreList;
  data['gameTime'] = entity.gameTime;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension TeamHistoryExtension on TeamHistory {
  TeamHistory copyWith({
    int? gameId,
    int? gameType,
    List<dynamic>? homePlayerScoreList,
    List<dynamic>? awayPlayerScoreList,
    int? gameTime,
    int? createTime,
    int? gameStartTime,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return TeamHistory()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..homePlayerScoreList = homePlayerScoreList ?? this.homePlayerScoreList
      ..awayPlayerScoreList = awayPlayerScoreList ?? this.awayPlayerScoreList
      ..gameTime = gameTime ?? this.gameTime
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}