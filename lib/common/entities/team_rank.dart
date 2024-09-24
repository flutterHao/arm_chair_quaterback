class StarsTeamRank {
  int? pfdRank;
  double? fg3Pct;
  int? orebRank;
  double? stl;
  double? dreb;
  int? fgPctRank;
  int? plusMinusRank;
  double? pfd;
  int? pfRank;
  int? drebRank;
  int? tovRank;
  double? fga;
  int? fg3PctRank;
  int? blkRank;
  double? fgm;
  int? lRank;
  double? wPct;
  int? fg3ARank;
  double? fta;
  double? min;
  double? tov;
  int? fg3MRank;
  double? ftm;
  int? teamId;
  double? blka;
  double? blk;
  double? plusMinus;
  int? wRank;
  int? minRank;
  double? fgPct;
  int? l;
  double? pts;
  double? fg3A;
  int? ftmRank;
  int? ftaRank;
  int? fgaRank;
  int? rebRank;
  int? blkaRank;
  int? w;
  double? fg3M;
  int? wPctRank;
  int? astRank;
  double? ast;
  double? oreb;
  int? ftPctRank;
  int? gp;
  int? fgmRank;
  double? reb;
  double? ftPct;
  int? ptsRank;
  String? teamName;
  double? pf;
  int? gpRank;
  int? stlRank;
  String? shortName;

  StarsTeamRank({
    this.pfdRank,
    this.fg3Pct,
    this.orebRank,
    this.stl,
    this.dreb,
    this.fgPctRank,
    this.plusMinusRank,
    this.pfd,
    this.pfRank,
    this.drebRank,
    this.tovRank,
    this.fga,
    this.fg3PctRank,
    this.blkRank,
    this.fgm,
    this.lRank,
    this.wPct,
    this.fg3ARank,
    this.fta,
    this.min,
    this.tov,
    this.fg3MRank,
    this.ftm,
    this.teamId,
    this.blka,
    this.blk,
    this.plusMinus,
    this.wRank,
    this.minRank,
    this.fgPct,
    this.l,
    this.pts,
    this.fg3A,
    this.ftmRank,
    this.ftaRank,
    this.fgaRank,
    this.rebRank,
    this.blkaRank,
    this.w,
    this.fg3M,
    this.wPctRank,
    this.astRank,
    this.ast,
    this.oreb,
    this.ftPctRank,
    this.gp,
    this.fgmRank,
    this.reb,
    this.ftPct,
    this.ptsRank,
    this.teamName,
    this.pf,
    this.gpRank,
    this.stlRank,
  });

  factory StarsTeamRank.fromJson(Map<String, dynamic> json) => StarsTeamRank(
        pfdRank: json['PFD_RANK'] as int?,
        fg3Pct: (json['FG3_PCT'] as num?)?.toDouble(),
        orebRank: json['OREB_RANK'] as int?,
        stl: (json['STL'] as num?)?.toDouble(),
        dreb: (json['DREB'] as num?)?.toDouble(),
        fgPctRank: json['FG_PCT_RANK'] as int?,
        plusMinusRank: json['PLUS_MINUS_RANK'] as int?,
        pfd: json['PFD'] as double?,
        pfRank: json['PF_RANK'] as int?,
        drebRank: json['DREB_RANK'] as int?,
        tovRank: json['TOV_RANK'] as int?,
        fga: (json['FGA'] as num?)?.toDouble(),
        fg3PctRank: json['FG3_PCT_RANK'] as int?,
        blkRank: json['BLK_RANK'] as int?,
        fgm: (json['FGM'] as num?)?.toDouble(),
        lRank: json['L_RANK'] as int?,
        wPct: (json['W_PCT'] as num?)?.toDouble(),
        fg3ARank: json['FG3A_RANK'] as int?,
        fta: (json['FTA'] as num?)?.toDouble(),
        min: (json['MIN'] as num?)?.toDouble(),
        tov: (json['TOV'] as num?)?.toDouble(),
        fg3MRank: json['FG3M_RANK'] as int?,
        ftm: (json['FTM'] as num?)?.toDouble(),
        teamId: json['TEAM_ID'] as int?,
        blka: (json['BLKA'] as num?)?.toDouble(),
        blk: (json['BLK'] as num?)?.toDouble(),
        plusMinus: (json['PLUS_MINUS'] as num?)?.toDouble(),
        wRank: json['W_RANK'] as int?,
        minRank: json['MIN_RANK'] as int?,
        fgPct: (json['FG_PCT'] as num?)?.toDouble(),
        l: json['L'] as int?,
        pts: (json['PTS'] as num?)?.toDouble(),
        fg3A: (json['FG3A'] as num?)?.toDouble(),
        ftmRank: json['FTM_RANK'] as int?,
        ftaRank: json['FTA_RANK'] as int?,
        fgaRank: json['FGA_RANK'] as int?,
        rebRank: json['REB_RANK'] as int?,
        blkaRank: json['BLKA_RANK'] as int?,
        w: json['W'] as int?,
        fg3M: (json['FG3M'] as num?)?.toDouble(),
        wPctRank: json['W_PCT_RANK'] as int?,
        astRank: json['AST_RANK'] as int?,
        ast: (json['AST'] as num?)?.toDouble(),
        oreb: (json['OREB'] as num?)?.toDouble(),
        ftPctRank: json['FT_PCT_RANK'] as int?,
        gp: json['GP'] as int?,
        fgmRank: json['FGM_RANK'] as int?,
        reb: (json['REB'] as num?)?.toDouble(),
        ftPct: (json['FT_PCT'] as num?)?.toDouble(),
        ptsRank: json['PTS_RANK'] as int?,
        teamName: json['TEAM_NAME'] as String?,
        pf: (json['PF'] as num?)?.toDouble(),
        gpRank: json['GP_RANK'] as int?,
        stlRank: json['STL_RANK'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'PFD_RANK': pfdRank,
        'FG3_PCT': fg3Pct,
        'OREB_RANK': orebRank,
        'STL': stl,
        'DREB': dreb,
        'FG_PCT_RANK': fgPctRank,
        'PLUS_MINUS_RANK': plusMinusRank,
        'PFD': pfd,
        'PF_RANK': pfRank,
        'DREB_RANK': drebRank,
        'TOV_RANK': tovRank,
        'FGA': fga,
        'FG3_PCT_RANK': fg3PctRank,
        'BLK_RANK': blkRank,
        'FGM': fgm,
        'L_RANK': lRank,
        'W_PCT': wPct,
        'FG3A_RANK': fg3ARank,
        'FTA': fta,
        'MIN': min,
        'TOV': tov,
        'FG3M_RANK': fg3MRank,
        'FTM': ftm,
        'TEAM_ID': teamId,
        'BLKA': blka,
        'BLK': blk,
        'PLUS_MINUS': plusMinus,
        'W_RANK': wRank,
        'MIN_RANK': minRank,
        'FG_PCT': fgPct,
        'L': l,
        'PTS': pts,
        'FG3A': fg3A,
        'FTM_RANK': ftmRank,
        'FTA_RANK': ftaRank,
        'FGA_RANK': fgaRank,
        'REB_RANK': rebRank,
        'BLKA_RANK': blkaRank,
        'W': w,
        'FG3M': fg3M,
        'W_PCT_RANK': wPctRank,
        'AST_RANK': astRank,
        'AST': ast,
        'OREB': oreb,
        'FT_PCT_RANK': ftPctRank,
        'GP': gp,
        'FGM_RANK': fgmRank,
        'REB': reb,
        'FT_PCT': ftPct,
        'PTS_RANK': ptsRank,
        'TEAM_NAME': teamName,
        'PF': pf,
        'GP_RANK': gpRank,
        'STL_RANK': stlRank,
      };
}
