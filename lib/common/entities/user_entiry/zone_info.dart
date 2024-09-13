import 'dart:convert';

class ZoneInfo {
  int? chatCdTime;
  int? chatGradeLimit;
  int? createTime;
  int? id;
  List<dynamic>? iosChargeAreas;
  int? iosChargeGrade;
  int? startServerTime;
  int? updateTime;

  ZoneInfo({
    this.chatCdTime,
    this.chatGradeLimit,
    this.createTime,
    this.id,
    this.iosChargeAreas,
    this.iosChargeGrade,
    this.startServerTime,
    this.updateTime,
  });

  factory ZoneInfo.fromMap(Map<String, dynamic> data) => ZoneInfo(
        chatCdTime: data['chatCdTime'] as int?,
        chatGradeLimit: data['chatGradeLimit'] as int?,
        createTime: data['createTime'] as int?,
        id: data['id'] as int?,
        iosChargeAreas: data['iosChargeAreas'] as List<dynamic>?,
        iosChargeGrade: data['iosChargeGrade'] as int?,
        startServerTime: data['startServerTime'] as int?,
        updateTime: data['updateTime'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'chatCdTime': chatCdTime,
        'chatGradeLimit': chatGradeLimit,
        'createTime': createTime,
        'id': id,
        'iosChargeAreas': iosChargeAreas,
        'iosChargeGrade': iosChargeGrade,
        'startServerTime': startServerTime,
        'updateTime': updateTime,
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
