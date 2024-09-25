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

  factory ZoneInfo.fromJson(Map<String, dynamic> json) => ZoneInfo(
        chatCdTime: json['chatCdTime'] as int?,
        chatGradeLimit: json['chatGradeLimit'] as int?,
        createTime: json['createTime'] as int?,
        id: json['id'] as int?,
        iosChargeAreas: json['iosChargeAreas'] as List<dynamic>?,
        iosChargeGrade: json['iosChargeGrade'] as int?,
        startServerTime: json['startServerTime'] as int?,
        updateTime: json['updateTime'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'chatCdTime': chatCdTime,
        'chatGradeLimit': chatGradeLimit,
        'createTime': createTime,
        'id': id,
        'iosChargeAreas': iosChargeAreas,
        'iosChargeGrade': iosChargeGrade,
        'startServerTime': startServerTime,
        'updateTime': updateTime,
      };
}
