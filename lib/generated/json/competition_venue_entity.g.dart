import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/competition_venue_entity.dart';

CompetitionVenueEntity $CompetitionVenueEntityFromJson(
    Map<String, dynamic> json) {
  final CompetitionVenueEntity competitionVenueEntity = CompetitionVenueEntity();
  final String? actor = jsonConvert.convert<String>(json['Actor']);
  if (actor != null) {
    competitionVenueEntity.actor = actor;
  }
  final String? assist = jsonConvert.convert<String>(json['Assist']);
  if (assist != null) {
    competitionVenueEntity.assist = assist;
  }
  final List<String>? awayC = (json['AwayC'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (awayC != null) {
    competitionVenueEntity.awayC = awayC;
  }
  final List<String>? awayPF = (json['AwayPF'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (awayPF != null) {
    competitionVenueEntity.awayPF = awayPF;
  }
  final List<String>? awayPG = (json['AwayPG'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (awayPG != null) {
    competitionVenueEntity.awayPG = awayPG;
  }
  final List<String>? awaySF = (json['AwaySF'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (awaySF != null) {
    competitionVenueEntity.awaySF = awaySF;
  }
  final List<String>? awaySG = (json['AwaySG'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (awaySG != null) {
    competitionVenueEntity.awaySG = awaySG;
  }
  final List<String>? gameEventType = (json['GameEventType'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (gameEventType != null) {
    competitionVenueEntity.gameEventType = gameEventType;
  }
  final List<String>? homeC = (json['HomeC'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (homeC != null) {
    competitionVenueEntity.homeC = homeC;
  }
  final List<String>? homePF = (json['HomePF'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (homePF != null) {
    competitionVenueEntity.homePF = homePF;
  }
  final List<String>? homePG = (json['HomePG'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (homePG != null) {
    competitionVenueEntity.homePG = homePG;
  }
  final List<String>? homeSF = (json['HomeSF'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (homeSF != null) {
    competitionVenueEntity.homeSF = homeSF;
  }
  final List<String>? homeSG = (json['HomeSG'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (homeSG != null) {
    competitionVenueEntity.homeSG = homeSG;
  }
  final String? posID = jsonConvert.convert<String>(json['PosID']);
  if (posID != null) {
    competitionVenueEntity.posID = posID;
  }
  final String? time = jsonConvert.convert<String>(json['Time']);
  if (time != null) {
    competitionVenueEntity.time = time;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    competitionVenueEntity.desc = desc;
  }
  return competitionVenueEntity;
}

Map<String, dynamic> $CompetitionVenueEntityToJson(
    CompetitionVenueEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['Actor'] = entity.actor;
  data['Assist'] = entity.assist;
  data['AwayC'] = entity.awayC;
  data['AwayPF'] = entity.awayPF;
  data['AwayPG'] = entity.awayPG;
  data['AwaySF'] = entity.awaySF;
  data['AwaySG'] = entity.awaySG;
  data['GameEventType'] = entity.gameEventType;
  data['HomeC'] = entity.homeC;
  data['HomePF'] = entity.homePF;
  data['HomePG'] = entity.homePG;
  data['HomeSF'] = entity.homeSF;
  data['HomeSG'] = entity.homeSG;
  data['PosID'] = entity.posID;
  data['Time'] = entity.time;
  data['desc'] = entity.desc;
  return data;
}

extension CompetitionVenueEntityExtension on CompetitionVenueEntity {
  CompetitionVenueEntity copyWith({
    String? actor,
    String? assist,
    List<String>? awayC,
    List<String>? awayPF,
    List<String>? awayPG,
    List<String>? awaySF,
    List<String>? awaySG,
    List<String>? gameEventType,
    List<String>? homeC,
    List<String>? homePF,
    List<String>? homePG,
    List<String>? homeSF,
    List<String>? homeSG,
    String? posID,
    String? time,
    String? desc,
  }) {
    return CompetitionVenueEntity()
      ..actor = actor ?? this.actor
      ..assist = assist ?? this.assist
      ..awayC = awayC ?? this.awayC
      ..awayPF = awayPF ?? this.awayPF
      ..awayPG = awayPG ?? this.awayPG
      ..awaySF = awaySF ?? this.awaySF
      ..awaySG = awaySG ?? this.awaySG
      ..gameEventType = gameEventType ?? this.gameEventType
      ..homeC = homeC ?? this.homeC
      ..homePF = homePF ?? this.homePF
      ..homePG = homePG ?? this.homePG
      ..homeSF = homeSF ?? this.homeSF
      ..homeSG = homeSG ?? this.homeSG
      ..posID = posID ?? this.posID
      ..time = time ?? this.time
      ..desc = desc ?? this.desc;
  }
}