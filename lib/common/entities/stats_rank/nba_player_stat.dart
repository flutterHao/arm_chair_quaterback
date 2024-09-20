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
