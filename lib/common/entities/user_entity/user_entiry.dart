import 'team_login_info.dart';

class UserEntity {
  TeamLoginInfo? teamLoginInfo;

  UserEntity({this.teamLoginInfo});

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        teamLoginInfo: json['teamLoginInfo'] == null
            ? null
            : TeamLoginInfo.fromJson(
                json['teamLoginInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'teamLoginInfo': teamLoginInfo?.toJson(),
      };
}
