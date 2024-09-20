import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';

GuessInfosEntity $GuessInfosEntityFromJson(Map<String, dynamic> json) {
  final GuessInfosEntity guessInfosEntity = GuessInfosEntity();
  final List<GuessInfosGuessInfos>? guessInfos = (json['guessInfos'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GuessInfosGuessInfos>(e) as GuessInfosGuessInfos)
      .toList();
  if (guessInfos != null) {
    guessInfosEntity.guessInfos = guessInfos;
  }
  return guessInfosEntity;
}

Map<String, dynamic> $GuessInfosEntityToJson(GuessInfosEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessInfos'] = entity.guessInfos.map((v) => v.toJson()).toList();
  return data;
}

extension GuessInfosEntityExtension on GuessInfosEntity {
  GuessInfosEntity copyWith({
    List<GuessInfosGuessInfos>? guessInfos,
  }) {
    return GuessInfosEntity()
      ..guessInfos = guessInfos ?? this.guessInfos;
  }
}

GuessInfosGuessInfos $GuessInfosGuessInfosFromJson(Map<String, dynamic> json) {
  final GuessInfosGuessInfos guessInfosGuessInfos = GuessInfosGuessInfos();
  final GuessInfosGuessInfosL5Avg? l5Avg = jsonConvert.convert<
      GuessInfosGuessInfosL5Avg>(json['L5Avg']);
  if (l5Avg != null) {
    guessInfosGuessInfos.l5Avg = l5Avg;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    guessInfosGuessInfos.awayTeamId = awayTeamId;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    guessInfosGuessInfos.createTime = createTime;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    guessInfosGuessInfos.gameId = gameId;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    guessInfosGuessInfos.gameStartTime = gameStartTime;
  }
  final List<
      GuessInfosGuessInfosGuessData>? guessData = (json['guessData'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<GuessInfosGuessInfosGuessData>(
          e) as GuessInfosGuessInfosGuessData).toList();
  if (guessData != null) {
    guessInfosGuessInfos.guessData = guessData;
  }
  final GuessInfosGuessInfosGuessReferenceValue? guessReferenceValue = jsonConvert
      .convert<GuessInfosGuessInfosGuessReferenceValue>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessInfosGuessInfos.guessReferenceValue = guessReferenceValue;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    guessInfosGuessInfos.id = id;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    guessInfosGuessInfos.playerId = playerId;
  }
  final int? scId = jsonConvert.convert<int>(json['scId']);
  if (scId != null) {
    guessInfosGuessInfos.scId = scId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    guessInfosGuessInfos.teamId = teamId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    guessInfosGuessInfos.type = type;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    guessInfosGuessInfos.updateTime = updateTime;
  }
  return guessInfosGuessInfos;
}

Map<String, dynamic> $GuessInfosGuessInfosToJson(GuessInfosGuessInfos entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['L5Avg'] = entity.l5Avg.toJson();
  data['awayTeamId'] = entity.awayTeamId;
  data['createTime'] = entity.createTime;
  data['gameId'] = entity.gameId;
  data['gameStartTime'] = entity.gameStartTime;
  data['guessData'] = entity.guessData.map((v) => v.toJson()).toList();
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['playerId'] = entity.playerId;
  data['scId'] = entity.scId;
  data['teamId'] = entity.teamId;
  data['type'] = entity.type;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension GuessInfosGuessInfosExtension on GuessInfosGuessInfos {
  GuessInfosGuessInfos copyWith({
    GuessInfosGuessInfosL5Avg? l5Avg,
    int? awayTeamId,
    int? createTime,
    int? gameId,
    int? gameStartTime,
    List<GuessInfosGuessInfosGuessData>? guessData,
    GuessInfosGuessInfosGuessReferenceValue? guessReferenceValue,
    int? id,
    int? playerId,
    int? scId,
    int? teamId,
    int? type,
    int? updateTime,
  }) {
    return GuessInfosGuessInfos()
      ..l5Avg = l5Avg ?? this.l5Avg
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..createTime = createTime ?? this.createTime
      ..gameId = gameId ?? this.gameId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..playerId = playerId ?? this.playerId
      ..scId = scId ?? this.scId
      ..teamId = teamId ?? this.teamId
      ..type = type ?? this.type
      ..updateTime = updateTime ?? this.updateTime;
  }
}

GuessInfosGuessInfosL5Avg $GuessInfosGuessInfosL5AvgFromJson(
    Map<String, dynamic> json) {
  final GuessInfosGuessInfosL5Avg guessInfosGuessInfosL5Avg = GuessInfosGuessInfosL5Avg();
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    guessInfosGuessInfosL5Avg.ast = ast;
  }
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    guessInfosGuessInfosL5Avg.blk = blk;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    guessInfosGuessInfosL5Avg.createTime = createTime;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    guessInfosGuessInfosL5Avg.dreb = dreb;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    guessInfosGuessInfosL5Avg.fga = fga;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    guessInfosGuessInfosL5Avg.fgm = fgm;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    guessInfosGuessInfosL5Avg.fta = fta;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    guessInfosGuessInfosL5Avg.ftm = ftm;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    guessInfosGuessInfosL5Avg.min = min;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    guessInfosGuessInfosL5Avg.oreb = oreb;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    guessInfosGuessInfosL5Avg.pf = pf;
  }
  final int? playCount = jsonConvert.convert<int>(json['playCount']);
  if (playCount != null) {
    guessInfosGuessInfosL5Avg.playCount = playCount;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    guessInfosGuessInfosL5Avg.playerId = playerId;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    guessInfosGuessInfosL5Avg.pts = pts;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    guessInfosGuessInfosL5Avg.seasonId = seasonId;
  }
  final int? starterCount = jsonConvert.convert<int>(json['starterCount']);
  if (starterCount != null) {
    guessInfosGuessInfosL5Avg.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    guessInfosGuessInfosL5Avg.stl = stl;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    guessInfosGuessInfosL5Avg.threePa = threePa;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    guessInfosGuessInfosL5Avg.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    guessInfosGuessInfosL5Avg.to = to;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    guessInfosGuessInfosL5Avg.updateTime = updateTime;
  }
  return guessInfosGuessInfosL5Avg;
}

Map<String, dynamic> $GuessInfosGuessInfosL5AvgToJson(
    GuessInfosGuessInfosL5Avg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['blk'] = entity.blk;
  data['createTime'] = entity.createTime;
  data['dreb'] = entity.dreb;
  data['fga'] = entity.fga;
  data['fgm'] = entity.fgm;
  data['fta'] = entity.fta;
  data['ftm'] = entity.ftm;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['pf'] = entity.pf;
  data['playCount'] = entity.playCount;
  data['playerId'] = entity.playerId;
  data['pts'] = entity.pts;
  data['seasonId'] = entity.seasonId;
  data['starterCount'] = entity.starterCount;
  data['stl'] = entity.stl;
  data['threePa'] = entity.threePa;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension GuessInfosGuessInfosL5AvgExtension on GuessInfosGuessInfosL5Avg {
  GuessInfosGuessInfosL5Avg copyWith({
    double? ast,
    double? blk,
    int? createTime,
    double? dreb,
    double? fga,
    int? fgm,
    double? fta,
    double? ftm,
    double? min,
    int? oreb,
    double? pf,
    int? playCount,
    int? playerId,
    double? pts,
    int? seasonId,
    int? starterCount,
    double? stl,
    double? threePa,
    double? threePm,
    double? to,
    int? updateTime,
  }) {
    return GuessInfosGuessInfosL5Avg()
      ..ast = ast ?? this.ast
      ..blk = blk ?? this.blk
      ..createTime = createTime ?? this.createTime
      ..dreb = dreb ?? this.dreb
      ..fga = fga ?? this.fga
      ..fgm = fgm ?? this.fgm
      ..fta = fta ?? this.fta
      ..ftm = ftm ?? this.ftm
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..pf = pf ?? this.pf
      ..playCount = playCount ?? this.playCount
      ..playerId = playerId ?? this.playerId
      ..pts = pts ?? this.pts
      ..seasonId = seasonId ?? this.seasonId
      ..starterCount = starterCount ?? this.starterCount
      ..stl = stl ?? this.stl
      ..threePa = threePa ?? this.threePa
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..updateTime = updateTime ?? this.updateTime;
  }
}

GuessInfosGuessInfosGuessData $GuessInfosGuessInfosGuessDataFromJson(
    Map<String, dynamic> json) {
  final GuessInfosGuessInfosGuessData guessInfosGuessInfosGuessData = GuessInfosGuessInfosGuessData();
  final List<dynamic>? awards = (json['awards'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (awards != null) {
    guessInfosGuessInfosGuessData.awards = awards;
  }
  final String? guessAttr = jsonConvert.convert<String>(json['guessAttr']);
  if (guessAttr != null) {
    guessInfosGuessInfosGuessData.guessAttr = guessAttr;
  }
  final int? guessChoice = jsonConvert.convert<int>(json['guessChoice']);
  if (guessChoice != null) {
    guessInfosGuessInfosGuessData.guessChoice = guessChoice;
  }
  final int? guessReferenceValue = jsonConvert.convert<int>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    guessInfosGuessInfosGuessData.guessReferenceValue = guessReferenceValue;
  }
  final int? guessTime = jsonConvert.convert<int>(json['guessTime']);
  if (guessTime != null) {
    guessInfosGuessInfosGuessData.guessTime = guessTime;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    guessInfosGuessInfosGuessData.status = status;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    guessInfosGuessInfosGuessData.success = success;
  }
  final int? winPro = jsonConvert.convert<int>(json['winPro']);
  if (winPro != null) {
    guessInfosGuessInfosGuessData.winPro = winPro;
  }
  return guessInfosGuessInfosGuessData;
}

Map<String, dynamic> $GuessInfosGuessInfosGuessDataToJson(
    GuessInfosGuessInfosGuessData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['awards'] = entity.awards;
  data['guessAttr'] = entity.guessAttr;
  data['guessChoice'] = entity.guessChoice;
  data['guessReferenceValue'] = entity.guessReferenceValue;
  data['guessTime'] = entity.guessTime;
  data['status'] = entity.status;
  data['success'] = entity.success;
  data['winPro'] = entity.winPro;
  return data;
}

extension GuessInfosGuessInfosGuessDataExtension on GuessInfosGuessInfosGuessData {
  GuessInfosGuessInfosGuessData copyWith({
    List<dynamic>? awards,
    String? guessAttr,
    int? guessChoice,
    int? guessReferenceValue,
    int? guessTime,
    int? status,
    bool? success,
    int? winPro,
  }) {
    return GuessInfosGuessInfosGuessData()
      ..awards = awards ?? this.awards
      ..guessAttr = guessAttr ?? this.guessAttr
      ..guessChoice = guessChoice ?? this.guessChoice
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..guessTime = guessTime ?? this.guessTime
      ..status = status ?? this.status
      ..success = success ?? this.success
      ..winPro = winPro ?? this.winPro;
  }
}

GuessInfosGuessInfosGuessReferenceValue $GuessInfosGuessInfosGuessReferenceValueFromJson(
    Map<String, dynamic> json) {
  final GuessInfosGuessInfosGuessReferenceValue guessInfosGuessInfosGuessReferenceValue = GuessInfosGuessInfosGuessReferenceValue();
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    guessInfosGuessInfosGuessReferenceValue.ast = ast;
  }
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    guessInfosGuessInfosGuessReferenceValue.blk = blk;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    guessInfosGuessInfosGuessReferenceValue.createTime = createTime;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    guessInfosGuessInfosGuessReferenceValue.dreb = dreb;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    guessInfosGuessInfosGuessReferenceValue.fga = fga;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    guessInfosGuessInfosGuessReferenceValue.fgm = fgm;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    guessInfosGuessInfosGuessReferenceValue.fta = fta;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    guessInfosGuessInfosGuessReferenceValue.ftm = ftm;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    guessInfosGuessInfosGuessReferenceValue.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    guessInfosGuessInfosGuessReferenceValue.oreb = oreb;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    guessInfosGuessInfosGuessReferenceValue.pf = pf;
  }
  final int? playCount = jsonConvert.convert<int>(json['playCount']);
  if (playCount != null) {
    guessInfosGuessInfosGuessReferenceValue.playCount = playCount;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    guessInfosGuessInfosGuessReferenceValue.playerId = playerId;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    guessInfosGuessInfosGuessReferenceValue.pts = pts;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    guessInfosGuessInfosGuessReferenceValue.seasonId = seasonId;
  }
  final int? starterCount = jsonConvert.convert<int>(json['starterCount']);
  if (starterCount != null) {
    guessInfosGuessInfosGuessReferenceValue.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    guessInfosGuessInfosGuessReferenceValue.stl = stl;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    guessInfosGuessInfosGuessReferenceValue.threePa = threePa;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    guessInfosGuessInfosGuessReferenceValue.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    guessInfosGuessInfosGuessReferenceValue.to = to;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    guessInfosGuessInfosGuessReferenceValue.updateTime = updateTime;
  }
  return guessInfosGuessInfosGuessReferenceValue;
}

Map<String, dynamic> $GuessInfosGuessInfosGuessReferenceValueToJson(
    GuessInfosGuessInfosGuessReferenceValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['blk'] = entity.blk;
  data['createTime'] = entity.createTime;
  data['dreb'] = entity.dreb;
  data['fga'] = entity.fga;
  data['fgm'] = entity.fgm;
  data['fta'] = entity.fta;
  data['ftm'] = entity.ftm;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['pf'] = entity.pf;
  data['playCount'] = entity.playCount;
  data['playerId'] = entity.playerId;
  data['pts'] = entity.pts;
  data['seasonId'] = entity.seasonId;
  data['starterCount'] = entity.starterCount;
  data['stl'] = entity.stl;
  data['threePa'] = entity.threePa;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension GuessInfosGuessInfosGuessReferenceValueExtension on GuessInfosGuessInfosGuessReferenceValue {
  GuessInfosGuessInfosGuessReferenceValue copyWith({
    double? ast,
    double? blk,
    int? createTime,
    double? dreb,
    double? fga,
    double? fgm,
    double? fta,
    double? ftm,
    double? min,
    double? oreb,
    double? pf,
    int? playCount,
    int? playerId,
    double? pts,
    int? seasonId,
    int? starterCount,
    double? stl,
    double? threePa,
    double? threePm,
    double? to,
    int? updateTime,
  }) {
    return GuessInfosGuessInfosGuessReferenceValue()
      ..ast = ast ?? this.ast
      ..blk = blk ?? this.blk
      ..createTime = createTime ?? this.createTime
      ..dreb = dreb ?? this.dreb
      ..fga = fga ?? this.fga
      ..fgm = fgm ?? this.fgm
      ..fta = fta ?? this.fta
      ..ftm = ftm ?? this.ftm
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..pf = pf ?? this.pf
      ..playCount = playCount ?? this.playCount
      ..playerId = playerId ?? this.playerId
      ..pts = pts ?? this.pts
      ..seasonId = seasonId ?? this.seasonId
      ..starterCount = starterCount ?? this.starterCount
      ..stl = stl ?? this.stl
      ..threePa = threePa ?? this.threePa
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..updateTime = updateTime ?? this.updateTime;
  }
}