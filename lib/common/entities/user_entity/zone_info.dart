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

  factory ZoneInfo.fromJson(Map<String, dynamic> json) => ZoneInfo(
        chatCdTime: json['chatCdTime'] as int?,
        chatGradeLimit: json['chatGradeLimit'] as int?,
        ct: json['createTime'] as int?,
        id: json['id'] as int?,
        iosChargeAreas: json['iosChargeAreas'] as List<dynamic>?,
        iosChargeGrade: json['iosChargeGrade'] as int?,
        startServerTime: json['startServerTime'] as int?,
        ut: json['updateTime'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'chatCdTime': chatCdTime,
        'chatGradeLimit': chatGradeLimit,
        'createTime': ct,
        'id': id,
        'iosChargeAreas': iosChargeAreas,
        'iosChargeGrade': iosChargeGrade,
        'startServerTime': startServerTime,
        'updateTime': ut,
      };
}
