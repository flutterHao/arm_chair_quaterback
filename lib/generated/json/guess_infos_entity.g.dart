import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';

GuessInfosEntity $GuessInfosEntityFromJson(Map<String, dynamic> json) {
  final GuessInfosEntity guessInfosEntity = GuessInfosEntity();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    guessInfosEntity.gameId = gameId;
  }
  final GuessInfosL5Avg? l5Avg = jsonConvert.convert<GuessInfosL5Avg>(
      json['L5Avg']);
  if (l5Avg != null) {
    guessInfosEntity.l5Avg = l5Avg;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    guessInfosEntity.gameStartTime = gameStartTime;
  }
  final double? teamId = jsonConvert.convert<double>(json['teamId']);
  if (teamId != null) {
    guessInfosEntity.teamId = teamId;
  }
  final List<GuessInfosGuessData>? guessData = (json['guessData'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GuessInfosGuessData>(e) as GuessInfosGuessData)
      .toList();
  if (guessData != null) {
    guessInfosEntity.guessData = guessData;
  }
  final GuessInfosGuessReferenceValue? guessReferenceValue = jsonConvert
      .convert<GuessInfosGuessReferenceValue>(json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessInfosEntity.guessReferenceValue = guessReferenceValue;
  }
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    guessInfosEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    guessInfosEntity.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    guessInfosEntity.awayTeamId = awayTeamId;
  }
  final double? scId = jsonConvert.convert<double>(json['scId']);
  if (scId != null) {
    guessInfosEntity.scId = scId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    guessInfosEntity.playerId = playerId;
  }
  return guessInfosEntity;
}

Map<String, dynamic> $GuessInfosEntityToJson(GuessInfosEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['L5Avg'] = entity.l5Avg.toJson();
  data['gameStartTime'] = entity.gameStartTime;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData.map((v) => v.toJson()).toList();
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['scId'] = entity.scId;
  data['playerId'] = entity.playerId;
  return data;
}

extension GuessInfosEntityExtension on GuessInfosEntity {
  GuessInfosEntity copyWith({
    int? gameId,
    GuessInfosL5Avg? l5Avg,
    int? gameStartTime,
    double? teamId,
    List<GuessInfosGuessData>? guessData,
    GuessInfosGuessReferenceValue? guessReferenceValue,
    double? id,
    int? type,
    int? awayTeamId,
    double? scId,
    int? playerId,
  }) {
    return GuessInfosEntity()
      ..gameId = gameId ?? this.gameId
      ..l5Avg = l5Avg ?? this.l5Avg
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..scId = scId ?? this.scId
      ..playerId = playerId ?? this.playerId;
  }
}

GuessInfosL5Avg $GuessInfosL5AvgFromJson(Map<String, dynamic> json) {
  final GuessInfosL5Avg guessInfosL5Avg = GuessInfosL5Avg();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    guessInfosL5Avg.blk = blk;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    guessInfosL5Avg.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    guessInfosL5Avg.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    guessInfosL5Avg.dreb = dreb;
  }
  final double? starterCount = jsonConvert.convert<double>(
      json['starterCount']);
  if (starterCount != null) {
    guessInfosL5Avg.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    guessInfosL5Avg.stl = stl;
  }
  final double? updateTime = jsonConvert.convert<double>(json['updateTime']);
  if (updateTime != null) {
    guessInfosL5Avg.updateTime = updateTime;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    guessInfosL5Avg.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    guessInfosL5Avg.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    guessInfosL5Avg.threePa = threePa;
  }
  final double? playCount = jsonConvert.convert<double>(json['playCount']);
  if (playCount != null) {
    guessInfosL5Avg.playCount = playCount;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    guessInfosL5Avg.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    guessInfosL5Avg.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    guessInfosL5Avg.oreb = oreb;
  }
  final double? createTime = jsonConvert.convert<double>(json['createTime']);
  if (createTime != null) {
    guessInfosL5Avg.createTime = createTime;
  }
  final double? seasonId = jsonConvert.convert<double>(json['seasonId']);
  if (seasonId != null) {
    guessInfosL5Avg.seasonId = seasonId;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    guessInfosL5Avg.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    guessInfosL5Avg.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    guessInfosL5Avg.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    guessInfosL5Avg.ftm = ftm;
  }
  final double? playerId = jsonConvert.convert<double>(json['playerId']);
  if (playerId != null) {
    guessInfosL5Avg.playerId = playerId;
  }
  return guessInfosL5Avg;
}

Map<String, dynamic> $GuessInfosL5AvgToJson(GuessInfosL5Avg entity) {
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

extension GuessInfosL5AvgExtension on GuessInfosL5Avg {
  GuessInfosL5Avg copyWith({
    double? blk,
    double? fga,
    double? ast,
    double? dreb,
    double? starterCount,
    double? stl,
    double? updateTime,
    double? fgm,
    double? pts,
    double? threePa,
    double? playCount,
    double? fta,
    double? min,
    double? oreb,
    double? createTime,
    double? seasonId,
    double? pf,
    double? threePm,
    double? to,
    double? ftm,
    double? playerId,
  }) {
    return GuessInfosL5Avg()
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

GuessInfosGuessData $GuessInfosGuessDataFromJson(Map<String, dynamic> json) {
  final GuessInfosGuessData guessInfosGuessData = GuessInfosGuessData();
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    guessInfosGuessData.guessAttr = guessAttr;
  }
  final double? guessChoice = jsonConvert.convert<double>(json['guessChoice']);
  if (guessChoice != null) {
    guessInfosGuessData.guessChoice = guessChoice;
  }
  final double? guessTime = jsonConvert.convert<double>(json['guessTime']);
  if (guessTime != null) {
    guessInfosGuessData.guessTime = guessTime;
  }
  final List<dynamic>? awards = (json['awards'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (awards != null) {
    guessInfosGuessData.awards = awards;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    guessInfosGuessData.success = success;
  }
  final double? guessReferenceValue = jsonConvert.convert<double>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessInfosGuessData.guessReferenceValue = guessReferenceValue;
  }
  final double? winPro = jsonConvert.convert<double>(json['winPro']);
  if (winPro != null) {
    guessInfosGuessData.winPro = winPro;
  }
  final double? status = jsonConvert.convert<double>(json['status']);
  if (status != null) {
    guessInfosGuessData.status = status;
  }
  return guessInfosGuessData;
}

Map<String, dynamic> $GuessInfosGuessDataToJson(GuessInfosGuessData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessAttr'] = entity.guessAttr;
  data['guessChoice'] = entity.guessChoice;
  data['guessTime'] = entity.guessTime;
  data['awards'] = entity.awards;
  data['success'] = entity.success;
  data['guessReferenceValue'] = entity.guessReferenceValue;
  data['winPro'] = entity.winPro;
  data['status'] = entity.status;
  return data;
}

extension GuessInfosGuessDataExtension on GuessInfosGuessData {
  GuessInfosGuessData copyWith({
    String? guessAttr,
    double? guessChoice,
    double? guessTime,
    List<dynamic>? awards,
    bool? success,
    double? guessReferenceValue,
    double? winPro,
    double? status,
  }) {
    return GuessInfosGuessData()
      ..guessAttr = guessAttr ?? this.guessAttr
      ..guessChoice = guessChoice ?? this.guessChoice
      ..guessTime = guessTime ?? this.guessTime
      ..awards = awards ?? this.awards
      ..success = success ?? this.success
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..winPro = winPro ?? this.winPro
      ..status = status ?? this.status;
  }
}

GuessInfosGuessReferenceValue $GuessInfosGuessReferenceValueFromJson(
    Map<String, dynamic> json) {
  final GuessInfosGuessReferenceValue guessInfosGuessReferenceValue = GuessInfosGuessReferenceValue();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    guessInfosGuessReferenceValue.blk = blk;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    guessInfosGuessReferenceValue.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    guessInfosGuessReferenceValue.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    guessInfosGuessReferenceValue.dreb = dreb;
  }
  final double? starterCount = jsonConvert.convert<double>(
      json['starterCount']);
  if (starterCount != null) {
    guessInfosGuessReferenceValue.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    guessInfosGuessReferenceValue.stl = stl;
  }
  final double? updateTime = jsonConvert.convert<double>(json['updateTime']);
  if (updateTime != null) {
    guessInfosGuessReferenceValue.updateTime = updateTime;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    guessInfosGuessReferenceValue.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    guessInfosGuessReferenceValue.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    guessInfosGuessReferenceValue.threePa = threePa;
  }
  final double? playCount = jsonConvert.convert<double>(json['playCount']);
  if (playCount != null) {
    guessInfosGuessReferenceValue.playCount = playCount;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    guessInfosGuessReferenceValue.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    guessInfosGuessReferenceValue.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    guessInfosGuessReferenceValue.oreb = oreb;
  }
  final double? createTime = jsonConvert.convert<double>(json['createTime']);
  if (createTime != null) {
    guessInfosGuessReferenceValue.createTime = createTime;
  }
  final double? seasonId = jsonConvert.convert<double>(json['seasonId']);
  if (seasonId != null) {
    guessInfosGuessReferenceValue.seasonId = seasonId;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    guessInfosGuessReferenceValue.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    guessInfosGuessReferenceValue.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    guessInfosGuessReferenceValue.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    guessInfosGuessReferenceValue.ftm = ftm;
  }
  final double? playerId = jsonConvert.convert<double>(json['playerId']);
  if (playerId != null) {
    guessInfosGuessReferenceValue.playerId = playerId;
  }
  return guessInfosGuessReferenceValue;
}

Map<String, dynamic> $GuessInfosGuessReferenceValueToJson(
    GuessInfosGuessReferenceValue entity) {
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

extension GuessInfosGuessReferenceValueExtension on GuessInfosGuessReferenceValue {
  GuessInfosGuessReferenceValue copyWith({
    double? blk,
    double? fga,
    double? ast,
    double? dreb,
    double? starterCount,
    double? stl,
    double? updateTime,
    double? fgm,
    double? pts,
    double? threePa,
    double? playCount,
    double? fta,
    double? min,
    double? oreb,
    double? createTime,
    double? seasonId,
    double? pf,
    double? threePm,
    double? to,
    double? ftm,
    double? playerId,
  }) {
    return GuessInfosGuessReferenceValue()
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