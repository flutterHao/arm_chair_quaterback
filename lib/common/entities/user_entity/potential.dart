class Potential {
  int? ast;
  int? blk;
  int? pts;
  int? reb;
  int? stl;
  int? threePts;

  Potential({
    this.ast,
    this.blk,
    this.pts,
    this.reb,
    this.stl,
    this.threePts,
  });

  factory Potential.fromJson(Map<String, dynamic> json) => Potential(
        ast: json['ast'] as int?,
        blk: json['blk'] as int?,
        pts: json['pts'] as int?,
        reb: json['reb'] as int?,
        stl: json['stl'] as int?,
        threePts: json['threePts'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ast': ast,
        'blk': blk,
        'pts': pts,
        'reb': reb,
        'stl': stl,
        'threePts': threePts,
      };
}
