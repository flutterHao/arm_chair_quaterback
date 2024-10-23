import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';

ReciveAwardEntity $ReciveAwardEntityFromJson(Map<String, dynamic> json) {
  final ReciveAwardEntity reciveAwardEntity = ReciveAwardEntity();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    reciveAwardEntity.gameId = gameId;
  }
  final ReciveAwardL5Avg? l5Avg = jsonConvert.convert<ReciveAwardL5Avg>(
      json['L5Avg']);
  if (l5Avg != null) {
    reciveAwardEntity.l5Avg = l5Avg;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    reciveAwardEntity.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    reciveAwardEntity.gameStartTime = gameStartTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    reciveAwardEntity.teamId = teamId;
  }
  final List<ReciveAwardGuessData>? guessData = (json['guessData'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ReciveAwardGuessData>(e) as ReciveAwardGuessData)
      .toList();
  if (guessData != null) {
    reciveAwardEntity.guessData = guessData;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    reciveAwardEntity.updateTime = updateTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    reciveAwardEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    reciveAwardEntity.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    reciveAwardEntity.awayTeamId = awayTeamId;
  }
  final int? scId = jsonConvert.convert<int>(json['scId']);
  if (scId != null) {
    reciveAwardEntity.scId = scId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    reciveAwardEntity.playerId = playerId;
  }
  return reciveAwardEntity;
}

Map<String, dynamic> $ReciveAwardEntityToJson(ReciveAwardEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['L5Avg'] = entity.l5Avg.toJson();
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData.map((v) => v.toJson()).toList();
  data['updateTime'] = entity.updateTime;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['scId'] = entity.scId;
  data['playerId'] = entity.playerId;
  return data;
}

extension ReciveAwardEntityExtension on ReciveAwardEntity {
  ReciveAwardEntity copyWith({
    int? gameId,
    ReciveAwardL5Avg? l5Avg,
    int? createTime,
    int? gameStartTime,
    int? teamId,
    List<ReciveAwardGuessData>? guessData,
    int? updateTime,
    int? id,
    int? type,
    int? awayTeamId,
    int? scId,
    int? playerId,
  }) {
    return ReciveAwardEntity()
      ..gameId = gameId ?? this.gameId
      ..l5Avg = l5Avg ?? this.l5Avg
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..updateTime = updateTime ?? this.updateTime
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..scId = scId ?? this.scId
      ..playerId = playerId ?? this.playerId;
  }
}

ReciveAwardL5Avg $ReciveAwardL5AvgFromJson(Map<String, dynamic> json) {
  final ReciveAwardL5Avg reciveAwardL5Avg = ReciveAwardL5Avg();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    reciveAwardL5Avg.blk = blk;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    reciveAwardL5Avg.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    reciveAwardL5Avg.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    reciveAwardL5Avg.dreb = dreb;
  }
  final int? starterCount = jsonConvert.convert<int>(json['starterCount']);
  if (starterCount != null) {
    reciveAwardL5Avg.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    reciveAwardL5Avg.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    reciveAwardL5Avg.updateTime = updateTime;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    reciveAwardL5Avg.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    reciveAwardL5Avg.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    reciveAwardL5Avg.threePa = threePa;
  }
  final int? playCount = jsonConvert.convert<int>(json['playCount']);
  if (playCount != null) {
    reciveAwardL5Avg.playCount = playCount;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    reciveAwardL5Avg.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    reciveAwardL5Avg.min = min;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    reciveAwardL5Avg.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    reciveAwardL5Avg.createTime = createTime;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    reciveAwardL5Avg.seasonId = seasonId;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    reciveAwardL5Avg.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    reciveAwardL5Avg.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    reciveAwardL5Avg.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    reciveAwardL5Avg.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    reciveAwardL5Avg.playerId = playerId;
  }
  return reciveAwardL5Avg;
}

Map<String, dynamic> $ReciveAwardL5AvgToJson(ReciveAwardL5Avg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['starterCount'] = entity.starterCount;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['playCount'] = entity.playCount;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['seasonId'] = entity.seasonId;
  data['pf'] = entity.pf;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  return data;
}

extension ReciveAwardL5AvgExtension on ReciveAwardL5Avg {
  ReciveAwardL5Avg copyWith({
    double? blk,
    double? fga,
    double? ast,
    double? dreb,
    int? starterCount,
    double? stl,
    int? updateTime,
    int? fgm,
    double? pts,
    double? threePa,
    int? playCount,
    double? fta,
    double? min,
    int? oreb,
    int? createTime,
    int? seasonId,
    double? pf,
    double? threePm,
    double? to,
    double? ftm,
    int? playerId,
  }) {
    return ReciveAwardL5Avg()
      ..blk = blk ?? this.blk
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..starterCount = starterCount ?? this.starterCount
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..playCount = playCount ?? this.playCount
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..seasonId = seasonId ?? this.seasonId
      ..pf = pf ?? this.pf
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId;
  }
}

ReciveAwardGuessData $ReciveAwardGuessDataFromJson(Map<String, dynamic> json) {
  final ReciveAwardGuessData reciveAwardGuessData = ReciveAwardGuessData();
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    reciveAwardGuessData.guessAttr = guessAttr;
  }
  final int? guessChoice = jsonConvert.convert<int>(json['guessChoice']);
  if (guessChoice != null) {
    reciveAwardGuessData.guessChoice = guessChoice;
  }
  final int? guessTime = jsonConvert.convert<int>(json['guessTime']);
  if (guessTime != null) {
    reciveAwardGuessData.guessTime = guessTime;
  }
  final List<ReciveAwardGuessDataAwards>? awards = (json['awards'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<ReciveAwardGuessDataAwards>(
          e) as ReciveAwardGuessDataAwards).toList();
  if (awards != null) {
    reciveAwardGuessData.awards = awards;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    reciveAwardGuessData.success = success;
  }
  final int? guessReferenceValue = jsonConvert.convert<int>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    reciveAwardGuessData.guessReferenceValue = guessReferenceValue;
  }
  final int? guessGameAttrValue = jsonConvert.convert<int>(
      json['guessGameAttrValue']);
  if (guessGameAttrValue != null) {
    reciveAwardGuessData.guessGameAttrValue = guessGameAttrValue;
  }
  final int? winPro = jsonConvert.convert<int>(json['winPro']);
  if (winPro != null) {
    reciveAwardGuessData.winPro = winPro;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    reciveAwardGuessData.status = status;
  }
  return reciveAwardGuessData;
}

Map<String, dynamic> $ReciveAwardGuessDataToJson(ReciveAwardGuessData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessAttr'] = entity.guessAttr;
  data['guessChoice'] = entity.guessChoice;
  data['guessTime'] = entity.guessTime;
  data['awards'] = entity.awards.map((v) => v.toJson()).toList();
  data['success'] = entity.success;
  data['guessReferenceValue'] = entity.guessReferenceValue;
  data['guessGameAttrValue'] = entity.guessGameAttrValue;
  data['winPro'] = entity.winPro;
  data['status'] = entity.status;
  return data;
}

extension ReciveAwardGuessDataExtension on ReciveAwardGuessData {
  ReciveAwardGuessData copyWith({
    String? guessAttr,
    int? guessChoice,
    int? guessTime,
    List<ReciveAwardGuessDataAwards>? awards,
    bool? success,
    int? guessReferenceValue,
    int? guessGameAttrValue,
    int? winPro,
    int? status,
  }) {
    return ReciveAwardGuessData()
      ..guessAttr = guessAttr ?? this.guessAttr
      ..guessChoice = guessChoice ?? this.guessChoice
      ..guessTime = guessTime ?? this.guessTime
      ..awards = awards ?? this.awards
      ..success = success ?? this.success
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..guessGameAttrValue = guessGameAttrValue ?? this.guessGameAttrValue
      ..winPro = winPro ?? this.winPro
      ..status = status ?? this.status;
  }
}

ReciveAwardGuessDataAwards $ReciveAwardGuessDataAwardsFromJson(
    Map<String, dynamic> json) {
  final ReciveAwardGuessDataAwards reciveAwardGuessDataAwards = ReciveAwardGuessDataAwards();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    reciveAwardGuessDataAwards.id = id;
  }
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    reciveAwardGuessDataAwards.num = num;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    reciveAwardGuessDataAwards.type = type;
  }
  return reciveAwardGuessDataAwards;
}

Map<String, dynamic> $ReciveAwardGuessDataAwardsToJson(
    ReciveAwardGuessDataAwards entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['num'] = entity.num;
  data['type'] = entity.type;
  return data;
}

extension ReciveAwardGuessDataAwardsExtension on ReciveAwardGuessDataAwards {
  ReciveAwardGuessDataAwards copyWith({
    int? id,
    int? num,
    int? type,
  }) {
    return ReciveAwardGuessDataAwards()
      ..id = id ?? this.id
      ..num = num ?? this.num
      ..type = type ?? this.type;
  }
}