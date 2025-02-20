import 'dart:convert';

import 'package:arm_chair_quaterback/common/utils/utils.dart';

class ZoneInfo {
  int? chatCdTime;
  int? chatGradeLimit;
  int? ct;
  int? id;
  List<dynamic>? iosChargeAreas;
  int? iosChargeGrade;
  int? startServerTime;
  int? ut;

  ZoneInfo({
    this.chatCdTime,
    this.chatGradeLimit,
    this.ct,
    this.id,
    this.iosChargeAreas,
    this.iosChargeGrade,
    this.startServerTime,
    this.ut,
  });

  int get createTime =>
      (ct??0) + Utils.getTimeZoneOffset().inMilliseconds;

  int get updateTime =>
      (ut??0) + Utils.getTimeZoneOffset().inMilliseconds;

  factory ZoneInfo.fromMap(Map<String, dynamic> data) => ZoneInfo(
        chatCdTime: data['chatCdTime'] as int?,
        chatGradeLimit: data['chatGradeLimit'] as int?,
        ct: data['createTime'] as int?,
        id: data['id'] as int?,
        iosChargeAreas: data['iosChargeAreas'] as List<dynamic>?,
        iosChargeGrade: data['iosChargeGrade'] as int?,
        startServerTime: data['startServerTime'] as int?,
        ut: data['updateTime'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'chatCdTime': chatCdTime,
        'chatGradeLimit': chatGradeLimit,
        'createTime': ct,
        'id': id,
        'iosChargeAreas': iosChargeAreas,
        'iosChargeGrade': iosChargeGrade,
        'startServerTime': startServerTime,
        'updateTime': ut,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ZoneInfo].
  factory ZoneInfo.fromJson(String data) {
    return ZoneInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ZoneInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}
