import 'dart:convert';

import 'package:arm_chair_quaterback/common/utils/utils.dart';

import 'qualification_ability.dart';

class TeamPlayerList {
  List<dynamic>? areaMascotId;
  bool? bindStatus;
  int? breakThroughGrade;
  int? buyPlayerScore;
  int? buyPrice;
  List<dynamic>? coachPassivitySkills;
  int? ct;
  int? famousAlmanacGrade;
  int? fromType;
  int? gradeExp;
  int? id;
  int? mascotId;
  int? mvpGrade;
  List<dynamic>? needAwardData;
  int? perfectPromoteCount;
  int? playerGrade;
  int? playerId;
  int? position;
  int? power;
  int? promoteCount;
  int? property;
  List<QualificationAbility>? qualificationAbility;
  int? qualificationLuckValue;
  int? specialTrainingGrade;
  int? teamId;
  int? ut;
  String? uuid;

  TeamPlayerList({
    this.areaMascotId,
    this.bindStatus,
    this.breakThroughGrade,
    this.buyPlayerScore,
    this.buyPrice,
    this.coachPassivitySkills,
    this.ct,
    this.famousAlmanacGrade,
    this.fromType,
    this.gradeExp,
    this.id,
    this.mascotId,
    this.mvpGrade,
    this.needAwardData,
    this.perfectPromoteCount,
    this.playerGrade,
    this.playerId,
    this.position,
    this.power,
    this.promoteCount,
    this.property,
    this.qualificationAbility,
    this.qualificationLuckValue,
    this.specialTrainingGrade,
    this.teamId,
    this.ut,
    this.uuid,
  });

  factory TeamPlayerList.fromMap(Map<String, dynamic> data) {
    return TeamPlayerList(
      areaMascotId: data['areaMascotId'] as List<dynamic>?,
      bindStatus: data['bindStatus'] as bool?,
      breakThroughGrade: data['breakThroughGrade'] as int?,
      buyPlayerScore: data['buyPlayerScore'] as int?,
      buyPrice: data['buyPrice'] as int?,
      coachPassivitySkills: data['coachPassivitySkills'] as List<dynamic>?,
      ct: data['createTime'] as int?,
      famousAlmanacGrade: data['famousAlmanacGrade'] as int?,
      fromType: data['fromType'] as int?,
      gradeExp: data['gradeExp'] as int?,
      id: data['id'] as int?,
      mascotId: data['mascotId'] as int?,
      mvpGrade: data['mvpGrade'] as int?,
      needAwardData: data['needAwardData'] as List<dynamic>?,
      perfectPromoteCount: data['perfectPromoteCount'] as int?,
      playerGrade: data['playerGrade'] as int?,
      playerId: data['playerId'] as int?,
      position: data['position'] as int?,
      power: data['power'] as int?,
      promoteCount: data['promoteCount'] as int?,
      property: data['property'] as int?,
      qualificationAbility: (data['qualificationAbility'] as List<dynamic>?)
          ?.map((e) => QualificationAbility.fromMap(e as Map<String, dynamic>))
          .toList(),
      qualificationLuckValue: data['qualificationLuckValue'] as int?,
      specialTrainingGrade: data['specialTrainingGrade'] as int?,
      teamId: data['teamId'] as int?,
      ut: data['updateTime'] as int?,
      uuid: data['uuid'] as String?,
    );
  }

  int get createTime =>
      (ct??0) + Utils.getTimeZoneOffset().inMilliseconds;

  int get updateTime =>
      (ut??0) + Utils.getTimeZoneOffset().inMilliseconds;

  Map<String, dynamic> toMap() => {
        'areaMascotId': areaMascotId,
        'bindStatus': bindStatus,
        'breakThroughGrade': breakThroughGrade,
        'buyPlayerScore': buyPlayerScore,
        'buyPrice': buyPrice,
        'coachPassivitySkills': coachPassivitySkills,
        'createTime': ct,
        'famousAlmanacGrade': famousAlmanacGrade,
        'fromType': fromType,
        'gradeExp': gradeExp,
        'id': id,
        'mascotId': mascotId,
        'mvpGrade': mvpGrade,
        'needAwardData': needAwardData,
        'perfectPromoteCount': perfectPromoteCount,
        'playerGrade': playerGrade,
        'playerId': playerId,
        'position': position,
        'power': power,
        'promoteCount': promoteCount,
        'property': property,
        'qualificationAbility':
            qualificationAbility?.map((e) => e.toMap()).toList(),
        'qualificationLuckValue': qualificationLuckValue,
        'specialTrainingGrade': specialTrainingGrade,
        'teamId': teamId,
        'updateTime': ut,
        'uuid': uuid,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TeamPlayerList].
  factory TeamPlayerList.fromJson(String data) {
    return TeamPlayerList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TeamPlayerList] to a JSON string.
  String toJson() => json.encode(toMap());
}
