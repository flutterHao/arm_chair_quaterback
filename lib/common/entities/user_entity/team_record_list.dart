class TeamRecordList {
  int? catalogs;
  int? resetTime;
  int? teamId;
  int? value1;
  int? value2;
  int? value4;
  int? value5;

  TeamRecordList({
    this.catalogs,
    this.resetTime,
    this.teamId,
    this.value1,
    this.value2,
    this.value4,
    this.value5,
  });

  factory TeamRecordList.fromJson(Map<String, dynamic> json) {
    return TeamRecordList(
      catalogs: json['catalogs'] as int?,
      resetTime: json['resetTime'] as int?,
      teamId: json['teamId'] as int?,
      value1: json['value1'] as int?,
      value2: json['value2'] as int?,
      value4: json['value4'] as int?,
      value5: json['value5'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'catalogs': catalogs,
        'resetTime': resetTime,
        'teamId': teamId,
        'value1': value1,
        'value2': value2,
        'value4': value4,
        'value5': value5,
      };
}
