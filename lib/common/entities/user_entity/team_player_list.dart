import 'potential.dart';

class TeamPlayerList {
  bool? bindStatus;
  int? breakThroughGrade;
  int? buyPlayerScore;
  int? buyPrice;
  int? createTime;
  int? fromType;
  int? gradeExp;
  int? id;
  int? playerGrade;
  int? playerId;
  int? position;
  Potential? potential;
  int? power;
  int? teamId;
  int? updateTime;
  String? uuid;

  TeamPlayerList({
    this.bindStatus,
    this.breakThroughGrade,
    this.buyPlayerScore,
    this.buyPrice,
    this.createTime,
    this.fromType,
    this.gradeExp,
    this.id,
    this.playerGrade,
    this.playerId,
    this.position,
    this.potential,
    this.power,
    this.teamId,
    this.updateTime,
    this.uuid,
  });

  int getBreakThroughGrade(){
    if((breakThroughGrade??0)>=1){
      return breakThroughGrade!;
    }
    return 1;
  }

  int getNextBreakThroughGrade(){
    var i = getBreakThroughGrade()+1;
    return i;
  }

  int getPreBreakThroughGrade(){
    var i = getBreakThroughGrade()-1;
    return i;
  }

  factory TeamPlayerList.fromJson(Map<String, dynamic> json) {
    return TeamPlayerList(
      bindStatus: json['bindStatus'] as bool?,
      breakThroughGrade: json['breakThroughGrade'] as int?,
      buyPlayerScore: json['buyPlayerScore'] as int?,
      buyPrice: json['buyPrice'] as int?,
      createTime: json['createTime'] as int?,
      fromType: json['fromType'] as int?,
      gradeExp: json['gradeExp'] as int?,
      id: json['id'] as int?,
      playerGrade: json['playerGrade'] as int?,
      playerId: json['playerId'] as int?,
      position: json['position'] as int?,
      potential: json['potential'] == null
          ? null
          : Potential.fromJson(json['potential'] as Map<String, dynamic>),
      power: json['power'] as int?,
      teamId: json['teamId'] as int?,
      updateTime: json['updateTime'] as int?,
      uuid: json['uuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'bindStatus': bindStatus,
        'breakThroughGrade': breakThroughGrade,
        'buyPlayerScore': buyPlayerScore,
        'buyPrice': buyPrice,
        'createTime': createTime,
        'fromType': fromType,
        'gradeExp': gradeExp,
        'id': id,
        'playerGrade': playerGrade,
        'playerId': playerId,
        'position': position,
        'potential': potential?.toJson(),
        'power': power,
        'teamId': teamId,
        'updateTime': updateTime,
        'uuid': uuid,
      };
}
