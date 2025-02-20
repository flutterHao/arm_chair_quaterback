import 'package:arm_chair_quaterback/common/utils/utils.dart';

class TeamPropList {
  int? ct;
  int? num;
  int? propId;
  int? teamId;
  int? ut;

  TeamPropList({
    this.ct,
    this.num,
    this.propId,
    this.teamId,
    this.ut,
  });

  int get createTime =>
      (ct??0) + Utils.getTimeZoneOffset().inMilliseconds;

  int get updateTime =>
      (ut??0) + Utils.getTimeZoneOffset().inMilliseconds;

  factory TeamPropList.fromJson(Map<String, dynamic> json) => TeamPropList(
        ct: json['createTime'] as int?,
        num: json['num'] as int?,
        propId: json['propId'] as int?,
        teamId: json['teamId'] as int?,
        ut: json['updateTime'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'createTime': ct,
        'num': num,
        'propId': propId,
        'teamId': teamId,
        'updateTime': ut,
      };
}
