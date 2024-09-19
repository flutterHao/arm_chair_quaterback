class NbaTeamRank {
  double? ast;
  int? awayL;
  int? awayW;
  double? blk;
  int? confL;
  int? confW;
  int? createTime;
  double? diff;
  int? divL;
  int? divW;
  double? dr;
  double? fg;
  double? fga;
  double? fgm;
  double? ft;
  double? fta;
  double? ftm;
  int? gb;
  int? gp;
  int? homeL;
  int? homeW;
  int? l;
  int? l10L;
  int? l10W;
  double? oppPpg;
  double? or;
  double? pct;
  double? pf;
  double? ppg;
  double? pts;
  double? reb;
  int? season;
  double? stl;
  String? strk;
  int? teamId;
  double? threeP;
  double? threePa;
  double? threePm;
  double? to;
  int? updateTime;
  int? w;

  NbaTeamRank({
    this.ast = 0,
    this.awayL = 0,
    this.awayW = 0,
    this.blk = 0,
    this.confL = 0,
    this.confW = 0,
    this.createTime = 0,
    this.diff = 0,
    this.divL = 0,
    this.divW = 0,
    this.dr = 0,
    this.fg = 0,
    this.fga = 0,
    this.fgm = 0,
    this.ft = 0,
    this.fta = 0,
    this.ftm = 0,
    this.gb = 0,
    this.gp = 0,
    this.homeL = 0,
    this.homeW = 0,
    this.l = 0,
    this.l10L = 0,
    this.l10W = 0,
    this.oppPpg = 0,
    this.or = 0,
    this.pct = 0,
    this.pf = 0,
    this.ppg = 0,
    this.pts = 0,
    this.reb = 0,
    this.season = 0,
    this.stl = 0,
    this.strk = "",
    this.teamId = 0,
    this.threeP = 0,
    this.threePa = 0,
    this.threePm = 0,
    this.to = 0,
    this.updateTime = 0,
    this.w = 0,
  });

  factory NbaTeamRank.fromJson(Map<String, dynamic> json) => NbaTeamRank(
        ast: (json['ast'] as num?)?.toDouble(),
        awayL: json['away_l'] as int?,
        awayW: json['away_w'] as int?,
        blk: (json['blk'] as num?)?.toDouble(),
        confL: json['conf_l'] as int?,
        confW: json['conf_w'] as int?,
        createTime: json['createTime'] as int?,
        diff: (json['diff'] as num?)?.toDouble(),
        divL: json['div_l'] as int?,
        divW: json['div_w'] as int?,
        dr: (json['dr'] as num?)?.toDouble(),
        fg: (json['fg'] as num?)?.toDouble(),
        fga: (json['fga'] as num?)?.toDouble(),
        fgm: (json['fgm'] as num?)?.toDouble(),
        ft: (json['ft'] as num?)?.toDouble(),
        fta: (json['fta'] as num?)?.toDouble(),
        ftm: (json['ftm'] as num?)?.toDouble(),
        gb: json['gb'] as int?,
        gp: json['gp'] as int?,
        homeL: json['home_l'] as int?,
        homeW: json['home_w'] as int?,
        l: json['l'] as int?,
        l10L: json['l10_l'] as int?,
        l10W: json['l10_w'] as int?,
        oppPpg: (json['opp_ppg'] as num?)?.toDouble(),
        or: (json['or'] as num?)?.toDouble(),
        pct: (json['pct'] as num?)?.toDouble(),
        pf: (json['pf'] as num?)?.toDouble(),
        ppg: (json['ppg'] as num?)?.toDouble(),
        pts: (json['pts'] as num?)?.toDouble(),
        reb: (json['reb'] as num?)?.toDouble(),
        season: json['season'] as int?,
        stl: (json['stl'] as num?)?.toDouble(),
        strk: json['strk'] as String?,
        teamId: json['teamId'] as int?,
        threeP: (json['three_p'] as num?)?.toDouble(),
        threePa: (json['three_pa'] as num?)?.toDouble(),
        threePm: (json['three_pm'] as num?)?.toDouble(),
        to: (json['to'] as num?)?.toDouble(),
        updateTime: json['updateTime'] as int?,
        w: json['w'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ast': ast,
        'away_l': awayL,
        'away_w': awayW,
        'blk': blk,
        'conf_l': confL,
        'conf_w': confW,
        'createTime': createTime,
        'diff': diff,
        'div_l': divL,
        'div_w': divW,
        'dr': dr,
        'fg': fg,
        'fga': fga,
        'fgm': fgm,
        'ft': ft,
        'fta': fta,
        'ftm': ftm,
        'gb': gb,
        'gp': gp,
        'home_l': homeL,
        'home_w': homeW,
        'l': l,
        'l10_l': l10L,
        'l10_w': l10W,
        'opp_ppg': oppPpg,
        'or': or,
        'pct': pct,
        'pf': pf,
        'ppg': ppg,
        'pts': pts,
        'reb': reb,
        'season': season,
        'stl': stl,
        'strk': strk,
        'teamId': teamId,
        'three_p': threeP,
        'three_pa': threePa,
        'three_pm': threePm,
        'to': to,
        'updateTime': updateTime,
        'w': w,
      };
}
