import 'dart:convert';

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

  factory TeamRecordList.fromMap(Map<String, dynamic> data) {
    return TeamRecordList(
      catalogs: data['catalogs'] as int?,
      resetTime: data['resetTime'] as int?,
      teamId: data['teamId'] as int?,
      value1: data['value1'] as int?,
      value2: data['value2'] as int?,
      value4: data['value4'] as int?,
      value5: data['value5'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'catalogs': catalogs,
        'resetTime': resetTime,
        'teamId': teamId,
        'value1': value1,
        'value2': value2,
        'value4': value4,
        'value5': value5,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TeamRecordList].
  factory TeamRecordList.fromJson(String data) {
    return TeamRecordList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TeamRecordList] to a JSON string.
  String toJson() => json.encode(toMap());
}
