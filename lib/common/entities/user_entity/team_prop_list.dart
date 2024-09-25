class TeamPropList {
  int? createTime;
  int? num;
  int? propId;
  int? teamId;
  int? updateTime;

  TeamPropList({
    this.createTime,
    this.num,
    this.propId,
    this.teamId,
    this.updateTime,
  });

  factory TeamPropList.fromJson(Map<String, dynamic> json) => TeamPropList(
        createTime: json['createTime'] as int?,
        num: json['num'] as int?,
        propId: json['propId'] as int?,
        teamId: json['teamId'] as int?,
        updateTime: json['updateTime'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'createTime': createTime,
        'num': num,
        'propId': propId,
        'teamId': teamId,
        'updateTime': updateTime,
      };
}
