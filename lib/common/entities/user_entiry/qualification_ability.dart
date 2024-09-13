import 'dart:convert';

class QualificationAbility {
  int? baseValue;
  bool? lock;
  int? newValue;
  int? type;

  QualificationAbility({
    this.baseValue,
    this.lock,
    this.newValue,
    this.type,
  });

  factory QualificationAbility.fromMap(Map<String, dynamic> data) {
    return QualificationAbility(
      baseValue: data['baseValue'] as int?,
      lock: data['lock'] as bool?,
      newValue: data['newValue'] as int?,
      type: data['type'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'baseValue': baseValue,
        'lock': lock,
        'newValue': newValue,
        'type': type,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QualificationAbility].
  factory QualificationAbility.fromJson(String data) {
    return QualificationAbility.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [QualificationAbility] to a JSON string.
  String toJson() => json.encode(toMap());
}
