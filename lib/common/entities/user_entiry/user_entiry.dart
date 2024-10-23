import 'dart:convert';

import 'team_login_info.dart';

class UserEntiry {
  TeamLoginInfo? teamLoginInfo;

  UserEntiry({this.teamLoginInfo});

  factory UserEntiry.fromMap(Map<String, dynamic> data) => UserEntiry(
        teamLoginInfo: data['teamLoginInfo'] == null
            ? null
            : TeamLoginInfo.fromMap(
                data['teamLoginInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'teamLoginInfo': teamLoginInfo?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserEntiry].
  factory UserEntiry.fromJson(String data) {
    return UserEntiry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserEntiry] to a JSON string.
  String toJson() => json.encode(toMap());
}
