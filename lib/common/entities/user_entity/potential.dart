import 'dart:math';

class Potential {
  int? ast;
  int? blk;
  int? pts;
  int? reb;
  int? stl;
  int? threePt;

  Potential({
    this.ast,
    this.blk,
    this.pts,
    this.reb,
    this.stl,
    this.threePt,
  });

  factory Potential.fromJson(Map<String, dynamic> json) => Potential(
        ast: json['ast'] as int?,
        blk: json['blk'] as int?,
        pts: json['pts'] as int?,
        reb: json['reb'] as int?,
        stl: json['stl'] as int?,
        threePt: json['threePts'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ast': ast,
        'blk': blk,
        'pts': pts,
        'reb': reb,
        'stl': stl,
        'threePts': threePt,
      };

  int _getMaxValue(){
    var value = max(pts ?? 0, threePt ?? 0);
    value = max(value, ast ?? 0);
    value = max(value, reb ?? 0);
    value = max(value, blk ?? 0);
    value = max(value, stl ?? 0);
    return value;
  }
  int getMax() {
    var maxValue = _getMaxValue();
    int step  = getStep();
    var value = maxValue%step==0? maxValue+step:(maxValue~/step+1)*step;
    return value;
  }

  int getStep(){
    var value = _getMaxValue();
    int step  = value>100?20:value>500?100:10;
    return step;
  }
}
