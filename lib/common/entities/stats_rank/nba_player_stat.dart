// class NbaPlayerStat {
//   double? pfdRank;
//   double? fg3Pct;
//   double? orebRank;
//   double? stl;
//   double? dreb;
//   double? fgPctRank;
//   double? plusMinusRank;
//   double? pfd;
//   double? pfRank;
//   double? drebRank;
//   double? tovRank;
//   double? fga;
//   double? fg3PctRank;
//   double? blkRank;
//   String? teamAbbreviation;
//   double? nbaFantasyPts;
//   double? fgm;
//   double? lRank;
//   double? wPct;
//   double? fg3ARank;
//   String? nickname;
//   double? fta;
//   double? nbaFantasyPtsRank;
//   double? min;
//   double? dd2;
//   double? dd2Rank;
//   int? playerId;
//   double? tov;
//   double? fg3MRank;
//   double? ftm;
//   double? teamId;
//   double? blka;
//   double? blk;
//   double? plusMinus;
//   double? td3;
//   double? wRank;
//   double? minRank;
//   double? fgPct;
//   double? l;
//   double? wnbaFantasyPts;
//   double? pts;
//   double? fg3A;
//   double? ftmRank;
//   double? ftaRank;
//   double? fgaRank;
//   double? rebRank;
//   double? blkaRank;
//   double? w;
//   double? td3Rank;
//   double? fg3M;
//   double? age;
//   double? wPctRank;
//   double? astRank;
//   String? playerName;
//   double? ast;
//   double? oreb;
//   double? ftPctRank;
//   double? gp;
//   double? fgmRank;
//   double? reb;
//   double? ftPct;
//   double? wnbaFantasyPtsRank;
//   double? ptsRank;
//   double? pf;
//   double? gpRank;
//   double? stlRank;

//   NbaPlayerStat({
//     this.pfdRank,
//     this.fg3Pct,
//     this.orebRank,
//     this.stl,
//     this.dreb,
//     this.fgPctRank,
//     this.plusMinusRank,
//     this.pfd,
//     this.pfRank,
//     this.drebRank,
//     this.tovRank,
//     this.fga,
//     this.fg3PctRank,
//     this.blkRank,
//     this.teamAbbreviation,
//     this.nbaFantasyPts,
//     this.fgm,
//     this.lRank,
//     this.wPct,
//     this.fg3ARank,
//     this.nickname,
//     this.fta,
//     this.nbaFantasyPtsRank,
//     this.min,
//     this.dd2,
//     this.dd2Rank,
//     this.playerId,
//     this.tov,
//     this.fg3MRank,
//     this.ftm,
//     this.teamId,
//     this.blka,
//     this.blk,
//     this.plusMinus,
//     this.td3,
//     this.wRank,
//     this.minRank,
//     this.fgPct,
//     this.l,
//     this.wnbaFantasyPts,
//     this.pts,
//     this.fg3A,
//     this.ftmRank,
//     this.ftaRank,
//     this.fgaRank,
//     this.rebRank,
//     this.blkaRank,
//     this.w,
//     this.td3Rank,
//     this.fg3M,
//     this.age,
//     this.wPctRank,
//     this.astRank,
//     this.playerName,
//     this.ast,
//     this.oreb,
//     this.ftPctRank,
//     this.gp,
//     this.fgmRank,
//     this.reb,
//     this.ftPct,
//     this.wnbaFantasyPtsRank,
//     this.ptsRank,
//     this.pf,
//     this.gpRank,
//     this.stlRank,
//   });

//   factory NbaPlayerStat.fromJson(Map<String, dynamic> json) => NbaPlayerStat(
//         pfdRank: json['PFD_RANK'] as double?,
//         fg3Pct: (json['FG3_PCT'] as num?)?.toDouble(),
//         orebRank: json['OREB_RANK'] as double?,
//         stl: (json['STL'] as num?)?.toDouble(),
//         dreb: (json['DREB'] as num?)?.toDouble(),
//         fgPctRank: json['FG_PCT_RANK'] as double?,
//         plusMinusRank: json['PLUS_MINUS_RANK'] as double?,
//         pfd: (json['PFD'] as num?)?.toDouble(),
//         pfRank: json['PF_RANK'] as double?,
//         drebRank: json['DREB_RANK'] as double?,
//         tovRank: json['TOV_RANK'] as double?,
//         fga: (json['FGA'] as num?)?.toDouble(),
//         fg3PctRank: json['FG3_PCT_RANK'] as double?,
//         blkRank: json['BLK_RANK'] as double?,
//         teamAbbreviation: json['TEAM_ABBREVIATION'] as String?,
//         nbaFantasyPts: json['NBA_FANTASY_PTS'] as double?,
//         fgm: (json['FGM'] as num?)?.toDouble(),
//         lRank: json['L_RANK'] as double?,
//         wPct: (json['W_PCT'] as num?)?.toDouble(),
//         fg3ARank: json['FG3A_RANK'] as double?,
//         nickname: json['NICKNAME'] as String?,
//         fta: (json['FTA'] as num?)?.toDouble(),
//         nbaFantasyPtsRank: json['NBA_FANTASY_PTS_RANK'] as double?,
//         min: (json['MIN'] as num?)?.toDouble(),
//         dd2: json['DD2'] as double?,
//         dd2Rank: json['DD2_RANK'] as double?,
//         playerId: json['PLAYER_ID'] as int?,
//         tov: (json['TOV'] as num?)?.toDouble(),
//         fg3MRank: json['FG3M_RANK'] as double?,
//         ftm: (json['FTM'] as num?)?.toDouble(),
//         teamId: json['TEAM_ID'] as double?,
//         blka: (json['BLKA'] as num?)?.toDouble(),
//         blk: (json['BLK'] as num?)?.toDouble(),
//         plusMinus: (json['PLUS_MINUS'] as num?)?.toDouble(),
//         td3: json['TD3'] as double?,
//         wRank: json['W_RANK'] as double?,
//         minRank: json['MIN_RANK'] as double?,
//         fgPct: (json['FG_PCT'] as num?)?.toDouble(),
//         l: json['L'] as double?,
//         wnbaFantasyPts: (json['WNBA_FANTASY_PTS'] as num?)?.toDouble(),
//         pts: (json['PTS'] as num?)?.toDouble(),
//         fg3A: (json['FG3A'] as num?)?.toDouble(),
//         ftmRank: json['FTM_RANK'] as double?,
//         ftaRank: json['FTA_RANK'] as double?,
//         fgaRank: json['FGA_RANK'] as double?,
//         rebRank: json['REB_RANK'] as double?,
//         blkaRank: json['BLKA_RANK'] as double?,
//         w: json['W'] as double?,
//         td3Rank: json['TD3_RANK'] as double?,
//         fg3M: (json['FG3M'] as num?)?.toDouble(),
//         age: json['AGE'] as double?,
//         wPctRank: json['W_PCT_RANK'] as double?,
//         astRank: json['AST_RANK'] as double?,
//         playerName: json['PLAYER_NAME'] as String?,
//         ast: (json['AST'] as num?)?.toDouble(),
//         oreb: (json['OREB'] as num?)?.toDouble(),
//         ftPctRank: json['FT_PCT_RANK'] as double?,
//         gp: json['GP'] as double?,
//         fgmRank: json['FGM_RANK'] as double?,
//         reb: (json['REB'] as num?)?.toDouble(),
//         ftPct: (json['FT_PCT'] as num?)?.toDouble(),
//         wnbaFantasyPtsRank: json['WNBA_FANTASY_PTS_RANK'] as double?,
//         ptsRank: json['PTS_RANK'] as double?,
//         pf: (json['PF'] as num?)?.toDouble(),
//         gpRank: json['GP_RANK'] as double?,
//         stlRank: json['STL_RANK'] as double?,
//       );

//   Map<String, dynamic> toJson() => {
//         'PFD_RANK': pfdRank,
//         'FG3_PCT': fg3Pct,
//         'OREB_RANK': orebRank,
//         'STL': stl,
//         'DREB': dreb,
//         'FG_PCT_RANK': fgPctRank,
//         'PLUS_MINUS_RANK': plusMinusRank,
//         'PFD': pfd,
//         'PF_RANK': pfRank,
//         'DREB_RANK': drebRank,
//         'TOV_RANK': tovRank,
//         'FGA': fga,
//         'FG3_PCT_RANK': fg3PctRank,
//         'BLK_RANK': blkRank,
//         'TEAM_ABBREVIATION': teamAbbreviation,
//         'NBA_FANTASY_PTS': nbaFantasyPts,
//         'FGM': fgm,
//         'L_RANK': lRank,
//         'W_PCT': wPct,
//         'FG3A_RANK': fg3ARank,
//         'NICKNAME': nickname,
//         'FTA': fta,
//         'NBA_FANTASY_PTS_RANK': nbaFantasyPtsRank,
//         'MIN': min,
//         'DD2': dd2,
//         'DD2_RANK': dd2Rank,
//         'PLAYER_ID': playerId,
//         'TOV': tov,
//         'FG3M_RANK': fg3MRank,
//         'FTM': ftm,
//         'TEAM_ID': teamId,
//         'BLKA': blka,
//         'BLK': blk,
//         'PLUS_MINUS': plusMinus,
//         'TD3': td3,
//         'W_RANK': wRank,
//         'MIN_RANK': minRank,
//         'FG_PCT': fgPct,
//         'L': l,
//         'WNBA_FANTASY_PTS': wnbaFantasyPts,
//         'PTS': pts,
//         'FG3A': fg3A,
//         'FTM_RANK': ftmRank,
//         'FTA_RANK': ftaRank,
//         'FGA_RANK': fgaRank,
//         'REB_RANK': rebRank,
//         'BLKA_RANK': blkaRank,
//         'W': w,
//         'TD3_RANK': td3Rank,
//         'FG3M': fg3M,
//         'AGE': age,
//         'W_PCT_RANK': wPctRank,
//         'AST_RANK': astRank,
//         'PLAYER_NAME': playerName,
//         'AST': ast,
//         'OREB': oreb,
//         'FT_PCT_RANK': ftPctRank,
//         'GP': gp,
//         'FGM_RANK': fgmRank,
//         'REB': reb,
//         'FT_PCT': ftPct,
//         'WNBA_FANTASY_PTS_RANK': wnbaFantasyPtsRank,
//         'PTS_RANK': ptsRank,
//         'PF': pf,
//         'GP_RANK': gpRank,
//         'STL_RANK': stlRank,
//       };
// }
class NbaPlayerStat {
  double? blk;
  double? fg3Pct;
  double? eff;
  int? rank;
  double? stl;
  double? fgPct;
  double? dreb;
  double? pts;
  double? fg3A;
  double? fg3M;
  double? fga;
  double? ast;
  double? oreb;
  int? gp;
  double? fgm;
  double? reb;
  double? ftPct;
  String? player;
  double? fta;
  double? min;
  int? playerId;
  String? team;
  double? tov;
  double? ftm;
  int? teamId;
  String? playerName;
  String? teamAbbreviation;
  String? nickname;

  NbaPlayerStat({
    this.blk,
    this.fg3Pct,
    this.eff,
    this.rank,
    this.stl,
    this.fgPct,
    this.dreb,
    this.pts,
    this.fg3A,
    this.fg3M,
    this.fga,
    this.ast,
    this.oreb,
    this.gp,
    this.fgm,
    this.reb,
    this.ftPct,
    this.player,
    this.fta,
    this.min,
    this.playerId,
    this.team,
    this.tov,
    this.ftm,
    this.teamId,
    this.playerName,
    this.teamAbbreviation,
    this.nickname,
  });

  factory NbaPlayerStat.fromJson(Map<String, dynamic> json) => NbaPlayerStat(
        blk: (json['BLK'] as num?)?.toDouble(),
        fg3Pct: (json['FG3_PCT'] as num?)?.toDouble(),
        eff: (json['EFF'] as num?)?.toDouble(),
        rank: json['RANK'] as int?,
        stl: (json['STL'] as num?)?.toDouble(),
        fgPct: (json['FG_PCT'] as num?)?.toDouble(),
        dreb: (json['DREB'] as num?)?.toDouble(),
        pts: (json['PTS'] as num?)?.toDouble(),
        fg3A: (json['FG3A'] as num?)?.toDouble(),
        fg3M: (json['FG3M'] as num?)?.toDouble(),
        fga: (json['FGA'] as num?)?.toDouble(),
        ast: (json['AST'] as num?)?.toDouble(),
        oreb: (json['OREB'] as num?)?.toDouble(),
        gp: json['GP'] as int?,
        fgm: (json['FGM'] as num?)?.toDouble(),
        reb: (json['REB'] as num?)?.toDouble(),
        ftPct: (json['FT_PCT'] as num?)?.toDouble(),
        player: json['PLAYER'] as String?,
        fta: (json['FTA'] as num?)?.toDouble(),
        min: (json['MIN'] as num?)?.toDouble(),
        playerId: json['PLAYER_ID'] as int?,
        team: json['TEAM'] as String?,
        tov: json['TOV'] as double?,
        ftm: (json['FTM'] as num?)?.toDouble(),
        teamId: json['TEAM_ID'] as int?,
        playerName: json['PLAYER_NAME'] as String?,
        teamAbbreviation: json['TEAM_ABBREVIATION'] as String?,
        nickname: json['NICKNAME'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'BLK': blk,
        'FG3_PCT': fg3Pct,
        'EFF': eff,
        'RANK': rank,
        'STL': stl,
        'FG_PCT': fgPct,
        'DREB': dreb,
        'PTS': pts,
        'FG3A': fg3A,
        'FG3M': fg3M,
        'FGA': fga,
        'AST': ast,
        'OREB': oreb,
        'GP': gp,
        'FGM': fgm,
        'REB': reb,
        'FT_PCT': ftPct,
        'PLAYER': player,
        'FTA': fta,
        'MIN': min,
        'PLAYER_ID': playerId,
        'TEAM': team,
        'TOV': tov,
        'FTM': ftm,
        'TEAM_ID': teamId,
      };
}
