import 'dart:convert';

class TencentBlue {
  int? blueGradeState;
  bool? blueVip;
  int? blueVipLevel;
  int? blueVipState;
  bool? blueYearVip;
  bool? superBlueVip;
  int? vipValidTime;

  TencentBlue({
    this.blueGradeState,
    this.blueVip,
    this.blueVipLevel,
    this.blueVipState,
    this.blueYearVip,
    this.superBlueVip,
    this.vipValidTime,
  });

  factory TencentBlue.fromMap(Map<String, dynamic> data) => TencentBlue(
        blueGradeState: data['blueGradeState'] as int?,
        blueVip: data['blueVip'] as bool?,
        blueVipLevel: data['blueVipLevel'] as int?,
        blueVipState: data['blueVipState'] as int?,
        blueYearVip: data['blueYearVip'] as bool?,
        superBlueVip: data['superBlueVip'] as bool?,
        vipValidTime: data['vipValidTime'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'blueGradeState': blueGradeState,
        'blueVip': blueVip,
        'blueVipLevel': blueVipLevel,
        'blueVipState': blueVipState,
        'blueYearVip': blueYearVip,
        'superBlueVip': superBlueVip,
        'vipValidTime': vipValidTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TencentBlue].
  factory TencentBlue.fromJson(String data) {
    return TencentBlue.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TencentBlue] to a JSON string.
  String toJson() => json.encode(toMap());
}
